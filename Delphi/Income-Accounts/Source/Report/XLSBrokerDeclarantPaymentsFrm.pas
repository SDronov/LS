unit XLSBrokerDeclarantPaymentsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportByPeriodFrm, Menus, cxLookAndFeelPainters, DB,
  dxmdaset, xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, StdCtrls, cxButtons, cxControls, shlobj, OleServer;

type
  TXLSBrokerDeclarantPayments = class(TXLSReportByPeriodForm)
   procedure xlReportBeforeBuild(Report: TxlReport);
   procedure FormShow(Sender: TObject);
   procedure xlReportAfterBuild(Report: TxlReport);
   procedure xlReportBeforeWorkbookSave(Report: TxlReport;
      var WorkbookName, WorkbookPath: String; Save: Boolean);
  private
  public
//   class procedure ExecuteReport(const ACaption: string = ''; const ATemplateFile: string = ''); override;
  end;

implementation
uses ExcelXP, DateUtils, fdcDBUtils, MainDm, fdcUtils, shellAPI;
{$R *.dfm}




procedure TXLSBrokerDeclarantPayments.xlReportBeforeBuild(Report: TxlReport);
begin
 inherited;
 Report.MacroAfter := 'autoHigh';
end;

function quartBegins(const aDate:TDate):TDate;
//возвращает дату начала квартала для произвольной aDate
var Y, M, D: word;
begin
 decodeDate(aDate, Y, M, D);
 result:= encodeDate(Y, 1+3*((M-1) div 3), 1);
end;

procedure TXLSBrokerDeclarantPayments.FormShow(Sender: TObject);
var qEnds: TDate;
begin
 inherited;
 (*{  Закоментить после отладки !!
   dsParamDATE_FROM.AsDateTime := StrToDate('01.01.2014');
   dsParamDATE_TO.AsDateTime := StrToDate('31.03.2014');
   Exit;                               }*)
 qEnds := incDay( quartBegins( date ), -1 );    // дата окончания предыдущего квартала
 dsParamDATE_FROM.AsDateTime := quartBegins(qEnds);
 dsParamDATE_TO.AsDateTime := qEnds;
end;

function getMyDocuments: string;
var
 r: Bool;
 path: array[0..Max_Path] of Char;
begin
 r := SHGetSpecialFolderPath(0, path, CSIDL_Personal, False) ;
 if not r then raise Exception.Create('Could not find MyDocuments folder location.') ;
   Result := Path;
end;

procedure TXLSBrokerDeclarantPayments.xlReportAfterBuild(Report: TxlReport);
var
  ws: ExcelWorksheet;
  wb: ExcelWorkbook;
begin
 inherited;
 wb:= Report.IWorkbook as ExcelWorkbook;
 ws:= wb.ActiveSheet as ExcelWorksheet;
 ws.Name:=MainData.GetCustomsCode;
end;

procedure TXLSBrokerDeclarantPayments.xlReportBeforeWorkbookSave(
  Report: TxlReport; var WorkbookName, WorkbookPath: String; Save: Boolean);
const cStr = '%s_Оплата Брокером за Декларанта_Период с %s по %s';
var
 fileExt, rptHeader, rptPath, suffix: string;
 i: integer;
begin
 inherited;
 rptHeader:= Format( cStr, [MainData.GetCustomsCode, dateToStr(edtDateFrom.Date), dateToStr(edtDateTo.Date) ]);
 rptPath:= getMyDocuments;
 if (rptPath = '') then
   rptPath:= workbookPath;
 rptPath:=IncludeTrailingPathDelimiter(rptPath);

 fileExt:= ExtractFileExt( workbookName );
 if (fileExt = '') then
     fileExt:= 'xls';

 i:=0;
 suffix:='';
 while fileExists( rptPath + rptHeader + suffix + '.' + fileExt ) do begin
   inc(i);
   suffix:= '_' + intToStr( i );
 end;
 workbookPath := rptPath;
 workbookName := rptHeader + suffix + '.' + fileExt;

end;

initialization
 RegisterClass(TXLSBrokerDeclarantPayments);
end.
