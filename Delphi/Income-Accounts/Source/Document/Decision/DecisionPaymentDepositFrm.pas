unit DecisionPaymentDepositFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionPaymentFrm, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit, cxPC,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit,
  fdcObjectLookupEdit, QueryList;

type
  TDecisionPaymentDepositForm = class(TDecisionPaymentForm)
    dsetTR: TOracleDataSet;
    dsetTRNAME: TStringField;
    dsetTRSHORTNAME: TStringField;
    dsetTROBJECT_TYPE_ID: TFloatField;
    dsetTRSTATE_ID: TFloatField;
    dsetTRACCESSLEVEL: TFloatField;
    dsetTRSYSNAME: TStringField;
    dsetTRDESCRIPT: TStringField;
    dsetTROWNER_OBJECT_ID: TFloatField;
    dsetTRTYPENAME: TStringField;
    dsetTRTYPESYSNAME: TStringField;
    dsetTROBJECTKINDLIST: TStringField;
    dsetTRID: TFloatField;
    dsetTRMODIFY_DATE: TDateTimeField;
    dsetTRCUSTOM_MODE_ID: TFloatField;
    dsetTRCURRENCY_ID: TFloatField;
    dsetTRSUBJECT_ID: TFloatField;
    dsetTRCUSTOMS_CODE: TStringField;
    dsetTRREG_DATE: TDateTimeField;
    dsetTRDECL_NO: TStringField;
    dsetTRDECISION_CODE: TStringField;
    dsetTRDOC_NUMBER: TStringField;
    dsetTRDOC_DATE: TDateTimeField;
    dsetTRIS_ACTIVE: TStringField;
    dsetTRACTIVATION_DATE: TDateTimeField;
    dsetTRDECL_NAME: TStringField;
    dsetTRDECL_INN: TStringField;
    dsetTRDECL_KPP: TStringField;
    dsetTRCARRIER_NAME: TStringField;
    dsetTRCARRIER_INN: TStringField;
    dsetTRCARRIER_KPP: TStringField;
    dsetTRNUM_MPO: TStringField;
    dsetTRREGIM: TStringField;
    dsetTRMETH_MOVE: TStringField;
    dsetTRORDER_TYPE: TStringField;
    dsetTRSUM_RUB: TFloatField;
    dsetTRCARRIER_ID: TFloatField;
    dsetTRERR_COUNT: TFloatField;
    dsetTRERRPAY_COUNT: TFloatField;
    dsetTRDEBT_COUNT: TFloatField;
    dsetTRANN_DATE: TDateTimeField;
    dsetTRPAYOFF_DATE: TDateTimeField;
    dsetTRDATE_CREATED: TDateTimeField;
    dsetTRSTATESYSNAME: TStringField;
    dsetTRPAYTIME_FINISHED: TFloatField;
    dsetTROPERATION_DATE: TDateTimeField;
    dsTR: TDataSource;
    grdTR: TcxGrid;
    grdTRDBTableView: TcxGridDBTableView;
    grdTRDBTableViewNAME: TcxGridDBColumn;
    grdTRDBTableViewDOC_NUMBER: TcxGridDBColumn;
    grdTRDBTableViewDOC_DATE: TcxGridDBColumn;
    grdTRDBTableViewIS_ACTIVE: TcxGridDBColumn;
    grdTRDBTableViewACTIVATION_DATE: TcxGridDBColumn;
    grdTRDBTableViewDECL_NAME: TcxGridDBColumn;
    grdTRDBTableViewDECL_INN: TcxGridDBColumn;
    grdTRDBTableViewDECL_KPP: TcxGridDBColumn;
    grdTRLevel: TcxGridLevel;
    dsDataSUMMA_BASE: TFloatField;
    sqlOpGetRefObj: TsqlOp;
    procedure dsetTRBeforeQuery(Sender: TOracleDataSet);
    procedure grdTRDBTableViewDblClick(Sender: TObject);
    procedure tabDocObligationsShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetDocObligationsFormType : string; override;
  public
    { Public declarations }
  end;

var
  DecisionPaymentDepositForm: TDecisionPaymentDepositForm;
  

implementation

{$R *.dfm}

uses
  MainDM, fdcCustomDBDataFrm, fdcCustomObjectFrm, fdcMessages;

procedure TDecisionPaymentDepositForm.dsetTRBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable( 'ID', dsData.FieldByName( 'ID' ).AsFloat );
end;

procedure TDecisionPaymentDepositForm.grdTRDBTableViewDblClick(
  Sender: TObject);
begin          
  ObjectServices.OpenObject( dsetTR.FieldByName( 'ID' ).asFloat, Params );
end;

procedure TDecisionPaymentDepositForm.tabDocObligationsShow(
  Sender: TObject);
begin
  if not dsetTR.Active then
    dsetTR.Open
  else
    dsetTR.Refresh;
end;

function TDecisionPaymentDepositForm.GetDocObligationsFormType: string;
begin
  Result := '';
end;

initialization
  RegisterClass( TDecisionPaymentDepositForm );

end.
