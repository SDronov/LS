unit RoleFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxCheckBox, cxGraphics,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TRoleForm = class(TObjectForm)
    dsDataROLE_NAME: TStringField;
    dsOraRoleROLE_NAME: TStringField;
    tabRoleUser: TcxTabSheet;
    dsOraRole: TfdcQuery;
    srcOraRole: TDataSource;
    cmbxROLE_NAME: TcxDBLookupComboBox;
    lciRole_NameEdit: TdxLayoutItem;
    procedure cmbxROLE_NAMEPropertiesInitPopup(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabRoleUserShow(Sender: TObject);
  private
    { Private declarations }
    FRoleUserGridForm: TForm;
  public
    { Public declarations }
  end;

var
  RoleForm: TRoleForm;

implementation
 uses fdcUtils, fdcMessages, MainDm, fdcCustomObjectFrm;

{$R *.dfm}

procedure TRoleForm.cmbxROLE_NAMEPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  RefreshDataset(dsOraRole);
end;

procedure TRoleForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  { init lookup data }
  cmbxROLE_NAMEPropertiesInitPopup(Self);
  { disable role_name editing for the existing users
    cause of logging event issues }
  if not IsNew then
    begin
      cmbxROLE_NAME.Properties.ReadOnly := True;
      cmbxROLE_NAME.Style.Color := clSilver; //clInactiveCaptionText;
      cmbxROLE_NAME.Properties.ReadOnly := True;
    end;
end;

procedure TRoleForm.tabRoleUserShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FRoleUserGridForm) then
    FRoleUserGridForm := ObjectServices.ShowForm('TUserGridByRoleForm', Params, tabRoleUser);
end;

initialization
  RegisterClass(TRoleForm);

end.
