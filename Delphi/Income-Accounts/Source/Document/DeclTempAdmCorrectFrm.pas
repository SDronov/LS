unit DeclTempAdmCorrectFrm;

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
  TDeclTempAdmCorrectFrm = class(TfdcCustomSimpleDlgForm)
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
    cxGrid1Level1: TcxGridLevel;
    odsSetGoodsChargeMODE_ID: TFloatField;
    odsSetGoodsChargePROLONG_ID: TFloatField;
    sqlCheckSumma: TsqlOp;
    GridPopupMenu: TcxGridPopupMenu;
    odsSetGoodsChargeCHANGE_REASON_ID: TFloatField;
    cxGrid1DBTableView1CHANGE_REASON_ID: TcxGridDBColumn;
    odsGetReason: TOracleDataSet;
    dsReason: TDataSource;
    odsGetReasonID: TFloatField;
    odsGetReasonNAME: TStringField;
    procedure actOkExecute(Sender: TObject);
    procedure odsSetGoodsChargeApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
  private
    vExportDate :TDateTime;
    vDeclId     :Double;
  public
  end;

  function CorrectTempAdm(DeclId : Double): Boolean;

implementation

{$R *.dfm}

function CorrectTempAdm(DeclId : Double): Boolean;
var
  F : TDeclTempAdmCorrectFrm;
begin
  Result := False;
  F := TDeclTempAdmCorrectFrm.Create(nil);
  F.vDeclId     :=  DeclId;
  F.odsGetReason.Open;
  F.odsSetGoodsCharge.SetVariable('pDeclId',DeclId);
  F.odsSetGoodsCharge.Open;
  try
    F.Caption := 'Корректировка таможенной стоимости';
    if F.ShowModal = mrOk then
    try
      F.sqlAddGoodsCharge.QueryList.Session.Commit;
      Result := True;
    except
        F.sqlAddGoodsCharge.QueryList.Session.Rollback;
        raise;
    end;
  finally
    F.odsSetGoodsCharge.Close;
    F.Free;
  end;
end;




procedure TDeclTempAdmCorrectFrm.actOkExecute(Sender: TObject);
var
  I : Integer;
begin
  try
      if odsSetGoodsCharge.State <> dsBrowse then odsSetGoodsCharge.Post;

      odsSetGoodsCharge.First;
      for i := 0 to odsSetGoodsCharge.RecordCount - 1 do
      begin
         try
            sqlCheckSumma.Exec('pPayTypeId;pDeclId;pdatebegin;pdateend;pSumma',[odsSetGoodsChargePAY_TYPE_ID.Value,vDeclId,odsSetGoodsChargeDATE_BEGIN.Value,odsSetGoodsChargeDATE_END.Value,odsSetGoodsCharge.FieldValues['new_summa']]);
         except
           odsSetGoodsCharge.Edit;
           odsSetGoodsChargeNEW_SUMMA.Value := 0;
           raise;
         end;
         sqlAddGoodsCharge.ParamValues['date_begin']      := odsSetGoodsCharge.FieldValues['date_begin'];
         sqlAddGoodsCharge.ParamValues['date_end']        := odsSetGoodsCharge.FieldValues['date_end'];
         //sqlAddGoodsCharge.ParamValues['pay_mode_id']     := odsSetGoodsCharge.FieldValues['pay_mode_id'];
         sqlAddGoodsCharge.ParamValues['decl_goods_id']   := odsSetGoodsCharge.FieldValues['decl_goods_id'];
         sqlAddGoodsCharge.ParamValues['pay_type_id']     := odsSetGoodsCharge.FieldValues['pay_type_id'];
         sqlAddGoodsCharge.ParamValues['currency_id']     := odsSetGoodsCharge.FieldValues['currency_id'];
         sqlAddGoodsCharge.ParamValues['summa']           := odsSetGoodsCharge.FieldValues['new_summa'];
         sqlAddGoodsCharge.ParamValues['mode_id']         := odsSetGoodsCharge.FieldValues['mode_id'];
         sqlAddGoodsCharge.ParamValues['prolong_id']      := odsSetGoodsCharge.FieldValues['prolong_id'];
         sqlAddGoodsCharge.ParamValues['change_reason_id']:= odsSetGoodsCharge.FieldValues['change_reason_id'];

         sqlAddGoodsCharge.Exec;
         odsSetGoodsCharge.Next;
      end;
  except
    ModalResult := mrNone;
    sqlAddGoodsCharge.QueryList.Session.Rollback;
    raise;
  end;
end;

procedure TDeclTempAdmCorrectFrm.odsSetGoodsChargeApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  inherited;
    Applied := True;
end;

end.
