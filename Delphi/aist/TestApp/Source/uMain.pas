unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxLayoutLookAndFeels, dxLayoutControl, cxControls, ComCtrls,
  ShlObj, cxShellCommon, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxShellComboBox, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, dxmdaset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMemo, StdCtrls, cxButtons, cxSpinEdit,
  VKDBFDataSet, ztvBase, ztvUnZip, ztvregister, ztvZip;

type
  TMainForm = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    cbDir: TcxShellComboBox;
    dxLayoutControl1Item1: TdxLayoutItem;
    cbKey: TcxComboBox;
    dxLayoutControl1Item2: TdxLayoutItem;
    btnExec: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    memLog: TcxMemo;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item5: TdxLayoutItem;
    dsOtvet: TDataSource;
    meIP: TcxMaskEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    sePort: TcxSpinEdit;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dsetOtvet: TVKDBFNTX;
    Zip: TZip;
    UnZip: TUnZip;
    dsDK_PP: TDataSource;
    dsetDK: TVKDBFNTX;
    dxLayoutControl1Item8: TdxLayoutItem;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    procedure btnExecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fZipFileData : string;
    fZipFileOtv  : string;
    ds           : TDecompMemoryStream;
    dsDK         : TDecompMemoryStream;
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
  uAistConsts;

function SetConnection ( IP : PChar; Port : Integer ) : HResult; stdcall; external 'exchLS.dll' Name 'SetConnection';
function ExecQuery( Key : PChar; SizeData : Integer; Data : Pointer; var SizeOtvet : Integer; var Otvet : Pointer; callBackFnc : Pointer ) : HResult; stdcall; external 'exchLS.dll' Name 'ExecQuery';
function GetLastError( var BufSize : Integer; Msg : Pointer ) : HResult; stdcall; external 'exchLS.dll' Name 'GetLastError';
function Disconnect( Commit : Integer ) : HResult; stdcall; external 'exchLS.dll' Name 'Disconnect';

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

    f  : TFileStream;

begin
  if dsetOtvet.Active then
    dsetOtvet.Close;

  if dsetDK.Active then
    dsetDK.Close;
  if cbKey.Properties.Items.IndexOf( cbKey.Text ) < 0 then
    raise Exception.Create( '������ �������� ��� �������' );

  if not DirectoryExists( cbDir.Text ) then
    raise Exception.Create( '������ �������������� �������!' );

  ip := StringReplace( meIP.Text, ' ', '', [rfReplaceAll] );

  ClearLog;
  DoLog( '��������� ������� � �����������:' );
  DoLog( '  �������:     ' + cbDir.Text );
  DoLog( '  ��� �������: ' + cbKey.Text );
  DoLog( '  IP:          ' + ip );
  DoLog( '  ����:        ' + IntToStr( sePort.Value ) );

  DoLog( '' );
  DoLog( '����������� � �������...' );

  r := SetConnection( PChar(ip), sePort.Value );
  if r <> cResOK then
    begin
      DoLogError( r );
      Exit;
    end;
  DoLog( '��������� � �������.' );

  // ������������ ������ ��� ���������� �������
  Zip.FileSpec.Clear;
  if (cbKey.Text = 'R') or (cbKey.Text = 'T') then
    Zip.FileSpec.Add( cbDir.Text + '\DK_PP.DBF' )
  else
    for j := 0 to sTableNames.Count - 1 do
      Zip.FileSpec.Add( cbDir.Text + '\' + sTableNames[j] + '.DBF' );

  DeleteFile( fZipFileData );
  Zip.ArchiveFile := fZipFileData;
  if Zip.Compress = 0 then
    begin
      DoLog( '�� ������� ����� ��� �������� �������' );
      DoLog( '���������� �� �������' );
      r := Disconnect( 0 );
      if r <> cResOK then
        DoLogError( r );
      Exit;
    end;

  // ������ ZIP � �����
  f := TFileStream.Create( fZipFileData, fmOpenRead	);
  try
    DataSize := f.Size;
    GetMem( pData, DataSize );
    f.ReadBuffer( pData^, DataSize );
  finally
    f.Free;
  end;

  if Assigned( ds ) then
    begin
      ds.Destroy;
      ds := nil;
    end;

  if Assigned( dsDK ) then
    begin
      dsDK.Destroy;
      dsDK := nil;
    end;
  // ���������� �������
  try
    try
      // ��������� ������ ��� �����
      GetMem( pOtv, 10240 );
      r := ExecQuery( PChar(cbKey.Text), DataSize, pData, OtvSize, pOtv, nil );
      DoLog('������ ������ - '+IntToStr(OtvSize));
      if r <> cResOK then
        begin
          DoLogError( r );

          pLog := Addr( vLog );
          LogSize := 10240;
          GetLastError( LogSize, pLog );
          DoLog( vLog );

        end;

      // ������� ���������
      DeleteFile( fZipFileOtv );
      f := TFileStream.Create( fZipFileOtv, fmCreate	);
      f.WriteBuffer( pOtv^, OtvSize );
      f.Free;

      UnZip.ArchiveFile := fZipFileOtv;
      UnZip.FileSpec.Clear;
//      if cbKey.Text = 'SP' then
//        UnZip.FileSpec.Add( 'dk_pp.dbf' );
//      else
      UnZip.FileSpec.Add( 'otvet.dbf' );

      ds := TDecompMemoryStream.Create;
      UnZip.ExtractToMemoryStream( ds );
      if ds.FileCount = 0 then
        raise Exception.Create( '������ ���������� ������ � �����������' );

      dsetOtvet.OuterStream := ds;
      dsetOtvet.Open;
      UnZip.FileSpec.Clear;
      UnZip.FileSpec.Add( 'dk_pp.dbf' );

      dsDK := TDecompMemoryStream.Create;
      UnZip.ExtractToMemoryStream( dsDK );
      if dsDK.FileCount <> 0 then
      begin
        dsetDK.OuterStream := dsDK;
        dsetDK.Open;
      end;

    except
      on E : Exception do
        begin
          DoLog( '������: ' + E.Message );
          if dsetOtvet.Active then
            dsetOtvet.Close;
        end;
    end;
  finally
    DoLog( '���������� �� �������' );
    r := Disconnect( 1 );
    if r <> cResOK then
      DoLogError( r );
  end;

  if dsetOtvet.Active then
    if cxGrid1DBTableView1.ItemCount = 0 then
      cxGrid1DBTableView1.DataController.CreateAllItems;
  if dsetDK.Active then
    if cxGridDBTableView1.ItemCount = 0 then
      cxGridDBTableView1.DataController.CreateAllItems;
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
    cResAlreadyConn  : sMsg := '��� ��������� � �������';
    cResConnError    : sMsg := '������ ��� ����������� � ������� (�������� IP ��� Port?; �� ������� ������ ��?)';
    cResNoConnection : sMsg := '��� ����������� � �������';
    cResNoKey        : sMsg := '�������� ���� �������';
    cResQueryError   : sMsg := '������ �� ��������';
  end;

  sMsg := '������: ' + sMsg;
  DoLog( sMsg );
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //cbDir.Text := 'C:\TEST\data\E';
  cbDir.Text := 'C:\TEMP\online\';
  meIP.Text  := '127.0.0.1';
  cbKey.Text := 'T';
  fZipFileData := ExtractFilePath( Application.ExeName ) + 'data.zip';
  fZipFileOtv  := ExtractFilePath( Application.ExeName ) + 'otvet.zip';
end;

end.
