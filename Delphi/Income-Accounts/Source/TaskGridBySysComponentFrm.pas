unit TaskGridBySysComponentFrm;

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
  TTaskGridBySysComponentForm = class(TTaskGridForm)
    dsDataSYSCOMPONENT_ID: TFloatField;
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
  TaskGridBySysComponentForm: TTaskGridBySysComponentForm;

implementation

uses fdcUtils, fdcMessages, MainDm;

{$R *.dfm}

procedure TTaskGridBySysComponentForm.AddTask(ATask: TfdcObject; AIndex,
  ACount: integer; var ADescr: string; var ABreak: boolean);
var
  TaskName: string;
  SysComponentName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Добавление компонента в задачи...';
    ShowProgress(ADescr);
    if Assigned(ATask) and
       ATask.IsOfType('Task') and
       (not ATask.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.AddSysComponentToTask( ParamByName('ID').AsFloat, ATask.ID);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      SysComponentName := ParamByName('NAME').AsString;
      TaskName := ATask.ObjName;
      UserMessage := 'Ошибка добавления компонента в задачу';
      UserHint := 'При попытке добавления компонента ' +
        SysComponentName + ' в задачу ' + TaskName + ' произошла ошибка.';

      { показать сообщение }
      if AIndex < ACount - 1 then
      begin
        UserHint := UserHint + #10'Продолжить добавление оставшихся компонент в задачу?';
        if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
          ABreak := True;
      end
      else
        MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TTaskGridBySysComponentForm.RemoveTask(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  TaskName: string;
  SysComponentName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Исключение компоненты из задач...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.RemoveSysComponentFromTask(ParamByName('ID').AsFloat, dsDataID.AsFloat);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      TaskName := dsDataNAME.AsString;
      SysComponentName := ParamByName('NAME').AsString;
      UserMessage := 'Ошибка исключения компонента из задачи';
      UserHint := 'При попытке исключения компонента ' +
        SysComponentName + ' из задачи ' + TaskName + ' произошла ошибка.';

      { показать сообщение }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'Продолжить исключение оставшихся компонент из задачи?';
          if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
            ABreak := True;
        end
        else
          MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TTaskGridBySysComponentForm.DoTaskSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddTasks(ADragObject.Objects);
end;

function TTaskGridBySysComponentForm.IsWaiter(
  AForm: TfdcCustomDataForm): boolean;
begin
  Result := inherited IsWaiter(AForm) or
    (AForm.ClassName = 'TSysComponentGridByTaskForm');
end;

procedure TTaskGridBySysComponentForm.AddTasks(ATasks: TfdcObjectList);
begin
  IterateObjects(ATasks, AddTask);
end;

procedure TTaskGridBySysComponentForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TTaskGridForm', 'Task', 0,
    Params, Self, True, DoTaskSearchFinished);
end;

procedure TTaskGridBySysComponentForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('Исключить компонент из выбранных задач?',
       'Сейчас будет проведено исключение компонента ' +
       ParamByName('NAME').AsString + ' из выбранных задач.'#10 +
       'Исключить компонент из задач?') = mrYes then
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

procedure TTaskGridBySysComponentForm.grdDataDBBandedTableViewDragOver(
  Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  inherited;
  Accept :=
    (Source is TfdcDragObject) and
    ((Source as TfdcDragObject).Sender <> Sender) and
    ((Source as TfdcDragObject).HasMultipleObjectsOfType('Task'));
end;

procedure TTaskGridBySysComponentForm.grdDataDBBandedTableViewDragDrop(
  Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  AddTasks((Source as TfdcDragObject).Objects);
end;

initialization
  RegisterClass(TTaskGridBySysComponentForm);

end.
