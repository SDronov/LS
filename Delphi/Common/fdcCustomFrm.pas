{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomFrm.pas $
  $Revision: 2233 $
  $Author: charushin $
  $Date: 2007-02-22 14:25:43 +0400 (Р§С‚, 22 С„РµРІ 2007) $
}

unit fdcCustomFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cxContainer, cxEdit, ActnList,
  dxLayoutLookAndFeels, cxLookAndFeels, Registry;

type

  { базовая абстрактная форма }
  TfdcCustomForm = class(TForm)
    ActionList: TActionList;
    LayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    LayoutOfficeLookAndFeel: TdxLayoutOfficeLookAndFeel;
    LayoutWebLookAndFeel: TdxLayoutWebLookAndFeel;
    LayoutWebToolLookAndFeel: TdxLayoutWebLookAndFeel;
    OfficeEditStyleController: TcxEditStyleController;
    WebEditStyleController: TcxEditStyleController;
    LayoutStandardLookAndFeel: TdxLayoutStandardLookAndFeel;
    LookAndFeelController: TcxLookAndFeelController;
    DefaultEditStyleController: TcxDefaultEditStyleController;
    actResetLayout: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actResetLayoutExecute(Sender: TObject);
    procedure actResetLayoutUpdate(Sender: TObject);
  private
    { indicates that layout must not be saved when destroying }
    ResetLayoutFlag: boolean;

    function GetAppRegistryKey: string;
    function GetAppLayoutRegistryKey: string;
    function GetFormLayoutRegistryKey: string;

    procedure InternalLoadLayout;
    procedure InternalSaveLayout;
  protected
    procedure Activate; override;
    procedure Deactivate; override;
    procedure DoCreate; override;
    procedure DoDestroy; override;
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
  public
    function IsShortCut(var Message: TWMKey): Boolean; override;
    { is form layout autosave enabled }
    function AutoSaveLayout: boolean; virtual;
    { load form layout }
    procedure LoadLayout; virtual;
    { save form layout }
    procedure SaveLayout; virtual;
    { reset form layout }
    procedure ResetLayout; virtual;

    property AppRegistryKey: string read GetAppRegistryKey;
    property AppLayoutRegistryKey: string read GetAppLayoutRegistryKey;
    property FormLayoutRegistryKey: string read GetFormLayoutRegistryKey;
  end;

implementation

uses fdcConsts, fdcUtils, fdcMessages, FormMngr;

{$R *.dfm}

const
  SAutoSaveLayout = 'AutoSaveLayout';
  SLeft = 'Left';
  STop = 'Top';
  SWidth = 'Width';
  SHeight = 'Height';
  SWindowState = 'WindowState';

function TfdcCustomForm.GetAppRegistryKey: string;
begin
  Result := fdcUtils.GetAppRegistryKey;
end;

function TfdcCustomForm.GetAppLayoutRegistryKey: string;
begin
  Result := GetAppRegistryKey + '\Forms';
end;

function TfdcCustomForm.GetFormLayoutRegistryKey: string;
begin
  Result := GetAppLayoutRegistryKey + '\' + ClassName;
end;

procedure TfdcCustomForm.InternalLoadLayout;
begin
  ResetLayoutFlag := False;
  if AutoSaveLayout then
    LoadLayout;
end;

procedure TfdcCustomForm.InternalSaveLayout;
begin
  if AutoSaveLayout and
    not ResetLayoutFlag then
    SaveLayout;
end;

function TfdcCustomForm.AutoSaveLayout: boolean;
begin
  Result := ReadRegistryValue(AppRegistryKey, SAutoSaveLayout, rvInteger) = 1;
end;

procedure TfdcCustomForm.LoadLayout;
var
  Reg: TRegistry;
  ALeft, ATop, AWidth, AHeight: integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(FormLayoutRegistryKey, False) then
    begin
      if ((FormStyle <> fsMDIChild) or (Application.MainForm.MDIChildCount = 1))
         and Reg.ValueExists(SWindowState) then
        WindowState := TWindowState(Reg.ReadInteger(SWindowState));
      if WindowState = wsNormal then
      begin
        ALeft := Left;
        if Reg.ValueExists(SLeft) then
          ALeft := Reg.ReadInteger(SLeft);

        ATop := Top;
        if Reg.ValueExists(STop) then
          ATop := Reg.ReadInteger(STop);

        AWidth := Width;
        if Reg.ValueExists(SWidth) then
          AWidth := Reg.ReadInteger(SWidth);

        AHeight := Height;
        if Reg.ValueExists(SHeight) then
          AHeight := Reg.ReadInteger(SHeight);

        SetBounds(ALeft, ATop, AWidth, AHeight);
      end;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfdcCustomForm.SaveLayout;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(FormLayoutRegistryKey, True) then
    begin
      Reg.WriteInteger(SWindowState, integer(WindowState));
      if WindowState = wsNormal then
      begin
        Reg.WriteInteger(SLeft, Left);
        Reg.WriteInteger(STop, Top);
        Reg.WriteInteger(SWidth, Width);
        Reg.WriteInteger(SHeight, Height);
      end;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfdcCustomForm.ResetLayout;
