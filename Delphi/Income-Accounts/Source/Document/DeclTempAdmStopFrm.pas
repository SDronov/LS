unit DeclTempAdmStopFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit, cxMemo, DB, dxmdaset,
  QueryList, cxGraphics, OracleData, cxGroupBox, cxRadioGroup,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxCurrencyEdit, cxCalc, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TDeclTempAdmStopForm = class(TfdcCustomSimpleDlgForm)
    edtDateBegin: TcxDBDateEdit;
    lciDate: TdxLayoutItem;
    QueryList1: TQueryList;
    dsData: TdxMemData;
    srcData: TDataSource;
    dsDataDate_begin: TDateField;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDateEnd: TcxDBDateEdit;
    rgTovar: TcxRadioGroup;
    dxLayoutControl1Item3: TdxLayoutItem;
    odsGetMode: TOracleDataSet;
    odsGetModeID: TFloatField;
    odsGetModeNAME: TStringField;
    odsGetModeCODE: TStringField;
    dsGetMode: TDataSource;
    edtMode: TcxDBLookupComboBox;
    dxLayoutControl1Item4: TdxLayoutItem;
    odsSetGoodsCharge: TOracleDataSet;
    dsSetGoodsCharge: TDataSource;
    odsSetGoodsChargePAY_TYPE_ID: TFloatField;
    odsSetGoodsChargePAY_TYPE_CODE: TStringField;
    odsSetGoodsChargeSUMMA: TFloatField;
    odsSetGoodsChargeNEW_SUMMA: TFloatField;
    sqlAddGoodsCharge: TsqlOp;
    odsSetGoodsChargeDECL_GOODS_ID: TFloatField;
    odsSetGoodsChargePAY_MODE_ID: TFloatField;
    odsSetGoodsChargeCURRENCY_ID: TFloatField;
    dsDataDate_end: TDateField;
    dsDatapay_mode_id: TIntegerField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxGrid1DBTableView1PAY_TYPE_ID: TcxGridDBColumn;
    cxGrid1DBTableView1PAY_TYPE_CODE: TcxGridDBColumn;
    cxGrid1DBTableView1DECL_GOODS_ID: TcxGridDBColumn;
    cxGrid1DBTableView1PAY_MODE_ID: TcxGridDBColumn;
    cxGrid1DBTableView1CURRENCY_ID: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1NEW_SUMMA: TcxGridDBColumn;
    odsSetGoodsChargeGOODS_CODE: TStringField;
    odsSetGoodsChargeGOODS_NAME: TStringField;
    cxGrid1DBTableView1GOODS_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1GOODS_CODE: TcxGridDBColumn;
    sqlGetExportDate: TsqlOp;
    sqlCheckSumma: TsqlOp;
    GridPopupMenu: TcxGridPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure rgTovarPropertiesEditValueChanged(Sender: TObject);
    procedure odsSetGoodsChargeApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
  private
    vExportDate :TDateTime;
    vDeclId     :Double;
  public
  end;

  function StopTempAdm(DeclId : Double): Boolean;

implementation

{$R *.dfm}

function StopTempAdm(DeclId : Double): Boolean;
var
  F : TDeclTempAdmStopForm;
begin
  Result := False;
  F := TDeclTempAdmStopForm.Create(nil);
  F.vDeclId     :=  DeclId;
  F.odsSetGoodsCharge.SetVariable('pDeclId',DeclId);
  F.odsSetGoodsCharge.Open;
  F.sqlGetExportDate.ParamValues['pDate'] := StrToDate('06.10.1978');
  F.sqlGetExportDate.Exec('pDeclId',DeclId);
  F.vExportDate :=  F.sqlGetExportDate.ParamValues['pDate'];

  try
    F.Caption := 'Приостановление таможенной процедуры/Выбытие товаров';
    if F.ShowModal = mrOk then
    try
    F.sqlAddGoodsCharge.QueryList.Session.Commit;
    Result := True;
    except
        F.sqlAddGoodsCharge.QueryList.Session.Rollback;
        raise;
    end;
  finally
    F.Free;
  end;
end;


procedure TDeclTempAdmStopForm.FormCreate(Sender: TObject);
begin
  inherited;
  odsGetMode.Open;
  dsData.Open;
  dsData.Edit;
  dsDataDate_Begin.Value := Now;
end;

