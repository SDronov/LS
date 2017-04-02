{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomMainFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcCustomMainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fdcCustomWindowFrm, cxGraphics,
  cxContainer, cxEdit, AppEvnts, ImgList, ActnList, dxBar,
  XPMan, cxControls, dxStatusBar, dxLayoutLookAndFeels,
  cxLookAndFeels, cxLabel, StdActns, StdCtrls, dxDockControl,
  fdcInspector, fdcParamsHolder, DB, Contnrs;

type
  TfdcCustomMainForm = class;

  { THistoryList }
  THistoryList = class(TObjectList)
  private
    FActiveIndex: integer;
    Owner: TfdcCustomMainForm;
    SaveScreenActiveFormChange: TNotifyEvent;

    function GetItems(i: integer): TForm;
    function GetBackwardIndex(AIndex: integer): integer;
    function GetForwardIndex(AIndex: integer): integer;
    procedure ScreenActiveFormChange(Sender: TObject);
    procedure RemoveDuplicates;
    procedure ShowActiveItem;
  public
    constructor Create(AOwner: TfdcCustomMainForm);
    destructor Destroy; override;

    function CanNavBackward: boolean;
    function CanNavForward: boolean;

    procedure NavBackward;
    procedure NavForward;

    procedure Remove(AForm: TForm);

    property ActiveIndex: integer read FActiveIndex write FActiveIndex;
    property Items[i: integer]: TForm read GetItems; default;
  end;

  { Базовый класс для главного окна приложения }
  TfdcCustomMainForm = class(TfdcCustomWindowForm)
    XPManifest: TXPManifest;
    actWindowCascade: TWindowCascade;
    actWindowTileHorizontal: TWindowTileHorizontal;
    actWindowTileVertical: TWindowTileVertical;
    actWindowMinimizeAll: TWindowMinimizeAll;
    actWindowArrange: TWindowArrange;
    actWindowClose: TWindowClose;
    miWindow: TdxBarSubItem;
    miWindowArrange: TdxBarButton;
    miWindowCascade: TdxBarButton;
    miWindowClose: TdxBarButton;
    miWindowMinimizeAll: TdxBarButton;
    miWindowTileHorizontal: TdxBarButton;
    miWindowTileVertical: TdxBarButton;
    miWindowList: TdxBarListItem;
    fdcInspector1: TfdcInspector;
    actNavBackward: TAction;
    actNavForward: TAction;
    miNavBack: TdxBarButton;
    miNavForward: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure actResetLayoutExecute(Sender: TObject);
    procedure miWindowListGetData(Sender: TObject);
    procedure miWindowListClick(Sender: TObject);
    procedure actNavBackwardUpdate(Sender: TObject);
    procedure actNavBackwardExecute(Sender: TObject);
    procedure actNavForwardUpdate(Sender: TObject);
    procedure actNavForwardExecute(Sender: TObject);
  private
    HistoryList: THistoryList;

    procedure RegisterChildForm(AForm: TForm);
    function GetDockingLayoutRegistryKey: string;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    { Создать компонент типа AClassName }
    function CreateComponent(AClassName: string; AOwner: TComponent = nil): TComponent; virtual;

    { Показывать ли стандартное окно заставки приложения.

      Переопределите данную функцию чтобы реализовать
      ваше собственное поведение. }
    function IsShowSplash: boolean; virtual;

    { Показать стандартное окно заставки приложения.

      Переопределите данную функцию чтобы реализовать
      ваше собственное поведение. }
    procedure ShowSplash; virtual;

    { Скрыть окно заставки приложения. По умолчанию
      показывается стандартное окно заставки приложения.

      Переопределите данную функцию чтобы реализовать
      ваше собственное поведение. }
    procedure HideSplash; virtual;

    { Показать окно с сообщением об ошибке.

      Переопределите данную функцию чтобы реализовать
      ваше собственное поведение. }
    procedure ShowError(E: Exception); virtual;
  public
    { Сбросить настройки внешнего вида формы }
    procedure LoadLayout; override;
    { Сбросить настройки внешнего вида формы }
    procedure SaveLayout; override;
    { Сбросить настройки внешнего вида приложения }
    procedure ResetLayout; override;

    { Показать форму }
    procedure ShowForm(AForm: TForm; AParams: TParams = nil; ADockSite: TWinControl = nil); overload;
    function ShowForm(AClassName: string; AParams: TParams = nil; ADockSite: TWinControl = nil): TForm; overload;

    property DockingLayoutRegistryKey: string read GetDockingLayoutRegistryKey;
  end;

implementation

uses
  fdcUtils, fdcMessages, fdcExceptions, fdcSplashFrm, fdcCustomDataFrm,
  fdcCustomFrm;

{$R *.dfm}

const
  SDocking = 'Docking';

{ THistoryList }

constructor THistoryList.Create(AOwner: TfdcCustomMainForm);
begin
  inherited Create(False);

  ActiveIndex := -1;
  Owner := AOwner;
  SaveScreenActiveFormChange := Screen.OnActiveFormChange;
  Screen.OnActiveFormChange := ScreenActiveFormChange;
end;

destructor THistoryList.Destroy;
begin
  Screen.OnActiveFormChange := SaveScreenActiveFormChange;
  inherited;
end;

function THistoryList.GetItems(i: integer): TForm;
begin
  Result := (inherited Items[i]) as TForm;
end;

function THistoryList.GetBackwardIndex(AIndex: integer): integer;
begin
  if AIndex > 0 then
    if AIndex <= Count - 1 then
      Result := AIndex - 1
    else
      Result := Count - 1
  else
    Result := AIndex
end;

function THistoryList.GetForwardIndex(AIndex: integer): integer;
begin
  if AIndex < Count - 1 then
    if AIndex >= 0 then
      Result := AIndex + 1
    else
      Result := 0
  else
    Result := AIndex
end;

procedure THistoryList.ScreenActiveFormChange(Sender: TObject);
begin
  if Assigned(SaveScreenActiveFormChange) then
    SaveScreenActiveFormChange(Sender);

  if (Assigned(Screen.ActiveForm)) and
     (Screen.ActiveForm.Visible) and
     (Screen.ActiveForm.FormStyle = fsMDIChild) and
     (
       (ActiveIndex < 0) or
       (ActiveIndex > Count - 1) or
       (Screen.ActiveForm <> Items[ActiveIndex])
     ) then
    begin
      //while (Count-1 > ActiveIndex) do
      //  Delete(Count-1);
      ActiveIndex := Add(Screen.ActiveForm);
    end;
end;

procedure THistoryList.RemoveDuplicates;
var
  i, j, k: integer;
  Form: TForm;
begin
  if Count = 0 then Exit;

  i := 1;
  k := Count;
  Form := Items[0];
  for j:=1 to k-1 do
    if Items[i] <> Form then
    begin
      Form := Items[i];
      Inc(i);
    end
    else
      Delete(i);
end;

procedure THistoryList.ShowActiveItem;
begin
  if (ActiveIndex >= 0) and
     (ActiveIndex <= Count - 1) then
    Items[ActiveIndex].Show;
end;

function THistoryList.CanNavBackward: boolean;
begin
  Result := (ActiveIndex <> -1) and (ActiveIndex > GetBackwardIndex(ActiveIndex));
end;

function THistoryList.CanNavForward: boolean;
begin
  Result := (ActiveIndex <> -1) and (ActiveIndex < GetForwardIndex(ActiveIndex));
end;

procedure THistoryList.NavBackward;
begin
  if CanNavBackward then
  begin
    ActiveIndex := GetBackwardIndex(ActiveIndex);
    ShowActiveItem;
  end;  
end;

procedure THistoryList.NavForward;
begin
  if CanNavForward then
  begin
    ActiveIndex := GetForwardIndex(ActiveIndex);
    ShowActiveItem;
  end;
end;

procedure THistoryList.Remove(AForm: TForm);
begin
  { remove form }
  while IndexOf(AForm) <> -1 do
    inherited Remove(AForm);
  RemoveDuplicates;

  { update active index }
  ActiveIndex := IndexOf(Screen.ActiveForm);
end;

{ TfdcCustomMainForm }
  
function TfdcCustomMainForm.GetDockingLayoutRegistryKey: string;
begin
  Result := FormLayoutRegistryKey + '\' + SDocking;
end;

procedure TfdcCustomMainForm.RegisterChildForm(AForm: TForm);
var
  indx: integer;
begin
  { зарегистрировать выдимую дочернюю MDI форму в списке видимых форм }
  if (Assigned(AForm)) and
     (AForm.Visible) and
     (AForm.FormStyle = fsMDIChild) then
  begin
    AForm.FreeNotification(Self);

    indx := miWindowList.Items.IndexOfObject(AForm);
    if indx = -1 then
      miWindowList.Items.AddObject(AForm.Caption, AForm)
    else
      miWindowList.Items[indx] := AForm.Caption;
  end;
end;

function TfdcCustomMainForm.CreateComponent(AClassName: string;
  AOwner: TComponent = nil): TComponent;
var
  ComponentClass: TPersistentClass;
begin
  { get component class }
  ComponentClass := GetClass(AClassName);
  if not Assigned(ComponentClass) then
    raise Exception.Create('Класс ' + AClassName + ' не зарегистрирован');

  { init owner }
  if AOwner = nil then
    AOwner := Self;

  { create component }
  Result := TComponent(ComponentClass.NewInstance);
  Result.Create(AOwner);
end;

procedure TfdcCustomMainForm.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  indx: integer;
begin
  inherited;
  { исключить удаляемую форму из списка видимых форм }
  if (not (csDestroying in ComponentState)) and
     (Operation = opRemove) and
     (AComponent is TForm) then
  begin
    indx := miWindowList.Items.IndexOfObject(AComponent);
    if indx <> -1 then
      miWindowList.Items.Delete(indx);

    if Assigned(HistoryList) then
      HistoryList.Remove(AComponent as TForm);
  end;
end;

function TfdcCustomMainForm.IsShowSplash: boolean;
begin
  { показывать заставку }
  Result := True;
end;

procedure TfdcCustomMainForm.ShowSplash;
begin
  { показать стандартную заставку }
  ShowSplashScreen;
end;

procedure TfdcCustomMainForm.HideSplash;
begin
  { скрыть стандартную заставку }
  HideSplashScreen;
end;

procedure TfdcCustomMainForm.ShowError(E: Exception);
begin
  { показать стандартное окно с сообщением об ошибке }
  ErrorDlg(E);
end;

procedure TfdcCustomMainForm.LoadLayout;
begin
  inherited;
  DockingManager.LoadLayoutFromRegistry(DockingLayoutRegistryKey);
end;

procedure TfdcCustomMainForm.SaveLayout;
begin
  inherited;
  DockingManager.SaveLayoutToRegistry(DockingLayoutRegistryKey);
end;

procedure TfdcCustomMainForm.ResetLayout;
var
  i: integer;
begin
  inherited;

  { сбросить настройки внешнего вида открытых форм }
  for i:=0 to Screen.FormCount-1 do
    if (Screen.Forms[i] <> Self) and
       (Screen.Forms[i] is TfdcCustomForm) then
      (Screen.Forms[i] as TfdcCustomForm).ResetLayout;
      
  { удалить ключ внешнего вида приложения }
  DeleteRegistryKey(AppLayoutRegistryKey);
end;

procedure TfdcCustomMainForm.ShowForm(AForm: TForm;
  AParams: TParams = nil; ADockSite: TWinControl = nil);
//var
  //AFormPos: TPoint;
begin
  { проверить форму }
  if not Assigned(AForm) then Exit;

  { передать параметры форме }
  if AForm is TfdcCustomDataForm then
    (AForm as TfdcCustomDataForm).Params.FillBy(AParams);

  { подготовить форму как прикрепленную }
  if Assigned(ADockSite) then
  begin
    //AFormPos.X := 0;
    //AFormPos.Y := 0;
    //AFormPos := ADockSite.ClientToScreen(AFormPos);
    //AForm.Position := poDesigned;
    //AForm.FormStyle := fsNormal;
    //AForm.BorderStyle := bsNone;
    //AForm.SetBounds(AFormPos.X, AFormPos.Y, ADockSite.Width, ADockSite.Height);
    //ShowWindow(AForm.Handle, SW_SHOWNOACTIVATE);
    
    AForm.ManualDock(ADockSite);
    AForm.WindowState := wsNormal;
    AForm.Align := alClient;
  end

  { подготовить форму как дочернюю MDI }
  else
  begin
    if AForm.FormStyle <> fsMDIChild then
      AForm.FormStyle := fsMDIChild;
    if AForm.WindowState = wsMinimized then
      AForm.WindowState := wsNormal;
  end;

  { показать форму }
  AForm.Show;

  { зарегистрировать форму }
  RegisterChildForm(AForm);
end;

function TfdcCustomMainForm.ShowForm(AClassName: string;
  AParams: TParams = nil; ADockSite: TWinControl = nil): TForm;
var
  AOwner: Tcomponent;
begin
  AOwner := nil;
  if Assigned(ADockSite) then
    AOwner := ADockSite.Owner;
  Result := CreateComponent(AClassName, AOwner) as TForm;
  ShowForm(Result, AParams, ADockSite);
end;

procedure TfdcCustomMainForm.FormCreate(Sender: TObject);
begin
  inherited;

  { создать список истории просмотра форм }
  HistoryList := THistoryList.Create(Self);

  { обновить заголовок приложения и формы }
  Application.Title := InternalName;
  Caption           := InternalName;

  { показать заставку }
  if IsShowSplash then
    ShowSplash;
end;

procedure TfdcCustomMainForm.FormDestroy(Sender: TObject);
begin
  inherited;
  
  { удалить список истории просмотра форм }
  FreeAndNil(HistoryList);
end;

procedure TfdcCustomMainForm.FormShow(Sender: TObject);
begin
  inherited;

  { скрыть заставку }
  HideSplash;
end;

procedure TfdcCustomMainForm.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
  { обработать ошибку и вывести окно с сообщением об ошибке }
  try
    HandleError(E);
  except
    on E: Exception do
      ShowError(E);
  end;
end;

procedure TfdcCustomMainForm.actResetLayoutExecute(Sender: TObject);
begin
  if WarningDlg('Сбросить настройки внешнего вида приложения?',
       'При этом будут восстановлены настройки внешнего вида приложения по умолчанию.') = mrYes then
  begin
    ResetLayout;
    InfoDlg('Настройки по умолчанию успешно восстановлены',
      'Для того чтобы эти настройки были применены закройте приложение и откройте его заново.');
  end;
end;

procedure TfdcCustomMainForm.miWindowListGetData(Sender: TObject);
begin
  inherited;
  { отметить текущую активную форму }
  with miWindowList do
    ItemIndex := Items.IndexOfObject(ActiveMDIChild);
end;

procedure TfdcCustomMainForm.miWindowListClick(Sender: TObject);
begin
  inherited;
  { показать выбранную форму }
  with miWindowList do
    TForm(Items.Objects[ItemIndex]).Show;
end;

procedure TfdcCustomMainForm.actNavBackwardUpdate(Sender: TObject);
begin
  inherited;
  with HistoryList do
    (Sender as TAction).Enabled := (Sender as TAction).Visible and
      Assigned(HistoryList) and
      HistoryList.CanNavBackward;
end;

procedure TfdcCustomMainForm.actNavBackwardExecute(Sender: TObject);
begin
  inherited;
  HistoryList.NavBackward;
end;

procedure TfdcCustomMainForm.actNavForwardUpdate(Sender: TObject);
begin
  inherited;
  with HistoryList do
    (Sender as TAction).Enabled := (Sender as TAction).Visible and
      Assigned(HistoryList) and
      HistoryList.CanNavForward;
end;

procedure TfdcCustomMainForm.actNavForwardExecute(Sender: TObject);
begin
  inherited;
  HistoryList.NavForward;
end;

end.

