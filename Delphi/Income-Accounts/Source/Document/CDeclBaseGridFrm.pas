{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 14695 $
  $Author: sbakum $
  $Date: 2012-04-28 14:03:18 +0400 (РЎР±, 28 Р°РїСЂ 2012) $
}
unit CDeclBaseGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, cxDBEdit,
  cxDropDownEdit, cxCalendar, Menus, QueryList, Oracle;

type
  TCDeclBaseGridForm = class(TObjectGridForm)
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    dsDataDECL_INN: TStringField;
    dsDataDECL_NAME: TStringField;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn;
    dsDataDECL_KPP: TStringField;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    edtKPP: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    dsDataERR_COUNT: TFloatField;
    colERR_COUNT: TcxGridDBBandedColumn;
    cmbxViewMode: TdxBarCombo;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn;
    edtCustomsCode: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtFrom: TcxDateEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtTo: TcxDateEdit;
    lcSearchCriteriaItem5: TdxLayoutItem;
    edtNo: TcxTextEdit;
    lcSearchCriteriaItem6: TdxLayoutItem;
    dsDataDEBT_COUNT: TFloatField;
    grdDataDBBandedTableViewDEBT_COUNT: TcxGridDBBandedColumn;
    cmbxCustCode: TdxBarCombo;
    dsDataOBJKINDLABEL: TStringField;
    lcgDocument: TdxLayoutGroup;
    lcgSubject: TdxLayoutGroup;
    lcgGoods: TdxLayoutGroup;
    lcSearchCriteriaItem7: TdxLayoutItem;
    edtGoodsCode: TcxMaskEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    edtGoodsPref: TcxTextEdit;
    grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn;
    dsDataOPERATION_DATE: TDateTimeField;
    grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn;
    QueryList1: TQueryList;
    sqlReparse: TsqlOp;
    sqlCheckPayments: TsqlOp;
    sqlReparseTempAdm: TsqlOp;
    sqlReparsePaymentTPO: TsqlOp;
    sqlReIdentGTD: TsqlOp;
    sqlReIdentTPO: TsqlOp;
    dsErrorsLst: TfdcQuery;
    dsErrorsLstID: TFloatField;
    dsErrorsLstNAME: TStringField;
    dsErrorsLstSHORTNAME: TStringField;
    dsErrorsLstOBJECT_TYPE_ID: TFloatField;
    dsErrorsLstSTATE_ID: TFloatField;
    dsErrorsLstACCESSLEVEL: TFloatField;
    dsErrorsLstSYSNAME: TStringField;
    dsErrorsLstDESCRIPT: TStringField;
    dsErrorsLstOWNER_OBJECT_ID: TFloatField;
    dsErrorsLstTYPENAME: TStringField;
    dsErrorsLstTYPESYSNAME: TStringField;
    dsErrorsLstOBJECTKINDLIST: TStringField;
    actCorrect: TAction;
    btnCorrect: TdxBarButton;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cmbxViewModeChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure cmbxCustCodeChange(Sender: TObject);
    procedure dsDataCalcFields(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewColumn2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure grdDataDBBandedTableViewOBJECTKINDLISTGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure actCorrectUpdate(Sender: TObject);
    procedure actCorrectExecute(Sender: TObject);
  private
    procedure DoFixDecl(AGridTableView: TcxGridTableView; AIndex,
               ACount: integer; var ADescr: string; var ABreak: boolean);
  public
    procedure LoadLayout; override;
    procedure SaveLayout; override;
    { Public declarations }
    
  end;

var
  CDeclBaseGridForm: TCDeclBaseGridForm;

implementation

uses MainDm, fdcUtils, fdcCustomDBDataFrm, fdcCustomObjectGridFrm,
  fdcCustomDataFrm, fdcCustomGridFrm, fdcMessages;

{$R *.dfm}

procedure TCDeclBaseGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSubsParam('viewmode', cmbxViewMode.ItemIndex);
  //SetSearchParam('cust_code', Trim(cmbxCustCode.Text));
  dsData.ParamByName('CUST_CODE').Value := Trim(cmbxCustCode.Text);
  SetSearchParam('INN', Trim(edtInn.Text));
  SetSearchParam('KPP', Trim(edtKpp.Text));
  SetSearchParam('DECL_NO', Trim(edtNo.Text));
  if Trim(edtCustomsCode.Text) <> '' then
    SetSearchParam('CUST_CODE', Trim(edtCustomsCode.Text));
  SetSearchParam('FROM_DATE', edtFrom.EditValue);
  SetSearchParam('TO_DATE', edtTo.EditValue);
  SetSearchParam('g_code', edtGoodsCode.EditValue);
  SetSearchParam('g_pref', edtGoodsPref.EditValue);
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

procedure TCDeclBaseGridForm.grdDataDBBandedTableViewCustomDrawCell(
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
  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewDEBT_COUNT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
     ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clLightRedFocused, clLightRed);
     ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[colERR_COUNT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;

    ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clBlueSky, clBlueLight);


    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  StateId := VarToStr(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewSTATE_ID.Index]);
  if StateId <> '' then
  begin
    ACanvas.Font.Color := clGrayText;
  end;

  ADone := False;
end;

procedure TCDeclBaseGridForm.cmbxViewModeChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TCDeclBaseGridForm.actAddExecute(Sender: TObject);
begin
//  inherited;
  RegisterAsWaiterFor(ObjectServices.CreateObject(SupportedTypeSysName, False, Params));
