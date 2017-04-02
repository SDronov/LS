unit PasswordDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, cxLabel,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxImage, fdcOraLogOnFrm, DB,
  FDCCustomDataset, fdcQuery;

type
  TPasswordDlgFormClass = class of TPasswordDlgForm;
  TPasswordDlgForm = class(TfdcCustomSimpleDlgForm)
    Panel1: TPanel;
    Shape1: TShape;
    tmrCheckLanguage: TTimer;
    lblInternalName: TcxLabel;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Group2: TdxLayoutGroup;
    dxLayoutControl1Item1: TdxLayoutItem;
    imgKey: TcxImage;
    edtUserName: TcxButtonEdit;
    lciUserName: TdxLayoutItem;
    edtPassword: TcxTextEdit;
    lciPassword: TdxLayoutItem;
    edtPasswordR: TcxTextEdit;
    lciNewPassword: TdxLayoutItem;
    lblLanguage: TcxLabel;
    dxLayoutControl1Item4: TdxLayoutItem;
    actShowAll: TAction;
    actDeveloperMode: TAction;
    dxLayoutControl1Group3: TdxLayoutGroup;
    Panel2: TPanel;
    Panel3: TPanel;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    dxLayoutControl1Item3: TdxLayoutItem;
    actConnect: TAction;
    procedure FormShow(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function  VerifyPassword(pPassword: string): Integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actConnectExecute(Sender: TObject);
  private
    FisOraPwExp: boolean;
    { Private declarations }
  public         
    property isOraPwExp: boolean read FisOraPwExp write FisOraPwExp;
    { Public declarations }
  end;

var
  PasswordDlgForm: TPasswordDlgForm;

implementation

uses MainDm, fdcUtils;

{$R *.dfm}

procedure TPasswordDlgForm.FormShow(Sender: TObject);
var
  InternalName: string;
begin
  { получить информацию о названии приложения }
  GetAppVersion(['InternalName'], [@InternalName]);
  lblInternalName.Caption := ' ' + InternalName + ' ';
  if (self.isOraPwExp) then
    edtUserName.Text := MainData.Session.LogonUsername
  else
    edtUserName.Text := MainData.sqlGetUserLogin.Exec;
end;

procedure TPasswordDlgForm.actOkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible;
end;

procedure TPasswordDlgForm.FormCreate(Sender: TObject);
begin
  inherited;

  { adjust labels font using current font of the form }
  lblInternalName.Style.Font.Color := clWhite;
  lblInternalName.Style.Font.Size  := Font.Size*2;
  lblInternalName.Style.Font.Style := [fsBold];
  lblLanguage.Style.Font.Color := clGrayText;
  lblLanguage.Style.Font.Size  := Font.Size;
  lblLanguage.Style.Font.Style := [fsBold];
end;

function TPasswordDlgForm.VerifyPassword(pPassword: string): Integer;
var
  i: Integer;
begin
  if not (pPassword[1] in ['a'..'z', 'A'..'Z'])  then
  begin
    Result := 0;
    Exit;
  end;

  for i := 1 to Length(pPassword) do
  begin
    if not (pPassword[i] in ['a'..'z', 'A'..'Z', '0'..'9', '_', '$', '#'])  then
    begin
      Result := 0;
      Exit;
    end;
  end;

  Result := 1;
end;

procedure TPasswordDlgForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TPasswordDlgForm.FormDestroy(Sender: TObject);
begin
  inherited;
  PasswordDlgForm := nil;
end;

procedure TPasswordDlgForm.actOkExecute(Sender: TObject);
var
  vLogin: string;
  vPass, vPassR: string;
  st: string;
begin
//  inherited;
  cxLabel2.Caption := '';

  vPass  := Trim(edtPassword.Text);
  vPassR := Trim(edtPasswordR.Text);

  if (vPass = '') or (vPassR = '') then
  begin
    cxLabel2.Caption := 'Пароль не введен.';
    Exit;
  end;

  if vPass <> vPassR then
  begin
    cxLabel2.Caption := 'Пароли не совпадают.';
    Exit;
  end;

  if VerifyPassword(vPass) = 0 then
  begin
    cxLabel2.Caption := 'Не корректный пароль.';
    Exit;
  end;

  vLogin := edtUserName.Text;

  if (self.isOraPwExp) then
  begin
    MainData.Session.SetPassword(vPass);
    cxLabel2.Caption := 'Пароль успешно изменен.';
    btnOK.Action := actConnect;
  end
  else
  with MainData do
  begin
    try
      sqlUserChangePassword.Exec('pUser;pPass', [vLogin, vPass]);
      sqlSetExpDate.Exec('pLogin', [vLogin]);

      st := GetUserExpDate;

      cxLabel2.Caption := 'Пароль успешно изменен. Действует до ' + st;
      btnOK.Action := actConnect;
    except
    //
    end;
  end;
end;

procedure TPasswordDlgForm.actConnectExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrYes;
end;

end.

