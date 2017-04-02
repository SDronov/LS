{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: MainFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}
unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomOraMainFrm, cxGraphics, XPMan, AppEvnts,
  ImgList, dxBar, cxContainer, cxEdit, dxLayoutLookAndFeels, ActnList,
  cxControls, dxStatusBar, cxLookAndFeels, ExtCtrls, cxLabel, StdActns,
  DB, fdcObjectCore, fdcObjectServices, ObjectFrm, fdcOracleSession,
  dxDockControl, dxDockPanel, cxSplitter, fdcCustomGridFrm, fdcInspector,
  fdcCustomObjectFrm, fdcCustomObjectGridFrm, fdcParamsHolder,
  NavigatorFrm, ObjectBufferFrm, StdCtrls, dxBarExtItems;

const
  SIgnoreVersionParam = 'ignore_version';

type

  { TMainForm }
  TMainForm = class(TfdcCustomOraMainForm, IfdcObjectServices)
    pnlNavigator: TdxDockPanel;
    LeftDockSite: TdxDockSite;
    RightDockSite: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    pnlObjectBuffer: TdxDockPanel;
    actShowNavigator: TAction;
    actShowBuffer: TAction;
    miShowNavigator: TdxBarButton;
    miShowBuffer: TdxBarButton;
    actCopyToBuffer: TAction;
    actPasteFromBuffer: TAction;
    miCopyToBuffer: TdxBarButton;
    miPasteFromBuffer: TdxBarButton;
    actClearBuffer: TAction;
    miClearBuffer: TdxBarButton;
    actOpenFromBuffer: TAction;
    miOpenFromBuffer: TdxBarButton;
    actRemoveFromBuffer: TAction;
    miRemoveFromBuffer: TdxBarButton;
    dxVertContainerDockSite1: TdxVertContainerDockSite;
    tmrCheckVersion: TTimer;
    tmrCloseApp: TTimer;
    pnlClose: TPanel;
    lblClose: TLabel;
    Image1: TImage;
    miClosePanel: TdxBarControlContainerItem;
    actObjectGridTree: TAction;
    pmnObjectBuffer: TdxBarPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pnlNavigatorVisibleChanged(Sender: TdxCustomDockControl);
    procedure pnlObjectBufferVisibleChanged(Sender: TdxCustomDockControl);
    procedure tmrCheckVersionTimer(Sender: TObject);
    procedure tmrCloseAppTimer(Sender: TObject);
    procedure actShowNavigatorUpdate(Sender: TObject);
    procedure actShowNavigatorExecute(Sender: TObject);
    procedure actShowBufferUpdate(Sender: TObject);
    procedure actShowBufferExecute(Sender: TObject);
    procedure actCopyToBufferUpdate(Sender: TObject);
    procedure actCopyToBufferExecute(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure actClearBufferUpdate(Sender: TObject);
    procedure actClearBufferExecute(Sender: TObject);
    procedure actOpenFromBufferUpdate(Sender: TObject);
    procedure actOpenFromBufferExecute(Sender: TObject);
    procedure actRemoveFromBufferUpdate(Sender: TObject);
    procedure actRemoveFromBufferExecute(Sender: TObject);
    procedure actObjectGridTreeUpdate(Sender: TObject);
    procedure actObjectGridTreeExecute(Sender: TObject);
  private
    FObjectTypeFactory: TfdcObjectTypeFactory;
    FObjectFactory: TfdcObjectFactory;
    FFileFactory: TfdcFileFactory;
    FObjectServices: IfdcObjectServices;
    FUser: TfdcObject;
    FSaveObjectBufferTreeViewMouseDown: TMouseEvent;
    CloseMoment: TDateTime;

    function GetNavigator: TNavigatorForm;
    function GetObjectBuffer: TObjectBufferForm;
    function GetActiveObjectID: double;
    function GetIgnoreVersionMode: boolean;
  protected
    function GetSession: TfdcOracleSession; override;
    function CreateComponent(AClassName: string; AOwner: TComponent = nil): TComponent; override;
    procedure CheckVersion(ACloseImmediate: boolean = True); virtual;
    procedure ObjectBufferTreeViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    function FindObjectForm(AID: double): TfdcCustomObjectForm;
    function ShowObjectForm(AObject: TfdcObject; AParams: TParams = nil): TfdcCustomObjectForm; overload;
    function ShowObjectForm(AID: double; AParams: TParams = nil): TfdcCustomObjectForm; overload;
    function ShowNewObjectForm(ATypeSysName: string; ACheckChilds: boolean = True; AParams: TParams = nil): TfdcCustomObjectForm;

    procedure FreeObject(AID: double);

    property ObjectTypeFactory: TfdcObjectTypeFactory read FObjectTypeFactory;
    property ObjectFactory: TfdcObjectFactory read FObjectFactory;
    property FileFactory: TfdcFileFactory read FFileFactory;
    property ObjectServices: IfdcObjectServices read FObjectServices implements IfdcObjectServices;
    property Navigator: TNavigatorForm read GetNavigator;
    property ObjectBuffer: TObjectBufferForm read GetObjectBuffer;
    property ActiveObjectID: double read GetActiveObjectID;
    property IgnoreVersionMode: boolean read GetIgnoreVersionMode;
    property User: TfdcObject read FUser;
  end;

var
  MainForm: TMainForm;

implementation

uses
  fdcUtils, fdcMessages, MainDm, fdcCustomMainDm, fdcCustomWindowFrm,
  ObjectTypeTreeDlgFrm, ObjectGridTreeFrm;

{$R *.dfm}

type

  { TfdcObjectServices }
  TfdcObjectServices = class(TInterfacedObject, IfdcObjectServices)
  private
    function GetObjectFactory: TfdcObjectFactory;
    function GetObjectTypeFactory: TfdcObjectTypeFactory;
    function GetFileFactory: TfdcFileFactory;

    function CreateObject(ATypeSysName: string; ACheckChilds: boolean = True;
      AParams: TParams = nil): TForm;
    function FindObject(AID: double): TForm;
    function OpenObject(AID: double; AParams: TParams = nil): TForm;
    function SearchObject(ASearchFormClassName, ASearchTypeSysName: string;
      ASelectedObjectID: double; AParams: TParams; ASourceComponent: TComponent;
      ASearchMultiple: boolean; AOnSearchFinished: TOnSearchFinishedEvent): TForm;
    procedure FreeObject(AID: double);

    function ShowForm(AClassName: string; AParams: TParams = nil; ADockSite: TWinControl = nil): TForm;

    procedure NavigateForm(AForm: IfdcNavigableForm; AUpdateChilds: boolean = True);
  public
    constructor Create;
  end;

{ TfdcObjectServices }

constructor TfdcObjectServices.Create;
begin
  inherited Create;

  with MainForm, MainData do
  begin
    { check connection }
    if not Session.Connected then Exit;

    try
      { init object type factory }
      FObjectTypeFactory := TfdcObjectTypeFactory.Create(MainForm);
      ObjectTypeFactory.LoadQuery  := dsObjectTypeAll;
      //ObjectTypeFactory.CheckQuery := dsObjectIs;
      ObjectTypeFactory.ActionList := ActionList;
      ObjectTypeFactory.Load;

      { init object factory }
      FObjectFactory := TfdcObjectFactory.Create(MainForm);
      ObjectFactory.ObjectTypes := FObjectTypeFactory;
      ObjectFactory.LoadQueries.Add(dsObject);
      ObjectFactory.LoadQueries.Add(dsEvent);

      { init file factory }
      FFileFactory := TfdcFileFactory.Create(MainForm);
      FileFactory.Directory := GetAppTempDir;
      FileFactory.LobQuery := qryLobQuery;

      { load current user }
      FUser := ObjectFactory.GetObject(MainData.GetUser, True);

      { check version }
      MainForm.CheckVersion;

      { create navigator }
      NavigatorForm := TNavigatorForm.Create(MainForm);
      Navigator.TreeView.Images := imglAction;
      Navigator.Align := alClient;
      Navigator.ManualDock(pnlNavigator);
      Navigator.Show;

      { create object buffer }
      ObjectBufferForm := TObjectBufferForm.Create(MainForm);
      ObjectBuffer.ObjectServices := Self;
      ObjectBuffer.TreeView.Images := imglAction;
      FSaveObjectBufferTreeViewMouseDown := ObjectBuffer.TreeView.OnMouseDown;
      ObjectBuffer.TreeView.OnMouseDown := ObjectBufferTreeViewMouseDown;
      ObjectBuffer.Align := alClient;
      ObjectBuffer.ManualDock(pnlObjectBuffer);
      ObjectBuffer.Show;
    except
      on E: Exception do
      begin
        E.Message :=
          '<<Ошибка инициализации приложения>>. ' +
          '<<Приложение не может быть запущено. Обратитесь к администратору системы.>> '+E.Message;
        ErrorDlg(E);
        Application.ShowMainForm := False;
        PostQuitMessage(0);
      end;
    end;
  end;
end;

function TfdcObjectServices.GetObjectFactory: TfdcObjectFactory;
begin
  Result := nil;
  if Assigned(MainForm) then
    Result := MainForm.ObjectFactory;
end;

function TfdcObjectServices.GetObjectTypeFactory: TfdcObjectTypeFactory;
begin
  Result := nil;
  if Assigned(MainForm) then
    Result := MainForm.ObjectTypeFactory;
end;

function TfdcObjectServices.GetFileFactory: TfdcFileFactory;
begin
  Result := nil;
  if Assigned(MainForm) then
    Result := MainForm.FileFactory;
end;

function TfdcObjectServices.CreateObject(ATypeSysName: string;
  ACheckChilds: boolean = True; AParams: TParams = nil): TForm;
begin
  Result := nil;
  if Assigned(MainForm) then
    Result := MainForm.ShowNewObjectForm(ATypeSysName, ACheckChilds, AParams);
end;

function TfdcObjectServices.FindObject(AID: double): TForm;
begin
  Result := nil;
  if Assigned(MainForm) then
    Result := MainForm.FindObjectForm(AID);
end;

function TfdcObjectServices.OpenObject(AID: double; AParams: TParams = nil): TForm;
begin
  Result := nil;
  if Assigned(MainForm) then
    Result := MainForm.ShowObjectForm(AID, AParams);
end;

function TfdcObjectServices.SearchObject(ASearchFormClassName,
  ASearchTypeSysName: string; ASelectedObjectID: double;
  AParams: TParams; ASourceComponent: TComponent;
  ASearchMultiple: boolean; AOnSearchFinished: TOnSearchFinishedEvent): TForm;
begin
  try
    Result := MainForm.CreateComponent(ASearchFormClassName,
      ASourceComponent) as TForm;
    if Result is TfdcCustomGridForm then
      with Result as TfdcCustomGridForm do
      begin
        SearchMode := True;
        SearchMultiple := ASearchMultiple;
        SearchComponent := ASourceComponent;
        if Result is TfdcCustomObjectGridForm then
          with Result as TfdcCustomObjectGridForm do
          begin
            SelectedObjectID := ASelectedObjectID;
            SearchTypeSysName := ASearchTypeSysName;
            OnSearchFinished := AOnSearchFinished;
          end;
      end;
      MainForm.ShowForm(Result, AParams);
  except
    on E: Exception do begin
      E.Message := 'Ошибка инициализации формы поиска ' +
        ASearchFormClassName + '!'#10#13 + E.Message;
      raise;
    end;
  end;
end;

procedure TfdcObjectServices.FreeObject(AID: double);
begin
  if Assigned(MainForm) then
    MainForm.FreeObject(AID);
end;

function TfdcObjectServices.ShowForm(AClassName: string; AParams: TParams = nil;
  ADockSite: TWinControl = nil): TForm;
begin
  Result := nil;
  if Assigned(MainForm) then
    Result := MainForm.ShowForm(AClassName, AParams, ADockSite);
end;

procedure TfdcObjectServices.NavigateForm(AForm: IfdcNavigableForm;
  AUpdateChilds: boolean = True);
begin
  if Assigned(MainForm) and
     Assigned(MainForm.Navigator) then
    MainForm.Navigator.Navigate(AForm, AUpdateChilds);
end;

{ TMainForm }

function TMainForm.GetNavigator: TNavigatorForm;
begin
  Result := NavigatorForm;
end;

function TMainForm.GetObjectBuffer: TObjectBufferForm;
begin
  Result := ObjectBufferForm;
end;

function TMainForm.GetActiveObjectID: double;
begin
  Result := cNewIDNexus;
  if Assigned(Screen.ActiveForm) then
  begin
    { TfdcCustomObjectForm }
    if Screen.ActiveForm is TfdcCustomObjectForm then
      Result := (Screen.ActiveForm as TfdcCustomObjectForm).CurrentObjectID
    else
    { TfdcCustomObjectGridForm }
    if Screen.ActiveForm is TfdcCustomObjectGridForm then
      Result := (Screen.ActiveForm as TfdcCustomObjectGridForm).CurrentObjectID;
  end;
end;

function TMainForm.GetIgnoreVersionMode: boolean;
begin
  Result := FindCmdLineSwitch(SIgnoreVersionParam);
end;

function TMainForm.GetSession: TfdcOracleSession;
begin
  Result := MainData.Session;
end;

function TMainForm.CreateComponent(AClassName: string;
  AOwner: TComponent): TComponent;
begin
  { create component }
  Result := inherited CreateComponent(AClassName, AOwner);

  { set object services interface link }
  if Result is TfdcCustomObjectForm then
    (Result as TfdcCustomObjectForm).ObjectServices := ObjectServices;
  if Result is TfdcCustomObjectGridForm then
    (Result as TfdcCustomObjectGridForm).ObjectServices := ObjectServices;
  if Result is TObjectGridTreeForm then
    (Result as TObjectGridTreeForm).ObjectServices := ObjectServices;
end;

procedure TMainForm.CheckVersion(ACloseImmediate: boolean = True); 
var
  ServerVersion: string;
  VersionMigrate: boolean;
  UserMessage: string;
  UserHint: string;

  procedure ShowClosingBar;
  var
    ClosingBar: TdxBar;
  begin
    ClosingBar := BarManager.BarByName('barClose');
    if Assigned(ClosingBar) then
    begin
      ClosingBar.Visible := True;
      miClosePanel.Visible := ivAlways;
    end;
  end;

  procedure StartClosing;
  begin
    if ACloseImmediate then
      PostQuitMessage(0)
    else
    begin
      tmrCloseApp.Enabled := True;
      ShowClosingBar;
    end;
  end;

begin
  { Проверить ссответствие версии приложения и серверной части }
  if not MainData.CheckVersion(False, ServerVersion, VersionMigrate) then
  begin
    tmrCheckVersion.Enabled := False;
    
    UserMessage := IfElse(VersionMigrate,
      'Переход на новую версию не завершен',
      'Обнаружено несоответствие версий');
    UserHint := IfElse(VersionMigrate,
      'Обнаружен незавершенный процесс перехода на новую версию системы. ',
      'Обнаружено несоответствие версии приложения и серверной части системы: '#10 +
      '  - версия приложения: ' + GetAppVersion + #10 +
      '  - версия серверной части: ' + ServerVersion + '. ');

    {
      Администратор данных либо владелец схемы могут продолжить работу
      в режиме игнорирования версии.
    }
    if  IgnoreVersionMode and
       (
         MainData.UserIsAdminData or
         MainData.UserIsSchemaOwner
       ) then
    begin
      UserHint := UserHint + #10 +
        IfElse(VersionMigrate,
          'Не рекомендуется продолжать работу до завершения процесса перехода на новую версию. ',
          'Не рекомендуется продолжать работу при несоответствии версий. ') + 
        'Если Вы хотите продолжить работу нажмите "Да", иначе нажмите "Нет". ';

      if WarningDlg(UserMessage, UserHint) = mrYes then
      begin
        lblClose.Caption := 'Режим игнорирования версии';
        ShowClosingBar;
      end
      else
        StartClosing;
    end

    { Все остальные пользователи должны покинуть приложение }
    else
    begin
      UserHint := UserHint + #10#10 +
        IfElse(ACloseImmediate,
          'Приложение будет немедленно закрыто.',
          'В течение 3 минут приложение будет автоматически закрыто.');
      MessageDlg(UserMessage, UserHint, '', mtWarning, [mbOk], 0);
      lblClose.Caption := '';
      StartClosing;
    end;
        
  end

  { если все хорошо, то запустить таймер проверки версии }
  else
    tmrCheckVersion.Enabled := True;
end;

procedure TMainForm.ObjectBufferTreeViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  { fire own ObjectBuffer.TreeView.OnMouseDown event }
  if Assigned(FSaveObjectBufferTreeViewMouseDown) then
    FSaveObjectBufferTreeViewMouseDown(Sender, Button, Shift, X, Y);

  { show object buffer popup menu }
  if Button = mbRight then
    pmnObjectBuffer.PopupFromCursorPos;
end;

function TMainForm.FindObjectForm(AID: double): TfdcCustomObjectForm;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to MDIChildCount - 1 do
    if  (MDIChildren[i] is TfdcCustomObjectForm) and
       ((MDIChildren[i] as TfdcCustomObjectForm).ID = AID)  then
    begin
      Result := MDIChildren[i] as TfdcCustomObjectForm;
      Exit;
    end;
end;

function TMainForm.ShowObjectForm(AObject: TfdcObject;
  AParams: TParams = nil): TfdcCustomObjectForm;
begin
  { find visible form }
  Result := FindObjectForm(AObject.ID);

  { create new form }
  if not Assigned(Result) then
  begin
    Result := CreateComponent(AObject.ObjectType.DefaultFormClass) as TfdcCustomObjectForm;
    Result.EditObject := AObject;
  end;

  { show form }
  ShowForm(Result, AParams);
end;

function TMainForm.ShowObjectForm(AID: double; AParams: TParams = nil): TfdcCustomObjectForm;
begin
  Result := ShowObjectForm(ObjectFactory.GetObject(AID, True), AParams);
end;

function TMainForm.ShowNewObjectForm(ATypeSysName: string;
  ACheckChilds: boolean = True; AParams: TParams = nil): TfdcCustomObjectForm;
var
  ObjType: TfdcObjectType;
begin
  Result := nil;

  { get object type }
  if ACheckChilds then
  begin
    ObjType := ObjectTypeFactory.Find(ATypeSysName, True);
    if ObjType.HasChildren then
       ObjType := ExecObjectTypeDlg(ObjType, ObjectServices, 'Тип создаваемого объекта');

    if Assigned(ObjType) then
      ATypeSysName := ObjType.SysName
    else
      Exit;
  end;

  { open new form for the newly created object }
  Result := ShowObjectForm(ObjectFactory.CreateObject(ATypeSysName), AParams);
end;

procedure TMainForm.FreeObject(AID: double);
var
  Obj: TComponent;
  ObjForm: TForm;
begin
  { delete object from DB }
  MainData.FreeObject(AID);

  { close and free object form }
  ObjForm := FindObjectForm(AID);
  if Assigned(ObjForm) then begin
    ObjForm.Close;
    ObjForm.Free;
  end;

  { remove object from the object cache }
  Obj := ObjectFactory.FindObject(AID);
  if Assigned(Obj) then
    Obj.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  
  ClearAppTempDir;
  FObjectServices := TfdcObjectServices.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  inherited;
  ClearAppTempDir;
  FObjectServices := nil;
end;

procedure TMainForm.pnlNavigatorVisibleChanged(
  Sender: TdxCustomDockControl);
begin
  inherited;
  Navigator.Visible := Sender.Visible;
end;

procedure TMainForm.pnlObjectBufferVisibleChanged(
  Sender: TdxCustomDockControl);
begin
  inherited;
  ObjectBuffer.Visible := Sender.Visible;
end;

procedure TMainForm.tmrCheckVersionTimer(Sender: TObject);
begin
  inherited;
  CheckVersion(False);
end;

procedure TMainForm.tmrCloseAppTimer(Sender: TObject);
var
  SecsLeft: integer;
begin
  inherited;

  { disable version checking timer }
  tmrCheckVersion.Enabled := False;

  { set close moment forward to 3 min }
  if CloseMoment = 0 then
    CloseMoment := Now + 180 * (1/(60*60*24));

  { check close moment }  
  if Now > CloseMoment then
    Application.Terminate
  else begin
    SecsLeft := Round((CloseMoment - Now) * 60*60*24);
    lblClose.Caption := IntToStr(SecsLeft) + ' секунд до закрытия приложения';
    lblClose.Refresh;
  end;
end;

procedure TMainForm.actShowNavigatorUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Checked := pnlNavigator.Visible;
end;

procedure TMainForm.actShowNavigatorExecute(Sender: TObject);
begin
  inherited;
  pnlNavigator.Visible := not pnlNavigator.Visible;
end;

procedure TMainForm.actShowBufferUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Checked := pnlObjectBuffer.Visible;
end;

procedure TMainForm.actShowBufferExecute(Sender: TObject);
begin
  inherited;
  pnlObjectBuffer.Visible := not pnlObjectBuffer.Visible;
end;

procedure TMainForm.actCopyToBufferUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBuffer) and
    (not IsNewID(ActiveObjectID));
