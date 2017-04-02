unit qReportControlTimeBackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxGraphics,
  cxDropDownEdit, cxDBEdit, cxTextEdit, cxMaskEdit, cxCalendar, xlcClasses,
  xlEngine, xlReport, DB, FDCCustomDataset, fdcQuery, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, Oracle,
  OracleData, dxmdaset;

type
  TqReportControlTimeBackForm = class(TfdcCustomDlgForm)
    dsHeader: TfdcQuery;
    dsReport: TfdcQuery;
    xlrReport: TxlReport;
    qryCheckReport: TOracleQuery;
    dsGetCustomsTU: TDataSource;
    dxLayoutControl1Item3: TdxLayoutItem;
    cmbxCustomsTU: TfdcObjectLookupEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    cmbxCustoms: TfdcObjectLookupEdit;
    dsGetCustoms: TDataSource;
    qGetCustomsTU: TOracleDataSet;
    qGetCustoms: TOracleDataSet;
    dxMemData: TdxMemData;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    dxMemDataCustomsName: TStringField;
    dxMemDataCode: TStringField;
    dxMemDataid: TIntegerField;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDateFrom: TcxDBDateEdit;
    srcMain: TDataSource;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxMemDataCodeTU: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dxMemDataCodeTUChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ExecReport(Session : TOracleSession): boolean;

var
  qReportControlTimeBackForm: TqReportControlTimeBackForm;

implementation

uses MainDm, qReportUtil;
{$R *.dfm}


function ExecReport(Session : TOracleSession): boolean;
var
  F : TqReportControlTimeBackForm;
begin
  F := TqReportControlTimeBackForm.Create(nil);
  with F do
  try
    Result := False;
    if (xlrReport.XLSTemplate = '') then
      raise exception.Create('Нет соответствующего шаблона');
    // --- init session
    qGetCustomsTU.Open;
    qGetCustoms.Open;
    // --- init dxMemData
    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDate_From.Value := Trunc(Now);
    dxMemDataDate_To.Value := Trunc(Now);
    // --- get Result
    Result := (ShowModal = mrOk);
  finally
    F.Free;
  end;
end;

procedure TqReportControlTimeBackForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlrReport.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                           ExtractFileName(xlrReport.XLSTemplate);
end;

procedure TqReportControlTimeBackForm.actOkExecute(Sender: TObject);
begin
  inherited;
  dxMemData.CheckBrowseMode;
  qryCheckReport.SetVariable('DateFrom', dxMemDataDate_From.AsDateTime);
  qryCheckReport.Execute;
  // -- load query SQL
  LoadReportQueryEx(Self, xlrReport.XLSTemplate);
  // -- get report param
  dsHeader.ParamByName('pDateBegin').AsDate      := dxMemDataDate_From.AsDateTime;
  dsHeader.ParamByName('pDateEnd').AsDate        := dxMemDataDate_To.AsDateTime;
  If dxMemDataCode.Value = '' Then
     dsHeader.ParamByName('pCustomsCode').AsString  := dxMemDataCodeTU.AsString
  else
     dsHeader.ParamByName('pCustomsCode').AsString  := dxMemDataCode.AsString;
  dsHeader.Open;

  dsReport.ParamByName('pDateBegin').AsDate      := dsHeader.ParamByName('pDateBegin').AsDate;
  dsReport.ParamByName('pDateEnd').AsDate        := dsHeader.ParamByName('pDateEnd').AsDate;
  dsReport.ParamByName('pCustomsCode').AsString  := dsHeader.ParamByName('pCustomsCode').AsString;
  dsReport.Open;
  // -- show report
  try
    xlrReport.Report(True);
    ModalResult := mrOk;
  except on e: exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end end;
  dsHeader.Close;
  dsReport.Close;

end;

procedure TqReportControlTimeBackForm.dxMemDataCodeTUChange(
  Sender: TField);
begin
  qGetCustoms.SetVariable('PCUSTOMSCODE',dxMemDataCodeTU.AsString);
  qGetCustoms.Refresh;
end;

end.
