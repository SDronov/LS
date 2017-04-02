unit qSvodOutReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomReportFrm, Menus, cxLookAndFeelPainters, cxGraphics,
  FDCCustomDataset, fdcQuery, Oracle, OracleData, xlcClasses, xlEngine,
  xlReport, DB, dxmdaset, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxTextEdit, cxMaskEdit, cxCalendar, cxDBEdit,
  StdCtrls, cxButtons, cxControls, Registry, fdcCustomFrm, cxGroupBox,
  cxRadioGroup;

type
  TqSvodOutReportForm = class(TqCustomReportForm)
    rgReportType: TcxRadioGroup;
    dxLayoutControl1Item2: TdxLayoutItem;
    dsReportOut: TfdcQuery;
    dsMemDataTypeName: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dsMemDataDateFromChange(Sender: TField);
    procedure actOkExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function  GetEvtNumber: string; override;
    procedure GetSysValues; override;
  public
    { Public declarations }
  end;

var
  qSvodOutReportForm: TqSvodOutReportForm;

implementation

uses MainDm, qReportUtil;

{$R *.dfm}

procedure TqSvodOutReportForm.FormCreate(Sender: TObject);
begin
  inherited;

  SetTemplateName( 'Сводный_Отчёт_выбытий' );
  dsMemData.Open;
  dsMemData.Append;
end;

function TqSvodOutReportForm.GetEvtNumber: string;
begin
  Result := '00019';
end;

procedure TqSvodOutReportForm.dsMemDataDateFromChange(Sender: TField);
begin
  inherited;
  if (dsMemDataDateFrom.Value > dsMemDataDateTo.Value) then
    begin
      dsMemDataDateTo.Value := dsMemDataDateFrom.Value;
    end;
end;

procedure TqSvodOutReportForm.GetSysValues;
begin
  inherited;
  dsMemDataDateTo.Value := Trunc(Now);
end;

procedure TqSvodOutReportForm.actOkExecute(Sender: TObject);
  var
    ds : TfdcQuery;
begin
  dsMemData.FieldByName( 'TypeName' ).AsString := rgReportType.Properties.Items[rgReportType.ItemIndex].Caption;
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
  // Set report mode
  case rgReportType.ItemIndex of
    0 : xlrReport.DataSources.Items[0].DataSet := dsReport;
    1 : xlrReport.DataSources.Items[0].DataSet := dsReportOut;
  end;
  // -- load query SQL
  LoadReportQuery(xlrReport);
  // -- get report param
  ds := xlrReport.DataSources.Items[0].DataSet as TfdcQuery;
  ds.ParamByName('DateFrom').AsDate       := dsMemDataDateFrom.AsDateTime;
  ds.ParamByName('DateTo').AsDate         := dsMemDataDateTo.AsDateTime;
  ds.ParamByName('currency_id').AsInteger := dsMemDataCurrId.AsInteger;
  ds.Open;

  MainData.RegisterEvent('REP', GetEvtNumber);

  // -- show report
  xlrReport.Report(True);
  ModalResult := mrOk;
end;

end.
