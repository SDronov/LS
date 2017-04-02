unit TempModeChangeGoodsSelectionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  FDCCustomDataset, fdcQuery, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls, cxButtons,
  QueryList;

type
  TTempModeChangeGoodsSelectionForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    grdGoods: TcxGrid;
    grdGoodsDBTableView1: TcxGridDBTableView;
    grdGoodsLevel1: TcxGridLevel;
    srcGoods: TDataSource;
    dsGoods: TfdcQuery;
    dsGoodsGOODS_NAME: TStringField;
    dsGoodsID: TFloatField;
    dsGoodsGOODS_COUNT: TFloatField;
    dsGoodsGOODS_COUNT_SELECTED: TFloatField;
    grdGoodsDBTableView1GOODS_NAME: TcxGridDBColumn;
    grdGoodsDBTableView1GOODS_COUNT: TcxGridDBColumn;
    grdGoodsDBTableView1GOODS_COUNT_SELECTED: TcxGridDBColumn;
    QueryList1: TQueryList;
    dsGoodsNO: TIntegerField;
    dsGoodsGOODS_ID: TFloatField;
    dsGoodsG36: TStringField;
    dsGoodsG37: TStringField;
    sqlPrepareModeChange: TsqlOp;
    sqlAddGoodsModeChange: TsqlOp;
    sqlChangeMode: TsqlOp;
    dsGoodsDECL_ID: TFloatField;
    sqlChangeModeCurrencyId: TsqlOp;
    grdGoodsDBTableView1NO: TcxGridDBColumn;
    sqlExportGoods: TsqlOp;
    sqlGetSubject: TsqlOp;
    procedure actChangeModeExecute(Sender: TObject);
    procedure actExportGoodsExecute(Sender: TObject);
  private
    procedure MakePayments();
  public
    SelSumma : Double;
    SelCurrency : Double;
    SubjectId: integer;
  end;

function PayModeChange(DeclId: double): Boolean;
function ExportGoods(DeclId: double): Boolean;

implementation

uses SelectPOWizardFrm, fdcMessages;

{$R *.dfm}
function PayModeChange(DeclId: double): Boolean;
var
  F: TTempModeChangeGoodsSelectionForm;
begin
  Result := False;
  F := TTempModeChangeGoodsSelectionForm.Create(nil);
  try
    F.grdGoodsDBTableView1GOODS_COUNT_SELECTED.Caption := 'Постоянно ввозимое кол-во';
    F.actOk.OnExecute := F.actChangeModeExecute;
    F.dsGoods.ParamByName('DECL_ID').AsFloat := DeclId;
    F.dsGoods.Open;
    F.SubjectId:= F.sqlGetSubject.Exec('DECL_ID',[DeclId]);
    Result := F.ShowModal = mrOK;
  finally
    F.Free;
  end;
end;

function ExportGoods(DeclId: double): Boolean;
var
  F: TTempModeChangeGoodsSelectionForm;
begin
  Result := False;
  F := TTempModeChangeGoodsSelectionForm.Create(nil);
  try
    F.grdGoodsDBTableView1GOODS_COUNT_SELECTED.Caption := 'Вывозимое количество';
    F.actOk.OnExecute := F.actExportGoodsExecute;
    F.dsGoods.ParamByName('DECL_ID').AsFloat := DeclId;
    F.dsGoods.Open;
    F.SubjectId:= F.sqlGetSubject.Exec('DECL_ID',[DeclId]);
    Result := F.ShowModal = mrOK;
  finally
    F.Free;
  end;
end;

procedure TTempModeChangeGoodsSelectionForm.MakePayments();
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
  SelCurrency := 0;
  with grdGoodsDBTableView1.ViewData,
       grdGoodsDBTableView1.Controller,
       grdGoodsDBTableView1.DataController do begin
    { save current position }
    SavePosition := dsGoods.GetBookmark;
    try
      { get iteration count }
      RecCount := RecordCount;
      { iterate records }
      for i:=0 to RecCount-1 do begin
        { go to the record }
        FocusedRecord := Records[i];
        { execute }
        //**********************************
        sqlAddGoodsModeChange.Exec;
        //**********************************
        { check form destroying }
        if BreakProcess then Break;
      end;
      { return to the saved position }
      dsGoods.GotoBookmark(SavePosition);
    finally
      if not (csDestroying in ComponentState) then
      begin
        { free temporary bookmark }
        dsGoods.FreeBookmark(SavePosition);
      end;
    end;
  end;
end;

procedure TTempModeChangeGoodsSelectionForm.actChangeModeExecute(
  Sender: TObject);
begin
  inherited;
  if(dsGoods.Eof) then
    raise Exception.Create('<<Ошибка выбора товара>>. <<Не выбран товар!>>');
  try
    sqlPrepareModeChange.Exec;
    MakePayments();
    SelSumma := sqlChangeMode.Exec('result', [0.00]);
    SelCurrency := sqlChangeModeCurrencyId.Exec('result', [0.00]);
    if (SelSumma > 0) then begin
      if ShowPaymentWizard(SelSumma, SelCurrency, True,0,SubjectId) then begin
        QueryList1.Session.Commit;
      end else
        QueryList1.Session.Rollback;
    end else begin
      InfoDlg('Сумма уплаченных платежей превышает или равна сумме начислений.');
      QueryList1.Session.Rollback;
    end;
  except
    QueryList1.Session.Rollback;
    raise;
  end;
  ModalResult := mrOK;
end;

procedure TTempModeChangeGoodsSelectionForm.actExportGoodsExecute(
  Sender: TObject);
begin
  inherited;
  if(dsGoods.Eof) then
    raise Exception.Create('<<Ошибка выбора товара>>. <<Не выбран товар!>>');
  try
    sqlPrepareModeChange.Exec;
    MakePayments;
    sqlExportGoods.Exec;
    QueryList1.Session.Commit;
  except
    QueryList1.Session.Rollback;
    raise;
  end;
  ModalResult := mrOK;
end;

end.
