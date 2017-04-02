unit ReestrSpecifyKindPayGridByReestrFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxDropDownEdit, cxCalendar, QueryList, Oracle,
  cxCurrencyEdit, dxBarExtItems, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, OracleData, cxCheckBox;

type
  TReestrSpecifyKindPayGridByReestrForm = class(TObjectGridForm)
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtNO: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtFrom: TcxDateEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtTO: TcxDateEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtCODE: TcxTextEdit;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDATE_INPUT: TDateTimeField;
    dsDataDATE_SEND: TDateTimeField;
    dsDataTOTAL_SUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCURRENCY: TStringField;
    dsDataDATE_CONFIRM: TDateTimeField;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_SEND: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTOTAL_SUMM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_CONFIRM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    qlSQLCursor: TQueryList;
    sqlGetNoticeCurrency: TsqlOp;
    sqlGetConfirmCurrency: TsqlOp;
    qlSQLResult: TQueryList;
    sqlGetReestrNotice: TsqlOp;
    sqlGetReestrConfirm: TsqlOp;
    sqlGetReestrNoticeBuild: TsqlOp;
    sqlGetReestrConfirmBuild: TsqlOp;
    sqlGetCNoticeCurrency: TsqlOp;
    sqlGetReestrCNotice: TsqlOp;
    sqlGetReestrCNoticeBuild: TsqlOp;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarComboShow: TdxBarCombo;
    sqlGet_is_present_deduct_not_active: TsqlOp;
    dsDataSENDER_SOFT_CODE_ID: TFloatField;
    dsDataSENDER_SOFT_NAME: TStringField;
    dsDataSENDER_SOFT_CODE: TStringField;
    dsDataRECEIVER_SOFT_CODE_ID: TFloatField;
    dsDataRECEIVER_SOFT_NAME: TStringField;
    dsDataRECEIVER_SOFT_CODE: TStringField;
    dsDataIS_RECIEVED: TStringField;
    dsDataRECIEVE_DATE: TDateTimeField;
    dsDataDATE_LOAD: TDateTimeField;
    grdDataDBBandedTableViewDATE_LOAD: TcxGridDBBandedColumn;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarEdit1: TdxBarEdit;
    BarBtnPrint: TdxBarButton;
    dxbcTO: TdxBarCombo;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    RestoredCustoms : string;
  public
    { Public declarations }
    procedure LoadLayout; override;
    procedure SaveLayout; override;
  end;

var
  ReestrSpecifyKindPayGridByReestrForm: TReestrSpecifyKindPayGridByReestrForm;

implementation

Uses
  MainDm
 ,fdcCustomDBDataFrm
 ,fdcMessages
 ,fdcReestrSpecifyKindPayUnit
 ,fdcUtils;

{$R *.dfm}

const
  cRegKey_Customs = 'CurrentCustoms';

procedure TReestrSpecifyKindPayGridByReestrForm.actAddExecute(Sender: TObject);
begin
  ;
end;

procedure TReestrSpecifyKindPayGridByReestrForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  SrcCust: string;
begin
  inherited;

  SrcCust := ARecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ];
  if (SrcCust <> MainData.GetSoftCustomsCode) and
  	 ((copy(SrcCust,1,3) = copy(MainData.GetSoftCustomsCode,1,3)) or (MainData.GetCustomsLevel = 0)) then
  begin
    if ARecord.Selected
    then AStyle := MainData.stlDocPackAlienSelected
    else AStyle := MainData.stlDocPackAlien;
  end;
end;

procedure TReestrSpecifyKindPayGridByReestrForm.dsDataBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('DOC_NO', edtNO.EditingValue);
  SetSearchParam('CURR', edtCODE.EditingValue);
  SetSearchParam('FROM_DATE', edtFrom.EditingValue);
  SetSearchParam('TO_DATE', edtTO.EditingValue);
end;

procedure TReestrSpecifyKindPayGridByReestrForm.LoadLayout;
begin
  inherited;
  RestoredCustoms := ReadRegistryValue( FormLayoutRegistryKey, cRegKey_Customs, rvString );
end;

procedure TReestrSpecifyKindPayGridByReestrForm.SaveLayout;
begin
  inherited;
  WriteRegistryValue(FormLayoutRegistryKey, cRegKey_Customs, dxbcTO.Text);
end;

procedure TReestrSpecifyKindPayGridByReestrForm.FormShow(Sender: TObject);
begin
  inherited;
  ;
  // отображаем кнопку отчёта только для уровня FTS и RTU
  //if (MainData.GetCustomsLevel > 1) then
end;

initialization
  RegisterClass(TReestrSpecifyKindPayGridByReestrForm);

end.
