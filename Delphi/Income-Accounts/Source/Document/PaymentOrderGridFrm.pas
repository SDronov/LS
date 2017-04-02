{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 13111 $
  $Author: anaumenkov $
  $Date: 2011-04-07 22:10:08 +0400 (Р§С‚, 07 Р°РїСЂ 2011) $
}
unit PaymentOrderGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxDropDownEdit, cxCalendar, cxCurrencyEdit, cxCheckBox, dxBarExtDBItems,
  Menus, QueryList, cxMemo, cxDBEdit, DateUtils, cxCalc, dxmdaset;

type
  TPaymentOrderGridForm = class(TObjectGridForm)
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYER_INN: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtNomer: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtCurrency: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtFromDate: TcxDateEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtToDate: TcxDateEdit;
    lcSearchCriteriaItem5: TdxLayoutItem;
    lcSearchCriteriaGroup1: TdxLayoutGroup;
    lcSearchCriteriaItem6: TdxLayoutItem;
    Label1: TLabel;
    lcSearchCriteriaItem7: TdxLayoutItem;
    Label2: TLabel;
    edtSumMin: TcxCurrencyEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    edtSumMax: TcxCurrencyEdit;
    lcSearchCriteriaItem9: TdxLayoutItem;
    dsDataDOC_SUMMA: TFloatField;
    dsDataREST_SUMMA: TFloatField;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn;
    dsDataPAYER_KPP: TStringField;
    grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn;
    lcSearchCriteriaItem10: TdxLayoutItem;
    edtKPP: TcxTextEdit;
    dsDataSTATE_SYSNAME: TStringField;
    dsDataSTATE_NAME: TStringField;
    grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn;
    cmbxViewMode: TdxBarCombo;
    actAssure: TAction;
    dxbbAssure: TdxBarButton;
    qlPOG: TQueryList;
    sqlAssure: TsqlOp;
    dsDataCOMING_DATE: TDateTimeField;
    dsDataASSURE_DATE: TDateTimeField;
    grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCOMING_DATE: TcxGridDBBandedColumn;
    lcSearchCriteriaItem11: TdxLayoutItem;
    edtPayCode: TcxTextEdit;
    dsDataPAY_TYPE_CODE: TStringField;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    edtDescript: TcxMemo;
    lcSearchCriteriaItem12: TdxLayoutItem;
    dsDataLOCKED_SUMMA: TFloatField;
    grdDataDBBandedTableViewLOCKED_SUMMA: TcxGridDBBandedColumn;
    dsDataAVAIL_SUMMA: TFloatField;
    grdDataDBBandedTableViewAIL_SUMMA: TcxGridDBBandedColumn;
    dsDataINCOME_DATE: TDateTimeField;
    grdDataDBBandedTableViewINCOMDE_DATE: TcxGridDBBandedColumn;
    dsDataSUBJECT_ID: TFloatField;
    lvlAccData: TcxGridLevel;
    lvlAccDataDetails: TcxGridLevel;
    vwAccData: TcxGridDBBandedTableView;
    srcAccData: TDataSource;
    vwAccDataACC_OPER_DATE: TcxGridDBBandedColumn;
    dsAccData: TfdcQuery;
    vwAccDataSUMMA: TcxGridDBBandedColumn;
    dsAccDataACC_CODE: TStringField;
    dsAccDataACC_OPER_DATE: TDateTimeField;
    dsAccDataDAYSUM: TFloatField;
    dsAccDataACC_CURRENCY_ID: TFloatField;
    dsDataACC_CODE: TStringField;
    dsDataACC_OPER_DATE: TDateTimeField;
    dsDataACC_CURRENCY_ID: TFloatField;
    actCorrect: TAction;
    dxBarButton1: TdxBarButton;
    dsDataAK: TFloatField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    columnIS_ACTIVE: TcxGridDBBandedColumn;
    columnACTIVATION_DATE: TcxGridDBBandedColumn;
    dsDataIS_ARCHIVE: TStringField;
    columnIS_ARCHIVE: TcxGridDBBandedColumn;
    sqlPOIdent: TsqlOp;
    actIdentify: TAction;
    btnIdentifyAll: TdxBarButton;
    dsDataDESTCUSTOMSCODE: TStringField;
    grdDataDBBandedTableViewDestCustomsCode: TcxGridDBBandedColumn;
    dsDataKBK: TStringField;
    grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    lciActiveDate: TdxLayoutItem;
    lblActiveDate: TLabel;
    lciActiveFrom: TdxLayoutItem;
    edtActiveFrom: TcxDateEdit;
    lciActiveTo: TdxLayoutItem;
    edtActiveTo: TcxDateEdit;
    dsDataNOTE: TStringField;
    grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dsDataUIN: TStringField;
    grdDataDBBandedTableViewUIN: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actSearchExecute(Sender: TObject);
    procedure cmbxViewModeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtFromDatePropertiesChange(Sender: TObject);
    procedure edtFromDateFocusChanged(Sender: TObject);
    procedure edtSumMinFocusChanged(Sender: TObject);
    procedure edtSumMinPropertiesChange(Sender: TObject);
    procedure actSearchOkUpdate(Sender: TObject);
    procedure actAssureUpdate(Sender: TObject);
    procedure actAssureExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure dsAccDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataCalcFields(DataSet: TDataSet);
    procedure actCorrectExecute(Sender: TObject);
    procedure actCorrectUpdate(Sender: TObject);
    procedure actIdentifyUpdate(Sender: TObject);
    procedure actIdentifyExecute(Sender: TObject);
  protected
    function GetSupportedTypeSysName: string; override;
  private
    FDoCopy: Boolean;
    procedure DoAssure(AGridTableView: TcxGridTableView; AIndex,
    ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DoCheckUnAssure(AGridTableView: TcxGridTableView; AIndex,
    ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure CheckAccountMode;
    procedure DoReIdent(AGridTableView: TcxGridTableView; AIndex,
               ACount: integer; var ADescr: string; var ABreak: boolean);
  end;

var
  PaymentOrderGridForm: TPaymentOrderGridForm;

implementation

uses
  Oracle
 ,fdcUtils
 ,MainDm
 ,DictDm
 ,IaccLoader
 ,fdcCustomGridFrm
 ,cxEditConsts
 ,fdcCustomDBDataFrm
 ,fdcMessages
 ,SubjIntf
 ,fdcCustomDataFrm
 ,fdcObjectServices
 ,fdcCustomObjectGridFrm
 ;

{$R *.dfm}

procedure TPaymentOrderGridForm.dsDataBeforeOpen(DataSet: TDataSet);

  procedure SetPaysVisibleLevel ( ShowAll: boolean);
  begin
    if ShowAll then
      begin
        if Pos('fdc_po_credit_lst_all', dsData.SQL.Text) = 0 then
          dsData.SQL.Text := StringReplace(dsData.SQL.Text, 'fdc_po_credit_lst', 'fdc_po_credit_lst_all', [rfReplaceAll, rfIgnoreCase]);

        dsData.SQL.Text := StringReplace(dsData.SQL.Text, ':REST_SUMMA IS NULL', '1=1', [rfReplaceAll, rfIgnoreCase]);
        dsData.ParamByName('NA').Value := 6;
      end
    else
      dsData.SQL.Text := StringReplace(dsData.SQL.Text, 'fdc_po_credit_lst_all', 'fdc_po_credit_lst', [rfReplaceAll, rfIgnoreCase]);
  end;

begin

  if (self.ClassType  <> TPaymentOrderGridForm) then begin
    dsDataUIN.DataSet:= nil;
    dsDataUIN.FieldName := '';
    dsDataUIN.Visible := false;
    grdDataDBBandedTableViewUIN.Visible:= false;
    grdDataDBBandedTableViewUIN.DataBinding.FieldName:= '';
  end;

  SetPaysVisibleLevel( (cmbxViewMode.ItemIndex in [1, 5]) );
  if Params.FindParam('NA') = nil then
    case cmbxViewMode.ItemIndex of
      1: dsData.ParamByName('NA').Value := 6;
      2: dsData.ParamByName('NA').Value := 1;
      3: dsData.ParamByName('NA').Value := 2;
      4: dsData.ParamByName('NA').Value := 4;
      5: dsData.ParamByName('NA').Value := 7;
      6: dsData.ParamByName('NA').Value := 8;
      else
        dsData.ParamByName('NA').Value := Null;
    end;

  if Assigned( Params.FindParam( 'acc_id' ) ) then
    if Params.ParamByName( 'acc_reg_id' ).Value = -1 then
      SetSubsParam('viewmode', 0)
    else
      SetSubsParam('viewmode', 1);

  inherited;
  if    ( Pos( '%', Trim(edtINN.Text) ) > 0 )
     or ( Pos( '_', Trim(edtINN.Text) ) > 0 ) then
    begin
      SetSearchParam('INN',   Trim(edtINN.Text));
      SetSearchParam('INN_E', null);
    end
  else
    begin
      SetSearchParam('INN',   null);
      SetSearchParam('INN_E', Trim(edtINN.Text));
    end;

  if    ( Pos( '%', Trim(edtKPP.Text) ) > 0 )
     or ( Pos( '_', Trim(edtKPP.Text) ) > 0 ) then
    begin
      SetSearchParam('KPP',   Trim(edtKPP.Text));
      SetSearchParam('KPP_E', null);
    end
  else
    begin
      SetSearchParam('KPP',   null);
      SetSearchParam('KPP_E', Trim(edtKPP.Text));
    end;

  SetSearchParam('DOC_NO', Trim(edtNomer.Text));
  SetSearchParam('CURR', Trim(edtCurrency.Text));
  SetSearchParam('FROM_DATE', edtFromDate.EditValue);
  SetSearchParam('TO_DATE', edtToDate.EditValue);
  SetSearchParam('SUM_MIN', edtSumMin.EditValue);
  SetSearchParam('SUM_MAX', edtSumMax.EditValue);
  SetSearchParam('DESCRIPT', edtDescript.Text);
  SetSearchParam('PAY_CODE', edtPayCode.Text);
  SetSearchParam('ACTIVE_FROM', edtActiveFrom.EditValue);
  SetSearchParam('ACTIVE_TO', edtActiveTo.EditValue);  
end;

const
  colIsArchive         = clMedGray;
  colIsArchiveSelected = clBtnFace;


procedure TPaymentOrderGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val: double;
  vTypeSysName: string;
  V : variant;
begin
  inherited;

  if
    VarIsNull(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewASSURE_DATE.Index]) then
  begin
    if AViewInfo.RecordViewInfo.Selected {or AViewInfo.RecordViewInfo.Focused}
      then
      ACanvas.Canvas.Font.Color := clWhite
    else
      ACanvas.Canvas.Font.Color := clGreen;
  end;

  // покрасить в желтый, если с даты уплаты прошло 3 года
  if (AViewInfo.GridRecord.Values[grdDataDBBandedTableViewEXEC_DATE.Index] <> Null)
    and (CompareDate(IncYear(VarToDateTime(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewEXEC_DATE.Index]), 3), Now) < 1)
    and (AViewInfo.GridRecord.Values[grdDataDBBandedTableViewREST_SUMMA.Index] > 0) then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clYellowLight;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clYellowFocused;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  vTypeSysName := AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewTYPESYSNAME.Index];
  if   Pos('NonID', vTypeSysName) > 0  then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clBlueLight;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clBlueSky;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  if
    VarToStr(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewSTATE_SYSNAME.Index]) = 'PaymentOrderNew' then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clLightRed;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clLightRedFocused;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  // -- подсветка документов с null или 0-м остатком
  V := AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewREST_SUMMA.Index];
  if (VarToStr(V) = '') or (VarAsType(V, varDouble) < 0.01) then
    ACanvas.Canvas.Font.Color := clGrayText; // TColor($00E3E3FF);

  // --- подсветка архивных документов
  if (VarToStr(AViewInfo.GridRecord.Values[columnIs_Archive.Index]) = 'Y') then
  begin
    ACanvas.Canvas.Font.Color := clBlack;
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
      colIsArchive, colIsArchiveSelected);
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  ADone := False;
end;

