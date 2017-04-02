unit TaskAddComponentsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMemo, DB,
  FDCCustomDataset, fdcQuery, fdcObjectCore;

type
  TTaskAddComponentsForm = class(TfdcCustomDlgForm)
    edtText: TcxMemo;
    dxLayoutControl1Item1: TdxLayoutItem;
    dsComponents: TfdcQuery;
    procedure actOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
    ObjectList : TfdcObjectList;
  end;

implementation

{$R *.dfm}

uses
  MainFrm,
  MainDm;

procedure TTaskAddComponentsForm.actOkExecute(Sender: TObject);
var
  i : integer;
  s : string;
  o : TfdcObject;
const
  comma = '''';
begin
  if (edtText.Lines.Count <> 0) then
  begin
    s := '';
    for i := 0 to edtText.Lines.Count - 1 do
      s := s + ',' + comma + trim(edtText.Lines.Strings[i]) + comma;
    s := UpperCase(Copy(s, 2, MaxInt));

    dsComponents.SQL.Text := Format(dsComponents.SQL.Text, [s]);
    dsComponents.Open;
    while not dsComponents.Eof do
    begin
      o := TfdcObject.Create(MainForm.ObjectFactory);
      o.ID := dsComponents.FieldByName('ID').Value;
      o.TypeId := dsComponents.FieldByName('Object_Type_Id').value;
      ObjectList.Add(o);
      dsComponents.Next;
    end;
    dsComponents.Close;

  end;
end;

procedure TTaskAddComponentsForm.FormCreate(Sender: TObject);
begin
  inherited;
  ObjectList := TfdcObjectList.Create;
end;

procedure TTaskAddComponentsForm.FormDestroy(Sender: TObject);
begin
  ObjectList.Free;
  inherited;
end;

end.

