unit uReturnsYByPackGridForm;

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
  dxStatusBar, Oracle, OracleData, cxCurrencyEdit, cxCheckBox;

type
  TfReturnsYByPackGridForm = class(TObjectGridForm)
    btnDoForm: TdxBarButton;
    aDoForm: TAction;
    pkgDocPackReturnsY: TOraclePackage;
    dsDocPackState: TOracleDataSet;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataOPERATE_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCASHDESK_ID: TFloatField;
    dsDataCARDNUM: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataAGREEMENT_ID: TFloatField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataNOTE: TStringField;
    dsDataNREF: TStringField;
    dsDataACCOUNT_K: TStringField;
    dsDataBIC_K: TStringField;
    dsDataNLS: TStringField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_KPP: TStringField;
    dsDataCASHDESK_NAME: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataREST_SUMMA: TFloatField;
    dsDataLOCKED_SUMMA: TFloatField;
    dsDataCOMING_DATE: TDateTimeField;
    dsDataASSURE_DATE: TDateTimeField;
    dsDataDESCRIPT2: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataPO_NAME: TStringField;
    dsDataPO_INN: TStringField;
    dsDataPO_KPP: TStringField;
    dsDataS_NAME: TStringField;
    dsDataS_INN: TStringField;
    dsDataS_KPP: TStringField;
    dsDataDEC_PAY_ID: TFloatField;
    dsDataDECISION_DOC_NO: TStringField;
    dsDataDECISION_DOC_DATE: TDateTimeField;
    dsDataDECISION_BIC: TStringField;
    dsDataDECISION_BANK_NAME: TStringField;
    dsDataDECISION_CORR_ACCOUNT: TStringField;
    dsDataDECISION_ACCOUNT: TStringField;
    dsDataDECISION_PERSONAL_ACCOUNT: TStringField;
    dsDataDECISION_DATE_LAST_DOC: TDateTimeField;
    dsDataREG_RET_ID: TFloatField;
    dsDataREG_RET_DOC_NO: TStringField;
    dsDataREG_RET_DOC_DATE: TDateTimeField;
    dsDataREG_RET_DOC_SEND: TDateTimeField;
    dsDataACTIVATION_DATE_Y: TDateTimeField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataSEQ_PAYMENT: TStringField;
    dsDataKIND_PAYMENT: TStringField;
    dsDataRECIPIENT_ID: TFloatField;
    dsDataDESTCUSTOMSCODE: TStringField;
    dsDataKBK: TStringField;
    dsDataKBKCODE: TStringField;
    dsDataCUSTOMSFULLNAME: TStringField;
    dsDataCNFRM_ID: TFloatField;
    dsDataCNFRM_ACTTIVATION_DATE: TDateTimeField;
    dsDataCNFRM_IS_ACTIVE: TStringField;
    dsDataCNFRM_DOC_DATE: TDateTimeField;
    dsDataCNFRM_DOC_NUMBER: TStringField;
    dsDataSTATE_NAME: TStringField;
    dsDataSTATE_SYSNAME: TStringField;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_DOC_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_DOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_BIC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_BANK_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_CORR_ACCOUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_ACCOUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_PERSONAL_ACCOUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_DATE_LAST_DOC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREG_RET_DOC_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREG_RET_DOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREG_RET_DOC_SEND: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMSFULLNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCNFRM_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCNFRM_ACTTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCNFRM_IS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCNFRM_DOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCNFRM_DOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEC_PAY_ID: TcxGridDBBandedColumn;
    actDecisionOpen: TAction;
    barBtnDecisionOpen: TdxBarButton;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dsDataIS_TS: TStringField;
    procedure aDoFormExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actDeleteUpdate(Sender: TObject);
    procedure aDoFormUpdate(Sender: TObject);
    procedure actDecisionOpenExecute(Sender: TObject);
    procedure actDecisionOpenUpdate(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReturnsYByPackGridForm: TfReturnsYByPackGridForm;

implementation

uses fdcCustomObjectGridFrm, fdcCustomDBDataFrm, MainDm;

{$R *.dfm}

procedure TfReturnsYByPackGridForm.aDoFormExecute(Sender: TObject);
begin
  pkgDocPackReturnsY.CallProcedure( 'FormPackage', [ParamByName( 'ID' ).AsInteger] );
  RefreshData;
end;

procedure TfReturnsYByPackGridForm.actDeleteExecute(Sender: TObject);
begin
  if MessageDlg( 'Исключить документ ' + dsData.FieldByName( 'name' ).AsString+ ' из реестра?',
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
    begin
      pkgDocPackReturnsY.CallProcedure( 'RemoveDoc', [ ParamByName( 'id' ).AsInteger, dsData.FieldByName( 'cnfrm_id' ).AsInteger ] );
      RefreshData;
    end;
end;

procedure TfReturnsYByPackGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  dsDocPackState.SetVariable( 'id', dsData.Params.ParamValues['id'] );
  if dsDocPackState.Active then
    dsDocPackState.Refresh
  else
    dsDocPackState.Open;
end;

procedure TfReturnsYByPackGridForm.actDeleteUpdate(Sender: TObject);
begin
  actDelete.Enabled := dsDocPackState.Active
                   and not dsDocPackState.IsEmpty
                   and dsData.Active
                   and not dsData.IsEmpty;
end;

procedure TfReturnsYByPackGridForm.aDoFormUpdate(Sender: TObject);
begin
  aDoForm.Enabled := dsDocPackState.Active
                 and not dsDocPackState.IsEmpty;
end;

procedure TfReturnsYByPackGridForm.actDecisionOpenExecute(Sender: TObject);
begin
  if not (    dsData.Active
          and not dsData.IsEmpty
          and ( grdDataDBBandedTableView.Controller.SelectedRowCount > 0 ) ) then
    Exit;

  ObjectServices.OpenObject( grdDataDBBandedTableView.Controller.SelectedRows[0].Values[ grdDataDBBandedTableViewDEC_PAY_ID.Index ], nil );
end;

procedure TfReturnsYByPackGridForm.actDecisionOpenUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and ( grdDataDBBandedTableView.Controller.SelectedRowCount > 0 );
end;

procedure TfReturnsYByPackGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ARecord.Values[ grdDataDBBandedTableViewSTATE_SYSNAME.Index ] = 'State.PayBack.Received' then
    AStyle := MainData.stlPOPaybackLoaded
  else if ARecord.Values[ grdDataDBBandedTableViewSTATE_SYSNAME.Index ] = 'State.PayBack.Confirm' then
    AStyle := MainData.stlPOPaybackConfirmed
  else if ARecord.Values[ grdDataDBBandedTableViewSTATE_SYSNAME.Index ] = 'State.PayBack.Denial' then
    AStyle := MainData.stlPOPaybackDenial
  else
    AStyle := MainData.stlPOPaybackWorked;
end;

initialization
  RegisterClass( TfReturnsYByPackGridForm );
end.