begin
  ResetLayoutFlag := True;
  DeleteRegistryKey(FormLayoutRegistryKey);
end;

procedure TfdcCustomForm.FormCreate(Sender: TObject);
begin
  { load form layout }
  InternalLoadLayout;

  { assign form font to both styles }
  if csvFont in OfficeEditStyleController.Style.AssignedValues then
    OfficeEditStyleController.Style.Font.Assign(Font);
  if csvFont in WebEditStyleController.Style.AssignedValues then
    WebEditStyleController.Style.Font.Assign(Font);
end;

procedure TfdcCustomForm.FormDestroy(Sender: TObject);
begin
  { save form layout }
  InternalSaveLayout;
end;

procedure TfdcCustomForm.FormShow(Sender: TObject);
begin
  { dummy implementation - do not remove!!! }
  // попытка избежать ошибку ExpressBars Article ID: A945
  if ActiveControl <> nil then
    PostMessage(Handle, WM_ACTIVATE, WA_ACTIVE, 0);
end;

procedure TfdcCustomForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { free MDI child form after closing }
  if FormStyle = fsMDIChild then
    Action := caFree;
end;

procedure TfdcCustomForm.actResetLayoutUpdate(Sender: TObject);
begin
  (Sender as TAction).Visible := AutoSaveLayout;
  (Sender as TAction).Enabled := (Sender as TAction).Visible;
end;

procedure TfdcCustomForm.actResetLayoutExecute(Sender: TObject);
begin
  if WarningDlg('Сбросить настройки внешнего вида представления?',
    'При этом будут восстановлены настройки внешнего вида представления по умолчанию.') =
      mrYes then
  begin
    ResetLayout;
    InfoDlg('Настройки по умолчанию успешно восстановлены',
      'Для того чтобы эти настройки были применены, закройте окно и откройте его заново.');
  end;
end;

//
//   исправление поведения shortcut в VCL
//

function TfdcCustomForm.IsShortCut(var Message: TWMKey): Boolean;
var
  ActiveForm: TCustomForm;

  function GetParentFormEx(Control: TControl): TCustomForm;
  begin
    while Control.Parent <> nil do
    begin
      if Control.Parent is TCustomForm then
      begin
        Result := TCustomForm(Control.Parent);
        Exit;
      end;
      Control := Control.Parent;
    end;
    Result := nil;
  end;

  function DispatchShortCut(AForm: TCustomForm): Boolean;
  var
    I: Integer;
    List: TList;
  begin
    List := TfdcCustomForm(AForm).FActionLists;
    if List <> nil then
      for I := 0 to List.Count - 1 do
        if TCustomActionList(List[I]).IsShortCut(Message) then
        begin
          Result := True;
          Exit;
        end;
    Result := False;
  end;
begin
  ActiveForm := nil;
  if Screen.ActiveControl <> nil then
    ActiveForm := GetParentFormEx(Screen.ActiveControl);
  if (ActiveForm <> nil) and (ActiveForm <> Self) then
  begin
    Result := DispatchShortCut(ActiveForm);
    if not Result then
      Result := inherited IsShortCut(Message);
  end
  else
    Result := inherited IsShortCut(Message);
end;

procedure TfdcCustomForm.Deactivate;
begin
  inherited;
  if FormManager <> nil then
        FormManager.FormDeactivated(Self);
end;

procedure TfdcCustomForm.Activate;
begin
  inherited;
  if FormManager <> nil then
        FormManager.FormActivated(Self);
end;

procedure TfdcCustomForm.DoCreate;
begin
  inherited;
  if FormManager <> nil then
        FormManager.FormCreated(Self);
end;

procedure TfdcCustomForm.DoDestroy;
begin
  inherited;
  if FormManager <> nil then
        FormManager.FormDestroyed(Self);
end;

procedure TfdcCustomForm.CMShowingChanged(var Message: TMessage);
begin
//  if FormStyle = fsMDIChild then
//     WindowState := wsNormal;
  inherited;
end;

end.

