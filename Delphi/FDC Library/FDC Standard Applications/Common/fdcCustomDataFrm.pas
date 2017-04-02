{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomDataFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcCustomDataFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fdcCustomFrm, cxContainer, cxEdit,
  dxLayoutLookAndFeels, ActnList, Contnrs, dxBar, ImgList,
  cxLookAndFeels, fdcParamsHolder, DB, Registry;

type
  { базовая форма доступа к данным }
  TfdcCustomDataFormList = class;
  TfdcCustomDataForm = class(TfdcCustomForm)
    imglAction: TImageList;
    imglLarge: TImageList;
    BarManager: TdxBarManager;
    ParamsHolder: TfdcParamsHolder;
    miResetLayout: TdxBarButton;
    procedure FormShow(Sender: TObject);
    procedure BarManagerShowToolbarsPopup(Sender: TdxBarManager;
      PopupItemLinks: TdxBarItemLinks);
    procedure BarManagerDocking(Sender: TdxBar; Style: TdxBarDockingStyle;
      DockControl: TdxDockControl; var CanDocking: Boolean);
  private
    // waiters list
    Waiters: TfdcCustomDataFormList;

    function GetParams: TfdcParams;
    function GetMenusAndToolbarsLayoutRegistryKey: string;
    procedure RegisterAsWaiter;
    procedure ScanForWaiters;
    procedure InitCustomization;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    { define waiters of the form }
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; virtual;
    { handle refresh notification }
    procedure HandleRefresh; virtual;
  public
    { load form layout }
    procedure LoadLayout; override;
    { save form layout }
    procedure SaveLayout; override;

    { waiters support }
    procedure RefreshWaiters;
    procedure RegisterWaiter(AForm: TfdcCustomDataForm);
    procedure UnRegisterWaiter(AForm: TfdcCustomDataForm);

    { get param from ParamsHolder by its Name }
    function ParamByName(AName: string): TfdcParam;

    property Params: TfdcParams read GetParams;
    property MenusAndToolbarsLayoutRegistryKey: string read GetMenusAndToolbarsLayoutRegistryKey;
  end;

  { TfdcCustomDataFormList }
  TfdcCustomDataFormList = class(TObjectList)
  private
    function GetItems(i: integer): TfdcCustomDataForm;
  public
    function Exists(AForm: TfdcCustomDataForm): boolean;
    property Items[i: integer]: TfdcCustomDataForm read GetItems; default;
  end;

implementation
  
{$R *.dfm}

const
  SMenusAndToolbars = 'MenusAndToolbars';

{ TfdcCustomDataFormList }

function TfdcCustomDataFormList.Exists(AForm: TfdcCustomDataForm): boolean;
begin
  Result := IndexOf(AForm) <> -1;
end;

function TfdcCustomDataFormList.GetItems(i: integer): TfdcCustomDataForm;
begin
  Result := (inherited Items[i]) as TfdcCustomDataForm;
end;

{ TfdcCustomDataForm }

function TfdcCustomDataForm.GetParams: TfdcParams;
begin
  Result := ParamsHolder.Params;
end;

function TfdcCustomDataForm.GetMenusAndToolbarsLayoutRegistryKey: string;
begin
  Result := FormLayoutRegistryKey + '\' + SMenusAndToolbars;
end;

procedure TfdcCustomDataForm.RegisterAsWaiter;
var
  i: integer;
begin
  for i:=0 to Screen.FormCount-1 do
    if (Screen.Forms[i] is TfdcCustomDataForm) and
       (Screen.Forms[i] as TfdcCustomDataForm).IsWaiter(Self) then
      (Screen.Forms[i] as TfdcCustomDataForm).RegisterWaiter(Self);
end;

procedure TfdcCustomDataForm.ScanForWaiters;
var
  i: integer;
begin
  for i:=0 to Screen.FormCount-1 do
    if (Screen.Forms[i] is TfdcCustomDataForm) and
       (IsWaiter(Screen.Forms[i] as TfdcCustomDataForm)) then
      RegisterWaiter(Screen.Forms[i] as TfdcCustomDataForm);
end;

procedure TfdcCustomDataForm.InitCustomization;
var
  i: integer;
begin
  inherited;
  BarManager.CanCustomize := AutoSaveLayout;
  for i:=0 to BarManager.Bars.Count-1 do
  begin
    BarManager.Bars[i].AllowCustomizing := BarManager.CanCustomize;
    BarManager.Bars[i].AllowQuickCustomizing := BarManager.CanCustomize;
  end; 
end;

procedure TfdcCustomDataForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and
     (AComponent is TfdcCustomDataForm) then
    UnRegisterWaiter(AComponent as TfdcCustomDataForm);
end;

function TfdcCustomDataForm.IsWaiter(AForm: TfdcCustomDataForm): boolean;
begin
  Result := False;
end;

procedure TfdcCustomDataForm.HandleRefresh;
begin
  { dummy implementation }
end;

procedure TfdcCustomDataForm.LoadLayout;
begin
  inherited;
  BarManager.LoadFromRegistry(MenusAndToolbarsLayoutRegistryKey);
end;

procedure TfdcCustomDataForm.SaveLayout;
begin
  inherited;
  BarManager.SaveToRegistry(MenusAndToolbarsLayoutRegistryKey);
end;

procedure TfdcCustomDataForm.RefreshWaiters;
var
  i: integer;
begin
  if not Assigned(Waiters) then Exit;

  for i:=0 to Waiters.Count-1 do
    Waiters[i].HandleRefresh;
end;

procedure TfdcCustomDataForm.RegisterWaiter(AForm: TfdcCustomDataForm);
var
  i: integer;
begin
  { не регистрировать несуществующую (nil) ожидающую форму }
  if not Assigned(AForm) then
    Exit;

  { при необходимости создать список ожидающих форм }
  if not Assigned(Waiters) then
    Waiters := TfdcCustomDataFormList.Create(False);

  { зарегистрировать новую ожидающую форму }
  if (Self <> AForm) and
     (not Waiters.Exists(AForm)) then
  begin
    AForm.FreeNotification(Self);
    Waiters.Add(AForm);
    if Assigned(AForm.Waiters) then
      for i:=0 to AForm.Waiters.Count-1 do
        RegisterWaiter(AForm.Waiters[i]);
  end;
end;

procedure TfdcCustomDataForm.UnRegisterWaiter(AForm: TfdcCustomDataForm);
begin
  if not Assigned(Waiters) then Exit;

  AForm.RemoveFreeNotification(Self);
  Waiters.Remove(AForm);
  if Waiters.Count = 0 then
    FreeAndNil(Waiters);
end;

function TfdcCustomDataForm.ParamByName(AName: string): TfdcParam;
begin
  Result := nil;
  if Assigned(Params) then
    Result := Params.ParamByName(AName);
end;

procedure TfdcCustomDataForm.FormShow(Sender: TObject);
begin
  inherited;
  { init customization }
  InitCustomization;
  { register waiters }
  RegisterAsWaiter;
  ScanForWaiters;
end;

procedure TfdcCustomDataForm.BarManagerShowToolbarsPopup(
  Sender: TdxBarManager; PopupItemLinks: TdxBarItemLinks);
begin
  inherited;
  actResetLayout.Update;
  if actResetLayout.Enabled then
    PopupItemLinks.Add.Item := miResetLayout;
end;

procedure TfdcCustomDataForm.BarManagerDocking(Sender: TdxBar;
  Style: TdxBarDockingStyle; DockControl: TdxDockControl;
  var CanDocking: Boolean);
begin
  inherited;
  CanDocking := BarManager.CanCustomize;
end;

end.
