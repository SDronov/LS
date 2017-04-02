unit PaymentsBrokerDeclarantFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuartalReportFrm, Menus, cxLookAndFeelPainters, DB, dxmdaset,
  xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxGroupBox, cxRadioGroup, shlobj, OleServer;

type
  TPaymentsBrokerDeclarantForm = class(TQuartalReportForm)
    procedure xlReportBeforeBuild(Report: TxlReport);
    procedure xlReportAfterBuild(Report: TxlReport);
    procedure xlReportBeforeWorkbookSave(Report: TxlReport;
      var WorkbookName, WorkbookPath: String; Save: Boolean);
  private
  public
  end;


implementation

uses ExcelXP, fdcDBUtils, MainDm, fdcUtils, shellAPI;
{$R *.dfm}

function getMyDocuments: string;
var
 r: Bool;
 path: array[0..Max_Path] of Char;
begin
 r := SHGetSpecialFolderPath(0, path, CSIDL_Personal, False) ;
 if not r then raise Exception.Create('Could not find MyDocuments folder location.') ;
   Result := Path;
end;

procedure TPaymentsBrokerDeclarantForm.xlReportBeforeBuild( Report: TxlReport);
begin
  inherited;
  Report.MacroAfter := 'autoHigh';
end;

procedure TPaymentsBrokerDeclarantForm.xlReportAfterBuild(Report: TxlReport);
var
  ws: ExcelWorksheet;
  wb: ExcelWorkbook;
begin
 inherited;
 wb:= Report.IWorkbook as ExcelWorkbook;
 ws:= wb.ActiveSheet as ExcelWorksheet;
 ws.Name:=MainData.GetCustomsCode;
end;

procedure TPaymentsBrokerDeclarantForm.xlReportBeforeWorkbookSave(
  Report: TxlReport; var WorkbookName, WorkbookPath: String;
  Save: Boolean);
const cStr = '%s_Оплата Брокером за Декларанта_Период с %s по %s';
var
 fileExt, rptHeader, rptPath, suffix: string;
 i: integer;
begin
 inherited;
 rptHeader:= Format( cStr, [MainData.GetCustomsCode, dateToStr(getQStart), dateToStr(getQEnd) ]);
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
 RegisterClass(TPaymentsBrokerDeclarantForm);
end.
