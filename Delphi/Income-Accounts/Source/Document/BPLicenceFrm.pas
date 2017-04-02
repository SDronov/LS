unit BPLicenceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGraphics, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, dxmdaset, fdcObjectCore;

type
  TBPLicenceForm = class(TObjectForm)
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataSUBJ_NAME: TStringField;
    dsDataSUBJ_INN: TStringField;
    dsDataSUBJ_KPP: TStringField;
    dsDataFROM_DATE: TDateTimeField;
    dsDataTO_DATE: TDateTimeField;
    edtAGRMT_DATE: TcxDBDateEdit;
    lcGeneralItem1: TdxLayoutItem;
    lcGeneralItem2: TdxLayoutItem;
    edtPayerINN: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtKPP: TcxDBMaskEdit;
    lcGeneralItem4: TdxLayoutItem;
    edtPayerName: TfdcObjectLinkEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBDateEdit3: TcxDBDateEdit;
    lcGeneralItem6: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    tabBroker: TcxTabSheet;
    lcgSubject: TdxLayoutGroup;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGeneralGroup4: TdxLayoutGroup;
    edtDocNo: TcxDBTextEdit;
    lcGeneralItem7: TdxLayoutItem;
    edtDocDate: TcxDBDateEdit;
    lcGeneralItem8: TdxLayoutItem;
    lcGeneralGroup6: TdxLayoutGroup;
    edtAGRMT_NO: TcxDBTextEdit;
    lcGeneralItem9: TdxLayoutItem;
    dsDataAGRMT_NO: TStringField;
    dsDataAGRMT_DATE: TDateTimeField;
    dsDataLEVEL_MARK: TIntegerField;
    dsLevelMark: TdxMemData;
    dsLevelMarkId: TIntegerField;
    dsLevelMarkName: TStringField;
    lcbLevels: TfdcObjectLookupEdit;
    lcLevelMark: TdxLayoutItem;
    srcLevelMark: TDataSource;
    lcGeneralGroup1: TdxLayoutGroup;
    procedure tabBrokerShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPayerNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtDocNoPropertiesEditValueChanged(Sender: TObject);
    procedure edtDocDatePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    FBrokerList: TForm;
  public
    { Public declarations }
  end;

var
  BPLicenceForm: TBPLicenceForm;

implementation

{$R *.dfm}

procedure TBPLicenceForm.tabBrokerShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FBrokerList) then
    FBrokerList := ObjectServices.ShowForm('TBPLicenceBrokerGridForm', Params, TWinControl(Sender));
end;

procedure TBPLicenceForm.FormShow(Sender: TObject);
begin
  inherited;
  dsLevelMark.Open;
end;

procedure TBPLicenceForm.edtPayerNameBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject = nil then
    begin
      dsDataSUBJ_INN.Clear;
      dsDataSUBJ_KPP.Clear;
    end
  else
    begin
      dsData['SUBJ_INN'] := AObject.FieldValues['INN'];
      dsData['SUBJ_KPP'] := AObject.FieldValues['KPP'];
    end;
end;

procedure TBPLicenceForm.edtDocNoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtAGRMT_NO.EditValue := edtDocNo.EditingValue;
end;

procedure TBPLicenceForm.edtDocDatePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtAGRMT_DATE.EditValue := edtDocDate.EditingValue;
end;

initialization
  RegisterClass(TBPLicenceForm);

end.
