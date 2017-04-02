unit DeclTempAdmProlongFrm;

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
  TDeclTempAdmProlongForm = class(TfdcCustomSimpleDlgForm)
    dsData: TdxMemData;
    srcData: TDataSource;
    odsSetGoodsCharge: TOracleDataSet;
    dsSetGoodsCharge: TDataSource;
    odsSetGoodsChargePAY_TYPE_ID: TFloatField;
    odsSetGoodsChargePAY_TYPE_CODE: TStringField;
    odsSetGoodsChargeSUMMA: TFloatField;
    odsSetGoodsChargeNEW_SUMMA: TFloatField;
    odsSetGoodsChargeDECL_GOODS_ID: TFloatField;
    odsSetGoodsChargePAY_MODE_ID: TFloatField;
    odsSetGoodsChargeCURRENCY_ID: TFloatField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxGrid1DBTableView1PAY_TYPE_ID: TcxGridDBColumn;
    cxGrid1DBTableView1PAY_TYPE_CODE: TcxGridDBColumn;
    cxGrid1DBTableView1DECL_GOODS_ID: TcxGridDBColumn;
    cxGrid1DBTableView1PAY_MODE_ID: TcxGridDBColumn;
    cxGrid1DBTableView1CURRENCY_ID: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1NEW_SUMMA: TcxGridDBColumn;
    QueryList1: TQueryList;
    sqlAddGoodsCharge: TsqlOp;
    odsSetGoodsChargeGOODS_CODE: TStringField;
    odsSetGoodsChargeGOODS_NAME: TStringField;
    cxGrid1DBTableView1GOODS_CODE: TcxGridDBColumn;
    cxGrid1DBTableView1GOODS_NAME: TcxGridDBColumn;
    odsSetGoodsChargeDATE_BEGIN: TDateTimeField;
    odsSetGoodsChargeDATE_END: TDateTimeField;
    cxGrid1DBTableView1DATE_BEGIN: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
    odsSetGoodsChargeDATE_END_NEW: TDateTimeField;
    cxGrid1DBTableView1DATE_END_NEW: TcxGridDBColumn;
    sqlGetExportDate: TsqlOp;
    sqlSetExportDate: TsqlOp;
    sqlGetMaxSumma: TsqlOp;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDateBegin: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtDateEnd: TcxDBDateEdit;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dsDataDATE_BEGIN: TDateField;
    dsDataDATE_END: TDateField;
    cxButton1: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    sqlGetPeriodPrologn: TsqlOp;
    sqlSetPeriodPrologn: TsqlOp;
    cxGrid1DBTableView2: TcxGridDBTableView;
    odsGetPeriodProlong: TOracleDataSet;
    dsGetPeriodProlong: TDataSource;
    odsGetPeriodProlongDECL_ID: TFloatField;
    odsGetPeriodProlongDATE_BEGIN: TDateTimeField;
    odsGetPeriodProlongDATE_END: TDateTimeField;
    odsGetPeriodProlongID: TFloatField;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2DECL_ID: TcxGridDBColumn;
    cxGrid1DBTableView2DATE_BEGIN: TcxGridDBColumn;
    cxGrid1DBTableView2DATE_END: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Level2: TcxGridLevel;
    odsSetGoodsChargePROLONG_ID: TFloatField;
    cxGrid1DBTableView1PROLONG_ID: TcxGridDBColumn;
    dsDataprolong_id: TIntegerField;
    odsSetGoodsChargeROWNUM: TFloatField;
    cxGrid1DBTableView1ROWNUM: TcxGridDBColumn;
    GridPopupMenu: TcxGridPopupMenu;
    sqlSetTaxExemtion: TsqlOp;
    procedure actOkExecute(Sender: TObject);
    procedure odsSetGoodsChargeApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure odsSetGoodsChargeAfterPost(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
    procedure odsSetGoodsChargeAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure odsSetGoodsChargeAfterScroll(DataSet: TDataSet);
    procedure actCancelExecute(Sender: TObject);
  private
    vExportDate :TDateTime;
    vDeclId     :Double;
  public
  end;

  function ProlongTempAdm(DeclId : Double): Boolean;

implementation

{$R *.dfm}

function ProlongTempAdm(DeclId : Double): Boolean;
var
  F : TDeclTempAdmProlongForm;
begin
  Result := False;
  F := TDeclTempAdmProlongForm.Create(nil);
  F.vDeclId     :=  DeclId;

  F.sqlGetExportDate.Exec('pDeclId',DeclId);
  F.vExportDate :=  StrToDate(F.sqlGetExportDate.ParamValues['pDate']);

  F.sqlGetPeriodPrologn.ParamValues['date_begin']:=now;
  F.sqlGetPeriodPrologn.ParamValues['date_end']  :=now;
  F.sqlGetPeriodPrologn.Exec('pDeclId',DeclId);

  F.odsGetPeriodProlong.SetVariable('pDeclId',DeclId);
  F.odsGetPeriodProlong.Open;
  if  F.odsGetPeriodProlong.RecordCount = 1 then
  begin
    F.dsData.FieldByName('date_begin').Value := F.sqlGetPeriodPrologn.ParamValues['date_end']+1;
    F.dsData.FieldByName('date_end').Value   := Null;
    F.dsData.FieldByName('prolong_id').Value := Null;
  end
  else
  begin
    F.dsData.FieldByName('date_begin').Value := F.sqlGetPeriodPrologn.ParamValues['date_begin'];
    F.dsData.FieldByName('date_end').Value   := F.sqlGetPeriodPrologn.ParamValues['date_end'];
    F.dsData.FieldByName('prolong_id').Value := F.sqlGetPeriodPrologn.ParamValues['prolong_id'];
  end;
  F.odsSetGoodsCharge.SetVariable('pDeclId',DeclId);
  F.odsSetGoodsCharge.Open;
  try
    F.Caption := 'Продление срока временного ввоза';
    if F.ShowModal = mrOk then
    try
    F.sqlSetTaxExemtion.Exec('ID',DeclId);
    F.odsSetGoodsCharge.Session.Commit;
    Result := True;
    except
        F.odsGetPeriodProlong.Session.Rollback;
        raise;
    end;
  finally
    F.odsSetGoodsCharge.Close;
    F.odsGetPeriodProlong.Close;
    F.Free;
  end;
end;




procedure TDeclTempAdmProlongForm.actOkExecute(Sender: TObject);
var
  I : Integer;
  isEdit : boolean;
begin
  inherited;
  try
      if odsSetGoodsCharge.State <> dsBrowse then odsSetGoodsCharge.Post;
      isEdit := False;
      odsSetGoodsCharge.First;
      for i := 0 to odsSetGoodsCharge.RecordCount - 1 do
      begin
         if (odsSetGoodsCharge.FieldByName('new_summa').AsFloat <> 0) and not isEdit then
            isEdit := true;
         sqlAddGoodsCharge.ParamValues['date_begin']    := dsData.FieldValues['date_begin'];
         sqlAddGoodsCharge.ParamValues['date_end']      := dsData.FieldValues['date_end'];
         sqlAddGoodsCharge.ParamValues['decl_goods_id'] := odsSetGoodsCharge.FieldValues['decl_goods_id'];
         sqlAddGoodsCharge.ParamValues['pay_type_id']   := odsSetGoodsCharge.FieldValues['pay_type_id'];
         sqlAddGoodsCharge.ParamValues['currency_id']   := odsSetGoodsCharge.FieldValues['currency_id'];
         sqlAddGoodsCharge.ParamValues['summa']         := odsSetGoodsCharge.FieldValues['new_summa'];
         sqlAddGoodsCharge.ParamValues['prolong_id']    := dsData.FieldValues['prolong_id'];
         sqlAddGoodsCharge.Exec;
         odsSetGoodsCharge.Next;
      end;
    If not isEdit Then
    begin
       MessageDlg('Период не будет сохранен. Суммы не введены.', mtInformation, [mbOk], 0);
       ModalResult := mrNone;
    end;
  except
    ModalResult := mrNone;
    sqlAddGoodsCharge.QueryList.Session.Rollback;
    raise;
  end;
end;

procedure TDeclTempAdmProlongForm.odsSetGoodsChargeApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  inherited;
    Applied := True;
end;

procedure TDeclTempAdmProlongForm.odsSetGoodsChargeAfterPost(
  DataSet: TDataSet);
var vMaxSum :Real;
begin
     if odsSetGoodsChargeNEW_SUMMA.Value < 0 then
      Begin
       MessageDlg('Сумма продления не может быть меньше 0', mtInformation, [mbOk], 0);
       odsSetGoodsCharge.Edit;
       odsSetGoodsChargeNEW_SUMMA.Value := 0;
       odsSetGoodsCharge.Post;
      end;

     sqlGetMaxSumma.ParamValues['pSum'] := 0.0;
     sqlGetMaxSumma.Exec('pPayTypeId;pDeclId;pdatebegin;pdateend',[odsSetGoodsChargePAY_TYPE_ID.Value,vDeclId,odsSetGoodsChargeDATE_END.Value,dsData.FieldByName('date_end').Value]);
     vMaxSum := sqlGetMaxSumma.ParamValues['pSum'];
     if odsSetGoodsChargeNEW_SUMMA.Value > vMaxSum then
      Begin
       MessageDlg('Сумма продления не может быть больше доступной суммы ('+FloatToStr(vMaxSum)+')', mtInformation, [mbOk], 0);
       odsSetGoodsCharge.Edit;
       odsSetGoodsChargeNEW_SUMMA.Value := vMaxSum;
       odsSetGoodsCharge.Post;
      end;

end;

procedure TDeclTempAdmProlongForm.cxButton1Click(Sender: TObject);
begin
   if cxButton1.Caption = 'изменить' then
   begin
     if dsData.FieldByName('date_end').Value <> null then
       dsData.FieldByName('date_begin').AsDateTime := dsData.FieldByName('date_end').AsDateTime+1;
     dsData.FieldByName('date_end').Value    := null;
     dsData.FieldByName('date_end').ReadOnly := false;
     edtDateEnd.Enabled := True;
     cxButton1.Caption := 'сохранить';
     actOk.Enabled := False;
   end
   else
   begin
     if dsData.FieldByName('date_end').Value = null then
      begin
       MessageDlg('Дата окончания должна быть заполнена.', mtInformation, [mbOk], 0);
       exit;
      end;
     if dsData.FieldByName('date_end').Value <= dsData.FieldByName('date_begin').Value then
      begin
       MessageDlg('Дата окончания должна быть больше даты начала.', mtInformation, [mbOk], 0);
       exit;
      end;
     edtDateEnd.Enabled := False;
     dsData.FieldByName('date_end').ReadOnly := true;
     cxButton1.Caption := 'изменить';

     sqlSetExportDate.Exec('pDeclId;pDate',[vDeclId,dsData.FieldByName('date_end').AsDateTime]);
     vExportDate := dsData.FieldByName('date_end').AsDateTime;

     sqlSetPeriodPrologn.ParamValues['prolong_id'] := 0;
     sqlSetPeriodPrologn.Exec('decl_id;date_begin;date_end',[vDeclId,dsData.FieldByName('date_begin').AsDateTime,dsData.FieldByName('date_end').AsDateTime]);
     dsData.FieldByName('prolong_id').AsInteger := sqlSetPeriodPrologn.ParamValues['prolong_id'];
     odsSetGoodsCharge.Refresh;
     cxButton1.Enabled := False;
     actOk.Enabled := True;
   end;
end;

procedure TDeclTempAdmProlongForm.odsSetGoodsChargeAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
    dxLayoutControl1Item5.Enabled :=   not (dsData.FieldByName('date_end').Value = null);
end;

procedure TDeclTempAdmProlongForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsData.Open;
  dsData.Edit;
  edtDateEnd.Enabled   := False;
  edtDateBegin.Enabled := False;
end;

procedure TDeclTempAdmProlongForm.odsSetGoodsChargeAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
    odsSetGoodsChargeNEW_SUMMA.ReadOnly := (odsSetGoodsChargeDATE_END.AsDateTime <> dsData.FieldByName('date_begin').AsDateTime-1);
end;

procedure TDeclTempAdmProlongForm.actCancelExecute(Sender: TObject);
begin
  inherited;
    sqlSetPeriodPrologn.QueryList.Session.Rollback;
end;

end.
