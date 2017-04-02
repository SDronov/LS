{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomOraMainFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}
unit fdcCustomOraMainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomMainFrm, cxGraphics, Oracle, XPMan, AppEvnts,
  ImgList, dxBar, cxContainer, cxEdit, dxLayoutLookAndFeels, ActnList,
  cxControls, dxStatusBar, FDCOracleSession, cxLookAndFeels, cxLabel,
  ExtCtrls, Registry, StdActns, dxDockControl, fdcInspector,
  fdcParamsHolder;

type
  { Базовый класс для главного окна приложения с поддержкой
    авторизации пользователей средствами Oracle }
  TfdcCustomOraMainForm = class(TfdcCustomMainForm)
    StatusBarContainer3: TdxStatusBarContainerControl;
    imgUser: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ShowLogonForm: boolean;
    ShowSplashScreen: boolean;

    procedure ShowConnectionInfo;
  protected
    { Абстрактный метод, возвращающий текущую сессию }
    function GetSession: TfdcOracleSession; virtual;

    { Показывать ли стандартноеокно заставки приложения }
    function IsShowSplash: boolean; override;

    { Вывести стандартное окно авторизации пользователя }
    function ShowLogon: boolean; virtual;

    { загрузить/сохранить настройки соединения }
    procedure LoadLogon; virtual;
    procedure SaveLogon; virtual;
  public
    property Session: TfdcOracleSession read GetSession;
  end;

implementation

{$R *.dfm}

uses
  fdcOraLogOnFrm, fdcUtils;

const
  SShowLogon = 'SHOWLOGON';
  SShowSplash = 'SHOWSPLASH';
  SUser = 'USER';
  SPassword = 'PASSWORD';
  SSchema = 'SCHEMA';
  SServer = 'SERVER';

{ TfdcCustomOraMainForm }

procedure TfdcCustomOraMainForm.ShowConnectionInfo;
begin
  { отобразить информацию о соединении в строке состояния }
  imgUser.Visible := Assigned(Session) and Session.Connected;
  if imgUser.Visible then
    imgUser.Hint := 'Пользователь: ' + Session.LogonUsername + '@' + Session.LogonDatabase;
end;

function TfdcCustomOraMainForm.GetSession: TfdcOracleSession;
begin
  raise Exception.Create(
    '<<Не определена сессия>>. ' +
    '<<Переопределите метод TfdcCustomOraMainForm.GetSession в гланой форме приложения>>.');
end;

function TfdcCustomOraMainForm.IsShowSplash: boolean;
begin
  Result := ShowSplashScreen;
end;

function TfdcCustomOraMainForm.ShowLogon: boolean;
begin
  { вывести стандартное окно авторизации }
  Result := Assigned(Session) and Logon(Session, ShowLogonForm);
end;

procedure TfdcCustomOraMainForm.LoadLogon;
var
  Reg: TRegistry;
  KeyOpened: boolean;
begin
  Reg := TRegistry.Create;
  try
    { set root key }
    Reg.RootKey := HKEY_CURRENT_USER;

    { open params key }
    KeyOpened := Reg.OpenKey(AppRegistryKey, False);

    { read params }
    ShowLogonForm := True;
    if KeyOpened and Reg.ValueExists(SShowLogon) then
      ShowLogonForm := Reg.ReadBool(SShowLogon);

    ShowSplashScreen := True;
    if KeyOpened and Reg.ValueExists(SShowSplash) then
      ShowSplashScreen := Reg.ReadBool(SShowSplash);

    Session.LogonUsername := '';  
    if KeyOpened and Reg.ValueExists(SUser) then
      Session.LogonUsername := Trim(Reg.ReadString(SUser));

    Session.LogonPassword := '';
    if KeyOpened and Reg.ValueExists(SPassword) then
      Session.LogonPassword := Trim(Reg.ReadString(SPassword));

    Session.DefSchemeName := Session.LogonUsername;
    if KeyOpened and Reg.ValueExists(SSchema) then
      Session.DefSchemeName := Trim(Reg.ReadString(SSchema));

    Session.LogonDatabase := '';  
    if KeyOpened and Reg.ValueExists(SServer) then
      Session.LogonDatabase := Trim(Reg.ReadString(SServer));
  finally
    Reg.Free;
  end;
end;

procedure TfdcCustomOraMainForm.SaveLogon;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    { set root key }
    Reg.RootKey := HKEY_CURRENT_USER;
    { open params key }
    if Reg.OpenKey(GetAppRegistryKey, True) then
    begin
      { write param values }
      Reg.WriteBool(SShowLogon, ShowLogonForm);
      Reg.WriteBool(SShowSplash, ShowSplashScreen);
      Reg.WriteString(SUser, Trim(Session.LogonUsername));
      Reg.WriteString(SSchema, Trim(Session.DefSchemeName));
      Reg.WriteString(SServer, Trim(Session.LogonDatabase));
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfdcCustomOraMainForm.FormCreate(Sender: TObject);
begin
  { продолжить обработку в случае успешной авторизации }
  LoadLogon;
  if ShowLogon then
  begin
    SaveLogon;
    inherited;
  end
  { либо выйти из приложения }
  else
  begin
    Application.ShowMainForm := False;
    PostQuitMessage(0);
    Exit;
  end;
end;

procedure TfdcCustomOraMainForm.FormShow(Sender: TObject);
begin
  inherited;

  { отобразить информацию о соединении }
  ShowConnectionInfo;
end;

end.
