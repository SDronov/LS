unit qNsiNoticePeriodReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomReportFrm, Menus, cxLookAndFeelPainters, cxGraphics,
  FDCCustomDataset, fdcQuery, Oracle, OracleData, xlcClasses, xlEngine,
  xlReport, DB, dxmdaset, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxTextEdit, cxMaskEdit, cxCalendar, cxDBEdit,
  StdCtrls, cxButtons, cxControls;

type
  TqNsiNoticePeriodReportForm = class(TqCustomReportForm)
    lciDateTo: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    odsGetPayments: TOracleDataSet;
    dsMemDataDateTo: TDateField;
    procedure actOkExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetSysName: string; override;
    function GetEvtNumber: string; override;
  public
    { Public declarations }
  end;

  function ExecReport(aSession: TOracleSession): boolean;

var
  qNsiNoticePeriodReportForm: TqNsiNoticePeriodReportForm;

implementation

uses qReportUtil;
const
  cXMLext       = '.xml';
  cDateDivider  = 'D';
  cTimeDivider  = 'T';
  cDateFormat   = 'YYYYMMDD';
  cTimeFormat   = 'HHMMSS';

{$R *.dfm}

function ExecReport(aSession: TOracleSession): boolean;
begin
  with TqNsiNoticePeriodReportForm.Create(nil) do
  try
    SetSession(aSession);
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;


procedure TqNsiNoticePeriodReportForm.actOkExecute(Sender: TObject);
var
  fs : TFormatSettings;
  i  :integer;
begin
  dsMemData.UpdateRecord;
  // -- check date
  qryCheckReport.SetVariable('DateFrom', dsMemDataDateFrom.Value);
  qryCheckReport.Execute;
  // -- check currency
  if lciCurrency.Visible then
  begin
    if dsMemDataCurrId.IsNull then
      raise exception.Create('Необходимо выбрать валюту')
    else
      try
        dsCheckRate.Open;
      finally
        dsCheckRate.Close;
      end;
  end;
  odsGetPayments.SetVariable('DATE_FROM',dsMemDataDateFrom.Value);
  odsGetPayments.SetVariable('DATE_TO',dsMemDataDateTo.Value);
  odsGetPayments.Open;
  for i := 0 to odsGetPayments.RecordCount-1 do
  begin
 	 // -- get report param
	  dsReportParam.SetVariable('DateFrom', odsGetPayments.FieldValues['DOC_DATE']);
	  dsReportParam.SetVariable('SysName', GetSysName);
	  dsReportParam.Open;
	  GetReportParam;
	  dsReportParam.Close;
	  // -- load query SQL
	  LoadReportQuery(xlrReport);
	  // -- save to XML
	  fs := GetFormatSettings(cDateFormat, cTimeFormat);
	  dlgSave.FileName := GetSysName + cDateDivider + DateToStr(Now, fs) + cTimeDivider + TimeToStr(Now,fs) + cXmlExt;
	  if chbxXML.Checked and dlgSave.Execute then
	    XMLSave(dlgSave.FileName);
	  // -- show report
	  xlrReport.Report(false);
  end;
  ModalResult := mrOk;
end;


function  TqNsiNoticePeriodReportForm.GetSysName: string;
begin
  Result := 'NSIREPORT.ACC#B0541102';
end;

function  TqNsiNoticePeriodReportForm.GetEvtNumber: string;
begin
  Result := '00018';
end;

end.
