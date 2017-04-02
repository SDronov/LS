{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomLogOnFrm.pas $
  $Revision: 4679 $
  $Author: sbalezin $
  $Date: 2008-03-20 17:02:58 +0400 (Р§С‚, 20 РјР°СЂ 2008) $
}

unit fdcCustomLogOnFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, ActnList, Forms,
  dxLayoutLookAndFeels, cxContainer, cxEdit, dxLayoutControl, cxMaskEdit,
  cxControls, cxImage, cxLabel, cxLookAndFeelPainters, ExtCtrls, StdCtrls,
  cxButtons, cxTextEdit, cxButtonEdit, cxGroupBox, cxPropertiesStore,
  fdcCustomSimpleDlgFrm, fdcCustomDlgFrm, cxLookAndFeels, Menus;
    
type

  { IfdcSession }
  IfdcSession = interface
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
  end;

  { базовая форма диалогов авторизации }
  TfdcCustomLogOnFormClass = class of TfdcCustomLogOnForm;
  TfdcCustomLogOnForm = class(TfdcCustomSimpleDlgForm)
    Panel1: TPanel;
    Shape1: TShape;
    tmrCheckLanguage: TTimer;
    lblInternalName: TcxLabel;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Group2: TdxLayoutGroup;
    dxLayoutControl1Item1: TdxLayoutItem;
    imgKey: TcxImage;
    dxLayoutControl1Item3: TdxLayoutItem;
    lblGreetings: TcxLabel;
    edtUserName: TcxButtonEdit;
    lciUserName: TdxLayoutItem;
    edtPassword: TcxTextEdit;
    lciPassword: TdxLayoutItem;
    edtConnectString: TcxTextEdit;
    lciServerName: TdxLayoutItem;
    lblLanguage: TcxLabel;
    dxLayoutControl1Item4: TdxLayoutItem;
    actShowAll: TAction;
    actDeveloperMode: TAction;
    dxLayoutControl1Group3: TdxLayoutGroup;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure actOkUpdate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actShowAllExecute(Sender: TObject);
    procedure actDeveloperModeUpdate(Sender: TObject);
    procedure actDeveloperModeExecute(Sender: TObject);
    procedure actShowAllUpdate(Sender: TObject);
    procedure imgKeyClick(Sender: TObject);
    procedure edtUserNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tmrCheckLanguageTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSession: IfdcSession;
    LogonAttemptCount: integer;
  protected
    procedure ShowAll(AVisible: boolean); virtual;
    procedure GetSessionParams; virtual;
    procedure SetSessionParams; virtual;
    function CalcClientWidth: Integer; override;
  public
    procedure Init(const ASession: IfdcSession);

    property Session: IfdcSession read FSession;
  end;

  { вызывает форму Logon }
function LogOn(const LogOnFormClass: TfdcCustomLogOnFormClass;
  const ASession: IfdcSession; AShowForm: boolean = True): Boolean;

implementation

{$R *.dfm}

uses
  fdcUtils;

const
  cMaxLogonAttempts = 2;
  sUserGreeting = 'Добро пожаловать, %s!' + ' ' +
    'Для входа введите пароль и нажмите "ОК".' + ' ' +
    'Для ввода дополнительных параметров нажмите "F3".';
  sSimpleGreeting = 'Добро пожаловать!' + ' ' +
    'Для входа в систему заполните необходимые поля и нажмите "ОК".';

function LogOn(const LogOnFormClass: TfdcCustomLogOnFormClass;
  const ASession: IfdcSession; AShowForm: boolean = True): Boolean;
var
  LogOnForm: TfdcCustomLogOnForm;
begin
  try
    if AShowForm then begin
      LogOnForm := LogOnFormClass.Create(nil);
      try
        LogOnForm.Init(ASession);
        Result :=
          (LogOnForm.ShowModal = mrOk) and
          ASession.IsConnected;
      finally
        LogOnForm.Free;
      end;
    end
    else begin
      if ASession.IsConnected then
        ASession.LogOff;
      ASession.LogOn;
      Result := ASession.IsConnected;
    end;
  except
    Result := False;
  end;
end;

{ TfdcLogOnForm }

procedure TfdcCustomLogOnForm.ShowAll(AVisible: boolean);
begin
  { показать/спрятать дополнительные параметры }
  lblGreetings.Caption := IfElse(AVisible, sSimpleGreeting, Format(sUserGreeting, [edtUserName.Text]));
  edtUserName.Visible := AVisible;
  lciUserName.ShowCaption := AVisible;
  lciPassword.AlignVert := IfElse(AVisible, avTop, avCenter);
  edtConnectString.Visible := AVisible;
  lciServerName.ShowCaption := AVisible;

  { установить фокус ввода }
  if AVisible then
    edtUserName.SetFocus
  else
    edtPassword.SetFocus;
