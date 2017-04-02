unit ChangeImportDateFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxDropDownEdit,
  cxCalendar, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxLookAndFeels,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls, cxButtons,
  cxControls, Oracle;

type
  TChangeImportDateForm = class(TfdcCustomDlgForm)
    edtPassword: TcxMaskEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDate: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    qryChange: TOracleQuery;
    procedure actOkExecute(Sender: TObject);
  private
  public
  end;

function ChangeDate(aSession : TOracleSession): boolean;

implementation

{$R *.dfm}


function ChangeDate(aSession : TOracleSession): boolean;
begin
  with TChangeImportDateForm.Create(nil) do
  try
    qryChange.Session := aSession;
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;

procedure TChangeImportDateForm.actOkExecute(Sender: TObject);
begin
  if (edtPassword.Text = '') then
    raise exception.Create('Не задан пароль!');
  qryChange.SetVariable('pDate',     edtDate.EditValue);
  qryChange.SetVariable('pPassword', edtPassword.Text);
  try
    qryChange.Execute;
    qryChange.Session.Commit;
    ModalResult := mrOk;    
  except
    qryChange.Session.Rollback;
  end;
end;

end.

