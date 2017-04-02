unit SelectAdviceReserveForDecFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  FDCCustomDataset, fdcQuery, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxCurrencyEdit, QueryList;

type
  TSelectAdviceReserveForDecForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    grdReserve: TcxGrid;
    grdReserveDBTableView1: TcxGridDBTableView;
    grdReserveLevel1: TcxGridLevel;
    dsReserve: TfdcQuery;
    srcReserve: TDataSource;
    dsReservePAYMENT_ID: TFloatField;
    dsReserveNAME: TStringField;
    dsReserveKBK: TStringField;
    dsReservePO_SYSNAME: TStringField;
    dsReserveAVAIL_SUMMA: TFloatField;
    grdReserveDBTableView1PAYMENT_ID: TcxGridDBColumn;
    grdReserveDBTableView1NAME: TcxGridDBColumn;
    grdReserveDBTableView1KBK: TcxGridDBColumn;
    grdReserveDBTableView1PO_SYSNAME: TcxGridDBColumn;
    grdReserveDBTableView1AVAIL_SUMMA: TcxGridDBColumn;
    grdReserveDBTableView1SUMMA: TcxGridDBColumn;
    QueryList1: TQueryList;
    sqlPrepareReserveList: TsqlOp;
    sqlAddReserveRecord: TsqlOp;
    dsReserveSUMMA: TFloatField;
    dsReservepk_col: TStringField;
    procedure actOkExecute(Sender: TObject);
    procedure grdReserveDBTableView1SUMMAPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actOkUpdate(Sender: TObject);
  private
    procedure SetReserveList();
  public
    SelSumma : Double;
    SelPayment : Double;
  end;

  function SelectAdviceReserveForDec(AdviceId: double; IsTS: string): Boolean;

implementation

uses MainDm;

{$R *.dfm}

function SelectAdviceReserveForDec(AdviceId: double; IsTS: string): Boolean;
var
  F: TSelectAdviceReserveForDecForm;
begin
  Result := False;
  F := TSelectAdviceReserveForDecForm.Create(nil);
  try
    F.sqlPrepareReserveList.Exec( 'ADVICE_ID', [AdviceId] );
    F.dsReserve.ParamByName( 'ADVICE_ID' ).AsFloat := AdviceId;
    F.dsReserve.ParamByName( 'IS_TS' ).AsString := IsTS;
    F.dsReserve.Open;
    Result := F.ShowModal = mrOK;
  finally
    F.Free;
  end;
end;

procedure TSelectAdviceReserveForDecForm.SetReserveList();
var
  i: integer;
  SavePosition: TBookmark;
  BreakProcess: boolean;
  ProgressDescr: string;
  RecCount: integer;
begin
  BreakProcess := False;
  ProgressDescr := '';
  SelSumma := 0;
  SelPayment := 0;
  with grdReserveDBTableView1.ViewData,
       grdReserveDBTableView1.Controller,
       grdReserveDBTableView1.DataController do begin
    { save current position }
    SavePosition := dsReserve.GetBookmark;
    try
      { get iteration count }
      RecCount := RecordCount;
      { iterate records }
      for i:=0 to RecCount-1 do begin
        { go to the record }
        FocusedRecord := Records[i];
        { execute }
        //**********************************
        sqlAddReserveRecord.Exec;
        //**********************************
        { check form destroying }
        if BreakProcess then Break;
      end;
      { return to the saved position }
      dsReserve.GotoBookmark(SavePosition);
    finally
      if not (csDestroying in ComponentState) then
      begin
        { free temporary bookmark }
        dsReserve.FreeBookmark(SavePosition);
      end;
    end;
  end;
end;

procedure TSelectAdviceReserveForDecForm.actOkExecute(Sender: TObject);
begin
  inherited;
  if(dsReserve.Eof) then
    raise Exception.Create('<<Ошибка при выборе сумм остатков по уведомлению>>. <<Суммы остатков по уведомлению отсутствуют!>>');
  try
    SetReserveList;
  except
    raise;
  end;
  ModalResult := mrOk;
end;

procedure TSelectAdviceReserveForDecForm.grdReserveDBTableView1SUMMAPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  lv_Summa : Double;
begin
  inherited;
  lv_Summa := DisplayValue;
  if lv_Summa > dsReserve.FieldByName('AVAIL_SUMMA').AsFloat then
    DisplayValue := dsReserve.FieldByName('AVAIL_SUMMA').AsFloat;
  if lv_Summa < 0 then
    DisplayValue := 0;
end;

procedure TSelectAdviceReserveForDecForm.actOkUpdate(Sender: TObject);
begin
  inherited;
  actOk.Enabled := grdReserveDBTableView1.DataController.Summary.FooterSummaryValues[1] > 0;

end;

end.
