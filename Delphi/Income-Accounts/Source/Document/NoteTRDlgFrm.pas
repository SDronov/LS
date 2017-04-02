unit NoteTRDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, cxTextEdit,
  cxMemo, Menus, cxCheckBox;

type
  TNoteTRDlgForm = class(TfdcCustomSimpleDlgForm)
    cxMemo1: TcxMemo;
    dxLayoutControl1Item1: TdxLayoutItem;
    lciReserveSum: TdxLayoutItem;
    chbxReserveSum: TcxCheckBox;
    procedure actOkUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NoteTRDlgForm: TNoteTRDlgForm;

implementation

{$R *.dfm}

procedure TNoteTRDlgForm.actOkUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := cxMemo1.Text <> '';
end;

end.
