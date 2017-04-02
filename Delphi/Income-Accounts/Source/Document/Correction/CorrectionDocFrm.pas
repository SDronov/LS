unit CorrectionDocFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit, QueryList;

type
  TCorrectionDocForm = class(TDocumentForm)
    dsDataDOC_ID: TFloatField;
    lcgDocumentSource: TdxLayoutGroup;
    lcDocumentSource: TdxLayoutItem;
    edtDocumentSource: TfdcObjectLinkEdit;
    dsDataDOC_SOURCE_NAME: TStringField;
    QueryList1: TQueryList;
    sqlActivate: TsqlOp;
    procedure actSaveExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectionDocForm: TCorrectionDocForm;

implementation

{$R *.dfm}
procedure TCorrectionDocForm.actSaveExecute(Sender: TObject);
begin
  inherited;

  try
    sqlActivate.Exec;
  except
  end;
end;

initialization
  RegisterClass(TCorrectionDocForm);

end.
