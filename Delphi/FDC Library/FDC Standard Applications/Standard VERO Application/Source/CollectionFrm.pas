unit CollectionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxCheckBox;

type
  TCollectionForm = class(TObjectForm)
    dsDataCOLDATE: TDateTimeField;
    dsDataUSER_ID: TFloatField;
    dsDataDEFCOLLECTION: TIntegerField;
    dsDataCUR_USER_DEFCOLLECTION: TFloatField;
    dsDataUSERNAME: TStringField;
    dsDataLOGIN: TStringField;
    dsDataSTATENAME: TStringField;
    edtUserID: TfdcObjectLinkEdit;
    lciUserID: TdxLayoutItem;
    edtColDate: TcxDBTextEdit;
    lciColDate: TdxLayoutItem;
    chbxDefCollection: TcxDBCheckBox;
    lciDefCollection: TdxLayoutItem;
    tabContent: TcxTabSheet;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabContentShow(Sender: TObject);
  private
    { Private declarations }

    { ссылки на дочерние формы списков }
    FContentGridForm: TForm;
  public
    { Public declarations }
  end;

var
  CollectionForm: TCollectionForm;

implementation

{$R *.dfm}

procedure TCollectionForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if IsNew then
     dsDataDefCollection.asInteger := 0;
end;

procedure TCollectionForm.tabContentShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FContentGridForm) then
     FContentGridForm := ShowForm('TObjectGridByCollectionForm', Params, tabContent);
end;

initialization
  RegisterClass(TCollectionForm);

end.