end;

procedure TMainForm.actCopyToBufferExecute(Sender: TObject);
begin
  inherited;
  ObjectBuffer.AddObject(ObjectFactory.GetObject(ActiveObjectID));
end;

procedure TMainForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(Screen.ActiveControl) and
    Assigned(ObjectBuffer) and
    Assigned(ObjectBuffer.CurObject);
end;

procedure TMainForm.actPasteFromBufferExecute(Sender: TObject);
begin
  inherited;
  Screen.ActiveControl.DragDrop(ObjectBuffer.GetDragObject(Sender), 0, 0);
end;

procedure TMainForm.actClearBufferUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBuffer) and
    (ObjectBuffer.ObjectsCount > 0);
end;

procedure TMainForm.actClearBufferExecute(Sender: TObject);
begin
  inherited;
  ObjectBuffer.Clear;
end;


procedure TMainForm.actOpenFromBufferUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBuffer) and
    Assigned(ObjectBuffer.CurObject);
end;

procedure TMainForm.actOpenFromBufferExecute(Sender: TObject);
begin
  inherited;
  ShowObjectForm(ObjectBuffer.CurObject);
end;

procedure TMainForm.actRemoveFromBufferUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBuffer) and
    Assigned(ObjectBuffer.CurObject);
end;

procedure TMainForm.actRemoveFromBufferExecute(Sender: TObject);
begin
  inherited;
  ObjectBuffer.RemoveCurObject;
end;

procedure TMainForm.actObjectGridTreeUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
     Assigned(Session) and
     Session.Connected; 
end;

procedure TMainForm.actObjectGridTreeExecute(Sender: TObject);
begin
  inherited;
  ShowForm('TObjectGridTreeForm');
end;

end.
