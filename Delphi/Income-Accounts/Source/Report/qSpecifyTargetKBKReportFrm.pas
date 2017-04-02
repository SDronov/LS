unit qSpecifyTargetKBKReportFrm;

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
  TqSpecifyTargetKBKReportForm = class(TqCustomReportForm)
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
  qSpecifyTargetKBKReportForm: TqSpecifyTargetKBKReportForm;

implementation

{$R *.dfm}

uses
  qReportUtil;

procedure TqSpecifyTargetKBKReportForm.FormCreate(Sender: TObject);
begin
  inherited;

  SetTemplateName( 'Отчёт_об_уточнении_целевого_КБК' );
end;

function TqSpecifyTargetKBKReportForm.GetEvtNumber: string;
begin
  Result := '00019';
end;

procedure TqSpecifyTargetKBKReportForm.actOkExecute(Sender: TObject);
begin
  dsMemData.UpdateRecord;
  // -- check date
  qryCheckReport.SetVariable('DateFrom', dsMemDataDateFrom.Value);
  qryCheckReport.Execute;
  if (lciDateTo.Visible) then
    begin
      qryCheckReport.SetVariable('DateFrom', dsMemDataDateTo.Value);
      qryCheckReport.Execute;
    end;
  // -- load query SQL
  LoadReportQuery(xlrReport);

  xlrReport.Report(True);
  ModalResult := mrOk;
end;

end.