procedure TPaymentOrderGridForm.actSearchExecute(Sender: TObject);
begin
  btnSearch.SetFocus;
  if Screen.ActiveControl is TcxCustomEdit then
    if not TcxCustomEdit(Screen.ActiveControl).Deactivate then
      Exit;
  inherited;
end;

procedure TPaymentOrderGridForm.cmbxViewModeChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TPaymentOrderGridForm.CheckAccountMode;
begin
  if (Params.FindParam('ACC_OPER_DATE') = nil)
       and (Params.FindParam('gl_acc_code') <> nil) then
  begin
    grdData.ActiveLevel := lvlAccData;
    lvlAccDataDetails.GridView := grdDataDBBandedTableView;
    dsAccData.Open;
  end;
end;

procedure TPaymentOrderGridForm.FormCreate(Sender: TObject);
var
  InTransaction: Boolean;
begin
  inherited;
  dsData.AutoCommit := False;
  dsData.AutoRollback := False;
  InTransaction := dsData.Session.InTransaction;
  actOpen.Visible := not InTransaction;
  actDelete.Visible := not InTransaction;
  actAdd.Visible := not InTransaction and (MainData.GetCustomsLevel <> 3);
  actAssure.Visible := actAssure.Visible and (Self.ClassName =
    'TPaymentOrderGridForm') and not InTransaction;
  edtName.Text := GetActiveSubjectName;
  edtINN.Text := GetActiveSubjectINN;
  edtKPP.Text := GetActiveSubjectKPP;
  if (Self.Owner.Name = 'MainForm') then
    begin
      actSwitchSearchCriteria.Execute;
      edtFromDate.EditValue := Date - 7;
      edtToDate.EditValue := Date;
    end;
