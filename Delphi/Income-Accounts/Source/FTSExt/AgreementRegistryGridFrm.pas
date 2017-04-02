unit AgreementRegistryGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, DB, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl,
  cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxCalendar, dxmdaset,
  cxGraphics, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData;

type
  TAgreementRegistryGridForm = class(TObjectGridForm)
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataAGREEMENT_ID: TFloatField;
    dsDataAGREEMENT_NAME: TStringField;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewAGREEMENT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewAGREEMENT_NAME: TcxGridDBBandedColumn;
    dsDataINN_KNP: TStringField;
    dsDataNUM_REE: TStringField;
    grdDataDBBandedTableViewINN_KNP: TcxGridDBBandedColumn;
    lcgRegistry: TdxLayoutGroup;
    edtCustCode: TcxTextEdit;
    lciCustCode: TdxLayoutItem;
    edtFromDate: TcxDateEdit;
    lciFromDate: TdxLayoutItem;
    edtToDate: TcxDateEdit;
    lciToDate: TdxLayoutItem;
    edtNumRee: TcxTextEdit;
    lciNumRee: TdxLayoutItem;
    lcgKNP: TdxLayoutGroup;
    edtKNPName: TcxTextEdit;
    lciKNPName: TdxLayoutItem;
    edtKNPINN: TcxTextEdit;
    lciKNPINN: TdxLayoutItem;
    cmbxAgrmtId: TfdcObjectLookupEdit;
    lciAgrmtId: TdxLayoutItem;
    dsAgrmData: TdxMemData;
    srcAgrmData: TDataSource;
    dsAgrmDataID: TIntegerField;
    dsDataERR_COUNT: TFloatField;
    grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AgreementRegistryGridForm: TAgreementRegistryGridForm;

implementation

uses MainDm, DictDm, fdcUtils;

{$R *.dfm}

function ExecuteForm(const AFormClass: string): boolean;
var
  F: TForm;
begin
  F := TFormClass((FindClass(AFormClass)(* as TFormClass*))).Create(nil);
  try
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TAgreementRegistryGridForm.actAddExecute(Sender: TObject);
begin
//  inherited;
   ExecuteForm('TARegistryLoaderWzdForm');
end;


procedure TAgreementRegistryGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//  SetSubsParam('viewmode', cmbxViewMode.ItemIndex);
//  dsData.ParamByName('CUST_CODE').Value := Trim(cmbxCustCode.Text);
  SetSearchParam('INN_KNP', Trim(edtKNPINN.Text));
  SetSearchParam('DECL_NAME', Trim(edtKNPName.Text));
//  SetSearchParam('KPP', Trim(edtKpp.Text));
  SetSearchParam('NUM_REE', Trim(edtNumRee.Text));
  SetSearchParam('CUST_CODE', Trim(edtCustCode.Text));
  SetSearchParam('FROM_DATE', edtFromDate.EditValue);
  SetSearchParam('TO_DATE', edtToDate.EditValue);
  SetSearchParam('AGRMT_ID', dsAgrmData['ID']);
end;

const
  clBlueDark = TColor($00C56A31);
  clBlueLight = TColor($00F7EAD9);
  clBlueBright = TColor($00FF953D);
  clBlueSky = TColor($00EBC4A4);

  clGold = TColor($0047D5FE);
  clGoldDark = TColor($0001BDF3);

  clGreyLight = TColor($00E2EFF1);
  clGreyDark = TColor($00B9D9DD);
  clYellowLight = TColor($00E1FFFF);

  clGreenBright = TColor($0082E887);
  clGreenLight = TColor($00C9F5CB);
  clGreenObscured = TColor($00ACF0AF);
  clGreenDark = TColor($0044DD4B);

  clSilverDark = TColor($00A6A6A6);

  clLightRed = TColor($00B4B7EB);
  clLightRedFocused = TColor($00363EC9);

procedure TAgreementRegistryGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  StateId: string;
  val: Integer;
begin
  inherited;
{
  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewAS_BIG_PAYER.Index], varInteger);
  if (val = 1) then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
        clGreenDark, clGreenBright);
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
}
{
  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewDEBT_COUNT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
     ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clLightRedFocused, clLightRed);
     ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
}
  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewERR_COUNT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;

    ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clBlueSky, clBlueLight);


    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

{  StateId := VarToStr(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewSTATE_ID.Index]);
  if StateId <> '' then
  begin
    ACanvas.Font.Color := clGrayText;
  end;
}
  ADone := False;
end;


initialization
   RegisterClass(TAgreementRegistryGridForm);
   
end.
