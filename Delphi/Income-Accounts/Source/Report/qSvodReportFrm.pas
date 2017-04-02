unit qSvodReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomReportFrm, Menus, cxLookAndFeelPainters, cxGraphics,
  FDCCustomDataset, fdcQuery, Oracle, OracleData, xlcClasses, xlEngine,
  xlReport, DB, dxmdaset, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxTextEdit, cxMaskEdit, cxCalendar, cxDBEdit,
  StdCtrls, cxButtons, cxControls, Registry, fdcCustomFrm;

type
  TqSvodReportForm = class(TqCustomReportForm)
    dsMemDatais_ts: TStringField;
    dxLayoutControl1Item1: TdxLayoutItem;
    chBIsActive: TcxDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure dsMemDataDateFromChange(Sender: TField);
    procedure actOkExecute(Sender: TObject);
    procedure edtDateFromPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function  GetEvtNumber: string; override;
    procedure GetSysValues; override;
  public
    { Public declarations }
  end;

const
  cReportDir    = 'Report\';
  cFldSysPrefix = 'Sys';
  cFldSysName   = 'SysName';
  cFldStrValue  = 'StringValue';
  cFldDefSize   = 400;
  cXMLRow       = 'xml_row';
  cXMLext       = '.xml';

var
  qSvodReportForm: TqSvodReportForm;

implementation

uses MainDm, qReportUtil;

{$R *.dfm}

procedure TqSvodReportForm.FormCreate(Sender: TObject);
begin
  inherited;

  SetTemplateName( 'Сводный_Отчёт' );
  dsMemData.Open;
  dsMemData.Append;
end;

function TqSvodReportForm.GetEvtNumber: string;
begin
  Result := '00019';
end;

procedure TqSvodReportForm.dsMemDataDateFromChange(Sender: TField);
begin
  inherited;
  if (dsMemDataDateFrom.Value > dsMemDataDateTo.Value) then
    begin
      dsMemDataDateTo.Value := dsMemDataDateFrom.Value;
    end;
end;

procedure TqSvodReportForm.GetSysValues;
begin
  inherited;
  dsMemDataDateTo.Value := Trunc(Now);
end;

procedure TqSvodReportForm.actOkExecute(Sender: TObject);
var
  fs : TFormatSettings;
  fRepDir: string;
begin
  dsMemData.FieldByName( 'CurrName' ).AsString := cmbxCurrency.Text;
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
  // -- load query SQL
  LoadReportQuery(xlrReport);
  // -- get report param
  dsReport.ParamByName('DateFrom').AsDate       := dsMemDataDateFrom.AsDateTime;
  dsReport.ParamByName('DateTo').AsDate         := dsMemDataDateTo.AsDateTime;
  dsReport.ParamByName('currency_id').AsInteger := dsMemDataCurrId.AsInteger;
  dsReport.ParamByName('Is_TS').AsString        := dsMemDataIs_TS.AsString;
  dsReport.Open;

  MainData.RegisterEvent('REP', GetEvtNumber);

  // -- show report
  xlrReport.Report(True);
  ModalResult := mrOk;
end;

procedure TqSvodReportForm.edtDateFromPropertiesChange(Sender: TObject);
begin
  inherited;
  if (dsMemDataDateFrom.Value > dsMemDataDateTo.Value) then
    begin
      dsMemDataDateTo.Value := dsMemDataDateFrom.Value;
    end;
end;

end.
