unit CustomDeclTempAdmFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomDeclFrm, cxGraphics, cxCheckBox, cxDBEdit, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxCalendar, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls,
  dxBarExtItems, ExtCtrls, cxSplitter, cxGroupBox, cxRadioGroup, QueryList,
  cxSpinEdit, OracleData, Menus, cxLookAndFeelPainters, cxButtons;

type
  TCustomDeclTempAdmForm = class(TCustomDeclForm)
    dsDataEXPORT_DATE: TDateTimeField;
    dsDataPAYED_MONTHS: TIntegerField;
    dsDataTAX_EXEMPTION: TIntegerField;
    tabImport31: TcxTabSheet;
    pnlImport31: TPanel;
    dxBarDockControl31Top: TdxBarDockControl;
    dxBarDockControl31Left: TdxBarDockControl;
    dxBarDockControl31Bottom: TdxBarDockControl;
    dxBarDockControl31Right: TdxBarDockControl;
    lcImport31Group_Root: TdxLayoutGroup;
    lcImport31: TdxLayoutControl;
    pnlPeriodicCharges: TPanel;
    cxSplitter1: TcxSplitter;
    lcImport31Item1: TdxLayoutItem;
    cxDBDateEdit4: TcxDBDateEdit;
    lcImport31Item2: TdxLayoutItem;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Panel1: TPanel;
    dsDataREALLY_PAYED_MONTHS: TFloatField;
    actStop: TAction;
    actProlong: TAction;
    actStopHistory: TAction;
    dsDataNEXT_PAY_MONTH: TDateTimeField;
    sqlAddAdvice: TsqlOp;
    cxDBCheckBox1: TcxDBCheckBox;
    lcGeneralItem21: TdxLayoutItem;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabImport31Show(Sender: TObject);
    procedure tabGeneralShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabGoodsShow(Sender: TObject);
    procedure actStopExecute(Sender: TObject);
    procedure actProlongExecute(Sender: TObject);
    procedure actStopUpdate(Sender: TObject);
    procedure actProlongUpdate(Sender: TObject);
    procedure actStopHistoryExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCorrectCChargeExecute(Sender: TObject);
    procedure cmbxDecisionEditing(Sender: TObject; var CanEdit: Boolean);
  private
    FPeriodicChargeForm: TForm;
    EXP_DATE           : TDateTime;
   public
    { Public declarations }
  end;

var
  CustomDeclTempAdmForm: TCustomDeclTempAdmForm;

implementation

uses fdcCustomCardFrm, ObjectFrm, fdcCustomGridFrm, fdcCustomDataFrm,
  DeclTempAdmStopFrm, fdcMessages, DeclTempAdmProlongFrm,
  PeriodicChargeGridFrm;

{$R *.dfm}

procedure TCustomDeclTempAdmForm.dsDataAfterOpen(DataSet: TDataSet);
const
  //Colors: array[boolean] of TColor = (clWindow, clInactiveCaptionText);
    Colors: array[boolean] of TColor = (clWindow, clSilver);
begin
  inherited;
  dsDataEXPORT_DATE.Required := not IsNew;
  cxDBDateEdit4.Enabled := (not IsNew) and dsDataEXPORT_DATE.IsNull;
  //dsDataPAYED_MONTHS.Required := not IsNew;
  if dsDataTAX_EXEMPTION.IsNull then dsDataTAX_EXEMPTION.Value := 0;
  //dsDataTAX_EXEMPTION.Required := not IsNew;
  //dsDataEXPORT_DATE.ReadOnly := not dsDataEXPORT_DATE.IsNull;
  dsDataPAYED_MONTHS.ReadOnly := not dsDataREALLY_PAYED_MONTHS.IsNull;
  if not dsDataREALLY_PAYED_MONTHS.IsNull then
    cxDBMaskEdit1.DataBinding.DataField := 'REALLY_PAYED_MONTHS'
  else
    cxDBMaskEdit1.DataBinding.DataField := 'PAYED_MONTHS';
//  dsDataTAX_EXEMPTION.ReadOnly := not  dsDataTAX_EXEMPTION.IsNull;
  cxDBDateEdit4.Style.Color := Colors[dsDataEXPORT_DATE.ReadOnly];
  cxDBMaskEdit1.Style.Color := Colors[dsDataPAYED_MONTHS.ReadOnly];
  tabGeneral.Caption := 'ДТ';
end;

