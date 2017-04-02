unit NewUserFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, QueryList, Oracle,
  fdcOracleSession, cxContainer, cxEdit, cxTextEdit, cxLookAndFeels,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls, cxButtons,
  cxControls, ExtCtrls, DB, FDCCustomDataset, fdcQuery, Menus;

type
  TNewUserForm = class(TfdcCustomDlgForm)
    edtAdminUserName: TcxTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtAdminPassword: TcxTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtNewUserName: TcxTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtNewPassword1: TcxTextEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edtNewPassword2: TcxTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    ssnLocal: TfdcOracleSession;
    dxLayoutControl1Item6: TdxLayoutItem;
    Bevel1: TBevel;
    dxLayoutControl1Item7: TdxLayoutItem;
    Bevel2: TBevel;
    dxLayoutControl1Item9: TdxLayoutItem;
    Bevel3: TBevel;
    dsLocalSQL: TfdcQuery;
    procedure actOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;


implementation

{$R *.dfm}

uses
  MainDM;

  
function DoFormExit(h : THandle; aText : string; TheEdit : TcxTextEdit; TheEdit2: TcxTextEdit = Nil): boolean;
begin
  if (TheEdit2 = nil) then
    Result := (TheEdit.Text = '')
  else
    Result := (TheEdit.Text <> TheEdit2.Text);
  // --- ���� ������ �� ������� ��� �� ��������� �� ������ ��������� 
  if Result then
  begin
    MessageBox(h,
               PChar(aText),
               pChar('��������'),
               Mb_Ok or MB_IconExclamation or Mb_Applmodal);
    // --- ������������� �� ������� ��������� ����������
    TheEdit.SetFocus;
    TheEdit.SelStart := length(TheEdit.Text);
  end;
end;


procedure TNewUserForm.actOkExecute(Sender: TObject);
begin
  // --- �������� ������� ����������
  if DoFormExit(Self.Handle, '�� ������� ��� ��������������.', edtAdminUserName) or
     DoFormExit(Self.Handle, '�� ������ ������ ��������������.', edtAdminPassword) or
     DoFormExit(Self.Handle, '�� ������� ��� ������������.', edtNewUserName) or
     DoFormExit(Self.Handle, '�� ������ ������ ������������.', edtNewPassword1) or
     DoFormExit(Self.Handle, '������ �� ���������.', edtNewPassword1, edtNewPassword2) then
    exit;

  // --- ����������� � ��
  ssnLocal.LogonDatabase := MainData.Session.LogonDatabase;
  ssnLocal.LogonUsername := edtAdminUserName.Text;
  ssnLocal.LogonPassword := edtAdminPassword.Text;
  try
    ssnLocal.LogOn;
    dsLocalSQL.SQL.Text := 'Create user ' + edtNewUserName.Text + ' identified by ' + edtNewPassword1.Text;
    dsLocalSQL.ExecSQL;
    dsLocalSQL.SQL.Text := 'Grant connect to ' + edtNewUserName.Text;
    dsLocalSQL.ExecSQL;
    ssnLocal.Commit;
    // --- ������� �������
    edtAdminPassword.Clear;
    edtNewPassword1.Clear;
    edtNewPassword2.Clear;


    MainData.pkgEVT.CallProcedure( 'EventRegister', [
                                     'pTypeCode', 'SCR'
                                    ,'pCode',     '00004'
                                    ,'pParam1',   edtNewUserName.Text ]
      );
    MainData.pkgEVT.Session.Commit;
  finally
    ssnLocal.Rollback;
    ssnLocal.LogOff;
  end;
  // --- ���������� ������
  ModalResult := mrOk;
end;


procedure TNewUserForm.FormCreate(Sender: TObject);
begin
  // --- ���������� �����
  edtAdminUserName.Clear;
  edtAdminPassword.Clear;
  edtNewUserName.Clear;
  edtNewPassword1.Clear;
  edtNewPassword2.Clear;
end;


end.
