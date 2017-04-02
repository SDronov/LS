unit qReportFrom_TO_Date_CurrFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, DB, dxmdaset, xlcClasses, xlEngine,
  xlReport, OracleData, Oracle, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcQuery, fdcObjectLookupEdit, FDCCustomDataset,
  cxCheckBox, MainDM, Registry, fdcCustomFrm;

type
  TqReportFrom_TO_Date_CurrForm = class(TfdcCustomDlgForm)
    dxMemData: TdxMemData;
    edtDateFrom: TcxDBDateEdit;
    lciDateFrom: TdxLayoutItem;
    dxMemDataDateFrom: TDateField;
    srcMemData: TDataSource;
    xlrReport: TxlReport;
    dxMemDataCurrId: TFloatField;
    dxMemDataCurrName: TStringField;
    cmbxCurrency: TfdcObjectLookupEdit;
    lciCurrency: TdxLayoutItem;
    dsHeader: TfdcQuery;
    dsBody: TfdcQuery;
    dlgSave: TSaveDialog;
    dsCheckRate: TfdcQuery;
    lciDateTo: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxMemDataDateTo: TDateField;
    dxMemDataPeriod: TStringField;
    procedure actOkExecute(Sender: TObject);
    procedure dxMemDataDateFromChange(Sender: TField);
  protected
    freportname : string;
  public
    property preportname: string read freportname write freportname;
  end;

function ExecReport(Session : TOracleSession; reportname : String): boolean;

//--  Отчет по расчетам по таможенным и иным платежам от участников ВЭД за период
function ExecReportChargesPay(Session : TOracleSession): boolean;

implementation

{$R *.dfm}

uses
  DateUtils, qReportUtil;

function ExecReport(Session : TOracleSession; reportname : String): boolean;
var
  Frm : TqReportFrom_TO_Date_CurrForm;
begin
  Frm := TqReportFrom_TO_Date_CurrForm.Create(nil);
  with Frm do
  try
    Result := False;
    preportname := reportname;
    // --- prepare template
    xlrReport.XLSTemplate :=ExtractFilePath(Application.ExeName) + 'Report\' +
                             preportname + '.xls';
    LoadReportQueryEx(Frm, xlrReport.XLSTemplate);

    dsHeader.Session := Session;
    dsBody.Session := Session;

    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDateFrom.Value := Trunc(Now);
    dxMemDataDateTo.Value := Trunc(Now);
    dxMemData.FieldByName('CurrID').AsFloat := cmbxCurrency.Properties.ListSource.DataSet.Lookup( 'CODE', '643', 'ID' );

    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;

function ExecReportChargesPay(Session : TOracleSession): boolean;
begin
  ExecReport(Session, 'ChargesPay0543011');
end;

procedure TqReportFrom_TO_Date_CurrForm.actOkExecute(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataPeriod.AsString := dxMemDataDateFrom.AsString + ' - ' + dxMemDataDateTo.AsString;
  dxMemData.CheckBrowseMode;
  // --- check input params
  CheckDate(dxMemDataDateFrom);
  CheckDate(dxMemDataDateTo);
  CmpDate(dxMemDataDateFrom, dxMemDataDateTo);
  // -- check currency
  if lciCurrency.Visible then
  begin
    if (dxMemDataCurrId.IsNull) then
      begin
        raise exception.Create('Необходимо выбрать валюту');
      end;
  end;
  // --- open Query`s
  dsHeader.ParamByName( 'begin_date' ).AsDate := dxMemDataDateFrom.AsDateTime;
  dsHeader.ParamByName( 'end_date' ).AsDate   := dxMemDataDateTo.AsDateTime;
  dsHeader.ParamByName( 'CurrId' ).AsFloat  := dxMemDataCurrId.AsFloat;
  dsHeader.ParamByName( 'CurrName' ).AsString  := dxMemDataCurrName.AsString;
  dsHeader.Open;

  dsBody.ParamByName( 'begin_date' ).AsDate := dxMemDataDateFrom.AsDateTime;
  dsBody.ParamByName( 'end_date' ).AsDate   := dxMemDataDateTo.AsDateTime;
  dsBody.Open;
  // --- generate report
  try
    xlrReport.Report(True);
    ModalResult := mrOk;
  except on e:exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end; end;
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
end;

procedure TqReportFrom_TO_Date_CurrForm.dxMemDataDateFromChange(
  Sender: TField);
begin
  inherited;
  if (dxMemDataDateFrom.Value > dxMemDataDateTo.Value) then
    begin
      dxMemDataDateTo.Value := dxMemDataDateFrom.Value;
    end;
end;

end.

