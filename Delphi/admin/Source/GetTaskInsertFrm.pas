unit GetTaskInsertFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, DB, FDCCustomDataset,
  fdcQuery, cxTextEdit, cxMemo;

type
  TGetTaskInsertForm = class(TfdcCustomDlgForm)
    dsData: TfdcQuery;
    dsDataINSERTSTRING: TStringField;
    dsDataTASK_ID: TFloatField;
    edtText: TcxMemo;
    dxLayoutControl1Item1: TdxLayoutItem;
    btnClipBoard: TcxButton;
    dxLayoutControl1Item2: TdxLayoutItem;
    procedure btnClipBoardClick(Sender: TObject);
  private
  public
  end;

  procedure ShowInsertForm(aTaskId : double);

implementation

{$R *.dfm}
uses
  MainDM;

procedure ShowInsertForm(aTaskId : double);
begin
  with TGetTaskInsertForm.Create(Application) do
  try
    dsData.ParamByName('TaskId').Value := aTaskId;
    dsData.Open;
    edtText.Lines.BeginUpdate;
    while not dsData.Eof do
    begin
      edtText.Lines.Append(dsDataInsertString.Value);
      dsData.Next;
    end;
    edtText.Lines.EndUpdate;
    dsData.Close;
    btnOk.Visible := False;
    btnCancel.Caption := 'Закрыть';
    ShowModal;
  finally
    Free;
  end;
end;


procedure TGetTaskInsertForm.btnClipBoardClick(Sender: TObject);
begin
  edtText.SelectAll;
  edtText.CopyToClipboard;
  edtTExt.SelLength := 0;
end;

end.