end;

procedure TfdcCustomLogOnForm.GetSessionParams;
begin
  edtUserName.Text := FSession.GetUserName;
  edtPassword.Text := FSession.GetPassword;
  edtConnectString.Text := FSession.GetConnectString;
end;

procedure TfdcCustomLogOnForm.SetSessionParams;
begin
  FSession.SetUserName(Trim(edtUserName.Text));
  FSession.SetPassword(Trim(edtPassword.Text));
  FSession.SetConnectString(Trim(edtConnectString.Text));
end;

procedure TfdcCustomLogOnForm.Init(const ASession: IfdcSession);
var
  InternalName: string;
begin
  { установить сессию }
  FSession := ASession;

  { инициализировать поля формы }
  GetSessionParams;

  { получить информацию о названии приложения }
  GetAppVersion(['InternalName'], [@InternalName]);
  lblInternalName.Caption := ' ' + InternalName + ' ';
end;

procedure TfdcCustomLogOnForm.actOkUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible;
end;

procedure TfdcCustomLogOnForm.actOkExecute(Sender: TObject);

  procedure SetState(AState: boolean);
  begin
    edtUserName     .Enabled := AState;
    edtPassword     .Enabled := AState;
    edtConnectString.Enabled := AState;
    actOk           .Enabled := AState;
    actCancel       .Enabled := AState;
  end;

begin
  { сделать недоступным внесение изменений в процессе подключения }
  SetState(False);
  try
    { установить соединение }
    SetSessionParams;
    if FSession.IsConnected then
      FSession.LogOff;
    FSession.LogOn;
  finally
    { разрешить внесение изменений }
    SetState(True);
  end;

  { закрыть форму после cMaxLogonAttempts попыток
    подключения и вернуть статус подключения }
  if FSession.IsConnected then begin
    inherited;
  end
  else
    if LogonAttemptCount < cMaxLogonAttempts then
    begin
      ModalResult := mrNone;
      Inc(LogonAttemptCount);
      ShowAll(True);
    end
    else
      actCancel.Execute;
end;

procedure TfdcCustomLogOnForm.actShowAllUpdate(Sender: TObject);
begin
  inherited;
  { показать дополнительные параметры можно только пока они не видимы }
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (not edtUserName.Visible);
end;

procedure TfdcCustomLogOnForm.actShowAllExecute(Sender: TObject);
begin
  ShowAll(True);
end;

procedure TfdcCustomLogOnForm.imgKeyClick(Sender: TObject);
begin
  actShowAll.Execute;
end;

procedure TfdcCustomLogOnForm.actDeveloperModeUpdate(Sender: TObject);
begin
  { TODO : временно отключено }
  actDeveloperMode.Enabled := False;
end;

procedure TfdcCustomLogOnForm.actDeveloperModeExecute(Sender: TObject);
begin
  edtUserName.Properties.Buttons.Items[0].Visible := True;
end;

procedure TfdcCustomLogOnForm.edtUserNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  { TODO : для будущего использования }
end;

procedure TfdcCustomLogOnForm.tmrCheckLanguageTimer(Sender: TObject);
begin
  { обновить информацию о текущей языковой раскладке }
  lblLanguage.Caption :=
    AnsiUpperCase(Copy(GetCurLangName, 1, 2));
end;

procedure TfdcCustomLogOnForm.FormShow(Sender: TObject);
begin
  inherited;

  { расширить форму если заголовок слишком большой }
  if Panel1.Width < lblInternalName.Left * 2 + lblInternalName.Width then
    Self.Width := Self.Width + lblInternalName.Width - Panel1.Width + 2*lblInternalName.Left;

  { обновить форму }
  ShowAll(edtUserName.Text = '');
  tmrCheckLanguageTimer(Self);
  lblGreetings.ParentFont := True;
end;

procedure TfdcCustomLogOnForm.FormCreate(Sender: TObject);
begin
  inherited;

  { init form params }
  LogonAttemptCount := 0;

  { adjust labels font using current font of the form }
  lblInternalName.Style.Font.Color := clWhite;
  lblInternalName.Style.Font.Size  := Font.Size*2;
  lblInternalName.Style.Font.Style := [fsBold];
  lblLanguage.Style.Font.Color := clGrayText;
  lblLanguage.Style.Font.Size  := Font.Size;
  lblLanguage.Style.Font.Style := [fsBold];
end;

function TfdcCustomLogOnForm.CalcClientWidth: Integer;
begin
  Result := inherited CalcClientWidth;
  if lblInternalName.Width > Result then
     Result := lblInternalName.Width;
end;

end.

