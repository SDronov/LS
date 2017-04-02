unit InteractSettingsMsgTypesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxGraphics, cxMaskEdit,
  cxDropDownEdit;

type
  TInteractSettingsMsgTypesForm = class(TObjectForm)
    dsDataCODE: TStringField;
    dsDataDIRECTION: TStringField;
    dsDataNDIRECTION: TIntegerField;
    dsDataEXECPROC: TStringField;
    edtDirection: TcxDBComboBox;
    lciDirectionEdit: TdxLayoutItem;
    edtExecProc: TcxDBTextEdit;
    lciExecProcEdit: TdxLayoutItem;
    edtCode: TcxDBTextEdit;
    lciCodeEdit: TdxLayoutItem;
    viewOwner: TcxDBTextEdit;
    lcOwnerView: TdxLayoutItem;
    dsDataowner_name: TStringField;
    procedure Modify(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InteractSettingsMsgTypesForm: TInteractSettingsMsgTypesForm;

implementation

uses fdcCustomCardFrm;

{$R *.dfm}

procedure TInteractSettingsMsgTypesForm.Modify(Sender: TObject);
begin
  inherited;             
  dsDataNDIRECTION.Value := edtDirection.ItemIndex;

end;



procedure TInteractSettingsMsgTypesForm.FormShow(Sender: TObject);
begin
  inherited;       
  dsDataOWNER_OBJECT_ID.asFloat := ParamByName('OWNER_OBJECT_ID').Value;
end;

initialization
  RegisterClass(TInteractSettingsMsgTypesForm);
end.
