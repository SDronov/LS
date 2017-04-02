unit NoticePayGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NoticePayFrm, cxGraphics, QueryList, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxMemo, cxTextEdit, cxPC,
  cxControls, DocRManagementGridFrm, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit, cxLabel, dxStatusBar,
  cxCheckBox;

type
  TNoticePayGridForm = class(TDocRManagementGridForm)
    colDutySumma: TcxGridDBBandedColumn;
    colExcise: TcxGridDBBandedColumn;
    colExecutionDate: TcxGridDBBandedColumn;
    colPaymentDate: TcxGridDBBandedColumn;
    colPenaltySumma: TcxGridDBBandedColumn;
    colNDS: TcxGridDBBandedColumn;
    colCustomsFees: TcxGridDBBandedColumn;
    colPercents: TcxGridDBBandedColumn;
    dsDataDEBTS_REASON_ID: TFloatField;
    dsDataDUTY_SUMMA: TFloatField;
    dsDataEXCISE: TFloatField;
    dsDataNDS: TFloatField;
    dsDataCUSTOMS_FEES: TFloatField;
    dsDataPERCENT: TFloatField;
    dsDataPAYMENT_DATE: TDateTimeField;
    dsDataPENALTY_SDATE: TDateTimeField;
    dsDataPENALTY_EDATE: TDateTimeField;
    dsDataPENALTY_SUMMA: TFloatField;
    dsDataEXECUTION_DATE: TDateTimeField;
    dsDataSUMMA: TFloatField;
    colSumma: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumnDeclINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumnDeclKPP: TcxGridDBBandedColumn;
    lcSearchCriteriaItem11: TdxLayoutItem;
    Label3: TLabel;
    lcSearchCrtFromDateActiveted: TdxLayoutItem;
    edtFromDateActiveted: TcxDateEdit;
    lcSearchCrtToDateActiveted: TdxLayoutItem;
    edtToDateActiveted: TcxDateEdit;
    dsDataASD_DOC_NUMBER: TStringField;
    colASD_Doc_Number: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    dsDataSUMMA_PAYED: TFloatField;
    dsDataPENALTY_SUMMA_PAYED: TFloatField;
    grdDataDBBandedTableViewSUMMA_PAYED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPENALTY_SUMMA_PAYED: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    stlNotReadyNotice: TcxStyle;
    stlNotDecisionForced: TcxStyle;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}
procedure TNoticePayGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('FROM_DATE_ACTIVETED').Value := edtFromDateActiveted.EditValue;
  dsData.ParamByName('TO_DATE_ACTIVETED').Value := edtToDateActiveted.EditValue;
end;

initialization
  RegisterClass(TNoticePayGridForm);

end.
