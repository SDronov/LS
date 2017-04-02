unit PaymentsBrokerDeclarantFrm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportFrm, Menus, cxLookAndFeelPainters, cxPC, DB, dxmdaset,
  xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxLabel, cxGroupBox,
  cxRadioGroup, cxTextEdit, cxMaskEdit, cxSpinEdit, cxGraphics,
  cxDropDownEdit, cxCalendar, DateUtils, Types, shlobj, OleServer;

type
  TPaymentsBrokerDeclarantForm2 = class(TXLSReportForm)
    PC: TcxPageControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    tsPeriod: TcxTabSheet;
    tsQuart: TcxTabSheet;
    seYear: TcxSpinEdit;
    rgQuarts: TcxRadioGroup;
    cxLabel1: TcxLabel;
    D1: TcxDateEdit;
    D2: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cb: TcxComboBox;
    dsParamDATE_FROM: TDateField;
    dsParamDATE_TO: TDateField;
    dsParamQUART_FLAG: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cbClick(Sender: TObject);
    procedure xlReportBeforeBuild(Report: TxlReport);
    procedure xlReportAfterBuild(Report: TxlReport);
    procedure xlReportBeforeWorkbookSave( Report: TxlReport; var WorkbookName, WorkbookPath: String; Save: Boolean);
    procedure D1PropertiesChange(Sender: TObject);
  private
    fDateFrom, fDateTo: TDate;
    procedure setDateEdits;
    procedure setControls;
    procedure setParentColors;
    procedure setReportDates;
    function getQEnd: TDate;
    function getQStart: TDate;
    procedure DatePikerOnChangeEnabled(aEnabled: boolean);

  protected
  public
    procedure TransferParams; override;
  end;

implementation
uses qReportUtil, ExcelXP, fdcDBUtils, MainDm, fdcUtils, shellAPI;

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

function quartBegins(const aDate:TDate):TDate;
//возвращает дату начала квартала для произвольной aDate
begin
 result:= encodeDate( yearOf(aDate), 1+3*(( monthOf(aDate) - 1 ) div 3), 1 );
end;

procedure TPaymentsBrokerDeclarantForm2.setControls;
var
 d, minDate: TDate;
 Y, M, Dy: word;
begin
 inherited;
 minDate:= encodeDate(2014, 1, 1);
 {Устанавливаем квартал предыдущий к текущему }
 d:= quartBegins( incDay( quartBegins( date ), -1 ) ); // дата начала предыдущего кв.

 if ( CompareDate(d, minDate) <> GreaterThanValue ) then
   d:= minDate;

 decodeDate(d, Y, M, Dy);
 seYear.Value := Y;
 rgQuarts.ItemIndex:= ((M-1) div 3);

 setDateEdits;
end;

procedure TPaymentsBrokerDeclarantForm2.setParentColors;
begin
 cxLabel2.ParentColor := true;
 cxLabel3.ParentColor := true;
 cxLabel4.ParentColor := true;
 refresh;
end;

procedure TPaymentsBrokerDeclarantForm2.FormCreate(Sender: TObject);
begin
 inherited;
 if (cb.Properties.Items.Count > 0) then cb.ItemIndex := 0;
 PC.ActivePageIndex:= 0;
 with CB.Properties do DropDownRows:= Items.Count;
 setControls;

 setParentColors;
end;

//Предыдущий рабочий день
//Предыдущая неделя
//Предыдущий месяц
//Предыдущий квартал
//Предыдущее полугодие
//С начала текущей недели
//С начала текущего месяца
//С начала текущего квартала
//С начала текущего полугодия
//С начала текущего года

procedure TPaymentsBrokerDeclarantForm2.DatePikerOnChangeEnabled(aEnabled:boolean);
begin
 if aEnabled then begin
   D1.Properties.OnChange:= D1PropertiesChange;
   D2.Properties.OnChange:= D1PropertiesChange;
 end
 else begin
   D1.Properties.OnChange:= nil;
   D2.Properties.OnChange:= nil;
 end;
end;

procedure TPaymentsBrokerDeclarantForm2.setDateEdits;
var D: TDate;
begin
 DatePikerOnChangeEnabled(false);
 D:= Date;
 case 1 + cb.ItemIndex of
  //0: begin D2.Date:= incDay(D,-1); D1.Date:= D2.Date; end; //Предыдущий день
  1: begin repeat D:= incDay(D, -1) until (dayOfTheWeek(D) < 6); D2.Date:= D; D1.Date:= D end; //Предыдущий рабочий день
  2: begin D2.Date:= incDay(D, -DayOfTheWeek(D)); D1.Date:= incDay(D2.Date, -6); end; //Предыдущая неделя
  3: begin D2.Date:= incDay(D, -dayOfTheMonth(D)); D1.Date:= incDay( incMonth(D2.Date, -1) );  end; //Предыдущий месяц
  4: begin D2.Date:= incDay(quartBegins(D),-1); D1.Date:= quartBegins(D2.Date)  end;//Предыдущий квартал
  5: begin D2.Date:= incDay( encodeDate(yearOf(D), 1 + 6*(monthOf(D) div 7), 1 ), -1 );  D1.Date:= EncodeDate( yearOf(D2.Date), (1+6*(monthOf(D2.Date) div 7)), 1 ); end; //Предыдущее полугодие
  6: begin D2.Date:= D; D1.Date:= incDay(D2.Date, -(dayOfTheWeek(D2.Date)- 1) ) end; //С начала текущей недели
  7: begin D2.Date:= D; D1.Date:= incDay(D2.Date, -(dayOfTheMonth(D2.Date)-1) ) end; //С начала текущего месяца
  8: begin D2.Date:= D; D1.Date:= quartBegins(D) end; //С начала текущего квартала
  9: begin D2.Date:= D; D1.Date:= EncodeDate( yearOf(D2.Date), (1+6*(monthOf(D2.Date) div 7)), 1 ) end; //С начала текущего полугодия
  10: begin D1.Date:= EncodeDate( yearOf(D), 1, 1 ); D2.Date:= D; end; //С начала текущего года
 else
   ;
 end;
 DatePikerOnChangeEnabled(true);
