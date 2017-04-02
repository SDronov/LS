{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcOraLogOnFrm.pas $
  $Revision: 4679 $
  $Author: sbalezin $
  $Date: 2008-03-20 17:02:58 +0400 (Р§С‚, 20 РјР°СЂ 2008) $
}
unit fdcOraLogOnFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomLogOnFrm, cxLookAndFeelPainters, ActnList,
  cxPropertiesStore, ExtCtrls, cxContainer, cxEdit, dxLayoutLookAndFeels,
  dxLayoutControl, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, Oracle,
  cxButtonEdit, cxLabel, cxImage, cxGroupBox, cxControls, cxLookAndFeels,
  fdcOracleSession, cxHyperLinkEdit, Menus;

const
  SSchemaSep = '/';
    
type
  { Стандартная форма авторизации пользователя ORACLE } 
  TfdcOraLogOnForm = class(TfdcCustomLogOnForm)
    lciSchema: TdxLayoutItem;
    edtSchema: TcxTextEdit;
    lciShowAll: TdxLayoutItem;
    cxLabel1: TcxLabel;
    procedure cxLabel1Click(Sender: TObject);
  private
    { Private declarations }
    function  GetShowScheme: Boolean;
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
  fdcExceptions, fdcMessages, Registry, PasswordDlgFrm;

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

function MakeConnectString(AServer, ASchema: string): string;
begin
  if (AServer <> '') and
     (ASchema <> '') then
    Result := AServer + SSchemaSep + ASchema
  else
    Result := AServer;
end;

function LogOn(ASession: TfdcOracleSession; AShowForm: boolean = True): boolean;
var
 iSession: IfdcSession;
{$IFDEF _DEBUG_}
 i, p: integer; s, sPassword, sUser, sServ: string;

procedure setValue( const aParamValue: string );
const cPass = '/password='; cUser = '/user=';  cServ = '/serv=';
var p: integer;
begin
  if ( pos( AnsiUpperCase(cPass), AnsiUpperCase(aParamValue) ) = 1  ) then
    sPassword := trim( copy( aParamValue, 1 + length(cPass), length(aParamValue) ) );

  if ( pos( AnsiUpperCase(cUser), AnsiUpperCase(aParamValue) ) = 1 ) then
    sUser:= trim( copy(aParamValue, 1 + length(cUser), length(aParamValue) ) );

  if ( pos( AnsiUpperCase(cServ), AnsiUpperCase(aParamValue) ) = 1 ) then
    sServ:= trim( copy( aParamValue, 1 + length(cServ), length(aParamValue) ) ) ;

end;

{$ENDIF}
begin
 result:= false;
 try
 iSession:= TfdcOraSessionAdapter.Create(ASession);// as IfdcSession;
{$IFDEF _DEBUG_}
 sPassword:= ''; sUser:= ''; sServ:= '';
 for i:=1 to paramCount do
   setValue( paramStr(i) );

 if (sPassword <> '') and (sUser <> '') and (sServ <> '') then begin
   iSession.SetPassword(sPassword);
   iSession.SetUserName(sUser) ;
   iSession.SetConnectString(MakeConnectString( sServ, ASession.DefSchemeName) );
   iSession.LogOn;
 end;
 result:= iSession.IsConnected;
 {$ENDIF}
 finally
  if (not result) then
    result:= fdcCustomLogOnFrm.LogOn(TfdcOraLogOnForm, iSession, AShowForm);
 end;
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
    Application.HandleException(Self);
//    fdcExceptions.HandleError(E);
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
  except on E: Exception do
    if (E.ClassName = 'EOracleError') then
    with E as EOracleError do
      if (ErrorCode = 28001) then
      try
        if not Assigned(PasswordDlgForm) then
          begin
            PasswordDlgForm := TPasswordDlgForm.Create(nil);
            PasswordDlgForm.isOraPwExp := true;
            PasswordDlgForm.ShowModal;
            if PasswordDlgForm.ModalResult <> mrYes then
              Application.Terminate;
            if Assigned(PasswordDlgForm) then
              PasswordDlgForm.Free;
          end;
        FOraSession.LogOn;
        except
          HandleError(E);
        end
    else
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
  Session.SetConnectString(MakeConnectString(Trim(edtConnectString.Text), Trim(edtSchema.Text)));
end;

procedure TfdcOraLogOnForm.ShowAll(AVisible: boolean);
begin
  inherited;
  { показать/спрятать дополнительные параметры }
//  edtSchema.Visible := AVisible;
//  lciSchema.ShowCaption := AVisible;
  lciSchema.Visible := AVisible and GetShowScheme;
  lciUserName.Visible := AVisible;
  lciServerName.Visible := AVisible;
  lciShowAll.Visible := not AVisible;
  if lciShowAll.Visible then
  begin
   lciPassword.AlignVert := avClient;
   lciShowAll.AlignVert := avBottom;
  end;
end;

procedure TfdcOraLogOnForm.cxLabel1Click(Sender: TObject);
begin
  inherited;
  ShowAll(True);
end;

const
   SShowScheme = 'SHOWSCHEME';

function  TfdcOraLogOnForm.GetShowScheme: Boolean;
var
  Reg: TRegistry;
begin
  Result := False;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(AppRegistryKey, False) then
    begin
      if Reg.ValueExists(SShowScheme) then
         Result := Reg.ReadBool(SShowScheme);
    end;
  finally
    Reg.Free;
  end;
end;

end.
