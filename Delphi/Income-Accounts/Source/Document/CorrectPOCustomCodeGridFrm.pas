unit CorrectPOCustomCodeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalendar, cxCheckBox, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit,
  cxLabel, dxStatusBar, cxMemo, cxCurrencyEdit;

type
  TCorrectPOCustomCodeGridForm = class(TDocumentGridForm)
    dsDataPAYMENT_ID: TFloatField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDOC_SOURCE_NAME: TStringField;
    dsDataREASON_CORRECT: TStringField;
    dsDataIS_TS: TStringField;
    dsDataCUSTOMCODE_OLD_ID: TFloatField;
    dsDataCUSTOMCODE_OLD: TStringField;
    dsDataCUSTOMCODE_NEW_ID: TFloatField;
    dsDataCUSTOMCODE_NEW: TStringField;
    dsDataUSER_ID: TFloatField;
    dsDataUSER_NAME: TStringField;
    dsDataDOCUMENT_BASE: TStringField;
    dsDataPAYMENT_NUMBER: TStringField;
    dsDataPAYMENT_DATE: TDateTimeField;
    grdDataDBBandedTableViewPAYMENT_NUMBER: TcxGridDBBandedColumn;
    dsDataPAYMENT_DOC_SUMMA: TFloatField;
    grdDataDBBandedTableViewPAYMENT_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_DOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMCODE_OLD: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMCODE_NEW: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREASON_CORRECT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewUSER_NAME: TcxGridDBBandedColumn;
    lciedtPaymentNumber: TdxLayoutItem;
    edtPaymentNumber: TcxMaskEdit;
    lciedtPaymentDateFrom: TdxLayoutItem;
    edtPaymentDateFrom: TcxDateEdit;
    lciedtPaymentDateTo: TdxLayoutItem;
    edtPaymentDateTo: TcxDateEdit;
    lcSearchCriteriaGroup3: TdxLayoutGroup;
    lciedtSumMin: TdxLayoutItem;
    edtSumMin: TcxCurrencyEdit;
    lciedtSumMax: TdxLayoutItem;
    edtSumMax: TcxCurrencyEdit;
    lciedtReasonCorrect: TdxLayoutItem;
    edtReasonCorrect: TcxMemo;
    lcSearchCriteriaGroup4: TdxLayoutGroup;
    lcieditCustomcodeOld: TdxLayoutItem;
    editCustomcodeOld: TcxMaskEdit;
    lcieditCustomcodeNew: TdxLayoutItem;
    editCustomcodeNew: TcxMaskEdit;
    lcieditUserName: TdxLayoutItem;
    editUserName: TcxMaskEdit;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectPOCustomCodeGridForm: TCorrectPOCustomCodeGridForm;

implementation

{$R *.dfm}

procedure TCorrectPOCustomCodeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam( 'paymentnumber', edtPaymentNumber.Text );
  SetSearchParam( 'payment_date_from', edtPaymentDateFrom.EditValue );
  SetSearchParam( 'payment_date_to', edtPaymentDateTo.EditValue );
  SetSearchParam( 'payment_doc_summa_min', edtSumMin.EditValue  );
  SetSearchParam( 'payment_doc_summa_max', edtSumMax.EditValue );
  SetSearchParam( 'customcodeold', editCustomcodeOld.Text );
  SetSearchParam( 'customcodenew', editCustomcodeNew.Text );
  SetSearchParam( 'reasoncorrect', edtReasonCorrect.Text );
end;

initialization
  RegisterClass(TCorrectPOCustomCodeGridForm);

end.
