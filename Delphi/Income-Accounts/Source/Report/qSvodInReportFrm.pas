unit qSvodInReportFrm;

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
  TqSvodInReportForm = class(TqCustomReportForm)
    rgReportType: TcxRadioGroup;
    dxLayoutControl1Item2: TdxLayoutItem;
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
  qSvodInReportForm: TqSvodInReportForm;

implementation

uses MainDm, qReportUtil;

{$R *.dfm}

procedure TqSvodInReportForm.FormCreate(Sender: TObject);
begin
  inherited;

  dsMemData.Open;
  dsMemData.Append;
end;

function TqSvodInReportForm.GetEvtNumber: string;
begin
  Result := '00019';
end;

procedure TqSvodInReportForm.dsMemDataDateFromChange(Sender: TField);
begin
  inherited;
  if (dsMemDataDateFrom.Value > dsMemDataDateTo.Value) then
    begin
      dsMemDataDateTo.Value := dsMemDataDateFrom.Value;
    end;
end;

procedure TqSvodInReportForm.GetSysValues;
begin
  inherited;
  dsMemDataDateTo.Value := Trunc(Now);
end;

procedure TqSvodInReportForm.actOkExecute(Sender: TObject);
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
  // Set report mode
  case rgReportType.ItemIndex of
    0 : SetTemplateName( 'Сводный_Отчёт_поступлений_1' );
    1 : SetTemplateName( 'Сводный_Отчёт_поступлений_2' );
  end;
  // -- load query SQL
  LoadReportQuery(xlrReport);
  // -- get report param
  dsReport.ParamByName('DateFrom').AsDate       := dsMemDataDateFrom.AsDateTime;
  dsReport.ParamByName('DateTo').AsDate         := dsMemDataDateTo.AsDateTime;
  dsReport.ParamByName('currency_id').AsInteger := dsMemDataCurrId.AsInteger;
  dsReport.Open;

  MainData.RegisterEvent('REP', GetEvtNumber);

  // -- show report
  xlrReport.Report(True);
  ModalResult := mrOk;
end;

end.
