{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: AccessLevelDlgFrm.pas $
  $Revision: 6 $
  $Author: alexvolo $
  $Date: 2005-07-18 17:48:53 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}
unit AccessLevelDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomSimpleDlgFrm, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, ExtCtrls,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, DB,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  OracleData, cxMaskEdit;

type
  TAccessLevelDlgForm = class(TfdcCustomSimpleDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    Label1: TLabel;
    dxLayoutControl1Item3: TdxLayoutItem;
    Image1: TImage;
    dxLayoutControl1Group1: TdxLayoutGroup;
    cmbxAccessLevel: TcxLookupComboBox;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxLayoutControl1Item5: TdxLayoutItem;
    lblDescript: TLabel;
    dxLayoutControl1Group2: TdxLayoutGroup;
    dxLayoutControl1Item6: TdxLayoutItem;
    Image2: TImage;
    dxLayoutControl1Group3: TdxLayoutGroup;
    dsAccessLevel: TOracleDataSet;
    srcAccessLevel: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure cmbxAccessLevelPropertiesEditValueChanged(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure cmbxAccessLevelPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AccessLevelDlg(var AccessLevel: double; const UseNoAccess: boolean): TModalResult;

implementation

uses fdcUtils, MainDm;

{$R *.dfm}

function AccessLevelDlg(var AccessLevel: double; const UseNoAccess: boolean): TModalResult;
var
  Dlg: TAccessLevelDlgForm;
begin
  Dlg := TAccessLevelDlgForm.Create(Application.MainForm);
  try
    Dlg.cmbxAccessLevel.EditValue := IfElse(AccessLevel >= 0, AccessLevel, Null);
    Dlg.dsAccessLevel.SetVariable('UseNoAccess', integer(UseNoAccess));
    Result := Dlg.ShowModal;
    if Result = mrOk then
      AccessLevel := Dlg.cmbxAccessLevel.EditValue;
  finally
    Dlg.Free;
  end;
end;

procedure TAccessLevelDlgForm.FormShow(Sender: TObject);
begin
  inherited;
  RefreshDataset(dsAccessLevel);
  cmbxAccessLevelPropertiesEditValueChanged(Self);
end;

procedure TAccessLevelDlgForm.cmbxAccessLevelPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if dsAccessLevel.Active then
    if not VarIsNull(cmbxAccessLevel.EditValue) then
      lblDescript.Caption := VarToStr(dsAccessLevel.
        Lookup('ID', cmbxAccessLevel.EditValue, 'DESCRIPT')) + '.'
    else
      lblDescript.Caption := 'Уровень доступа не выбран.';
end;

procedure TAccessLevelDlgForm.actOkUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (not VarIsNull(cmbxAccessLevel.EditValue));
end;

procedure TAccessLevelDlgForm.cmbxAccessLevelPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if cmbxAccessLevel.Text = '' then
    cmbxAccessLevel.Clear;
end;

end.