end;

procedure TPaymentOrderGridForm.edtFromDatePropertiesChange(
  Sender: TObject);
begin
  inherited;
  if FDoCopy then
    edtToDate.Text := edtFromDate.Text;
end;

procedure TPaymentOrderGridForm.edtFromDateFocusChanged(Sender: TObject);
begin
  inherited;
  if edtFromDate.Focused then
    FDoCopy := edtFromDate.Date = edtToDate.Date;
end;

procedure TPaymentOrderGridForm.edtSumMinFocusChanged(Sender: TObject);
begin
  inherited;
  if edtSumMin.Focused then
    FDoCopy := edtSumMin.Value = edtSumMax.Value;
end;

procedure TPaymentOrderGridForm.edtSumMinPropertiesChange(Sender: TObject);
begin
  inherited;
  if FDoCopy then
    edtSumMax.Text := edtSumMin.Text;
end;

procedure TPaymentOrderGridForm.actSearchOkUpdate(Sender: TObject);
var
  AllowUncertain: boolean;
begin
  inherited;
  AllowUncertain := Params.FindParam('ALLOW_UNCERTAIN') <> nil;
  if TAction(Sender).Visible and TAction(Sender).Enabled and (not AllowUncertain and dsDataPAYER_ID.IsNull) then
    TAction(Sender).Enabled := False;
