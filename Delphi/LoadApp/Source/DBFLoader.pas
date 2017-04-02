unit DBFLoader;

interface

uses Classes, DB, InLoader;

type
  TDBFLoader = class(TInLoader)
  private
    FPOId: double;
    FPosition: Integer;
    FFile: TStrings;
    FLoadMode: integer; //����� �������� (��� ��������� ������)
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
      raise Exception.CreateFmt('���� �%d :�������� ������ ����� ��� %s', [Pos,
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
      raise Exception.CreateFmt('���� �%d :�������� ������ ����� ��� %s', [Pos,
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
      raise Exception.CreateFmt('���� �%d :�������� ������ ���� ��� %s', [Pos,
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
  DoMessage(Format('��������� ����� %s', ['plat.dbf']));

  LoadDBF(FileName);
//  LoadFile(FileName);
  MainData.Session.Commit;
end;

procedure TDBFLoader.DoLoadDBF(const FileName: string);
begin
//  LoadFile('plat.txt');
  DoMessage(Format('��������� ����� %s', [FileName]));

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
  DoMessage(Format('��������� ����� %s', ['gtd.txt']));
  FPosition := 0;
  Cols := TStringList.Create;
  I := 0;
  try
    while not FTerminated and (FPosition < FFile.Count) do
    begin
      SetDelimitedText(Cols, FFile[FPosition]);
      if Cols.Count <> 20 then
        DoMessage(Format('������� ���������� ����� (%d) � ����� �%d',
          [Cols.Count, FPosition+1]))
      else
      begin
//     'nnn;decl_no;inn;kpp;decl_name;g011;g012;g444a;g444b;g447a;g447b;k115;gd1;srok;nclose;tosv;cur_code31;doza_p;doza_a;doza_n',
          MainData.qryGTD.SetVariable('NNN', GetStr(Cols, 0, '�����. ��'));
          MainData.qryGTD.SetVariable('DECL_NO', GetStr(Cols, 1, '����� ����������'));
          MainData.qryGTD.SetVariable('INN', GetStr(Cols, 2, '��� ����������'));
          MainData.qryGTD.SetVariable('KPP', GetStr(Cols, 3, '��� ����������'));
          MainData.qryGTD.SetVariable('DECL_NAME', GetStr(Cols, 4, '������������ ����������'));
          MainData.qryGTD.SetVariable('G011', GetStr(Cols, 5, '�����������'));
          MainData.qryGTD.SetVariable('G012', GetStr(Cols, 6, '�����'));
          MainData.qryGTD.SetVariable('G444A', GetStr(Cols, 7, '� ���������'));
          MainData.qryGTD.SetVariable('G444B', GetDate(Cols, 8, '���� ���������'));
          MainData.qryGTD.SetVariable('G447A', GetStr(Cols, 9, '� ������������'));
          MainData.qryGTD.SetVariable('G447B', GetDate(Cols, 10, '���� ���. ������������'));
          MainData.qryGTD.SetVariable('K115', GetStr(Cols, 11, '���������'));
          MainData.qryGTD.SetVariable('GD1', GetDate(Cols, 12, '���� �������'));
          MainData.qryGTD.SetVariable('SROK', GetDate(Cols, 13, '���� ������'));
          MainData.qryGTD.SetVariable('NCLOSE', GetInt(Cols, 14, '�������� �������'));
          MainData.qryGTD.SetVariable('TOSV', GetInt(Cols, 15, '������ ������������'));
          MainData.qryGTD.SetVariable('CUR_CODE31', GetStr(Cols, 16, '������ �������� ����������'));
          MainData.qryGTD.SetVariable('DOZA_P', GetFloat(Cols, 17, '������� (�������� ����������)'));
          MainData.qryGTD.SetVariable('DOZA_A', GetFloat(Cols, 18, '����� (�������� ����������)'));
          MainData.qryGTD.SetVariable('DOZA_N', GetFloat(Cols, 19, '��� (�������� ����������)'));
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
    DoMessage(Format('����� ����� %d �� ��� ��������� %d',
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
  DoMessage(Format('��������� ����� %s', ['goods.txt']));
  FPosition := 0;
  Cols := TStringList.Create;
  I := 0;
  try
    while not FTerminated and (FPosition < FFile.Count) do
    begin
      SetDelimitedText(Cols, FFile[FPosition]);
      if Cols.Count <> 7 then
        DoMessage(Format('������� ���������� ����� (%d) � ����� �%d',
          [Cols.Count, FPosition+1]))
      else
      begin
//     'nnn;decl_no;inn;kpp;decl_name;g011;g012;g444a;g444b;g447a;g447b;k115;gd1;srok;nclose;tosv;cur_code31;doza_p;doza_a;doza_n',
          MainData.qryGoods.SetVariable('GTD_NNN', GetStr(Cols, 0, '�����. �� ���'));
          MainData.qryGoods.SetVariable('NO', GetInt(Cols, 1, '����� ������'));
          MainData.qryGoods.SetVariable('GOODS_CODE', GetStr(Cols, 2, '��� ������'));
          MainData.qryGoods.SetVariable('PAY_TYPE_CODE', GetStr(Cols, 3, '��� �������'));
          MainData.qryGoods.SetVariable('PAY_MODE_CODE', GetStr(Cols, 4, '������ �������'));
          MainData.qryGoods.SetVariable('SUMMA', GetFloat(Cols, 5, '�����'));
          MainData.qryGoods.SetVariable('CURR_CODE', GetStr(Cols, 6, '������'));
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
    DoMessage(Format('����� ����� %d �� ��� ��������� %d',
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
  DoMessage(Format('��������� ����� %s', ['gtd2plt.txt']));
  FPosition := 0;
  Cols := TStringList.Create;
  I := 0;
  try
    while not FTerminated and (FPosition < FFile.Count) do
    begin
      SetDelimitedText(Cols, FFile[FPosition]);
      if Cols.Count <> 5 then
        DoMessage(Format('������� ���������� ����� (%d) � ����� �%d',
          [Cols.Count, FPosition+1]))
      else
      begin
//     'nnn;decl_no;inn;kpp;decl_name;g011;g012;g444a;g444b;g447a;g447b;k115;gd1;srok;nclose;tosv;cur_code31;doza_p;doza_a;doza_n',
          MainData.qryGtd2Plt.SetVariable('gtd_nnn', GetStr(Cols, 0, '�����. �� ���'));
          MainData.qryGtd2Plt.SetVariable('pay_type_code', GetStr(Cols, 1, '��� �������'));
          MainData.qryGtd2Plt.SetVariable('summa', GetFloat(Cols, 2, '�����'));
          MainData.qryGtd2Plt.SetVariable('curr_code', GetStr(Cols, 3, '������'));
          MainData.qryGtd2Plt.SetVariable('plat_nnn', GetStr(Cols, 4, '�����. �� ����. ���������'));
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
    DoMessage(Format('����� ����� %d �� ��� ��������� %d',
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
  //����������� ����� �� ������
  Status := '���������� ������...';
  DirName := GetAppTempDir;
  ExtractArchive('*.*', DirName, FPath);

  //����������� ��� ������ ����� ��������
  MainData.sqlSetLoadMode.ParamValues['Load_mode']:=FLoadMode;
  MainData.sqlSetLoadMode.Exec;

  try
    case FLoadMode of
      0: //��������
        begin
          Status := '�������� ��������...';
          DoLoadDBF('plat.dbf');
        end;
      1: //��������� ����
        begin
          Status := '�������� ���...';
          DoLoadDBF('gtd_vv.dbf');
          Status := '�������� �������...';
          DoLoadDBF('goods_vv.dbf');
          Status := '�������� �������� ������...';
          LoadBufferTables;
        end;
      2: //������������
        begin
          Status := '�������� ���...';
          DoLoadDBF('gtd_zad.dbf');
          Status := '�������� ����������...';
          DoLoadDBF('nach_zad.dbf');
          Status := '�������� �������� ������...';
          LoadBufferTables;
        end;
      3: //���
        begin
          Status := '�������� ��������...';
          DoLoadDBF('plat_vpd.dbf');
          Status := '�������� ���...';
          DoLoadDBF('gtd_vpd.dbf');
          Status := '�������� �������...';
          DoLoadDBF('goods_vpd.dbf');
          Status := '�������� ����������...';
          DoLoadDBF('nach_vpd.dbf');
          Status := '�������� �������� ������...';
          LoadBufferTables;
        end;
     4: //������� ��������
        begin
          Status := '�������� ��������...';
          DoLoadDBF('plat2.dbf');
        end;
     5: //�����
        begin
          Status := '�������� ��������...';
          DoLoadDBF('plat_izupl.dbf');
          Status := '�������� ���...';
          DoLoadDBF('gtd_izupl.dbf');
          Status := '�������� �������...';
          DoLoadDBF('goods_izupl.dbf');
          Status := '�������� ����������...';
          DoLoadDBF('nach_izupl.dbf');
          Status := '�������� �������� ������...';
          LoadBufferTables;
        end;
     6: //����������
        begin
          Status := '�������� ����������...';
          DoLoadDBF('reserv.dbf');
        end;
     7: //�������
        begin
          Status := '�������� �������...';
          DoLoadDBF('pays.dbf');
        end;
     8: //PaysUp
        begin
          Status := '�������� ��...';
          DoLoadDBF('plat3.dbf');
        end;
    end;
  finally
    //�������� ��������� ������
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
      Exception.CreateFmt('<<������� �� ������>>.<<��������� ������������ ��������>>'#13'���� �� ������: %s', [Dir]);

  //����������� ��� ������ ����� ��������
  case LoadMode of
    0: //��������
      if not FileExists(Dir + '\plat.dbf') then
        raise
          Exception.CreateFmt('<<������ �������� �������>>.<<��������� ������������ ��������>>'#13'�� ������ �� ���� ���� ��� ��������', []);
    1: //��������� ����
      if not (FileExists(Dir + '\gtd_vv.dbf')
        or FileExists(Dir + '\goods_vv.dbf')) then
        raise
          Exception.CreateFmt('<<������ �������� �������>>.<<��������� ������������ ��������>>'#13'�� ������ �� ���� ���� ��� ��������', []);
    2: //������������
      if not (FileExists(Dir + '\gtd_zad.dbf')
        or FileExists(Dir + '\nach_zad.fbd')) then
        raise
          Exception.CreateFmt('<<������ �������� �������>>.<<��������� ������������ ��������>>'#13'�� ������ �� ���� ���� ��� ��������', []);
    3: //���
      if not (FileExists(Dir + '\plat_vpd.dbf')
        or FileExists(Dir + '\gtd_vpd.dbf') or FileExists(Dir + '\goods_vpd.dbf')
        or FileExists(Dir + '\nach_vpd.dbf')) then
        raise
          Exception.CreateFmt('<<������ �������� �������>>.<<��������� ������������ ��������>>'#13'�� ������ �� ���� ���� ��� ��������', []);
  end;
end;

function TDBFLoader.LoadFile(const FileName: string): TStrings;
begin
  FFile.LoadFromFile(FPath + '\' + FileName);
end;

end.

