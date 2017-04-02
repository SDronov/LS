unit SysComponentGridByTaskFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, SysComponentGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, ActnList,
  cxContainer, dxLayoutLookAndFeels, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls, cxLabel,
  cxProgressBar, cxMaskEdit, cxSpinEdit, dxStatusBar, fdcObjectCore,
  fdcCustomDataFrm, Menus;

type
  TSysComponentGridByTaskForm = class(TSysComponentGridForm)
    dsDataBASE_TYPE_ID: TFloatField;
    dsDataBASETYPENAME: TStringField;
    dsDataTASK_ID: TFloatField;
    grdDataDBBandedTableViewBASETYPENAME: TcxGridDBBandedColumn;
    btnAddComps: TdxBarButton;
    actAddComponents: TAction;
    actGetInsertList: TAction;
    btnGetInsertList: TdxBarButton;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdDataDBBandedTableViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure actAddComponentsExecute(Sender: TObject);
    procedure actGetInsertListExecute(Sender: TObject);
  private
    procedure AddSysComponent(ASysComponent: TfdcObject;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure RemoveSysComponent(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DoSysComponentSearchFinished(const ADragObject: TfdcDragObject);
  protected
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; override;
  public
    procedure AddSysComponents(ASysComponents: TfdcObjectList);
  end;

implementation

uses fdcUtils, fdcMessages, TaskAddComponentsFrm, GetTaskInsertFrm, MainDm;

{$R *.dfm}

procedure TSysComponentGridByTaskForm.AddSysComponent(
  ASysComponent: TfdcObject; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  TaskName: string;
  SysComponentName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Добавление компонент в задачу...';
    ShowProgress(ADescr);
    if Assigned(ASysComponent) and
       ASysComponent.IsOfType('SysComponent') and
       (not ASysComponent.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.AddSysComponentToTask(ASysComponent.ID, ParamByName('ID').AsFloat);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      TaskName := ParamByName('NAME').AsString;
      SysComponentName := ASysComponent.ObjName;
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

procedure TSysComponentGridByTaskForm.RemoveSysComponent(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  TaskName: string;
  SysComponentName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Исключение компонент из задачи...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.RemoveSysComponentFromTask(dsDataID.AsFloat, ParamByName('ID').AsFloat);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      SysComponentName := dsDataNAME.AsString;
      TaskName := ParamByName('NAME').AsString;
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

procedure TSysComponentGridByTaskForm.DoSysComponentSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddSysComponents(ADragObject.Objects);
end;

function TSysComponentGridByTaskForm.IsWaiter(
  AForm: TfdcCustomDataForm): boolean;
begin
  Result := inherited IsWaiter(AForm) or
    (AForm.ClassName = 'TTaskGridBySysComponentForm');
end;

procedure TSysComponentGridByTaskForm.AddSysComponents(
  ASysComponents: TfdcObjectList);
begin
  IterateObjects(ASysComponents, AddSysComponent);
end;

procedure TSysComponentGridByTaskForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TSysComponentGridForm', 'SysComponent', 0,
    Params, Self, True, DoSysComponentSearchFinished);
end;

procedure TSysComponentGridByTaskForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('Исключить выбранные компоненты из задачи?',
       'Сейчас будет проведено исключение выбранных компонент из задачи ' +
       ParamByName('NAME').AsString + '.'#10 +
       'Исключить компоненты из задачи?') = mrYes then
  begin
    { удалить пользователя из выбранных групп }
    try
      Refresh;
      with ActiveGridTableView.Controller do
        IterateRecords(RemoveSysComponent, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;

    { обновить ожидающие формы }
    RefreshWaiters;
  end;
end;

procedure TSysComponentGridByTaskForm.grdDataDBBandedTableViewDragOver(
  Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  inherited;
  Accept :=
    (Source is TfdcDragObject) and
    ((Source as TfdcDragObject).Sender <> Sender) and
    ((Source as TfdcDragObject).HasMultipleObjectsOfType('SysComponent'));
end;

procedure TSysComponentGridByTaskForm.grdDataDBBandedTableViewDragDrop(
  Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  AddSysComponents((Source as TfdcDragObject).Objects);
end;

procedure TSysComponentGridByTaskForm.actAddComponentsExecute(
  Sender: TObject);
begin
  with TTaskAddComponentsForm.Create(nil) do
  try
    if (ShowModal = mrOk) and (ObjectList <> nil) then
      AddSysComponents(ObjectList);
  finally
    Free;
  end;
end;

procedure TSysComponentGridByTaskForm.actGetInsertListExecute(
  Sender: TObject);
begin
  GetTaskInsertFrm.ShowInsertForm(dsDataTask_Id.value);
end;

initialization
  RegisterClass(TSysComponentGridByTaskForm);

end.
