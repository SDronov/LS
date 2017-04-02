unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit,
  cxSplitter, cxContainer, cxEdit, cxTextEdit, cxMemo, cxDBEdit, cxPC,
  cxImage, ExtDlgs, Menus;

type
  TfrmMain = class(TForm)
    OracleSession: TOracleSession;
    OracleLogon: TOracleLogon;
    dsTypes: TOracleDataSet;
    dsetTypes: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    dsTypesID: TFloatField;
    dsTypesNAME: TStringField;
    dsTypesSYSNAME: TStringField;
    dsTypesICON: TStringField;
    dsTypesPARENT_OBJECT_TYPE_ID: TFloatField;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxSplitter1: TcxSplitter;
    pcMain: TcxPageControl;
    tabImage: TcxTabSheet;
    tapText: TcxTabSheet;
    tabScript: TcxTabSheet;
    cxDBMemo1: TcxDBMemo;
    dsTypesFMT_ICON: TStringField;
    cxDBMemo2: TcxDBMemo;
    imgIcon: TcxImage;
    PopupMenu1: TPopupMenu;
    itemLoadFromFile: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure dsTypesAfterOpen(DataSet: TDataSet);
    procedure dsTypesCalcFields(DataSet: TDataSet);
    procedure tabImageResize(Sender: TObject);
    procedure dsTypesAfterScroll(DataSet: TDataSet);
    procedure itemLoadFromFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

const
  cMaxBytes = 100000;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if OracleLogon.Execute then
    if OracleSession.Connected then
      dsTypes.Open
    else
      Halt(1)
  else
    Halt(1);
end;

procedure TfrmMain.dsTypesAfterOpen(DataSet: TDataSet);
begin
  cxDBTreeList1.DataController.GotoFirst;
end;

procedure TfrmMain.dsTypesCalcFields(DataSet: TDataSet);
  const
    iCount = 50;
  var
    sIcon    : string;
    sFmtIcon : string;
    s        : string;
begin
  sIcon    := DataSet.FieldByName( 'ICON' ).AsString;
  sFmtIcon := '';
  while Length( sIcon ) > 0 do
    begin
      s        := Copy( sIcon, 1, iCount );
      sFmtIcon := sFmtIcon + '''' + s + ''' ||' + #$D#$A;
      sIcon    := Copy( sIcon, iCount + 1, Length( sIcon ) - iCount );
    end;
  DataSet.FieldByName( 'FMT_ICON' ).AsString := sFmtIcon;
end;

procedure TfrmMain.tabImageResize(Sender: TObject);
begin
  imgIcon.Top  := Round( (tabImage.Height - imgIcon.Height) / 2 );
  imgIcon.Left := Round( (tabImage.Width  - imgIcon.Width ) / 2 );
end;

procedure TfrmMain.dsTypesAfterScroll(DataSet: TDataSet);
  var
    sIcon    : string;
    bIcon    : array [0..cMaxBytes] of Char;
    Buf      : array [0..cMaxBytes] of Char;
    lenBuf   : Integer;
    memStrm  : TMemoryStream;

    i : Integer;
begin
  sIcon := AnsiLowerCase( DataSet.FieldByName( 'ICON' ).AsString );
  lenBuf := Trunc( Length( sIcon ) / 2 );
  for i := 0 to lenBuf * 2 - 1 do
    bIcon[i] := sIcon[i + 1];
  bIcon[ lenBuf * 2 ] := #0;
  HexToBin( bIcon, Buf, lenBuf );

  memStrm := TMemoryStream.Create;
  try
    memStrm.Write( Buf, lenBuf );
    memStrm.Position := 0;
    imgIcon.Picture.Bitmap.LoadFromStream( memStrm );
  finally
    memStrm.Free;
  end;
end;

procedure TfrmMain.itemLoadFromFileClick(Sender: TObject);
  var
    sIcon    : string;
    bIcon    : array [0..cMaxBytes] of Char;
    Buf      : array [0..cMaxBytes] of Char;
    lenBuf   : Integer;
    memStrm  : TMemoryStream;

    i : Integer;
begin
  if OpenPictureDialog1.Execute then
    begin
      imgIcon.Picture.LoadFromFile( OpenPictureDialog1.FileName );

      memStrm := TMemoryStream.Create;
      try
        imgIcon.Picture.Bitmap.SaveToStream( memStrm );
        memStrm.Position := 0;
        lenBuf := memStrm.Size;
        memStrm.read( Buf, lenBuf );

        BinToHex( Buf, bIcon, lenBuf );

        SetLength( sIcon, lenBuf * 2 );
        for i := 0 to lenBuf * 2 - 1 do
          sIcon[i + 1] := bIcon[i];

        dsTypes.Edit;
        dsTypes.FieldByName( 'ICON' ).AsString := sIcon;
        dsTypes.Post;
      finally
        memStrm.Free;
      end;
    end;
end;

end.
