unit EventReportUtil;

interface

uses
  Windows, SysUtils, Variants, Classes, Forms, StdCtrls, ComObj, ActiveX, Dialogs,
  DB, FDCCustomDataset, FDCOracleSession, fdcQuery, Oracle, DateUtils;

procedure EvtRepExec(pDateFrom, pDateTo: TDateTime; pRepType: Integer; vUserStat: Integer);
procedure EvtRepUsersExec(pDateFrom, pDateTo: TDateTime; pTemplateFile: string);
procedure EvtRepCustomsExec(pDateFrom, pDateTo: TDateTime; pTemplateFile: string);
procedure ReadSQL(pDateFrom, pDateTo: TDateTime; pFileName: string);

implementation

uses MainDm;

var
  vCustomName: String;

procedure EvtRepExec(pDateFrom, pDateTo: TDateTime; pRepType: Integer; vUserStat: Integer);
  var
    vFileName, vFileNameSQL: string;
begin
    Case pRepType of
      0: vFileName := 'EventByUser';
      1: vFileName := 'EventByCustom';
    end;

    vFileNameSQL := ExtractFilePath(Application.ExeName)+'Report\'+ ChangeFileExt(ExtractFileName(vFileName), '.sql');
    vFileName    := ExtractFilePath(Application.ExeName)+'Report\'+ ChangeFileExt(ExtractFileName(vFileName), '.xls');

    if FileExists(vFileName) then
    begin
      ReadSQL(pDateFrom, pDateTo, vFileNameSQL);

      if vUserStat = 1 then
        MainData.dsReport.ParamByName('STATUS').AsString := 'ENABLED'
      else
        MainData.dsReport.ParamByName('STATUS').AsString := '';

      MainData.dsReport.Open;

      case pRepType of
        0: EvtRepUsersExec(pDateFrom, pDateTo, vFileName);
        1: EvtRepCustomsExec(pDateFrom, pDateTo, vFileName);
      end;

      MainData.dsReport.Close;
    end
    else
      raise Exception.CreateFmt('Не найден шаблон отчета [%s]!', [vFileName]);
end;

procedure EvtRepUsersExec(pDateFrom, pDateTo: TDateTime; pTemplateFile: string);
var
  ExcelApp, Workbook, Range, Cell1, Cell2, ArrayData: Variant;
  BeginCol, BeginRow: Integer;
  RowCount, ColCount: Integer;
  n: Integer;
begin
// Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');

// Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;

 //  заполняем шаблон
  Workbook := ExcelApp.WorkBooks.Add(pTemplateFile);

  RowCount := MainData.dsReport.RecordCount;
  ColCount := 6;

// Создаем Вариантный Массив, который заполним выходными данными
  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);

  BeginCol := 2;
  BeginRow := 11;
  n := 0;

  with MainData do
  begin
    dsReport.First;
    while not dsReport.Eof do
    begin
      n := n + 1;

     // Заполняем массив
      ArrayData[n, 1] := dsReport.FieldByName('user_name').AsVariant;
      ArrayData[n, 2] := dsReport.FieldByName('LOGIN').AsString;
      ArrayData[n, 3] := dsReport.FieldByName('rtu').AsString;
      ArrayData[n, 4] := dsReport.FieldByName('customs_name').AsString;
      ArrayData[n, 5] := dsReport.FieldByName('customs_post').AsString;
      ArrayData[n, 6] := dsReport.FieldByName('evt_count').AsString;

      dsReport.Next;
    end;
  end;

// Левая верхняя ячейка области, в которую будем выводить данные
  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];

// Правая нижняя ячейка области, в которую будем выводить данные
  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount - 1,
                        BeginCol + ColCount - 1];

    // Область, в которую будем выводить данные
//    Range := WorkBook.WorkSheets[1].RangeName['rngBody'];
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];

  // вывод данных
  Range.Value := ArrayData;

  // границы
  WorkBook.WorkSheets[1].Range[Cell1, Cell2].Borders.LineStyle := 1;

  // период
    WorkBook.WorkSheets[1].Cells[7, 4].Value :=
        'с ' + DateToStr(pDateFrom) + 'г.  по  ' + DateToStr(pDateTo) + 'г.';

  // таможня
    WorkBook.WorkSheets[1].Cells[1, 2].Value := vCustomName;

