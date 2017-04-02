unit UserGroupGridByTaskFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, UserGroupGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls, cxLabel,
  cxProgressBar, cxMaskEdit, cxSpinEdit, dxStatusBar, fdcObjectCore,
  fdcCustomDataFrm;

type
  TUserGroupGridByTaskForm = class(TUserGroupGridForm)
    dsDataTASK_ID: TFloatField;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdDataDBBandedTableViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
  private
    { Private declarations }
    procedure AddUserGroup(AGroup: TfdcObject;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure RemoveUserGroup(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DoUserGroupSearchFinished(const ADragObject: TfdcDragObject);
  protected
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; override;
  public
    procedure AddUserGroups(AGroups: TfdcObjectList);
  end;

var
  UserGroupGridByTaskForm: TUserGroupGridByTaskForm;

implementation

uses fdcUtils, fdcMessages, MainDm;

{$R *.dfm}

{ TUserGroupGridByTaskForm }

procedure TUserGroupGridByTaskForm.AddUserGroup(AGroup: TfdcObject; AIndex,
  ACount: integer; var ADescr: string; var ABreak: boolean);
var
  GroupName: string;
  TaskName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Добавление задачи в группы...';
    ShowProgress(ADescr);
    if Assigned(AGroup) and
       AGroup.IsOfType('UserGroup') and
       (not AGroup.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.AddTaskToUserGroup(ParamByName('ID').AsFloat, AGroup.ID);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      TaskName := ParamByName('NAME').AsString;
      GroupName := AGroup.ObjName;
      UserMessage := 'Ошибка добавления задачи в группу';
      UserHint := 'При попытке добавления задачи ' +
        TaskName + ' в группу ' + GroupName + ' произошла ошибка.';

      { показать сообщение }
      if AIndex < ACount - 1 then
      begin
        UserHint := UserHint + #10'Продолжить добавление задачи в оставшиеся группы?';
        if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
          ABreak := True;
      end
      else
        MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TUserGroupGridByTaskForm.RemoveUserGroup(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  GroupName: string;
  TaskName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Удаление задачи из групп...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.RemoveTaskFromUserGroup(ParamByName('ID').AsFloat, dsDataID.AsFloat);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      GroupName := dsDataNAME.AsString;
      TaskName := ParamByName('NAME').AsString;
      UserMessage := 'Ошибка удаления задачи из группы';
      UserHint := 'При попытке удаления задачи ' +
        TaskName + ' из группы ' + GroupName + ' произошла ошибка.';

      { показать сообщение }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'Продолжить удаление задачи из оставшихся групп?';
          if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
            ABreak := True;
        end
        else
          MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TUserGroupGridByTaskForm.DoUserGroupSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddUserGroups(ADragObject.Objects);
end;

function TUserGroupGridByTaskForm.IsWaiter(
  AForm: TfdcCustomDataForm): boolean;
begin
  Result := inherited IsWaiter(AForm) or
    (AForm.ClassName = 'TTaskGridByUserGroupForm') or
    (AForm.ClassName = 'TTaskGridByUserForm');
end;

procedure TUserGroupGridByTaskForm.AddUserGroups(AGroups: TfdcObjectList);
begin
  IterateObjects(AGroups, AddUserGroup);
end;

procedure TUserGroupGridByTaskForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TUserGroupGridForm', 'UserGroup', 0,
    Params, Self, True, DoUserGroupSearchFinished);
end;

procedure TUserGroupGridByTaskForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('Исключить задачу из выбранных групп?',
       'Сейчас будет проведено исключение задачи ' +
       ParamByName('NAME').AsString + ' из выбранных групп.'#10 +
       'Исключить задачу из групп?') = mrYes then
  begin
    { удалить пользователя из выбранных групп }
    try
      Refresh;
      with ActiveGridTableView.Controller do
        IterateRecords(RemoveUserGroup, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;

    { обновить ожидающие формы }
    RefreshWaiters;
  end;
end;

procedure TUserGroupGridByTaskForm.grdDataDBBandedTableViewDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept :=
    (Source is TfdcDragObject) and
    ((Source as TfdcDragObject).Sender <> Sender) and
    ((Source as TfdcDragObject).HasMultipleObjectsOfType('UserGroup'));
end;

procedure TUserGroupGridByTaskForm.grdDataDBBandedTableViewDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  AddUserGroups((Source as TfdcDragObject).Objects);
end;

initialization
  RegisterClass(TUserGroupGridByTaskForm);

end.
