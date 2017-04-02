unit RoleGridByUserFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RoleGridFrm, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
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
  TRoleGridByUserForm = class(TRoleGridForm)
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AddRole(ARole: TfdcObject;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure RemoveRole(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DoRoleSearchFinished(const ADragObject: TfdcDragObject);
  protected
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; override;
  public
    { Public declarations }
    procedure AddRoles(ARoles: TfdcObjectList);
  end;

var
  RoleGridByUserForm: TRoleGridByUserForm;

implementation

uses fdcUtils, fdcMessages, MainDm, fdcCustomObjectGridFrm,
  fdcCustomDBDataFrm, MainFrm;

{$R *.dfm}

procedure TRoleGridByUserForm.AddRole(ARole: TfdcObject;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
var
  RoleName: string;
  UserName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Предоставление пользователю роли...';
    ShowProgress(ADescr);
    if Assigned(ARole) and
       ARole.IsOfType('Role') and
       (not ARole.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.UserGrantRole(ParamByName('LOGIN').AsString, ARole.FieldValues['ROLE_NAME']);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      UserName := ParamByName('NAME').AsString;
      RoleName := ARole.ObjName;
      UserMessage := 'Ошибка предоставления пользователю роли';
      UserHint := 'При попытке предоставления пользователю ' + UserName +
      ' роли '+RoleName+' произошла ошибка.';

      { показать сообщение }
      if AIndex < ACount - 1 then
      begin
        UserHint := UserHint + #10'Продолжить предоставление пользователю оставшихся ролей?';
        if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
          ABreak := True;
      end
      else
        MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TRoleGridByUserForm.RemoveRole(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  RoleName: string;
  UserName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Забрать у пользователя роль...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.UserRevokeRole(ParamByName('LOGIN').AsString, dsDataROLE_NAME.AsString );
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      RoleName := dsDataROLE_NAME.AsString;
      UserName := ParamByName('NAME').AsString;
      UserMessage := 'Ошибка отбора у пользователя роли';
      UserHint := 'При попытке отбора у пользователя ' + UserName +
      ' роли '+RoleName+' произошла ошибка.';

      { показать сообщение }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'Продолжить отбор у пользователя оставшихся ролей?';
          if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
            ABreak := True;
        end
        else
          MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TRoleGridByUserForm.DoRoleSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddRoles(ADragObject.Objects);
end;

function TRoleGridByUserForm.IsWaiter(
  AForm: TfdcCustomDataForm): boolean;
begin
  Result := inherited IsWaiter(AForm) or
    (AForm.ClassName = 'TUserGridByRoleForm');
end;

procedure TRoleGridByUserForm.AddRoles(ARoles: TfdcObjectList);
begin
  { добавить роли для предоставления пользователю }
  IterateObjects(ARoles, AddRole);
end;


procedure TRoleGridByUserForm.actAddExecute(Sender: TObject);
begin
  if (MainForm.User.id=dsData.ParamByName('ID').AsFloat) then Raise Exception.Create('Пользователь не может сам себе предоставить роли доступа!');
  ObjectServices.SearchObject('TRoleGridForm', 'Role', 0, Params, Self, True, DoRoleSearchFinished);
end;


procedure TRoleGridByUserForm.actDeleteExecute(Sender: TObject);
begin
  if (MainForm.User.id=dsData.ParamByName('ID').AsFloat) then Raise Exception.Create('Пользователь не может сам у себя забрать роль доступа!');
  if WarningDlg('Отобрать у пользователя выбранные роли?',
       'Сейчас будет проведен отбор у пользователя '+ParamByName('NAME').AsString +
       ' выбранных ролей ' +
       '.'#10 +
       'Отобрать у пользователя роли?') = mrYes then
  begin
    { отобрать роль у пользователя }
    try
      Refresh;
      with ActiveGridTableView.Controller do
        IterateRecords(RemoveRole, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;

    { обновить ожидающие формы }
    RefreshWaiters;
  end;
end;

initialization
  RegisterClass(TRoleGridByUserForm);

end.
