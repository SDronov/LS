unit InteractSettingsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxGraphics, cxMaskEdit,
  cxDropDownEdit, cxButtonEdit, fdcObjectLinkEdit;

type
  TInteractSettingsForm = class(TObjectForm)
    edtCode: TcxDBTextEdit;
    lciCodeEdit: TdxLayoutItem;
    dsDataCODE: TStringField;
    edtType: TcxDBComboBox;
    lciTypeEdit: TdxLayoutItem;
    dsDataNTYPE: TIntegerField;
    dsDataTYPE: TStringField;
    tabMsgTypes: TcxTabSheet;
    tabQueues: TcxTabSheet;
    edtSoft: TfdcObjectLinkEdit;
    lciSoftEdit: TdxLayoutItem;
    dsDataSOFT_ID: TIntegerField;
    dsDataSOFT_NAME: TStringField;
    procedure Modify(Sender: TObject);
    procedure tabMsgTypesShow(Sender: TObject);
    procedure tabQueuesShow(Sender: TObject);
  private
    { Private declarations }
    FMsgTypesGridForm: TForm;
    FQueuesGridForm: TForm;
  public
    { Public declarations }
  end;

//var
//  InteractSettingsForm: TInteractSettingsForm;

implementation

{$R *.dfm}
      
procedure TInteractSettingsForm.Modify(Sender: TObject);
begin
  inherited;
  if (edtType.ItemIndex = 0) or (edtType.ItemIndex = 1) then begin
    dsDataNTYPE.Value := edtType.ItemIndex;
  end;
end;

procedure TInteractSettingsForm.tabMsgTypesShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FMsgTypesGridForm) then
    FMsgTypesGridForm := ObjectServices.ShowForm('TInteractSettingsMsgTypesGridForm', Params, tabMsgTypes);
end;

procedure TInteractSettingsForm.tabQueuesShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FQueuesGridForm) then
    FQueuesGridForm := ObjectServices.ShowForm('TInteractSettingsQueuesGridForm', Params, tabQueues);
end;

initialization
  RegisterClass(TInteractSettingsForm);
end.