end;

procedure TPaymentsBrokerDeclarantForm2.cbClick(Sender: TObject);
begin
  inherited;
  setDateEdits;
end;

function TPaymentsBrokerDeclarantForm2.getQStart: TDate;
begin
 result:= encodeDate( seYear.Value, rgQuarts.Properties.Items[ rgQuarts.ItemIndex ].Value, 1 );
end;

function TPaymentsBrokerDeclarantForm2.getQEnd: TDate;
begin
 result:= incDay(incMonth( getQStart, 3 ), -1);
end;

(*
function TQuartalReportForm.getQStart: TDate;
begin
 result:= encodeDate( YearOf( Date ), (monthOf(Date))div 3)     1+(3*rgQuarts.Properties.Items[ rgQuarts.ItemIndex ].Value), 1 );
end;

function TQuartalReportForm.getQEnd: TDate;
begin
 result:= incDay(incMonth( getQStart, 3 ), -1);
end;

 D2.Date:= incDay(D,-1); D1.Date:= D2.Date;  //Предыдущий день
 D2.Date:= D; repeat D2.Date:= incDay(D2.Date,-1) until (dayOfTheWeek(D2.Date) < 6); D1.Date:= D2.Date; //Предыдущий рабочий день
 D2.Date:= incDay(D, -DayOfTheWeek(D)); D1.Date:= incDay(D2.Date, -6); //Предыдущая неделя
 D2.Date:= incDay(D, -dayOfTheMonth(D)); D1.Date:= incDay( incMonth(D2.Date, -1) );  //Предыдущий месяц
// Предыдущий квартал
 D2.Date:= incDay( encodeDate(yearOf(D), 1 + 6*(monthOf(D) div 7), 1 ), -1 );  D1.Date:= EncodeDate( yearOf(D2.Date), (1+6*(monthOf(D2.Date) div 7)), 1 );  //Предыдущее полугодие
 D2.Date:= D; D1.Date:= incDay(D2.Date, -(dayOfTheWeek(D2.Date)- 1) ); // С начала текущей недели
 D2.Date:= D; D1.Date:= incDay(D2.Date, -(dayOfTheMonth(D2.Date)-1) ); // С начала текущего месяца
// С начала текущего квартала
 D2.Date:= D; D1.Date:= EncodeDate( yearOf(D2.Date), (1+6*(monthOf(D2.Date) div 7)), 1 ); //С начала текущего полугодия
 D1.Date:= EncodeDate( yearOf(D), 1, 1 ); D2.Date:= D;  //С начала текущего года
*)

procedure TPaymentsBrokerDeclarantForm2.setReportDates;
begin
 if (PC.ActivePageIndex = 0) then begin
  fDateFrom:= D1.Date;
  fDateTo:= D2.Date;
 end
 else begin
  fDateFrom:= getQStart;
  fDateTo:=  getQEnd;
 end;
end;

procedure TPaymentsBrokerDeclarantForm2.TransferParams;
begin
  setReportDates;
  dsParam.Edit;
  dsParamDATE_FROM.AsDateTime:= fDateFrom;
  dsParamDATE_TO.AsDateTime:= fDateTo;
  dsParamQUART_FLAG.AsInteger:= 0;
  if (PC.ActivePageIndex <> 0) then
    dsParamQUART_FLAG.AsInteger:= 1;
  dsParam.Post;
  inherited;
  with xlReport.Params.Add do
  begin
    Name := 'DATE_FROM_TEXT';
    Value := DateAsText( dsParamDATE_FROM.Value );
  end;

  with xlReport.Params.Add do
  begin
    Name := 'DATE_TO_TEXT';
    Value := DateAsText( dsParamDATE_TO.Value );
  end;

  with xlReport.Params.Add do
  begin
    Name := 'QUART_FLAG_TEXT';
    Value :=  dsParamQUART_FLAG.AsString ;
  end;

end;



procedure TPaymentsBrokerDeclarantForm2.xlReportBeforeBuild(
  Report: TxlReport);
begin
  inherited;
  Report.MacroAfter := 'autoHigh';
end;

procedure TPaymentsBrokerDeclarantForm2.xlReportAfterBuild(Report: TxlReport);
var
  ws: ExcelWorksheet;
  wb: ExcelWorkbook;
begin
 inherited;
 wb:= Report.IWorkbook as ExcelWorkbook;
 ws:= wb.ActiveSheet as ExcelWorksheet;
 ws.Name:=MainData.GetCustomsCode;
end;

procedure TPaymentsBrokerDeclarantForm2.xlReportBeforeWorkbookSave(
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


procedure TPaymentsBrokerDeclarantForm2.D1PropertiesChange(Sender: TObject);
begin
 inherited;
 cb.ItemIndex:= cb.Properties.Items.Count-1
end;

initialization
 RegisterClass(TPaymentsBrokerDeclarantForm2);

end.
