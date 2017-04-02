unit TaskFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, ImgList,
  fdcParamsHolder, dxBar, cxEdit, cxLookAndFeels, cxContainer, cxMemo,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxDBEdit,
  cxTextEdit, cxPC, cxControls;

type
  TTaskForm = class(TObjectForm)
    edtSysName: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    tabSysComponent: TcxTabSheet;
    tabUserGroup: TcxTabSheet;
    procedure tabSysComponentShow(Sender: TObject);
    procedure tabUserGroupShow(Sender: TObject);
  private
    { Private declarations }
    FSysComponentGridForm: TForm;
    FUserGroupGridForm: TForm;
  public
    { Public declarations }
  end;

var
  TaskForm: TTaskForm;

implementation

{$R *.dfm}

procedure TTaskForm.tabSysComponentShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FSysComponentGridForm) then
    FSysComponentGridForm := ObjectServices.ShowForm('TSysComponentGridByTaskForm', Params, tabSysComponent);
end;

procedure TTaskForm.tabUserGroupShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FUserGroupGridForm) then
    FUserGroupGridForm := ObjectServices.ShowForm('TUserGroupGridByTaskForm', Params, tabUserGroup);
end;

initialization
  RegisterClass(TTaskForm);

end.
