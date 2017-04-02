unit UserFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGraphics;

type
  TUserForm = class(TObjectForm)
    dsDataLOGIN: TStringField;
    dsDataLASTNAME: TStringField;
    dsDataFIRSTNAME: TStringField;
    dsDataMIDDLENAME: TStringField;
    dsDataALLOWGRANTOPTION: TIntegerField;
    dsDataCRYPTCONTAINER: TStringField;
    dsDataCERT_SUBJECT: TStringField;
    dsOraUser: TfdcQuery;
    srcOraUser: TDataSource;
    cmbxLogin: TcxDBLookupComboBox;
    lcGeneralItem1: TdxLayoutItem;
    edtLastName: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtFirstName: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtMiddleName: TcxDBTextEdit;
    lcGeneralItem4: TdxLayoutItem;
    tabUserGroup: TcxTabSheet;
    tabEvent: TcxTabSheet;
    tabTask: TcxTabSheet;
    actReGrant: TAction;
    btnReGrant: TdxBarButton;
    tabRoles: TcxTabSheet;
    editCryptContainerName: TcxDBTextEdit;
    lcGeneralItem5: TdxLayoutItem;
    editCert_Subject: TcxDBTextEdit;
    lcGeneralItem6: TdxLayoutItem;
    dsDataOBJECTKINDLIST: TStringField;
    dsDataCUSTOM_ID: TFloatField;
    dsDataCUSTOMS_CODE_8: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    edCustom: TcxDBLookupComboBox;
    lciedCustom: TdxLayoutItem;
    dsCustoms: TfdcQuery;
    srcCustoms: TDataSource;
    dsCustomsID: TFloatField;
    dsCustomsNAME: TStringField;
    dsCustomsSHORTNAME: TStringField;
    dsCustomsOBJECT_TYPE_ID: TFloatField;
    dsCustomsSTATE_ID: TFloatField;
    dsCustomsACCESSLEVEL: TFloatField;
    dsCustomsSYSNAME: TStringField;
    dsCustomsDESCRIPT: TStringField;
    dsCustomsOWNER_OBJECT_ID: TFloatField;
    dsCustomsTYPENAME: TStringField;
    dsCustomsTYPESYSNAME: TStringField;
    dsCustomsOBJECTKINDLIST: TStringField;
    dsCustomsADDRESS: TStringField;
    dsCustomsFULL_NAME: TStringField;
    dsCustomsOKPO: TStringField;
    dsCustomsINN: TStringField;
    dsCustomsOGRN: TStringField;
    dsCustomsSOATO: TStringField;
    dsCustomsKPP: TStringField;
    dsCustomsPHONE: TStringField;
    dsCustomsFAX: TStringField;
    dsCustomsTELEX: TStringField;
    dsCustomsTELEGRAPH: TStringField;
    dsCustomsTELETYPE: TStringField;
    dsCustomsCUSTOMS_CODE: TStringField;
    dsCustomsCUSTOMS_CODE_8: TStringField;
    dsCustomsDT_START: TDateTimeField;
    dsCustomsTTT: TStringField;
    dsCustomsCERT_SUBJECT: TStringField;
    dsCustomsSYSCRYPTO: TStringField;
    dsCustomsDT_END: TDateTimeField;
    dsCustomsPARENT_ID: TFloatField;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure cxDBLookupComboBox1PropertiesInitPopup(Sender: TObject);
    procedure tabUserGroupShow(Sender: TObject);
    procedure tabEventShow(Sender: TObject);
    procedure tabTaskShow(Sender: TObject);
    procedure actReGrantUpdate(Sender: TObject);
    procedure actReGrantExecute(Sender: TObject);
    procedure tabRolesShow(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
    FUserGroupGridForm: TForm;
    FEventGridForm: TForm;
    FTaskGridForm: TForm;
    FRoleGridForm: TForm;
  public
    { Public declarations }
    procedure ReGrant;
  end;

var
  UserForm: TUserForm;

implementation

uses fdcUtils, fdcMessages, MainDm, fdcCustomObjectFrm;

{$R *.dfm}

procedure TUserForm.ReGrant;
var
  UserName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    if not dsDataLOGIN.IsNull then
      MainData.ReGrantUser(dsDataLOGIN.AsString);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      UserName := dsDataNAME.AsString;
      UserMessage := 'Ошибка выдачи прав пользователю';
      UserHint := 'При попытке выдачи прав пользователю ' +
        UserName + ' произошла ошибка.';
      { показать сообщение }
      MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TUserForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  { init lookup data }
  cxDBLookupComboBox1PropertiesInitPopup(Self);
  { disable login editing for the existing users
    cause of logging event issues }
  if not IsNew then
  begin
    cmbxLogin.Properties.ReadOnly := True;
    cmbxLogin.Style.Color := clSilver; //clInactiveCaptionText;
  end;
end;

procedure TUserForm.cxDBLookupComboBox1PropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  RefreshDataset(dsOraUser);
end;

procedure TUserForm.tabUserGroupShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FUserGroupGridForm) then
    FUserGroupGridForm := ObjectServices.ShowForm('TUserGroupGridByUserForm', Params, tabUserGroup);
end;

procedure TUserForm.tabEventShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FEventGridForm) then
    FEventGridForm := ObjectServices.ShowForm('TEventsGridForm', Params, tabEvent);
end;

procedure TUserForm.tabTaskShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FTaskGridForm) then
    FTaskGridForm := ObjectServices.ShowForm('TTaskGridByUserForm', Params, tabTask);
end;

procedure TUserForm.actReGrantUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices) and
    (not dsDataLOGIN.IsNull);
end;

procedure TUserForm.actReGrantExecute(Sender: TObject);
begin
  inherited;
  ReGrant;
end;

procedure TUserForm.tabRolesShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FRoleGridForm) then
    FRoleGridForm := ObjectServices.ShowForm('TRoleGridByUserForm', Params, tabRoles);
end;

procedure TUserForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsCustoms.Open;
end;

procedure TUserForm.dsDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsCustoms.Close;
end;

initialization
  RegisterClass(TUserForm);

end.
