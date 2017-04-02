unit DBFLoader;

interface

uses Classes, DB, InLoader;

type
  TDBFLoader = class(TInLoader)
  private
    FPOId: double;
    FPosition: Integer;
    FFile: TStrings;
    FLoadMode: integer; //Режим загрузки (для текстовых файлов)
    function LoadFile(const FileName: string): TStrings;

    procedure DoLoadPayment(const FileName: string);
    procedure DoLoadDecl(const FileName: string);
    procedure DoLoadGoods(const FileName: string);
    procedure DoLoadDeduction(const FileName: string);
    procedure DoLoadDBF(const FileName: string);
    procedure Del(vFileName: string);
  protected
    function GetPosition: Integer; override;
    function GetTotal: Integer; override;
  public
    constructor Create(const Path: string; const LoadMode: integer); override;
    procedure DoLoad; override;
    destructor Destroy; override;
    class procedure CheckDir(const Dir: string; LoadMode: integer); override;
  end;

implementation

uses DataDM, SysUtils, VAriants, Windows, IaccLoader, fdcUtils, ArchUtils;

{ TPOLoader }

procedure TDBFLoader.Del(vFileName: string);
begin
  if FileExists(vFileName) then
    DeleteFile(PCHAR(vFileName));
end;

procedure LoadDBF(const DBFName: String);
var
  Importer     : TUniImporter;
  i          : integer;
  ErrorCount : Integer;
  DirName: String;
begin
  DirName := GetAppTempDir;
  Importer := TUniImporter.Create;
  try
    Importer.LoadFile(DBFName, Format('%s\%s', [DirName, DBFName]));
  finally
    Importer.free;
  end;
end;

constructor TDBFLoader.Create(const Path: string; const LoadMode: integer);
begin
  FPath := Path;
  FLoadMode:=LoadMode;
  FFile := TStringList.Create;
end;

destructor TDBFLoader.Destroy;
begin
  FreeAndNil(FFile);
  inherited;
end;

procedure SetDelimitedText(Str: TStrings; const Value: string);
var
  P, P1: PChar;
  S: string;