end;

procedure TCDeclBaseGridForm.cmbxCustCodeChange(Sender: TObject);
var
  I: Integer;
  Items: TStrings;
  S: string;
begin
  inherited;

  if cmbxCustCode.Tag = 0 then
   try
   cmbxCustCode.Tag := 1;
  S := cmbxCustCode.Text;
  Items := cmbxCustCode.Items;
  I := Items.IndexOf(S);
  if I >= 0 then
        Items.Delete(I);
  Items.Insert(0, S);

   while Items.Count > 5 do
      Items.Delete(Items.Count - 1);
   cmbxCustCode.ItemIndex := 0;

  if dsData.Active then
    RefreshData;
   finally
     cmbxCustCode.Tag := 0;
   end;

end;

procedure TCDeclBaseGridForm.LoadLayout;
begin
  DeleteRegistryKey(MenusAndToolbarsLayoutRegistryKey);
  inherited;
  cmbxCustCode.Items.Text := ReadRegistryValue(FormLayoutRegistryKey, 'CustCode', rvString);
  if cmbxCustCode.Items.Count > 0 then
     cmbxCustCode.ItemIndex := 0;
end;

procedure TCDeclBaseGridForm.SaveLayout;
begin
  inherited;
  WriteRegistryValue(FormLayoutRegistryKey, 'CustCode', cmbxCustCode.Items.Text);
end;

procedure TCDeclBaseGridForm.dsDataCalcFields(DataSet: TDataSet);
begin
  inherited;
//  dsDataOBJKINDLABEL.Value := IfElse(Pos('decl.otm', VarToStr(dsDataOBJECTKINDLIST.Value))>0, 'ОТП', '');
  dsDataOBJKINDLABEL.Value := 'ОТП';
end;

procedure TCDeclBaseGridForm.grdDataDBBandedTableViewColumn2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
//  AText := IfElse(Pos('decl.otm', VarToStr(ARecord.Values[grdDataDBBandedTableViewColumn2.Index]))>0, 'ОТП', '');
end;

procedure TCDeclBaseGridForm.grdDataDBBandedTableViewOBJECTKINDLISTGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  AText := IfElse(Pos('decl.otm', AText)>0, 'ОТП', '');
end;

procedure TCDeclBaseGridForm.DoFixDecl(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  dsErrorsLst.ParamByName('ID').AsInteger := dsData.FieldValues['ID'];
  dsErrorsLst.Open;
  try
    //Запускаем цикл по ошибкам
    while not dsErrorsLst.Eof do
    begin
      try
        if dsErrorsLstTYPESYSNAME.Value = 'WrongNumberOfMonthsError' then
          sqlReparseTempAdm.Exec
        else
          if dsErrorsLstTYPESYSNAME.Value = 'BadPayOrderErrorTPO' then
            sqlReparsePaymentTPO.Exec
          else
            if Pos('TPO', dsErrorsLstTYPESYSNAME.Value) <> 0 then
              sqlCheckPayments.Exec
            else
              if (Pos('NoDeclarant', dsErrorsLstTYPESYSNAME.Value) = 0)
                and (Pos('NoCarrierFoundError', dsErrorsLstTYPESYSNAME.Value) = 0)
                and (not dsErrorsLstSYSNAME.IsNull) then
              begin
                sqlReparse.Exec;
              end
              else
                if (Pos('NoDeclarant', dsErrorsLstTYPESYSNAME.Value) <> 0)
                or (Pos('NoCarrierFoundError', dsErrorsLstTYPESYSNAME.Value) <> 0) then
                begin
                  //Запускаем для ТПО
                  if (Pos('TPO', dsDataTYPESYSNAME.Value) <> 0) or
                      (Pos('TR', dsDataTYPESYSNAME.Value) <> 0) or
                      (Pos('TrDuplicate', dsDataTYPESYSNAME.Value) <> 0) then
                    sqlReIdentTPO.Exec
                  else
                    sqlReIdentGTD.Exec;
                end;


        MainData.Session.Commit;
      except
        on EOracleError do
          //Не смогли. Откатываем
          MainData.Session.Rollback;
      end;
      dsErrorsLst.Next;
    end;
  finally
    dsErrorsLst.Close;
  end;
end;

procedure TCDeclBaseGridForm.actCorrectUpdate(Sender: TObject);
begin
  inherited;
  //Отображать кнопку "Исправить", если выбран фильр "С ошибками"
  actCorrect.Visible := ( cmbxViewMode.ItemIndex = 2 );
  actCorrect.Enabled := ( grdDataDBBandedTableView.Controller.SelectedRowCount > 0 );
end;

procedure TCDeclBaseGridForm.actCorrectExecute(Sender: TObject);
begin
  inherited;
  with grdDataDBBandedTableView.Controller do
  if
     ( ( SelectedRowCount = 1) and
       ( ConfirmDlg(Format('Исправить документ?', []), '') = mrYes) )
       or
     ( ( SelectedRowCount > 1) and
       ( ConfirmDlg(Format('Исправить %d документа(ов)?', [SelectedRowCount]), '') = mrYes) )  then
  begin
      try
        IterateRecords(DoFixDecl, True, True);
        RefreshData;
      except
        dsData.Session.Rollback;
        raise;
      end;
  end;
end;



initialization
    RegisterClass(TCDeclBaseGridForm);

end.
