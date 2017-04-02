unit StateTransitFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl,
  cxMemo, cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit,
  fdcObjectLinkEdit;

type
  TStateTransitForm = class(TObjectForm)
    dsDataSTATE_SCHEME_ID: TFloatField;
    dsDataSRC_STATE_ID: TFloatField;
    dsDataDST_STATE_ID: TFloatField;
    dsDataBEFORE_PROCEDURE_ID: TFloatField;
    dsDataAFTER_PROCEDURE_ID: TFloatField;
    dsDataSTATE_SCHEMENAME: TStringField;
    dsDataSTATE_SCHEMESYSNAME: TStringField;
    dsDataSRC_STATENAME: TStringField;
    dsDataSRC_STATESYSNAME: TStringField;
    dsDataDST_STATENAME: TStringField;
    dsDataDST_STATESYSNAME: TStringField;
    dsDataBEFORE_PROCEDURENAME: TStringField;
    dsDataBEFORE_PROCEDURESYSNAME: TStringField;
    dsDataAFTER_PROCEDURENAME: TStringField;
    dsDataAFTER_PROCEDURESYSNAME: TStringField;
    edtSysName: TcxDBTextEdit;
    lciSysName: TdxLayoutItem;
    edtStateSchemeID: TfdcObjectLinkEdit;
    lciStateScheme: TdxLayoutItem;
    edtBeforeProcedure: TfdcObjectLinkEdit;
    lciBeforeProcedure: TdxLayoutItem;
    edtAfterProcedure: TfdcObjectLinkEdit;
    lciAfterProcedure: TdxLayoutItem;
    cmbxSrcStateID: TcxDBLookupComboBox;
    lciSrcStateID: TdxLayoutItem;
    srcSchemeState: TDataSource;
    dsSchemeState: TfdcQuery;
    dsSchemeStateID: TFloatField;
    dsSchemeStateName: TStringField;
    cmbxDstStateID: TcxDBLookupComboBox;
    lciDstStateID: TdxLayoutItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure cmbxSrcStateIDDblClick(Sender: TObject);
    procedure cmbxDstStateIDDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StateTransitForm: TStateTransitForm;

implementation

{$R *.dfm}

procedure TStateTransitForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsSchemeState.Close;
end;

procedure TStateTransitForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IsNew then
     begin
       dsDataState_Scheme_ID.AsFloat := Params.ParamByName('OMasterID').AsFloat;
       dsDataState_SchemeName.AsString := Params.ParamByName('OMasterName').AsString;
     end;

  if dsSchemeState.Active then
     dsSchemeState.Close;
  dsSchemeState.Open;
end;

procedure TStateTransitForm.cmbxSrcStateIDDblClick(Sender: TObject);
begin
  inherited;
  if dsDataSrc_State_ID.asFloat < 1 then exit;
  ObjectServices.OpenObject(dsDataSrc_State_ID.asFloat, nil);
end;

procedure TStateTransitForm.cmbxDstStateIDDblClick(Sender: TObject);
begin
  inherited;
  if dsDataDst_State_ID.asFloat < 1 then exit;
  ObjectServices.OpenObject(dsDataDst_State_ID.asFloat, nil);
end;

initialization
  RegisterClass(TStateTransitForm);

end.
