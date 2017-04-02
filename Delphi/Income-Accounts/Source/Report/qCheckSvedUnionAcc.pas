unit qCheckSvedUnionAcc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCheckSvedCustomFrm, Menus, cxLookAndFeelPainters, cxGraphics,
  FDCCustomDataset, fdcQuery, Oracle, OracleData, xlcClasses, xlEngine,
  xlReport, DB, dxmdaset, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxDBEdit, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxTextEdit, cxMaskEdit, cxCalendar, StdCtrls,
  cxButtons, cxControls;

type
  TqCheckSvedUnionAccForm = class(TqCheckSvedCustomForm)
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function  GetEvtNumber: string; override;
  public
    { Public declarations }
  end;

var
  qCheckSvedUnionAccForm: TqCheckSvedUnionAccForm;

implementation

uses MainDm, qReportUtil;

{$R *.dfm}

function TqCheckSvedUnionAccForm.GetEvtNumber: string;
begin
  Result := '00019';
end;

procedure TqCheckSvedUnionAccForm.FormCreate(Sender: TObject);
begin
  inherited;

  SetTemplateName( 'Факты объединения ЛС' );
  dsMemData.Open;
  dsMemData.Append;
end;

procedure TqCheckSvedUnionAccForm.actOkExecute(Sender: TObject);
var
  fs : TFormatSettings;
  fRepDir: string;
begin
//  dsMemData.FieldByName( 'CurrName' ).AsString := cmbxCurrency.Text;
//  dsMemData.UpdateRecord;

  // -- check date
//  qryCheckReport.SetVariable('DateFrom', dsMemDataDateFrom.Value);
//  qryCheckReport.Execute;

  // -- check currency
//  if lciCurrency.Visible then
//  begin
  //  if dsMemDataCurrId.IsNull then
 //     raise exception.Create('Необходимо выбрать валюту')
 ///   else
  //    try
  //      dsCheckRate.Open;
 //     finally
  //      dsCheckRate.Close;
  //    end;
//  end;
  // -- load query SQL
  LoadReportQuery(xlrReport);
  // -- get report param
  dsReport.ParamByName('DATE_FROM').AsDate := dsMemDataDateFrom.AsDateTime;
  dsReport.ParamByName('DATE_TO').AsDate := dsMemDataDateTo.AsDateTime;
  dsReport.Open;

  MainData.RegisterEvent('REP', GetEvtNumber);

  // -- show report
  xlrReport.Report(True);
  ModalResult := mrOk;
end;

end.