end;

procedure TPaymentOrderGridForm.actAssureUpdate(Sender: TObject);
var
  Enabled: Boolean;
begin
  inherited;
  Enabled := False;
  if TAction(Sender).Visible then
    case grdDataDBBandedTableView.Controller.SelectedRowCount of
      0: Enabled := False;
      1: Enabled := dsDataASSURE_DATE.IsNull;
      else
        Enabled := True;
    end;

  TAction(Sender).Enabled := Enabled;
end;

procedure TPaymentOrderGridForm.actAssureExecute(Sender: TObject);
begin
  inherited;
  if grdDataDBBandedTableView.Controller.SelectedRowCount = 1 then
  begin
    if ConfirmDlg(Format('Заверить документ?', []), '') = mrYes then
    begin
      sqlAssure.Exec('pdate', Date);
      dsData.Session.Commit;
      RefreshData;
    end;
  end
  else
  begin
//    IterateRecords(DoCheckUnAssure, False, False);
    if ConfirmDlg(Format('Заверить %d документа(ов)?',
      [grdDataDBBandedTableView.Controller.SelectedRowCount]), '') = mrYes then
      try
        IterateRecords(DoAssure, True, True);
        dsData.Session.Commit;
        RefreshData;
      except
        dsData.Session.Rollback;
        raise;
      end;
  end;
end;

