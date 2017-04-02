unit UserGroupFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls;

type
  TUserGroupForm = class(TObjectForm)
    tabUser: TcxTabSheet;
    tabTask: TcxTabSheet;
    procedure tabUserShow(Sender: TObject);
    procedure tabTaskShow(Sender: TObject);
  private
    { Private declarations }
    FUserGridForm: TForm;
    FTaskGridForm: TForm;
  public
    { Public declarations }
  end;

var
  UserGroupForm: TUserGroupForm;

implementation

{$R *.dfm}

procedure TUserGroupForm.tabUserShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FUserGridForm) then
    FUserGridForm := ObjectServices.ShowForm('TUserGridByUserGroupForm', Params, tabUser);
end;

procedure TUserGroupForm.tabTaskShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FTaskGridForm) then
    FTaskGridForm := ObjectServices.ShowForm('TTaskGridByUserGroupForm', Params, tabTask);
end;

initialization
  RegisterClass(TUserGroupForm);

end.
