unit EventGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGrid,
  cxGridCustomView, dxLayoutControl, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxGridBandedTableView, cxGridDBBandedTableView, fdcObjectCore,
  cxDropDownEdit, cxCalendar, cxRadioGroup, Menus;

type
  TEventGridForm = class(TObjectGridForm)
    dsDataOBJECT_ID: TFloatField;
    dsDataMOMENT: TDateTimeField;
    dsDataLOGIN: TStringField;
    dsDataPROGRAM: TStringField;
    dsDataMACHINE: TStringField;
    dsDataUSER_ID: TFloatField;
    dsDataUSERNAME: TStringField;
    dsDataOBJECTNAME: TStringField;
    dsDataOBJECTTYPEID: TFloatField;
    dsDataREFTYPENAME: TStringField;
    dsDataREFTYPESYSNAME: TStringField;
    grdDataDBBandedTableViewMOMENT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLOGIN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPROGRAM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMACHINE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewUSERNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREFTYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREFTYPESYSNAME: TcxGridDBBandedColumn;
    actOpenObject: TAction;
    actOpenUser: TAction;
    edtDateFrom: TcxDateEdit;
    lciDateFrom: TdxLayoutItem;
    edtDateTo: TcxDateEdit;
    lciDateTo: TdxLayoutItem;
    btnLastDay: TcxRadioButton;
    lciLastDay: TdxLayoutItem;
    lciSearchMoment: TdxLayoutItem;
    lblSearchMoment: TLabel;
    btnLastWeek: TcxRadioButton;
    lciLastWeek: TdxLayoutItem;
    btnPeriod: TcxRadioButton;
    lciPeriod: TdxLayoutItem;
    lciAllTime: TdxLayoutItem;
    btnAllTime: TcxRadioButton;
    dsDataIP_ADDRESS: TStringField;
    dsDataOS_USER: TStringField;
    grdDataDBBandedTableViewIpAddress: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOsUser: TcxGridDBBandedColumn;
    edtIPaddress: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtOSuser: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    procedure grdDataDBBandedTableViewREFTYPENAMECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actOpenExecute(Sender: TObject);
    procedure actOpenObjectUpdate(Sender: TObject);
    procedure actOpenObjectExecute(Sender: TObject);
    procedure actOpenUserUpdate(Sender: TObject);
    procedure actOpenUserExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure edtDateFromEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventGridForm: TEventGridForm;

implementation

uses fdcUtils, fdcCustomGridFrm, fdcCustomObjectGridFrm, MainFrm;

{$R *.dfm}

procedure TEventGridForm.grdDataDBBandedTableViewREFTYPENAMECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ObjectType: TfdcObjectType;
  ObjectTypeSysName: string;
begin
  inherited;
  ADone := False;
  if Assigned(ObjectServices) then begin
    ObjectTypeSysName := VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[
      grdDataDBBandedTableViewREFTYPESYSNAME.Index]);
    ObjectType := ObjectServices.GetObjectTypeFactory.Find(ObjectTypeSysName);
    if Assigned(ObjectType) then
      ADone := ObjectType.DrawGridCell(ACanvas.Canvas, AViewInfo.Bounds);
  end;
end;

procedure TEventGridForm.actOpenExecute(Sender: TObject);
begin
  with grdDataDBBandedTableView.Controller do

    { open event object }
    if (FocusedColumn = grdDataDBBandedTableViewREFTYPENAME) or
       (FocusedColumn = grdDataDBBandedTableViewOBJECTNAME) then
      actOpenObject.Execute

    { open user }
    else
    if (FocusedColumn = grdDataDBBandedTableViewLOGIN) or
       (FocusedColumn = grdDataDBBandedTableViewUSERNAME) then
      actOpenUser.Execute

    { open event }
    else
      inherited;
end;

procedure TEventGridForm.actOpenObjectUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (not SearchMode) and
    (not dsDataOBJECT_ID.IsNull);
end;

procedure TEventGridForm.actOpenObjectExecute(Sender: TObject);
begin
  with ActiveGridTableView.Controller do
    if (not dsDataOBJECT_ID.IsNull) and
       (not dsDataOBJECTNAME.IsNull) and
       (
         (FocusedColumn = grdDataDBBandedTableViewREFTYPENAME) or
         (FocusedColumn = grdDataDBBandedTableViewOBJECTNAME)
       )
    then
      RegisterAsWaiterFor(ObjectServices.OpenObject(dsDataOBJECT_ID.AsFloat, Params))
    else
      inherited;
end;

procedure TEventGridForm.actOpenUserUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (not SearchMode) and
    (not dsDataUSER_ID.IsNull);
end;

procedure TEventGridForm.actOpenUserExecute(Sender: TObject);
begin
  inherited;
  RegisterAsWaiterFor(ObjectServices.OpenObject(dsDataUSER_ID.AsFloat, Params));
end;

procedure TEventGridForm.dsDataBeforeOpen(DataSet: TDataSet);
var
  DateFrom, DateTo: Variant;
begin
  inherited;

  {IP адрес }
  SetSearchParam('IP_ADDRESS', Trim(edtIPaddress.Text));

  { Пользователь ОС }
  SetSearchParam('OS_USER', Trim(edtOSuser.Text));

  { all time }
  if btnAllTime.Checked then
  begin
    DateTo := Null;
    DateFrom := Null;
  end
  else

  { last day }
  if btnLastDay.Checked then
  begin
    DateTo := Now;
    DateFrom := DateTo - 1;
  end
  else

  { last week }
  if btnLastDay.Checked then
  begin
    DateTo := Now;
    DateFrom := DateTo - 7;
  end

  { period }
  else
  begin
    DateTo   := edtDateTo  .EditValue;
    DateFrom := edtDateFrom.EditValue;
  end;

  SetSearchParam('DateTo',   DateTo);
  SetSearchParam('DateFrom', DateFrom);
end;

procedure TEventGridForm.edtDateFromEnter(Sender: TObject);
begin
  inherited;
  btnPeriod.Checked := True;
end;

procedure TEventGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  if MainForm.actLogSearchOnOpen.Checked then begin
    NoRecordOnShow := True;
    actSwitchSearchCriteria.Execute;
  end;
end;

initialization
  RegisterClass(TEventGridForm);

end.
