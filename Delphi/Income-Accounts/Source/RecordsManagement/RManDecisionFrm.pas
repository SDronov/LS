unit RManDecisionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit,
  cxDropDownEdit, cxCalendar, cxMaskEdit, cxGraphics, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit,
  DocRManagementFrm, QueryList, fdcWord, cxCheckBox;

type
  TRManDecisionForm = class(TDocRManagementForm)
    edtAppNumber: TcxDBMaskEdit;
    lciAppNUmber: TdxLayoutItem;
    edtAppDate: TcxDBDateEdit;
    lciAppDate: TdxLayoutItem;
    edtAppDateIncome: TcxDBDateEdit;
    lciAppDateIncome: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    cmbxReason: TfdcObjectLookupEdit;
    lciReason: TdxLayoutItem;
    dsDataAPP_NUMBER: TStringField;
    dsDataAPP_DATE: TDateTimeField;
    dsDataAPP_DATE_INCOME: TDateTimeField;
    dsDataREASON_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    lcgAppNumberDate: TdxLayoutGroup;
    dsDataREASON_NAME: TStringField;
    dsReportDOC_DATE: TDateTimeField;
    dsReportDOC_NUMBER: TStringField;
    dsReportDECL_NAME: TStringField;
    dsReportDECL_OKPO: TStringField;
    dsReportDECL_INN: TStringField;
    dsReportDECL_KPP: TStringField;
    dsReportDECL_ADDRESS: TStringField;
    dsReportCASH_ASSETS_NAME: TStringField;
    dsReportREASON_NAME: TStringField;
    dsReportSUMMA: TFloatField;
    lcgAppDoc: TdxLayoutGroup;
    lciAppNumberIncome: TdxLayoutItem;
    edtAppNumberIncome: TcxDBMaskEdit;
    lcgAppDocIncome: TdxLayoutGroup;
    lcReason: TdxLayoutGroup;
    procedure FormCreate(Sender: TObject);
  private
  protected
  public
  end;

implementation

{$R *.dfm}

uses
  DictDM;
  
{ TRManDecisionForm }

procedure TRManDecisionForm.FormCreate(Sender: TObject);
begin
  inherited;

  if not DictData.dsAssetsReason.Active then
    DictData.dsAssetsReason.Open;
end;

initialization
  RegisterClass(TRManDecisionForm);

end.