procedure TPaymentOrderGridForm.DoAssure(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  if dsDataASSURE_DATE.IsNull then
     sqlAssure.Exec('pdate', Date);
end;

procedure TPaymentOrderGridForm.DoCheckUnAssure(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
begin
  if not dsDataASSURE_DATE.IsNull then
     grdDataDBBandedTableView.Controller.SelectedRows[AIndex].Selected := False;
end;

procedure TPaymentOrderGridForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if dsData.Session.InTransaction then
        dsData.Session.Commit;
end;

procedure TPaymentOrderGridForm.FormShow(Sender: TObject);
var
 AParam: TParam;
begin
  //CheckAccountMode;
  if SearchMode then
  begin
    cmbxViewMode.Visible := ivNever;
    AParam := Params.FindParam('QBE_DOC_SUMMA');
    if assigned(AParam) then
    begin
      edtSumMin.Value := AParam.AsCurrency;
      edtSumMax.Value := AParam.AsCurrency;
      AParam.Free;
    end;
    AParam := Params.FindParam('PAYER_ONLY');
    if assigned(AParam) then
    begin
      edtName.Enabled := False;
      edtINN.Enabled := False;
      edtKPP.Enabled := False;
      btnSwitchSearchCriteria.Enabled := False;
      AParam.Free;
    end
  end
   else  cmbxViewMode.Visible := ivAlways;
  inherited;
end;

procedure TPaymentOrderGridForm.actOpenExecute(Sender: TObject);
begin
  Params.ParamByName('pf_subject_Id').Value := dsDataSubject_Id.Value;
  ObjectServices.OpenObject(dsDataID.Value, Params);
end;

procedure TPaymentOrderGridForm.dsAccDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsAccData.Params.AssignValues(Params);
end;

procedure TPaymentOrderGridForm.dsDataCalcFields(DataSet: TDataSet);
  function GetParamValuesDef(const AParamName: string; const DefValue: Variant): Variant;
  var
    P: TParam;
  begin
    P := dsData.Params.FindParam(AParamName);
    if P = nil then Result := DefValue
      else Result := P.Value;
  end;
begin
  inherited;
  dsDataACC_CODE.AsVariant := GetParamValuesDef('ACC_CODE', Null);
  dsDataACC_OPER_DATE.AsVariant := GetParamValuesDef('ACC_OPER_DATE', Null);
  dsDataACC_CURRENCY_ID.AsVariant := GetParamValuesDef('ACC_CURRENCY_ID', Null);
end;

procedure TPaymentOrderGridForm.DoReIdent(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  //Идентификация платежек
  sqlPOIdent.Exec;
end;

procedure TPaymentOrderGridForm.actCorrectUpdate(Sender: TObject);
begin
  inherited;
  //Отображение кнопки "Исправить"
  actCorrect.Visible :=(cmbxViewMode.ItemIndex = 2); // если выбраны "Невыясненные"
  actCorrect.Enabled := ( grdDataDBBandedTableView.Controller.SelectedRowCount > 0 ) ;
end;

procedure TPaymentOrderGridForm.actCorrectExecute(Sender: TObject);
begin
  inherited;
  if grdDataDBBandedTableView.Controller.SelectedRowCount = 1 then
  begin
    if ConfirmDlg(Format('Исправить документ?', []), '') = mrYes then
    try
      sqlPOIdent.Exec;
      dsData.Session.Commit;
      RefreshData;
    except
      dsData.Session.Rollback;
      raise;
    end;
  end
  else
  begin
    if ConfirmDlg(Format('Исправить %d документа(ов)?',
      [grdDataDBBandedTableView.Controller.SelectedRowCount]), '') = mrYes then
      try
        IterateRecords(DoReIdent, True, True);
        dsData.Session.Commit;
        RefreshData;
      except
        dsData.Session.Rollback;
        raise;
      end;
  end;
end;

procedure TPaymentOrderGridForm.actIdentifyUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not dsData.IsEmpty and
                             not actCorrect.Visible;
end;

procedure TPaymentOrderGridForm.actIdentifyExecute(Sender: TObject);
  var
    AllCount, IdentCount : integer;
begin
  Try
    MainData.pkgCommon.PackageName := 'p_PO_NonId';
    MainData.pkgCommon.CallProcedure('IdentifyPayerForAllPayments', [parInteger, parInteger]);
    MainData.pkgCommon.Session.Commit;
    AllCount   := MainData.pkgCommon.GetParameter(0);
    IdentCount := MainData.pkgCommon.GetParameter(1);
    ShowMessage( 'Обработано документов:',
                 format('Всего неидентифицированных : %d'#$D#$A+'Из них идентифицированно: %d', [AllCount, IdentCount])
               );
  finally
    RefreshData;
  end;
end;

function TPaymentOrderGridForm.GetSupportedTypeSysName: string;
begin
  Result := 'CashOrder';
end;

initialization
  RegisterClass(TPaymentOrderGridForm);

end.

