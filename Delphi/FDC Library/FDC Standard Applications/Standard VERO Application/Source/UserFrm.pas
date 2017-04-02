unit UserFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TUserForm = class(TObjectForm)
    dsDataLOGIN: TStringField;
    dsDataLASTNAME: TStringField;
    dsDataFIRSTNAME: TStringField;
    dsDataMIDDLENAME: TStringField;
    dsDataALLOWGRANTOPTION: TIntegerField;
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
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure cxDBLookupComboBox1PropertiesInitPopup(Sender: TObject);
    procedure tabUserGroupShow(Sender: TObject);
    procedure tabEventShow(Sender: TObject);
    procedure tabTaskShow(Sender: TObject);
    procedure actReGrantUpdate(Sender: TObject);
    procedure actReGrantExecute(Sender: TObject);
  private
    { Private declarations }
    FUserGroupGridForm: TForm;
    FEventGridForm: TForm;
    FTaskGridForm: TForm;
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
    cmbxLogin.Style.Color := clSilver;//clInactiveCaptionText;
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
    FEventGridForm := ObjectServices.ShowForm('TEventGridByUserForm', Params, tabEvent);
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

initialization
  RegisterClass(TUserForm);

end.