begin
  Str.BeginUpdate;
  try
    Str.Clear;
    P := PChar(Value);
    while P^ in [#1..' '] do
    {$IFDEF MSWINDOWS}
      P := CharNext(P);
    {$ELSE}
      Inc(P);
    {$ENDIF}
    while P^ <> #0 do
    begin
      if P^ = Str.QuoteChar then
        S := AnsiExtractQuotedStr(P, Str.QuoteChar)
      else
      begin
        P1 := P;
        while (P^ >= ' ') and (P^ <> Str.Delimiter) do
        {$IFDEF MSWINDOWS}
          P := CharNext(P);
        {$ELSE}
          Inc(P);
        {$ENDIF}
        SetString(S, P1, P - P1);
      end;
      Str.Add(S);
      while P^ in [#1..#31] do
      {$IFDEF MSWINDOWS}
        P := CharNext(P);
      {$ELSE}
        Inc(P);
      {$ENDIF}
      if P^ = Str.Delimiter then
      begin
        P1 := P;
        {$IFDEF MSWINDOWS}
        if CharNext(P1)^ = #0 then
        {$ELSE}
        Inc(P1);
        if P1^ = #0 then
        {$ENDIF}
          Str.Add('');
        repeat
          {$IFDEF MSWINDOWS}
          P := CharNext(P);
          {$ELSE}
          Inc(P);
          {$ENDIF}
        until not (P^ in [#1..#31]);
      end;
    end;
  finally
    Str.EndUpdate;
  end;
end;

function ExtractStr(S: string): string;
var
  P, Dest: PChar;
  DropCount: Integer;
  Src: PChar;
begin
  SetString(Result, Pchar(S), Length(S));
  Src := PChar(Result);
  if (Src = nil) then
    Exit;
  DropCount := 1;
  P := Src;
  Src := AnsiStrScan(Src, '\');
  while Src <> nil do // count adjacent pairs of quote chars
  begin
    Inc(Src);
    if Src^ = 'n' then
    begin
      (Src - 1)^ := #$D;
      Src^ := #$A;
    end;
    Inc(Src);
    Src := AnsiStrScan(Src, '\');
  end;
  Result := StringReplace(Result, '\\', '\', [rfReplaceAll]);
  //  Result := StringReplace(Result, #$D#$A, #$A, [rfReplaceAll]);
end;

function GetStr(Cols: Tstrings; Pos: integer; Name: string = ''): string;
var
  S: string;
begin
  S := Cols[Pos];
  Result := ExtractStr(S);
end;

function GetInt(Cols: Tstrings; Pos: integer; Name: string = ''): Variant;
var
  S: string;
  I: integer;
begin
  S := Cols[Pos];
  Result := Null;
  if S <> '' then
  begin
    if not TryStrToInt(S, I) then
      raise Exception.CreateFmt('Поле №%d :Неверный формат числа для %s', [Pos,
        Name]);
    Result := I;
  end;
end;

function GetFloat(Cols: Tstrings; Pos: integer; Name: string = ''): Variant;
var
  S: string;
  f: double;
  FS: TFormatSettings;
begin
  S := Cols[Pos];
  Result := Null;
  FS.DecimalSeparator := '.';
  FS.ThousandSeparator := #0;

  if S <> '' then
  begin
    if not TryStrToFloat(S, f, FS) then
      raise Exception.CreateFmt('Поле №%d :Неверный формат числа для %s', [Pos,
        Name]);
    Result := f;
  end;
end;

function GetDate(Cols: Tstrings; Pos: integer; Name: string = ''): Variant;
var
  S: string;
  FS: TFormatSettings;
  dt: TDateTime;
begin
  S := Cols[Pos];
  FS.DateSeparator := '.';
  FS.ShortDateFormat := 'dd.mm.yy';
  FS.LongDateFormat := 'dd.mm.yyyy';
  Result := Null;

  if S <> '' then
  begin
    if not TryStrToDate(S, dt, FS) then
      raise Exception.CreateFmt('Поле №%d :Неверный формат даты для %s', [Pos,
        Name]);
    Result := dt;
  end;
end;

procedure TDBFLoader.DoLoadPayment(const FileName: string);
var
  I: Integer;
  Cols: TStrings;
begin
//  LoadFile('plat.txt');
  DoMessage(Format('Обработка файла %s', ['plat.dbf']));

  LoadDBF(FileName);
//  LoadFile(FileName);
  MainData.Session.Commit;
end;

procedure TDBFLoader.DoLoadDBF(const FileName: string);
begin
//  LoadFile('plat.txt');
  DoMessage(Format('Обработка файла %s', [FileName]));

  LoadDBF(FileName);
//  LoadFile(FileName);
  MainData.Session.Commit;
end;

procedure TDBFLoader.DoLoadDecl(const FileName: string);
var
  I: Integer;
  Cols: TStrings;
begin
//  LoadFile('gtd.txt');
  LoadFile(FileName);
  DoMessage(Format('Обработка файла %s', ['gtd.txt']));
  FPosition := 0;
  Cols := TStringList.Create;
  I := 0;
  try
    while not FTerminated and (FPosition < FFile.Count) do
    begin
      SetDelimitedText(Cols, FFile[FPosition]);
      if Cols.Count <> 20 then
        DoMessage(Format('Неверое количество полей (%d) в стоке №%d',
          [Cols.Count, FPosition+1]))
      else
      begin
//     'nnn;decl_no;inn;kpp;decl_name;g011;g012;g444a;g444b;g447a;g447b;k115;gd1;srok;nclose;tosv;cur_code31;doza_p;doza_a;doza_n',
          MainData.qryGTD.SetVariable('NNN', GetStr(Cols, 0, 'Внутр. Ид'));
          MainData.qryGTD.SetVariable('DECL_NO', GetStr(Cols, 1, 'Номер декларации'));
          MainData.qryGTD.SetVariable('INN', GetStr(Cols, 2, 'ИНН Декларанта'));
          MainData.qryGTD.SetVariable('KPP', GetStr(Cols, 3, 'КПП Декларанта'));
          MainData.qryGTD.SetVariable('DECL_NAME', GetStr(Cols, 4, 'Наименование Декларанта'));
          MainData.qryGTD.SetVariable('G011', GetStr(Cols, 5, 'Направление'));
          MainData.qryGTD.SetVariable('G012', GetStr(Cols, 6, 'Режим'));
          MainData.qryGTD.SetVariable('G444A', GetStr(Cols, 7, '№ контракта'));
          MainData.qryGTD.SetVariable('G444B', GetDate(Cols, 8, 'Дата контракта'));
          MainData.qryGTD.SetVariable('G447A', GetStr(Cols, 9, '№ освобождения'));
          MainData.qryGTD.SetVariable('G447B', GetDate(Cols, 10, 'Дата док. освобождения'));
          MainData.qryGTD.SetVariable('K115', GetStr(Cols, 11, 'Инспектор'));
          MainData.qryGTD.SetVariable('GD1', GetDate(Cols, 12, 'Дата выпуска'));
          MainData.qryGTD.SetVariable('SROK', GetDate(Cols, 13, 'Срок вывоза'));
          MainData.qryGTD.SetVariable('NCLOSE', GetInt(Cols, 14, 'Оплачено месяцев'));
          MainData.qryGTD.SetVariable('TOSV', GetInt(Cols, 15, 'Полное освобождение'));
          MainData.qryGTD.SetVariable('CUR_CODE31', GetStr(Cols, 16, 'Валюта месячных начислений'));
          MainData.qryGTD.SetVariable('DOZA_P', GetFloat(Cols, 17, 'Пошлина (месячные начисления)'));
          MainData.qryGTD.SetVariable('DOZA_A', GetFloat(Cols, 18, 'Акциз (месячные начисления)'));
          MainData.qryGTD.SetVariable('DOZA_N', GetFloat(Cols, 19, 'НДС (месячные начисления)'));
          MainData.qryGTD.SetVariable('LOAD_MODE', FLoadMode);

//            ]);
         MainData.qryGTD.Execute;
        Inc(I);
        if I mod 1000 = 0 then
          MainData.Session.Commit;
      end;
      Inc(FPosition);
    end;
    if I > 0 then
      MainData.Session.Commit;
  finally
    DoMessage(Format('Всего строк %d из них загружено %d',
          [FFile.Count, I]));
  end
end;

procedure TDBFLoader.DoLoadGoods(const FileName: string);
var
  I: Integer;
  Cols: TStrings;
begin
//  LoadFile('goods.txt');
  LoadFile(FileName);
  DoMessage(Format('Обработка файла %s', ['goods.txt']));
  FPosition := 0;
  Cols := TStringList.Create;
  I := 0;
  try
    while not FTerminated and (FPosition < FFile.Count) do
    begin
      SetDelimitedText(Cols, FFile[FPosition]);
      if Cols.Count <> 7 then
        DoMessage(Format('Неверое количество полей (%d) в стоке №%d',
          [Cols.Count, FPosition+1]))
      else
      begin
//     'nnn;decl_no;inn;kpp;decl_name;g011;g012;g444a;g444b;g447a;g447b;k115;gd1;srok;nclose;tosv;cur_code31;doza_p;doza_a;doza_n',
          MainData.qryGoods.SetVariable('GTD_NNN', GetStr(Cols, 0, 'Внутр. Ид ГТД'));
          MainData.qryGoods.SetVariable('NO', GetInt(Cols, 1, 'Номер товара'));
          MainData.qryGoods.SetVariable('GOODS_CODE', GetStr(Cols, 2, 'Код товара'));
          MainData.qryGoods.SetVariable('PAY_TYPE_CODE', GetStr(Cols, 3, 'Вид платежа'));
          MainData.qryGoods.SetVariable('PAY_MODE_CODE', GetStr(Cols, 4, 'Способ платежа'));
          MainData.qryGoods.SetVariable('SUMMA', GetFloat(Cols, 5, 'Сумма'));
          MainData.qryGoods.SetVariable('CURR_CODE', GetStr(Cols, 6, 'Валюта'));
//            ]);
         MainData.qryGoods.Execute;
        Inc(I);
        if I mod 1000 = 0 then
          MainData.Session.Commit;
      end;
      Inc(FPosition);
    end;
    if I > 0 then
      MainData.Session.Commit;
  finally
    DoMessage(Format('Всего строк %d из них загружено %d',
          [FFile.Count, I]));
  end
end;

procedure TDBFLoader.DoLoadDeduction(const FileName: string);
var
  I: Integer;
  Cols: TStrings;
begin
//  LoadFile('gtd2plt.txt');
  LoadFile(FileName);
  DoMessage(Format('Обработка файла %s', ['gtd2plt.txt']));
  FPosition := 0;
  Cols := TStringList.Create;
  I := 0;
  try
    while not FTerminated and (FPosition < FFile.Count) do
    begin
      SetDelimitedText(Cols, FFile[FPosition]);
      if Cols.Count <> 5 then
        DoMessage(Format('Неверое количество полей (%d) в стоке №%d',
          [Cols.Count, FPosition+1]))
      else
      begin
//     'nnn;decl_no;inn;kpp;decl_name;g011;g012;g444a;g444b;g447a;g447b;k115;gd1;srok;nclose;tosv;cur_code31;doza_p;doza_a;doza_n',
          MainData.qryGtd2Plt.SetVariable('gtd_nnn', GetStr(Cols, 0, 'Внутр. Ид ГТД'));
          MainData.qryGtd2Plt.SetVariable('pay_type_code', GetStr(Cols, 1, 'Вид платежа'));
          MainData.qryGtd2Plt.SetVariable('summa', GetFloat(Cols, 2, 'Сумма'));
          MainData.qryGtd2Plt.SetVariable('curr_code', GetStr(Cols, 3, 'Валюта'));
          MainData.qryGtd2Plt.SetVariable('plat_nnn', GetStr(Cols, 4, 'Внутр. Ид плат. документа'));
//            ]);
         MainData.qryGtd2Plt.Execute;
        Inc(I);
        if I mod 1000 = 0 then
          MainData.Session.Commit;
      end;
      Inc(FPosition);
    end;
    if I > 0 then
      MainData.Session.Commit;
  finally
    DoMessage(Format('Всего строк %d из них загружено %d',
          [FFile.Count, I]));
  end
end;

procedure TDBFLoader.DoLoad;
var
  PlatKN: TDataSet;
  Gtd2Plat: TDataSet;
  DirName: String;
  procedure LoadBufferTables;
  begin
    DoLoadDBF('DclHead.Dbf');
    DoLoadDBF('DclPlatR.Dbf');
    DoLoadDBF('DclPlatV.Dbf');
    DoLoadDBF('DclPredD.Dbf');
    DoLoadDBF('DclTechD.Dbf');
    DoLoadDBF('DclTovar.Dbf');
    DoLoadDBF('DclTrans.Dbf');
    DoLoadDBF('DclSlotM.Dbf');
    DoLoadDBF('Dk1.Dbf');
    DoLoadDBF('DkIsch.Dbf');
    DoLoadDBF('DkKUpl.Dbf');
    DoLoadDBF('DkOpRp.Dbf');
    DoLoadDBF('Dk_pp.dbf');
    DoLoadDBF('dclsumpp.dbf');
  end;

  procedure ClearTemp;
  begin
    Del(FPath+'\'+'GTD_VPD.Dbf');
    Del(FPath+'\'+'NACH_VPD.Dbf');
    Del(FPath+'\'+'PLAT_VPD.Dbf');
    Del(FPath+'\'+'GOODS_VPD.Dbf');

    Del(FPath+'\'+'GTD_ZAD.Dbf');
    Del(FPath+'\'+'NACH_ZAD.Dbf');

    Del(FPath+'\'+'GTD_VV.Dbf');
    Del(FPath+'\'+'GOODS_VV.Dbf');

    Del(FPath+'\'+'PLAT2.Dbf');

    Del(FPath+'\'+'RESERV.Dbf');

    Del(FPath+'\'+'GTD_IZUPL.Dbf');
    Del(FPath+'\'+'NACH_IZUPL.Dbf');
    Del(FPath+'\'+'PLAT_IZUPL.Dbf');
    Del(FPath+'\'+'GOODS_IZUPL.Dbf');

    Del(FPath+'\'+'PLAT.Dbf');

    Del(FPath+'\'+'PLAT3.Dbf');

    //dcl dbf
    Del(FPath+'\'+'DclHead.Dbf');
    Del(FPath+'\'+'DclPlatR.Dbf');
    Del(FPath+'\'+'DclPlatV.Dbf');
    Del(FPath+'\'+'DclPredD.Dbf');
    Del(FPath+'\'+'DclTechD.Dbf');
    Del(FPath+'\'+'DclTovar.Dbf');
    Del(FPath+'\'+'DclTrans.Dbf');
    Del(FPath+'\'+'DclSlotM.Dbf');
    Del(FPath+'\'+'Dk1.Dbf');
    Del(FPath+'\'+'DkIsch.Dbf');
    Del(FPath+'\'+'DkKUpl.Dbf');
    Del(FPath+'\'+'DkOpRp.Dbf');
    Del(FPath+'\'+'Dk_pp.dbf');
    Del(FPath+'\'+'dclsumpp.dbf');
  end;
begin
  //Вытаскиваем файлы из архива
  Status := 'Распаковка архива...';
  DirName := GetAppTempDir;
  ExtractArchive('*.*', DirName, FPath);

  //Разруливаем для разных типов загрузки
  MainData.sqlSetLoadMode.ParamValues['Load_mode']:=FLoadMode;
  MainData.sqlSetLoadMode.Exec;

  try
    case FLoadMode of
      0: //платежки
        begin
          Status := 'Загрузка платежей...';
          DoLoadDBF('plat.dbf');
        end;
      1: //временный ввоз
        begin
          Status := 'Загрузка ГТД...';
          DoLoadDBF('gtd_vv.dbf');
          Status := 'Загрузка Товаров...';
          DoLoadDBF('goods_vv.dbf');
          Status := 'Загрузка буферных таблиц...';
          LoadBufferTables;
        end;
      2: //задолженость
        begin
          Status := 'Загрузка ГТД...';
          DoLoadDBF('gtd_zad.dbf');
          Status := 'Загрузка начислений...';
          DoLoadDBF('nach_zad.dbf');
          Status := 'Загрузка буферных таблиц...';
          LoadBufferTables;
        end;
      3: //ВПД
        begin
          Status := 'Загрузка платежей...';
          DoLoadDBF('plat_vpd.dbf');
          Status := 'Загрузка ГТД...';
          DoLoadDBF('gtd_vpd.dbf');
          Status := 'Загрузка Товаров...';
          DoLoadDBF('goods_vpd.dbf');
          Status := 'Загрузка начислений...';
          DoLoadDBF('nach_vpd.dbf');
          Status := 'Загрузка буферных таблиц...';
          LoadBufferTables;
        end;
     4: //неидент платежки
        begin
          Status := 'Загрузка платежей...';
          DoLoadDBF('plat2.dbf');
        end;
     5: //Изупл
        begin
          Status := 'Загрузка платежей...';
          DoLoadDBF('plat_izupl.dbf');
          Status := 'Загрузка ГТД...';
          DoLoadDBF('gtd_izupl.dbf');
          Status := 'Загрузка Товаров...';
          DoLoadDBF('goods_izupl.dbf');
          Status := 'Загрузка начислений...';
          DoLoadDBF('nach_izupl.dbf');
          Status := 'Загрузка буферных таблиц...';
          LoadBufferTables;
        end;
     6: //Блокировки
        begin
          Status := 'Загрузка блокировок...';
          DoLoadDBF('reserv.dbf');
        end;
     7: //Выписка
        begin
          Status := 'Загрузка выписки...';
          DoLoadDBF('pays.dbf');
        end;
     8: //PaysUp
        begin
          Status := 'Загрузка ПД...';
          DoLoadDBF('plat3.dbf');
        end;
    end;
  finally
    //Зачистка временных файлов
    ClearTemp;
  end;
  Status := '';
end;

function TDBFLoader.GetPosition: Integer;
begin
  Result := 0;
  if FFile <> nil then
    Result := FPosition;
end;

function TDBFLoader.GetTotal: Integer;
begin
  Result := 0;
  if FFile <> nil then
    Result := FFile.Count;
end;

class procedure TDBFLoader.CheckDir(const Dir: string; LoadMode: integer);
begin
  inherited;
  if not DirectoryExists(Dir) then
    raise
      Exception.CreateFmt('<<Каталог не найден>>.<<Проверьте правильность каталога>>'#13'Файл не найден: %s', [Dir]);

  //Разруливаем для разных типов загрузки
  case LoadMode of
    0: //платежки
      if not FileExists(Dir + '\plat.dbf') then
        raise
          Exception.CreateFmt('<<Выбран неверный каталог>>.<<Проверьте правильность каталога>>'#13'Не найден ни один файл для загрузки', []);
    1: //временный ввоз
      if not (FileExists(Dir + '\gtd_vv.dbf')
        or FileExists(Dir + '\goods_vv.dbf')) then
        raise
          Exception.CreateFmt('<<Выбран неверный каталог>>.<<Проверьте правильность каталога>>'#13'Не найден ни один файл для загрузки', []);
    2: //задолженость
      if not (FileExists(Dir + '\gtd_zad.dbf')
        or FileExists(Dir + '\nach_zad.fbd')) then
        raise
          Exception.CreateFmt('<<Выбран неверный каталог>>.<<Проверьте правильность каталога>>'#13'Не найден ни один файл для загрузки', []);
    3: //ВПД
      if not (FileExists(Dir + '\plat_vpd.dbf')
        or FileExists(Dir + '\gtd_vpd.dbf') or FileExists(Dir + '\goods_vpd.dbf')
        or FileExists(Dir + '\nach_vpd.dbf')) then
        raise
          Exception.CreateFmt('<<Выбран неверный каталог>>.<<Проверьте правильность каталога>>'#13'Не найден ни один файл для загрузки', []);
  end;
end;

function TDBFLoader.LoadFile(const FileName: string): TStrings;
begin
  FFile.LoadFromFile(FPath + '\' + FileName);
end;

end.

