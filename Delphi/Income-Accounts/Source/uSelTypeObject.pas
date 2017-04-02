unit uSelTypeObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, OracleData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxTLData, ImgList;

type
  TfSelTypeObject = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    odsGetType: TOracleDataSet;
    dsGetType: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    Panel3: TPanel;
    Label1: TLabel;
    odsGetTypeID: TFloatField;
    odsGetTypePARENT_OBJECT_TYPE_ID: TFloatField;
    odsGetTypeNAME: TStringField;
    odsGetTypeSYSNAME: TStringField;
    cxDBTreeList1ID: TcxDBTreeListColumn;
    cxDBTreeList1PARENT_OBJECT_TYPE_ID: TcxDBTreeListColumn;
    cxDBTreeList1NAME: TcxDBTreeListColumn;
    cxDBTreeList1SYSNAME: TcxDBTreeListColumn;
    ImageList1: TImageList;
    odsGetTypeIND: TFloatField;
    cxDBTreeList1IND: TcxDBTreeListColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure odsGetTypeAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    TypeStr :String;
    TypeId  :Integer;
  end;

var
  fSelTypeObject: TfSelTypeObject;

implementation

uses MainDm;


{$R *.dfm}

procedure TfSelTypeObject.cxButton1Click(Sender: TObject);
begin
   TypeStr:=odsGetType.FieldValues['sysname'];
   TypeId:=odsGetType.FieldValues['id'];
end;

procedure TfSelTypeObject.FormShow(Sender: TObject);
begin
   odsGetType.SQL.Text:=StringReplace(odsGetType.SQL.Text,'@str',TypeStr,[rfReplaceAll]);
   if odsGetType.Active  then
                  odsGetType.Close;
   odsGetType.Open;
   cxDBTreeList1.FullExpand;
end;

procedure TfSelTypeObject.odsGetTypeAfterScroll(DataSet: TDataSet);
begin
   if DataSet.FieldByName('ind').AsInteger = 1   then
        cxButton1.Enabled := True
     else
        cxButton1.Enabled := false   ;

end;

end.
