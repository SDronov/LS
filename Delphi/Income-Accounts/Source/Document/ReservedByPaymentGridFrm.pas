unit ReservedByPaymentGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, QueryList;

type
  TReservedByPaymentGridForm = class(TfdcCustomGridForm)
    actUnLock: TAction;
    dxBarButton2: TdxBarButton;
    QueryList1: TQueryList;
    sqlUnlock: TsqlOp;
    dsDataID: TFloatField;
    dsDataNAME: TStringField;
    dsDataSHORTNAME: TStringField;
    dsDataOBJECT_TYPE_ID: TFloatField;
    dsDataSTATE_ID: TFloatField;
    dsDataACCESSLEVEL: TFloatField;
    dsDataSYSNAME: TStringField;
    dsDataDESCRIPT: TStringField;
    dsDataOWNER_OBJECT_ID: TFloatField;
    dsDataTYPENAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    dsDataOBJECTKINDLIST: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataPAYMENT_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataPAYMENT_DATE: TDateTimeField;
    dsDataREASON_CODE: TStringField;
    dsDataDOC_ID: TFloatField;
    dsDataDOC_KEY: TStringField;
    dsDataBDATE: TDateTimeField;
    dsDataEDATE: TDateTimeField;
    dsDataDOC_NAME: TStringField;
    dsDataPO_NAME: TStringField;
    dsDataPO_NO: TStringField;
    dsDataPO_DATE: TDateTimeField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCURR_CODE: TStringField;
    dsDataPAYER_ID: TFloatField;
    dsDataPO_TYPENAME: TStringField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBKCODE: TStringField;
    dsDataIS_TS: TStringField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataNOTE: TStringField;
    dsDataSUBJECT_NAME: TStringField;
    dsDataSUBJECT_INN: TStringField;
    dsDataSUBJECT_KPP: TStringField;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn;
    bcomboFiltr: TdxBarCombo;
    procedure FormShow(Sender: TObject);
    procedure actUnLockExecute(Sender: TObject);
    procedure actUnLockUpdate(Sender: TObject);
    procedure actSwitchSearchCriteriaUpdate(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure bcomboFiltrChange(Sender: TObject);
    procedure grdDataDBBandedTableViewNOTEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure grdDataDBBandedTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResFDeclGridForm: TReservedByPaymentGridForm;

implementation

uses MainDM, fdcCustomDBDataFrm, MainFrm;

{$R *.dfm}

procedure TReservedByPaymentGridForm.FormShow(Sender: TObject);
begin
  inherited;
  pnlSearchCriteria.Visible := False;
  splSearchCriteria.Visible := False;
end;

procedure TReservedByPaymentGridForm.actUnLockExecute(Sender: TObject);
begin
  inherited;
  if not dsData.Eof
    and (MessageDlg('Разблокировать сумму?', mtConfirmation, [mbOK,mbCancel], 0)=mrOk) then
    begin
    sqlUnlock.Exec('ID',[dsData['ID']]);
    RefreshData;
    end;
end;

procedure TReservedByPaymentGridForm.actUnLockUpdate(Sender: TObject);
begin
  inherited;
  if not(dsData.EOF) and (dsDataedate.IsNull) and (dsDataTYPESYSNAME.AsString = 'ReservedPayment.Decl') then
    TAction(Sender).Enabled:= True
    else
    TAction(Sender).Enabled:= False;
end;

procedure TReservedByPaymentGridForm.actSwitchSearchCriteriaUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Visible:= False;
end;

procedure TReservedByPaymentGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  TfdcQuery(DataSet).ParamByName('sign').AsInteger := bcomboFiltr.ItemIndex;
end;

procedure TReservedByPaymentGridForm.bcomboFiltrChange(Sender: TObject);
begin
  inherited;
  actRefresh.Execute;
end;

procedure TReservedByPaymentGridForm.grdDataDBBandedTableViewNOTEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  AText := WrapText(AText, 100);
end;

procedure TReservedByPaymentGridForm.grdDataDBBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not(dsDataDOC_ID.IsNull) then
    begin
      MainForm.ObjectServices.OpenObject(dsDataDOC_ID.AsFloat,nil);
    end;
end;

initialization
   RegisterClass(TReservedByPaymentGridForm);

end.
