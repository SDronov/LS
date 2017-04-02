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
    ADescr := 'Предоставление роли пользователям...';
    ShowProgress(ADescr);
    if Assigned(AUser) and
       AUser.IsOfType('User') and
       (not AUser.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      if (MainForm.User.id=AUser.ID) then Raise Exception.Create('Пользователь не может сам себе предоставлять роли доступа!');
      MainData.UserGrantRole(AUser.FieldValues['LOGIN'], ParamByName('ROLE_NAME').AsString);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      RoleName := ParamByName('ROLE_NAME').AsString;
      UserName := AUser.ObjName;
      UserMessage := 'Ошибка предоставления роли пользователю';
      UserHint := 'При попытке предоставления роли '+RoleName+' пользователю ' +
        UserName + ' произошла ошибка.';

      { показать сообщение }
      if AIndex < ACount - 1 then
      begin
        UserHint := UserHint + #10'Продолжить предоставление роли оставшимся пользователям?';
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
    ADescr := 'Забрать роль у пользователей...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      if (MainForm.User.id=dsDataID.AsFloat) then Raise Exception.Create('Пользователь не может сам у себя забрать роль доступа!');
      MainData.UserRevokeRole(dsDataLOGIN.AsString, ParamByName('ROLE_NAME').AsString);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      UserName := dsDataNAME.AsString;
      RoleName := ParamByName('ROLE_NAME').AsString;
      UserMessage := 'Ошибка отбора роли у пользователя';
      UserHint := 'При попытке отбора роли '+RoleName+' у пользователя ' +
        UserName + ' произошла ошибка.';

      { показать сообщение }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'Продолжить отбор роли у оставшихся пользователей?';
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
  { добавить пользователей для предоставления роли }
  IterateObjects(AUsers, AddUser);
end;

procedure TUserGridByRoleForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TUserGridForm', 'User', 0,
    Params, Self, True, DoUserSearchFinished);
end;

procedure TUserGridByRoleForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('Отобрать у выбранных пользователей роль?',
       'Сейчас будет проведен отбор роли '+ParamByName('ROLE_NAME').AsString +
       ' у выбранных пользователей ' +
       '.'#10 +
       'Отобрать роль у пользователей?') = mrYes then
  begin
    { отобрать роль у пользователя }
    try
      Refresh;
      with ActiveGridTableView.Controller do
        IterateRecords(RemoveUser, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;

    { обновить ожидающие формы }
    RefreshWaiters;
  end;
end;

initialization
  RegisterClass(TUserGridByRoleForm);

end.
