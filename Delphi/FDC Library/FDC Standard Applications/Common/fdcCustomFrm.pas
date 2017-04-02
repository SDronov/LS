{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
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
  public
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

uses fdcConsts, fdcUtils, fdcMessages;

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
  Result := GetAppRegistryKey +  '\Forms';
end;

function TfdcCustomForm.GetFormLayoutRegistryKey: string;
begin
  Result := GetAppLayoutRegistryKey +  '\' + ClassName;
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
      if Reg.ValueExists(SWindowState) then
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
       'При этом будут восстановлены настройки внешнего вида представления по умолчанию.') = mrYes then
  begin
    ResetLayout;
    InfoDlg('Настройки по умолчанию успешно восстановлены',
      'Для того чтобы эти настройки были применены закройте окно и откройте его заново.');
  end;
end;

end.
