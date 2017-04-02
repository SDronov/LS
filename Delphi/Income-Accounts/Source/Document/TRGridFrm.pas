unit TRGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, TPOBaseGridFrm,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, QueryList, cxDropDownEdit, cxCalendar, ObjectGridFrm, Menus,
  cxCalc, cxCurrencyEdit, cxCheckBox;

type
  TTRGridForm = class(TTPOBaseGridForm)
    grdDataDBTableViewID1: TcxGridDBColumn;
    grdDataDBTableViewNAME1: TcxGridDBColumn;
    grdDataDBTableViewSHORTNAME: TcxGridDBColumn;
    grdDataDBTableViewOBJECT_TYPE_ID: TcxGridDBColumn;
    grdDataDBTableViewSTATE_ID: TcxGridDBColumn;
    grdDataDBTableViewACCESSLEVEL: TcxGridDBColumn;
    grdDataDBTableViewSYSNAME: TcxGridDBColumn;
    grdDataDBTableViewDESCRIPT1: TcxGridDBColumn;
    grdDataDBTableViewOWNER_OBJECT_ID: TcxGridDBColumn;
    grdDataDBTableViewTYPENAME1: TcxGridDBColumn;
    grdDataDBTableViewTYPESYSNAME1: TcxGridDBColumn;
    grdDataDBTableViewMODIFY_DATE: TcxGridDBColumn;
    grdDataDBTableViewG011: TcxGridDBColumn;
    grdDataDBTableViewCUSTOM_MODE_ID: TcxGridDBColumn;
    grdDataDBTableViewOKPO: TcxGridDBColumn;
    grdDataDBTableViewINN: TcxGridDBColumn;
    grdDataDBTableViewG12: TcxGridDBColumn;
    grdDataDBTableViewCURRENCY_ID: TcxGridDBColumn;
    grdDataDBTableViewG444A: TcxGridDBColumn;
    grdDataDBTableViewG444B: TcxGridDBColumn;
    grdDataDBTableViewG447A: TcxGridDBColumn;
    grdDataDBTableViewG447B: TcxGridDBColumn;
    grdDataDBTableViewK115: TcxGridDBColumn;
    grdDataDBTableViewG40: TcxGridDBColumn;
    grdDataDBTableViewSUBJECT_ID: TcxGridDBColumn;
    grdDataDBTableViewG221: TcxGridDBColumn;
    grdDataDBTableViewCUSTOMS_CODE: TcxGridDBColumn;
    grdDataDBTableViewREG_DATE: TcxGridDBColumn;
    grdDataDBTableViewDECL_NO: TcxGridDBColumn;
    grdDataDBTableViewACT_NO: TcxGridDBColumn;
    grdDataDBTableViewGD1: TcxGridDBColumn;
    grdDataDBTableViewEXPORT_DATE: TcxGridDBColumn;
    grdDataDBTableViewTAX_EXEMPTION: TcxGridDBColumn;
    grdDataDBTableViewPAYED_MONTHS: TcxGridDBColumn;
    grdDataDBTableViewNEXT_PAY_MONTH: TcxGridDBColumn;
    dxBarButton1: TdxBarButton;
    dsDataANNUL_DATE: TDateTimeField;
    dsDataANNUL_NAME: TStringField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    dsDataDATE_CREATED: TDateTimeField;
    grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn;
    dsDataIN_WAIT: TIntegerField;
    colIN_WAIT: TcxGridDBBandedColumn;
    dsDataCARRIER_NAME: TStringField;
    dsDataCARRIER_INN: TStringField;
    dsDataCARRIER_KPP: TStringField;
    dsDataCARRIER_ID: TFloatField;
    colgrdDataDBBandedTableViewCarrier_Name: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewCarrier_Inn: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewCarrier_Kpp: TcxGridDBBandedColumn;
    dsDataCHARGED: TFloatField;
    grdDataDBBandedTableViewCHARGED: TcxGridDBBandedColumn;
    dsDataPAYED: TFloatField;
    grdDataDBBandedTableViewPAYED: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    columnIsActive: TcxGridDBBandedColumn;
    columnActivationDate: TcxGridDBBandedColumn;
    dsDataANNUL_REASON: TStringField;
    colAnnulReason: TcxGridDBBandedColumn;
    dsDatasType: TStringField;
    dsDatasSIGN_CORR: TStringField;
    colgrdDataDBBandedTableViewSTYPE: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewsSIGN_CORR: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  TRGridForm: TTRGridForm;

const
  clGold = TColor($0047D5FE);
  clGoldDark = TColor($0001BDF3);  

implementation

uses MainDm, fdcUtils, fdcCustomGridFrm;

{$R *.dfm}


procedure TTRGridForm.actAddExecute(Sender: TObject);
begin
//  inherited;
  RegisterAsWaiterFor(ObjectServices.CreateObject(SupportedTypeSysName, False, Params));
end;

procedure TTRGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val: Integer;
begin
  inherited;

  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[colIN_WAIT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
     ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clGoldDark, clGold);
     ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
end;

procedure TTRGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  if (Params.FindParam('AnnulOnly') <> nil) then
    SetSubsParam('viewmode', 4);
  inherited;
end;

procedure TTRGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  actAdd.Enabled := MainData.GetCustomsLevel = 0;
  actAdd.Visible := MainData.GetCustomsLevel = 0;
end;

initialization
   RegisterClass(TTRGridForm);

end.