procedure TCustomDeclTempAdmForm.tabImport31Show(Sender: TObject);
begin
  inherited;

  if (BarManager.Bars[0].DockControl = dxBarDockControlTop) then
    BarManager.Bars[0].DockControl := dxBarDockControl31Top;

  if (BarManager.Bars[0].DockControl = dxBarDockControlBottom) then
    BarManager.Bars[0].DockControl := dxBarDockControl31Bottom;

  if (BarManager.Bars[0].DockControl = dxBarDockControlLeft) then
    BarManager.Bars[0].DockControl := dxBarDockControl31Left;

  if (BarManager.Bars[0].DockControl = dxBarDockControlRight) then
    BarManager.Bars[0].DockControl := dxBarDockControl31Right;

  Params.ParamByName('DECL_ID').AsFloat := dsDataID.AsFloat;
  Params.ParamByName('Tax_Exemption').AsInteger := dsDataTAX_EXEMPTION.AsInteger;
  if not Assigned(FPeriodicChargeForm) then begin
    FPeriodicChargeForm := Self.ObjectServices.ShowForm('TPeriodicChargeGridForm', Params, pnlPeriodicCharges);
    TObjectForm(FPeriodicChargeForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FPeriodicChargeForm));
    (FPeriodicChargeForm as TPeriodicChargeGridForm).actAdd.Visible := False;
    (FPeriodicChargeForm as TPeriodicChargeGridForm).actAdd.Enabled  := False;
    (FPeriodicChargeForm as TPeriodicChargeGridForm).actDelete.Visible := False;
    (FPeriodicChargeForm as TPeriodicChargeGridForm).actDelete.Enabled := False;      
  end;
end;

procedure TCustomDeclTempAdmForm.tabGeneralShow(Sender: TObject);
begin
  inherited;
  if (BarManager.Bars[0].DockControl = dxBarDockControl31Top) then
    BarManager.Bars[0].DockControl := dxBarDockControlTop;

  if (BarManager.Bars[0].DockControl = dxBarDockControl31Bottom) then
    BarManager.Bars[0].DockControl := dxBarDockControlBottom;

  if (BarManager.Bars[0].DockControl = dxBarDockControl31Left) then
    BarManager.Bars[0].DockControl := dxBarDockControlLeft;

  if (BarManager.Bars[0].DockControl = dxBarDockControl31Right) then
    BarManager.Bars[0].DockControl := dxBarDockControlRight;
end;

procedure TCustomDeclTempAdmForm.FormCreate(Sender: TObject);
begin
  inherited;
  ParamByName('DECL_ID').SourceField := dsDataID;
//  ParamByName('DECL_NO').SourceField := dsDataNAME;
end;

procedure TCustomDeclTempAdmForm.tabGoodsShow(Sender: TObject);
begin
  if not Assigned(FGoodsForm) then begin
    FGoodsForm := ObjectServices.ShowForm('TDeclTempAdmGoodsGridForm', Params, TWinControl(Sender));
    TObjectForm(FGoodsForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FGoodsForm));
  end;
end;

procedure TCustomDeclTempAdmForm.actStopExecute(Sender: TObject);
begin
  inherited;
  if StopTempAdm(dsDataID.Value) then begin
    RefreshData;
    RefreshWaiters;
  end;
end;

procedure TCustomDeclTempAdmForm.actProlongExecute(Sender: TObject);
begin
  inherited;
  if ProlongTempAdm(dsDataID.Value) then begin
    RefreshData;
    RefreshWaiters;
  end;
end;

procedure TCustomDeclTempAdmForm.actStopUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (Pos('decl.stoptempadm', dsDataOBJECTKINDLIST.Value) = 0);
end;

procedure TCustomDeclTempAdmForm.actProlongUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (Pos('decl.stoptempadm', dsDataOBJECTKINDLIST.Value) > 0);
end;

procedure TCustomDeclTempAdmForm.actStopHistoryExecute(Sender: TObject);
begin
  inherited;
  ObjectServices.ShowForm('TDeclTempAdmStopHistForm', Params, nil);
end;

procedure TCustomDeclTempAdmForm.actSaveExecute(Sender: TObject);
begin
   EXP_DATE := dsDataEXPORT_DATE.Value;
 inherited;
  if  ((btnStateTransit.Caption = 'Оформлена')
   or (btnStateTransit.Caption = 'Выпущена'))
   and (EXP_DATE > dsDataEXPORT_DATE.Value)
   then
     if ConfirmDlg('Изменен срок обратного вывоза ДТ!!!','Будет сформировано уведомление об излишьней уплате') = mrYes then
     begin
       sqlAddAdvice.Exec('pDeclId',[dsDataID.AsInteger]);
       QueryList1.Session.Commit;
     end;
   EXP_DATE := dsDataEXPORT_DATE.Value;
end;

procedure TCustomDeclTempAdmForm.actCorrectCChargeExecute(Sender: TObject);
begin
  if ConfirmDlg('Вы уверены что хотите отменить списания по последнему оплаченному месяцу?','Операцию отменить будет нельзя.') <> mrYes then
     Exit;
  inherited;

end;

procedure TCustomDeclTempAdmForm.cmbxDecisionEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  inherited;
  dsData.FieldByName('DECISION_DATE').AsDateTime := DateOf(now);
end;

initialization
  RegisterClass(TCustomDeclTempAdmForm);
end.
