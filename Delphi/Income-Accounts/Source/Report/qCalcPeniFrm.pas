unit qCalcPeniFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBEdit, dxmdaset, FDCCustomDataset, fdcQuery, ORACLE,
  xlcClasses, xlEngine, xlReport, cxLabel, ExtCtrls;

type
  TqCalcPeniForm = class(TfdcCustomDlgForm)
    grdResultDBTableView1: TcxGridDBTableView;
    grdResultLevel1: TcxGridLevel;
    grdResult: TcxGrid;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtSumma: TcxDBTextEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    dsIn: TdxMemData;
    dsInSumma: TFloatField;
    dsOut: TdxMemData;
    srcIn: TDataSource;
    srcOut: TDataSource;
    dsRates: TfdcQuery;
    dsInDate_To: TDateField;
    dsInDate_From: TDateField;
    dsOutBegin_Date: TDateField;
    dsOutEnd_Date: TDateField;
    dsOutRate: TFloatField;
    dsOutDay_Count: TIntegerField;
    xlrCalcPeni: TxlReport;
    dsOutPeriod: TStringField;
    dsInPeriod: TStringField;
    grdResultDBTableView1Column1: TcxGridDBColumn;
    grdResultDBTableView1Column2: TcxGridDBColumn;
    grdResultDBTableView1Column3: TcxGridDBColumn;
    grdResultDBTableView1Column4: TcxGridDBColumn;
    dsOutNo: TIntegerField;
    dsInTotal: TFloatField;
    dsOutSumma: TFloatField;
    btnCalc: TcxButton;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxLayoutControl1Item7: TdxLayoutItem;
    Bevel1: TBevel;
    edtTotal: TcxDBTextEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    dsCheck: TfdcQuery;
    procedure actOkExecute(Sender: TObject);
    procedure CalcPeni;
    procedure FormDestroy(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
  private
  public
  end;

  function ExecReport(Session : TOracleSession): boolean;

implementation

{$R *.dfm}

uses
  DateUtils,
  qReportUtil;

const
  cVal = 300;  


function ExecReport(Session : TOracleSession): boolean;
var
  f : TqCalcPeniForm;
begin
  f := TqCalcPeniForm.Create(nil);
  with f do
  try
    // --- init dxMemData
    dsIn.Open;
    dsIn.Insert;
    dsOut.Open;
    dsInDate_From.Value := Trunc(Now);
    dsInDate_To.Value := dsInDate_From.Value;
    // --- init session
    dsRates.Session := Session;
    dsCheck.Session := Session;
    xlrCalcPeni.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                               ExtractFileName(xlrCalcPeni.XLSTemplate);
    LoadReportQueryEx(f, xlrCalcPeni.XLSTemplate);                                
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;


procedure TqCalcPeniForm.CalcPeni;
var
  isBegin : boolean;
  i : integer;
begin
  // проверки параметров
  if dsInSumma.IsNull then
    raise exception.Create('Необходимо ввести сумму');
  CmpDate(dsInDate_From, dsInDate_To);
  dsCheck.Open;
  try
    if dsCheck.IsEmpty then
      raise exception.Create('В заданном периоде не определена ставка ЦБ');
  finally
    dsCheck.Close;
  end;

  dsInPeriod.Value := dsInDate_From.AsString + ' - ' + dsInDate_To.AsString;
  while not dsOut.IsEmpty do
    dsOut.Delete;
  dsRates.Open;
  isBegin := True;
  dsInTotal.Value := 0;
  i := 1;  
  while not dsRates.Eof do
  begin
    dsOut.Append;
    if isBegin then
      dsOutBegin_Date.AsDateTime := dsInDate_From.AsDateTime
    else
      dsOutBegin_Date.AsDateTime := dsRates.FieldByName('Rate_Date').AsDateTime;
    dsOutRate.AsFloat := dsRates.FieldByName('Refinancing_Rate').AsFloat / 100;
    dsRates.Next;
    if dsRates.Eof then
      dsOutEnd_Date.AsDateTime := dsInDate_To.AsDateTime
    else
      dsOutEnd_Date.AsDateTime := dsRates.FieldByName('Rate_Date').AsDateTime-1;
    dsOutDay_Count.AsInteger := DaysBetween(dsOutBegin_Date.AsDateTime, dsOutEnd_Date.AsDateTime)+1;
    dsOutSumma.Value := dsOutDay_Count.Value * dsOutRate.Value * dsInSumma.Value / cVal;
    dsOutPeriod.Value := dsOutBegin_Date.AsString + ' - ' + dsOutEnd_Date.AsString;
//    dsInTotal.AsFloat := dsInTotal.AsFloat + Round(dsOutSumma.AsFloat * 100) / 100;
    // прибавляем дробные числа с максимальной точностью
    dsInTotal.AsFloat := dsInTotal.AsFloat + dsOutSumma.AsFloat;
    dsOutNo.AsInteger := i;
    dsOut.Post;
    isBegin := False;
    Inc(i);
  end;
  // округляем до сотых
  dsInTotal.AsFloat := Round(dsInTotal.AsFloat * 100) / 100; 
  dsRates.Close;
end;


procedure TqCalcPeniForm.actOkExecute(Sender: TObject);
begin
  ModalResult := mrNone;
  dsIn.UpdateRecord;
  CalcPeni;
  xlrCalcPeni.Report(True);
  ModalResult := mrOk;
end;


procedure TqCalcPeniForm.FormDestroy(Sender: TObject);
begin
  inherited;
  dsOut.Close;
  dsIn.Close;
end;


procedure TqCalcPeniForm.btnCalcClick(Sender: TObject);
begin
  CalcPeni;
end;


end.
