unit otMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ShlObj, cxShellCommon, cxGraphics, Menus,
  cxLookAndFeelPainters, dxLayoutLookAndFeels, dxLayoutControl, cxSpinEdit,
  cxMaskEdit, cxMemo, StdCtrls, cxButtons, cxDropDownEdit, cxContainer,
  cxEdit, cxTextEdit, cxShellComboBox, cxControls;

type
  TMainForm = class(TForm)
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    dxLayoutControl1: TdxLayoutControl;
    cbDir: TcxShellComboBox;
    cbKey: TcxComboBox;
    btnExec: TcxButton;
    memLog: TcxMemo;
    meIP: TcxMaskEdit;
    sePort: TcxSpinEdit;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutControl1Item2: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutControl1Item6: TdxLayoutItem;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Item4: TdxLayoutItem;
    memIn: TcxMemo;
    dxLayoutControl1Item1: TdxLayoutItem;
    memRes: TcxMemo;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutGroup;
    procedure btnExecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   // fZipFileData : string;
   // fZipFileOtv  : string;
   // ds           : TMemoryStream;
   // dsDK         : TMemoryStream;
    procedure ClearLog;
    procedure DoLog( ARec : string );
    procedure DoLogError( AErr : Integer );
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  comConsts;

function SetConnection ( IP : PChar; Port : Integer ) : HResult; stdcall; external 'ordercl.dll' Name 'SetConnection';
function ExecQuery( Key : PChar; SizeData : Integer; Data : Pointer; var SizeOtvet : Integer; var Otvet : Pointer; callBackFnc : Pointer ) : HResult; stdcall; external 'ordercl.dll' Name 'ExecQuery';
function GetLastError( var BufSize : Integer; Msg : Pointer ) : HResult; stdcall; external 'ordercl.dll' Name 'GetLastError';
function Disconnect( Commit : Integer ) : HResult; stdcall; external 'ordercl.dll' Name 'Disconnect';

procedure TMainForm.btnExecClick(Sender: TObject);

  var
    ip  : string;
    r   : HResult;
    j   : Integer;

    DataSize : Integer;
    pData    : Pointer;
    OtvSize  : Integer;
    pOtv     : Pointer;
    LogSize  : Integer;
    pLog     : Pointer;
    vLog     : array [0..10240] of char;

    f  : TMemoryStream;

begin
  if cbKey.Properties.Items.IndexOf( cbKey.Text ) < 0 then
    raise Exception.Create( 'Указан неверный код запроса' );

  if not DirectoryExists( cbDir.Text ) then
    raise Exception.Create( 'Указан несуществующий каталог!' );

  ip := StringReplace( meIP.Text, ' ', '', [rfReplaceAll] );

  ClearLog;
  DoLog( 'Обработка запроса с параметрами:' );
  DoLog( '  каталог:     ' + cbDir.Text );
  DoLog( '  тип запроса: ' + cbKey.Text );
  DoLog( '  IP:          ' + ip );
  DoLog( '  порт:        ' + IntToStr( sePort.Value ) );

  DoLog( '' );
  DoLog( 'Подключение к серверу...' );

  r := SetConnection( PChar(ip), sePort.Value );
  if r <> cResOK then
    begin
      DoLogError( r );
      Exit;
    end;
  DoLog( 'подключен к серверу.' );

  // входного XML в буфер
  f := TMemoryStream.Create;
  try
    memIn.Lines.SaveToStream(f);
    f.Position := 0;
    DataSize := f.Size;
    GetMem( pData, DataSize );
    f.ReadBuffer( pData^, DataSize );
  finally
    f.Free;
  end;

  // Выполнение запроса
  try
    try
      // выделение памяти под ответ
      //GetMem( pOtv, 10240 );
      r := ExecQuery( PChar(cbKey.Text), DataSize, pData, OtvSize, pOtv, nil );
      DoLog('Размер ответа - '+IntToStr(OtvSize));

      if r <> cResOK then
        begin
          DoLogError( r );

          pLog := Addr( vLog );
          //LogSize := 10240;
          GetLastError( LogSize, pLog );
          DoLog( vLog );

        end;

      // получим результат
      f := TMemoryStream.Create;
      f.WriteBuffer( pOtv^, OtvSize );
      f.Position := 0;
      memRes.Lines.LoadFromStream(f);
      f.Free;

    except
      on E : Exception do
        begin
          DoLog( 'Ошибка: ' + E.Message );
        end;
    end;
  finally
    DoLog( 'Отключение от сервера' );
    r := Disconnect( 1 );
    if r <> cResOK then
      DoLogError( r );
  end;

end;

procedure TMainForm.ClearLog;
begin
  memLog.Lines.Clear;
end;

procedure TMainForm.DoLog( ARec : string );
  var
    sD : string;
begin
  sD := FormatDateTime( 'dd.mm.yyyy hh:nn:ss.zzz', Now );
  memLog.Lines.Add( sD + '  ' + ARec );
end;

procedure TMainForm.DoLogError(AErr: Integer);
  var
    sMsg : string;
begin
  case AErr of
    cResAlreadyConn  : sMsg := 'уже подключён к серверу';
    cResConnError    : sMsg := 'ошибка при подключении к серверу (неверный IP или Port?; не запущен сервер ЛС?)';
    cResNoConnection : sMsg := 'нет подключения к серверу';
    cResNoKey        : sMsg := 'неверный ключ запроса';
    cResQueryError   : sMsg := 'запрос не выполнен';
  end;

  sMsg := 'Ошибка: ' + sMsg;
  DoLog( sMsg );
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  cbDir.Text := 'C:\TEMP\online\';
  meIP.Text  := '127.0.0.1';
//  meIP.Text  := '172.19.1.39';
  cbKey.Text := 'E';
end;

end.
