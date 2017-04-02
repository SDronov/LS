unit ValueFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, cxContainer,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, StdCtrls,
  dxLayoutLookAndFeels, ActnList, cxMaskEdit, cxDropDownEdit, cxControls,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl,
  cxMemo, cxDBEdit, cxTextEdit, cxPC, cxButtonEdit, fdcObjectLinkEdit,
  cxCheckBox;

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
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function IsSystem: boolean;
  end;

var
  ValueForm: TValueForm;

implementation

uses fdcUtils, fdcCustomObjectFrm;

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
    dsDataOWNER_OBJECT_ID.Value := ParamByName('OMasterID').Value;
    if IsNewID(dsDataOWNER_OBJECT_ID.Value) then
      dsDataOWNER_OBJECT_ID.Clear;
    dsDataOWNERNAME.Value := ParamByName('OMasterName').Value;
  end;

  lciNameEdit.Caption := 'Название';
  if IsSystem then
    lciNameEdit.Caption := lciNameEdit.Caption + ' *';
  lciSysName.Visible := IsSystem;
  lciOwnerID.Visible := not IsSystem;
end;

procedure TValueForm.actSaveExecute(Sender: TObject);
begin
  dsDataISSYSTEM.AsFloat := integer(IsSystem);
  inherited;
end;

initialization
  RegisterClass(TValueForm);

end.