// Делаем Excel видимым
  ExcelApp.Visible := true;
end;

procedure EvtRepCustomsExec(pDateFrom, pDateTo: TDateTime; pTemplateFile: string);
var
  ExcelApp, Workbook, Range, Cell1, Cell2, ArrayData: Variant;
  BeginCol, BeginRow: Integer;
  RowCount, ColCount: Integer;
  n: Integer;
  vReg, vWorked, vEvtCount: Double;
begin
  vReg := 0;
  vWorked := 0;
  vEvtCount := 0;

// Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');

// Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;

 //  заполняем шаблон
  Workbook := ExcelApp.WorkBooks.Add(pTemplateFile);

  RowCount := MainData.dsReport.RecordCount;
  ColCount := 4;

// Создаем Вариантный Массив, который заполним выходными данными
  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);

  BeginCol := 2;
  BeginRow := 12;
  n := 0;

  with MainData do
  begin
    dsReport.First;
    while not dsReport.Eof do
    begin
      n := n + 1;

     // Заполняем массив
      ArrayData[n, 1] := dsReport.FieldByName('custom_name').AsVariant;
      ArrayData[n, 2] := dsReport.FieldByName('user_reg').AsString;
      ArrayData[n, 3] := dsReport.FieldByName('user_worked').AsString;
      ArrayData[n, 4] := dsReport.FieldByName('evt_count').AsString;

      // для итого
      vReg      := vReg + dsReport.FieldByName('user_reg').AsFloat;
      vWorked   := vWorked + dsReport.FieldByName('user_worked').AsFloat;
      vEvtCount := vEvtCount + dsReport.FieldByName('evt_count').AsFloat;

      dsReport.Next;
    end;
  end;

// Левая верхняя ячейка области, в которую будем выводить данные
  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];

// Правая нижняя ячейка области, в которую будем выводить данные
  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount - 1,
                        BeginCol + ColCount - 1];

    // Область, в которую будем выводить данные
//    Range := WorkBook.WorkSheets[1].RangeName['rngBody'];
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];

  // вывод данных
  Range.Value := ArrayData;

  // границы
  WorkBook.WorkSheets[1].Range[Cell1, Cell2].Borders.LineStyle := 1;

  // Итого
    WorkBook.WorkSheets[1].Cells[11, 3].Value := vReg;
    WorkBook.WorkSheets[1].Cells[11, 4].Value := vWorked;
    WorkBook.WorkSheets[1].Cells[11, 5].Value := vEvtCount;

  // период
    WorkBook.WorkSheets[1].Cells[8, 3].Value :=
        'с ' + DateToStr(pDateFrom) + 'г.  по  ' + DateToStr(pDateTo) + 'г.';

  // таможня
    WorkBook.WorkSheets[1].Cells[1, 2].Value := vCustomName;

// Делаем Excel видимым
  ExcelApp.Visible := true;
end;

procedure ReadSQL(pDateFrom, pDateTo: TDateTime; pFileName: string);
var
  F: TextFile;
  st: String;
begin

    with MainData do
    begin
      dsReport.SQL.Clear;
      dsReport.SQL.Add('select stringvalue from fdc_value_lst_sys where sysname = :SYSNAME');
      dsReport.ParamByName('SYSNAME').AsString := 'CustomsName';
      dsReport.Open;
      vCustomName := dsReport.FieldByName('stringvalue').AsString;
      dsReport.Close;
    end;


    AssignFile(F, pFileName);
    Reset(F);
    ReadLn(F, st);

    with MainData do
    begin
      dsReport.SQL.Clear;

      While (not EOF(f)) do
      begin
        ReadLn(F, st);
        dsReport.SQL.Add(st);
      end;

    //  ShowMessage(MainData.dsReport.SQL.Text);

      dsReport.ParamByName('DateFrom').AsDateTime := DateOf(pDateFrom);
      dsReport.ParamByName('DateTo').AsDateTime   := DateOf(pDateTo);
    end;

    CloseFile(F);
end;

end.
