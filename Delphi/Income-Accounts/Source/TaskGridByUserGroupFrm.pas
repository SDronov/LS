unit TaskGridByUserGroupFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, TaskGridFrm, cxGraphics, cxLookAndFeelPainters,
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
  TTaskGridByUserGroupForm = class(TTaskGridForm)
    dsDataUSER_GROUP_ID: TFloatField;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdDataDBBandedTableViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
  private
    { Private declarations }
    procedure AddTask(ATask: TfdcObject;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure RemoveTask(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DoTaskSearchFinished(const ADragObject: TfdcDragObject);
  protected
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; override;
  public
    { Public declarations }
    procedure AddTasks(ATasks: TfdcObjectList);
  end;

var
  TaskGridByUserGroupForm: TTaskGridByUserGroupForm;

implementation

uses fdcUtils, fdcMessages, MainDm;

{$R *.dfm}

{ TTaskGridByUserGroupForm }

procedure TTaskGridByUserGroupForm.AddTask(ATask: TfdcObject; AIndex,
  ACount: integer; var ADescr: string; var ABreak: boolean);
var
  TaskName: string;
  GroupName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Добавление задачи в группу...';
    ShowProgress(ADescr);
    if Assigned(ATask) and
       ATask.IsOfType('Task') and
       (not ATask.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.AddTaskToUserGroup(ATask.ID, ParamByName('ID').AsFloat);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      GroupName := ParamByName('NAME').AsString;
      TaskName := ATask.ObjName;
      UserMessage := 'Ошибка добавления задачи в группу';
      UserHint := 'При попытке добавления задачи ' +
        TaskName + ' в группу ' + GroupName + ' произошла ошибка.';

      { показать сообщение }
      if AIndex < ACount - 1 then
      begin
        UserHint := UserHint + #10'Продолжить добавление оставшихся задач в группу?';
        if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
          ABreak := True;
      end
      else
        MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TTaskGridByUserGroupForm.RemoveTask(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  TaskName: string;
  GroupName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Исключение задач из группы...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.RemoveTaskFromUserGroup(dsDataID.AsFloat, ParamByName('ID').AsFloat);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      GroupName := dsDataNAME.AsString;
      TaskName := ParamByName('NAME').AsString;
      UserMessage := 'Ошибка исключения задачи из группы';
      UserHint := 'При попытке исключения задачи ' +
        TaskName + ' из группы ' + GroupName + ' произошла ошибка.';

      { показать сообщение }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'Продолжить исключение оставшихся задач из группы?';
          if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
            ABreak := True;
        end
        else
          MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TTaskGridByUserGroupForm.DoTaskSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddTasks(ADragObject.Objects);
end;

function TTaskGridByUserGroupForm.IsWaiter(
  AForm: TfdcCustomDataForm): boolean;
begin
  Result := inherited IsWaiter(AForm) or
    (AForm.ClassName = 'TUserGroupGridByTaskForm') or
    (AForm.ClassName = 'TTaskGridByUserForm');
end;

procedure TTaskGridByUserGroupForm.AddTasks(ATasks: TfdcObjectList);
begin
  IterateObjects(ATasks, AddTask);
end;

procedure TTaskGridByUserGroupForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TTaskGridForm', 'Task', 0,
    Params, Self, True, DoTaskSearchFinished);
end;

procedure TTaskGridByUserGroupForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('Исключить выбранные задачи из группы?',
       'Сейчас будет проведено исключение выбранных задач из группы ' +
       ParamByName('NAME').AsString + '.'#10 +
       'Исключить задачи из группы?') = mrYes then
  begin
    { удалить пользователя из выбранных групп }
    try
      Refresh;
      with ActiveGridTableView.Controller do
        IterateRecords(RemoveTask, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;

    { обновить ожидающие формы }
    RefreshWaiters;
  end;
end;

procedure TTaskGridByUserGroupForm.grdDataDBBandedTableViewDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept :=
    (Source is TfdcDragObject) and
    ((Source as TfdcDragObject).Sender <> Sender) and
    ((Source as TfdcDragObject).HasMultipleObjectsOfType('Task'));
end;

procedure TTaskGridByUserGroupForm.grdDataDBBandedTableViewDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  AddTasks((Source as TfdcDragObject).Objects);
end;

initialization
  RegisterClass(TTaskGridByUserGroupForm);

end.
