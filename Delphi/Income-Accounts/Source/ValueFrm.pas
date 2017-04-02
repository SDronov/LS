unit ValueFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, cxContainer,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, StdCtrls,
  dxLayoutLookAndFeels, ActnList, cxMaskEdit, cxDropDownEdit, cxControls,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl,
  cxMemo, cxDBEdit, cxTextEdit, cxPC, cxButtonEdit, fdcObjectLinkEdit,
  cxCheckBox, Oracle;

type
  TValueForm = class(TObjectForm)
    edtStringValue: TcxDBMemo;
    lciValueEdit: TdxLayoutItem;
    dsDataSTRINGVALUE: TStringField;
    dsDataNUMVALUE: TFloatField;
    dsDataDATETIMEVALUE: TDateTimeField;
    dsDataREF_OBJECT_ID: TFloatField;
    dsDataOWNERNAME: TStringField;
    dsDataOWNERTYPENAME: TStringField;
    dsDataOWNERTYPESYSNAME: TStringField;
    dsDataREFNAME: TStringField;
    dsDataREFTYPENAME: TStringField;
    dsDataREFTYPESYSNAME: TStringField;
    dsDataFILESOURCENAME: TStringField;
    edtOwnerID: TfdcObjectLinkEdit;
    lciOwnerID: TdxLayoutItem;
    dsDataISSYSTEM: TIntegerField;
    edtSysName: TcxDBTextEdit;
    lciSysName: TdxLayoutItem;
    dsDataLOCALITY: TIntegerField;
    LocValues: TOraclePackage;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function IsSystem: boolean;
  end;

var
  ValueForm: TValueForm;

implementation

uses fdcUtils, fdcCustomObjectFrm, fdcCustomDataFrm, MainDm;

{$R *.dfm}

function TValueForm.IsSystem: boolean;
begin
  { системная константа никому не принадлежит }
  Result := dsDataOWNER_OBJECT_ID.IsNull;
end;

procedure TValueForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if IsNew then
  begin
    dsDataOWNER_OBJECT_ID.Value := ParamByName('OMasterID').AsFloat;
    if IsNewID(dsDataOWNER_OBJECT_ID.Value) then
      dsDataOWNER_OBJECT_ID.Clear;
    dsDataOWNERNAME.Value := ParamByName('OMasterName').AsString;
  end;

  lciNameEdit.Caption := 'Название';
  if IsSystem then
    lciNameEdit.Caption := lciNameEdit.Caption + ' *';
  lciSysName.Visible := IsSystem;
  lciOwnerID.Visible := not IsSystem;

  // -- запрет редактирования системных констант
  if (dsDataLOCALITY.Value > 0) then
    begin
      dsDataNumValue.ReadOnly := false;
      dsDataStringValue.ReadOnly := false;
      dsDataDateTimeValue.ReadOnly := false;
    end
  else
    begin
      dsDataNumValue.ReadOnly := (dsDataIsSystem.Value = 1);
      dsDataStringValue.ReadOnly := (dsDataIsSystem.Value = 1);
      dsDataDateTimeValue.ReadOnly := (dsDataIsSystem.Value = 1);
    end;
  dsDataDescript.ReadOnly := (dsDataIsSystem.Value = 1);
end;

procedure TValueForm.actSaveExecute(Sender: TObject);
begin
    dsDataISSYSTEM.AsFloat := integer(IsSystem);
    inherited;
end;

procedure TValueForm.actSaveUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Visible := ((dsDataIsSystem.Value = 0) and (dsDataLOCALITY.Value = 0)) or (dsDataLOCALITY.Value > 0);
end;

initialization
  RegisterClass(TValueForm);

end.

