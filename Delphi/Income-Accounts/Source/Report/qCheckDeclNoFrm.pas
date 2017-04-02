unit qCheckDeclNoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, DB, OracleData,
  xlcClasses, xlEngine, xlReport, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle,
  ComObj, Excel2000;

type
  TqCheckDeclNoForm = class(TfdcCustomDlgForm)
    edtCC: TcxTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtbDate: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtEDate: TcxDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtMinNo: TcxMaskEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edtMaxNo: TcxMaskEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    xlReport: TxlReport;
    dsData: TOracleDataSet;
    dsDetail: TOracleDataSet;
    procedure dsDataBeforeQuery(Sender: TOracleDataSet);
    procedure xlReportBeforeBuild(Report: TxlReport);
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dsDetailBeforeQuery(Sender: TOracleDataSet);
  private
    { Private declarations }
    procedure ReportDeclNoExec;
  public
    { Public declarations }
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation

uses
  fdcUtils, DateUtils, MainDM;

{$R *.dfm}

function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TqCheckDeclNoForm;
begin
  F := TqCheckDeclNoForm.Create(nil);
  try
    F.dsData.Session := Session;
    F.dsDetail.Session:= Session;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TqCheckDeclNoForm.dsDataBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('FDATE', edtbDate.EditValue);
  Sender.SetVariable('EDATE', edtEDate.EditValue);
  Sender.SetVariable('CUSTOMS_CODE', edtCC.EditValue);
  Sender.SetVariable('MINNO', edtMinNo.EditValue);
  Sender.SetVariable('MAXNO', edtMaxNo.EditValue);
end;

procedure TqCheckDeclNoForm.xlReportBeforeBuild(Report: TxlReport);
begin
  inherited;
  Report.ParamByName['BDATE'].Value := edtbDate.EditValue;
  Report.ParamByName['EDATE'].Value := edtEDate.EditValue;
end;

procedure TqCheckDeclNoForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport.XLSTemplate;
  edtbDate.Date := StartOfTheYear(Date);
  edtEDate.Date := Date;
end;

procedure TqCheckDeclNoForm.actOkExecute(Sender: TObject);
begin
//  inherited;
  DisplayBusyCursor;
  dsData.Close;
  dsDetail.Close;
  dsData.Open;
  dsDetail.Open;

  MainData.RegisterEvent('REP','00012');

  xlReport.Report(True);
{
  ReportDeclNoExec;
}
  ModalResult := mrOk;
end;

procedure TqCheckDeclNoForm.dsDetailBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('FDATE', edtbDate.EditValue);
  Sender.SetVariable('EDATE', edtEDate.EditValue);
  Sender.SetVariable('MINNO', edtMinNo.EditValue);
  Sender.SetVariable('MAXNO', edtMaxNo.EditValue);
end;

procedure TqCheckDeclNoForm.ReportDeclNoExec;
type
  TDataCells = Record
    iRow: Integer;
    iCol: Integer;
    iRn : Integer;
  end;
var
  ExcelApp, Workbook, Range, Cell1, Cell2: Variant;
  n: Integer;
  vFind: OleVariant;
  i: Integer;
  st: String;
  DataCells: array[1..4] of TDataCells;
begin
// Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');

// Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;

 //  заполняем шаблон
  Workbook := ExcelApp.WorkBooks.Add(xlReport.XLSTemplate);

// Создаем Вариантный Массив, который заполним выходными данными
//  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);

  WorkBook.WorkSheets[1].Cells[2,1].Value := '';
  WorkBook.WorkSheets[1].Cells[9,1].Value := '';

  n := 0;

  vFind := WorkBook.WorkSheets[1].Cells;

  // найти и заменить период
  vFind := vFind.Find('XLRPARAMS_BDate');
  if Pointer(IDispatch(vFind))<>nil then
    WorkBook.WorkSheets[1].Cells[vFind.Row, vFind.Column].Value := edtbDate.EditValue;
  vFind := vFind.Find('XLRPARAMS_EDate');
  if Pointer(IDispatch(vFind))<>nil then
    WorkBook.WorkSheets[1].Cells[vFind.Row, vFind.Column].Value := DateToStr(edtEDate.EditValue);

    // определить столбцы и начальные строки для вывода данных
  for i := 1 to 4 do
  begin
    Case i of
      1: st := 'dsData_C_C';
      2: st := 'dsData_M_N';
      3: st := 'dsData_M_X';
      4: st := 'dsDetail_DECL_NO';
    end;

    vFind := vFind.Find(st);
    DataCells[i].iRow := vFind.Row;
    DataCells[i].iCol := vFind.Column;
    // количетво объедененных ячеек
    DataCells[i].iRn  :=
      WorkBook.WorkSheets[1].Cells[DataCells[i].iRow, DataCells[i].iCol].MergeArea.Columns.Count - 1;

    WorkBook.WorkSheets[1].Cells[DataCells[i].iRow, DataCells[i].iCol].Value := '';  // очистить
  end;

    dsData.First;
    while not dsData.Eof do
    begin
      for i := 1 to 3 do
      begin
        with DataCells[i] do
        begin
             // Формат ячеек
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].NumberFormat := '';
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].Font.Size := 9;
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].Font.Bold := True;
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].HorizontalAlignment := xlCenter;
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].VerticalAlignment := xlTop;

             // Объеденение ячеек
          if n > 0 then
          begin
            Cell1 := WorkBook.WorkSheets[1].Cells[iRow + n, iCol];
            Cell2 := WorkBook.WorkSheets[1].Cells[iRow + n, iCol + iRn - 1];
            Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
            Range.Merge;
          end;
        end;
      end;

         // Вывод значений
      WorkBook.WorkSheets[1].Cells[DataCells[1].iRow + n, DataCells[1].iCol].Value := dsData.FieldByName('C_C').AsString;
      WorkBook.WorkSheets[1].Cells[DataCells[2].iRow + n, DataCells[2].iCol].Value := dsData.FieldByName('M_N').AsString;
      WorkBook.WorkSheets[1].Cells[DataCells[3].iRow + n, DataCells[3].iCol].Value := dsData.FieldByName('M_X').AsString;

      dsDetail.First;
      while not dsDetail.Eof do
      begin
        With DataCells[4] do
        begin
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].NumberFormat := '';
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].Font.Size := 9;
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].Font.Bold := True;
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].HorizontalAlignment := xlRight;
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].VerticalAlignment := xlTop;
          WorkBook.WorkSheets[1].Cells[iRow + n, iCol].Value := dsDetail.FieldByName('DECL_NO').AsString;
        end;
        n := n + 1;
        dsDetail.Next;
      end;

      n := n + 2;  // пропустить одну строку

      dsData.Next;
    end;

// Делаем Excel видимым
  ExcelApp.Visible := true;
end;

end.
