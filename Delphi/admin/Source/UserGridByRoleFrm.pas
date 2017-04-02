unit UserGridByRoleFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UserGridFrm, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, fdcObjectCore,
  fdcCustomDataFrm;

type
  TUserGridByRoleForm = class(TUserGridForm)
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AddUser(AUser: TfdcObject;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure RemoveUser(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DoUserSearchFinished(const ADragObject: TfdcDragObject);
  protected
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; override;
  public
    { Public declarations }
    procedure AddUsers(AUsers: TfdcObjectList);
  end;

var
  UserGridByRoleForm: TUserGridByRoleForm;

implementation

uses fdcUtils, fdcMessages, MainDm, fdcCustomObjectGridFrm,
  fdcCustomDBDataFrm, MainFrm;

{$R *.dfm}

procedure TUserGridByRoleForm.AddUser(AUser: TfdcObject;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
var
  RoleName: string;
  UserName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := '�������������� ���� �������������...';
    ShowProgress(ADescr);
    if Assigned(AUser) and
       AUser.IsOfType('User') and
       (not AUser.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      if (MainForm.User.id=AUser.ID) then Raise Exception.Create('������������ �� ����� ��� ���� ������������� ���� �������!');
      MainData.UserGrantRole(AUser.FieldValues['LOGIN'], ParamByName('ROLE_NAME').AsString);
  except
    on E: Exception do
    begin
      { ����������� ����� ��������� }
      RoleName := ParamByName('ROLE_NAME').AsString;
      UserName := AUser.ObjName;
      UserMessage := '������ �������������� ���� ������������';
      UserHint := '��� ������� �������������� ���� '+RoleName+' ������������ ' +
        UserName + ' ��������� ������.';

      { �������� ��������� }
      if AIndex < ACount - 1 then
      begin
        UserHint := UserHint + #10'���������� �������������� ���� ���������� �������������?';
        if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
          ABreak := True;
      end
      else
        MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TUserGridByRoleForm.RemoveUser(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  RoleName: string;
  UserName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := '������� ���� � �������������...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      if (MainForm.User.id=dsDataID.AsFloat) then Raise Exception.Create('������������ �� ����� ��� � ���� ������� ���� �������!');
      MainData.UserRevokeRole(dsDataLOGIN.AsString, ParamByName('ROLE_NAME').AsString);
  except
    on E: Exception do
    begin
      { ����������� ����� ��������� }
      UserName := dsDataNAME.AsString;
      RoleName := ParamByName('ROLE_NAME').AsString;
      UserMessage := '������ ������ ���� � ������������';
      UserHint := '��� ������� ������ ���� '+RoleName+' � ������������ ' +
        UserName + ' ��������� ������.';

      { �������� ��������� }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'���������� ����� ���� � ���������� �������������?';
          if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
            ABreak := True;
        end
        else
          MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TUserGridByRoleForm.DoUserSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddUsers(ADragObject.Objects);
end;

function TUserGridByRoleForm.IsWaiter(
  AForm: TfdcCustomDataForm): boolean;
begin
  Result := inherited IsWaiter(AForm) or
    (AForm.ClassName = 'TRoleGridByUserForm');
end;

procedure TUserGridByRoleForm.AddUsers(AUsers: TfdcObjectList);
begin
  { �������� ������������� ��� �������������� ���� }
  IterateObjects(AUsers, AddUser);
end;

procedure TUserGridByRoleForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TUserGridForm', 'User', 0,
    Params, Self, True, DoUserSearchFinished);
end;

procedure TUserGridByRoleForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('�������� � ��������� ������������� ����?',
       '������ ����� �������� ����� ���� '+ParamByName('ROLE_NAME').AsString +
       ' � ��������� ������������� ' +
       '.'#10 +
       '�������� ���� � �������������?') = mrYes then
  begin
    { �������� ���� � ������������ }
    try
      Refresh;
      with ActiveGridTableView.Controller do
        IterateRecords(RemoveUser, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;

    { �������� ��������� ����� }
    RefreshWaiters;
  end;
end;

initialization
  RegisterClass(TUserGridByRoleForm);

end.