procedure TDeclTempAdmStopForm.actOkExecute(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  try
     if odsSetGoodsChargeNEW_SUMMA.Value < 0 then
      Begin
       MessageDlg('Сумма приостановления должна быть больше 0.', mtInformation, [mbOk], 0);
       odsSetGoodsChargeNEW_SUMMA.Value := 0;
       ModalResult := mrNone;
       exit;
      end;
   if odsSetGoodsChargeNEW_SUMMA.Value > odsSetGoodsChargeSUMMA.Value then
      Begin
       MessageDlg('Сумма приостановления не может быть больше суммы товара.', mtInformation, [mbOk], 0);
       odsSetGoodsChargeNEW_SUMMA.Value := odsSetGoodsChargeSUMMA.Value;
       ModalResult := mrNone;
       exit;
      end;

    if odsSetGoodsCharge.State = dsEdit then odsSetGoodsCharge.Post;

    if dsDatapay_mode_id.Value = 0 then
      begin
       MessageDlg('Не заполнен режим.', mtInformation, [mbOk], 0);
       ModalResult := mrNone;
       exit;
      end;
    if dsDataDate_end.Value = 0 then
      begin
       MessageDlg('Не заполнене дата окончания режима приостановления.', mtInformation, [mbOk], 0);
       ModalResult := mrNone;
       exit;
      end;
    if dsDataDate_end.AsDateTime < dsDataDate_begin.AsDateTime then
      begin
       MessageDlg('Дата окончания режима приостановления не может быть меньше даты начала.', mtInformation, [mbOk], 0);
       ModalResult := mrNone;
       exit;
      end;
    if dsDataDate_begin.AsDateTime < trunc(now) then
      begin
       MessageDlg('Дата начала режима приостановления не может быть меньше текущей даты.', mtInformation, [mbOk], 0);
       dsDataDate_begin.Value := trunc(now);
       ModalResult := mrNone;
       exit;
      end;
    if dsDataDate_end.AsDateTime > vExportDate then
      begin
       MessageDlg('Дата окончания режима приостановления не может быть больше даты выпуска.', mtInformation, [mbOk], 0);
       ModalResult := mrNone;
       exit;
      end;

    odsSetGoodsCharge.First;
    for i := 0 to odsSetGoodsCharge.RecordCount - 1 do
      begin
         try
            if rgTovar.ItemIndex = 0 then
               sqlCheckSumma.ParamValues['psumma']      :=  odsSetGoodsCharge.FieldValues['new_summa']
            else
               sqlCheckSumma.ParamValues['psumma']      :=  odsSetGoodsCharge.FieldValues['summa'];
           sqlCheckSumma.Exec('pPayTypeId;pDeclId;pdatebegin;pdateend',[odsSetGoodsChargePAY_TYPE_ID.Value,vDeclId,dsDataDate_begin.Value,dsDataDate_end.Value]);
         except
           odsSetGoodsCharge.Edit;
           odsSetGoodsChargeNEW_SUMMA.Value := 0;
           raise;
         end;
         sqlAddGoodsCharge.ParamValues['date_begin']    := dsData.FieldValues['date_begin'];
         sqlAddGoodsCharge.ParamValues['date_end']      := dsData.FieldValues['date_end'];
         sqlAddGoodsCharge.ParamValues['mode_id']       := dsData.FieldValues['mode_id'];
         //sqlAddGoodsCharge.ParamValues['pay_mode_id']   := odsSetGoodsCharge.FieldValues['pay_mode_id'];
         sqlAddGoodsCharge.ParamValues['decl_goods_id'] := odsSetGoodsCharge.FieldValues['decl_goods_id'];
         sqlAddGoodsCharge.ParamValues['pay_type_id']   := odsSetGoodsCharge.FieldValues['pay_type_id'];
         sqlAddGoodsCharge.ParamValues['currency_id']   := odsSetGoodsCharge.FieldValues['currency_id'];
         if rgTovar.ItemIndex = 0 then
            sqlAddGoodsCharge.ParamValues['summa']      :=  odsSetGoodsCharge.FieldValues['new_summa']
         else
            sqlAddGoodsCharge.ParamValues['summa']      :=  odsSetGoodsCharge.FieldValues['summa'];
         sqlAddGoodsCharge.Exec;
         odsSetGoodsCharge.Next;
      end;
  except
    ModalResult := mrNone;
    sqlAddGoodsCharge.QueryList.Session.Rollback;
    raise;
  end;
end;

procedure TDeclTempAdmStopForm.rgTovarPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
    dxLayoutControl1Item5.Enabled :=   (rgTovar.ItemIndex = 0);
    TcxGridTableView(cxGrid1.ActiveView).ViewData.Collapse(not dxLayoutControl1Item5.Enabled);

end;

procedure TDeclTempAdmStopForm.odsSetGoodsChargeApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  inherited;
     Applied := True;
end;

end.
