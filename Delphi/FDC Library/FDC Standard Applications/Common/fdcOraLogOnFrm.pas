{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcOraLogOnFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}
unit fdcOraLogOnFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomLogOnFrm, cxLookAndFeelPainters, ActnList,
  cxPropertiesStore, ExtCtrls, cxContainer, cxEdit, dxLayoutLookAndFeels,
  dxLayoutControl, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, Oracle,
  cxButtonEdit, cxLabel, cxImage, cxGroupBox, cxControls, cxLookAndFeels,
  fdcOracleSession;

const
  SSchemaSep = '/';
    
type
  { Стандартная форма авторизации пользователя ORACLE } 
  TfdcOraLogOnForm = class(TfdcCustomLogOnForm)
    lciSchema: TdxLayoutItem;
    edtSchema: TcxTextEdit;
  private
    { Private declarations }
  protected
    procedure ShowAll(AVisible: boolean); override;
    procedure GetSessionParams; override;
    procedure SetSessionParams; override;
  public
    { Public declarations }
  end;

{ Вызывает стандартную форму авторизации пользователя. 
  Авторизация проводится средствами сервера Oracle. }
function LogOn(ASession: TfdcOracleSession; AShowForm: boolean = True): boolean;

implementation

{$R *.dfm}

uses
  fdcExceptions, fdcMessages;

type
  { TfdcOraSessionAdapter }       
  TfdcOraSessionAdapter = class(TInterfacedObject, IfdcSession)
  private
    FOraSession: TfdcOracleSession;
  public
    constructor Create(AOraSession: TfdcOracleSession);
    procedure HandleError(E: Exception);

    // IfdcSession {{{
    { получить имя пользователя }
    function GetUserName: string;
    { получить пароль }
    function GetPassword: string;
    { получить строку соединения с сервером }
    function GetConnectString: string;
    { установить имя пользователя }
    procedure SetUserName(AUserName: string);
    { установить пароль }
    procedure SetPassword(APassword: string);
    { установить строку соединения }
    procedure SetConnectString(AConnectString: string);
    { вернуть статус соединения }
    function IsConnected: boolean;
    { присоединиться к серверу }
    procedure LogOn;
    { отсоединиться от сервера }
    procedure LogOff;
    // IfdcSession }}}
    
  end;

function LogOn(ASession: TfdcOracleSession; AShowForm: boolean = True): boolean;
begin
  Result := fdcCustomLogOnFrm.LogOn(TfdcOraLogOnForm, TfdcOraSessionAdapter.Create(ASession), AShowForm);
end;

function MakeConnectString(AServer, ASchema: string): string;
begin
  if (AServer <> '') and
     (ASchema <> '') then
    Result := AServer + SSchemaSep + ASchema
  else
    Result := '';
end;

function ExtractServer(AConnectString: string): string;
var
  SepPos: integer;
begin
  SepPos := Pos(SSchemaSep, AConnectString);
  if SepPos > 0 then
    Result := Copy(AConnectString, 1, SepPos - 1)
  else
    Result := AConnectString;
end;

function ExtractSchema(AConnectString: string): string;
var
  SepPos: integer;
begin
  SepPos := Pos(SSchemaSep, AConnectString);
  if SepPos > 0 then
    Result := Copy(AConnectString, SepPos + 1, Length(AConnectString) - SepPos)
  else
    Result := '';
end;

{ TfdcOraSessionAdapter }

constructor TfdcOraSessionAdapter.Create(AOraSession: TfdcOracleSession);
begin
  inherited Create;
  FOraSession := AOraSession;
end;

procedure TfdcOraSessionAdapter.HandleError(E: Exception);
begin
  try
    { обработать ошибку }
    fdcExceptions.HandleError(E);
  except
    { показать диалог с сообщением об ошибке }
    on E: Exception do
      ErrorDlg(E);
  end;
end;

function TfdcOraSessionAdapter.GetUserName: string;
begin
  Result := FOraSession.LogonUsername;
end;

function TfdcOraSessionAdapter.GetPassword: string;
begin
  Result := FOraSession.LogonPassword;
end;

function TfdcOraSessionAdapter.GetConnectString: string;
begin
  Result := MakeConnectString(
    FOraSession.LogonDatabase,
    FOraSession.DefSchemeName);
end;

procedure TfdcOraSessionAdapter.SetUserName(AUserName: string);
begin
  FOraSession.LogonUsername := AUserName;
end;

procedure TfdcOraSessionAdapter.SetPassword(APassword: string);
begin
  FOraSession.LogonPassword := APassword;
end;

procedure TfdcOraSessionAdapter.SetConnectString(AConnectString: string);
begin
  FOraSession.LogonDatabase := ExtractServer(AConnectString);
  FOraSession.DefSchemeName := ExtractSchema(AConnectString);
  if FOraSession.DefSchemeName = '' then
    FOraSession.DefSchemeName := FOraSession.LogonUsername;
end;

function TfdcOraSessionAdapter.IsConnected: boolean;
begin
  Result := FOraSession.Connected;
end;

procedure TfdcOraSessionAdapter.LogOn;
begin
  { открыть новое соединение }
  try
    FOraSession.LogOn;
  except
    on E: Exception do
      HandleError(E);
  end;
end;

procedure TfdcOraSessionAdapter.LogOff;
begin
  FOraSession.LogOff;
end;

{ TfdcOraLogOnForm }

procedure TfdcOraLogOnForm.GetSessionParams;
begin
  inherited;
  edtSchema       .Text := ExtractSchema(Session.GetConnectString);
  edtConnectString.Text := ExtractServer(Session.GetConnectString);
end;

procedure TfdcOraLogOnForm.SetSessionParams;
begin
  inherited;
  Session.SetConnectString(MakeConnectString(edtConnectString.Text, edtSchema.Text));
end;

procedure TfdcOraLogOnForm.ShowAll(AVisible: boolean);
begin
  inherited;
  { показать/спрятать дополнительные параметры }
  edtSchema.Visible := AVisible;
  lciSchema.ShowCaption := AVisible;
end;

end.
