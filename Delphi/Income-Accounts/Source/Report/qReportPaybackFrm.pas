unit qReportPaybackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxGraphics, cxGroupBox,
  cxRadioGroup, cxDBEdit, cxDropDownEdit, xlcClasses, xlEngine, xlReport,
  DB, dxmdaset, cxTextEdit, cxMaskEdit, cxCalendar, FDCCustomDataset,
  fdcQuery,Oracle, OracleData;

type
  TqReportPaybackForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxMemData: TdxMemData;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    srcMain: TDataSource;
    xlrReport: TxlReport;
    edtTypeReport: TcxDBRadioGroup;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxMemDataType_Report: TIntegerField;
    edtTypePayback: TcxDBRadioGroup;
    dxLayoutControl1Item5: TdxLayoutItem;
    dsHeader: TfdcQuery;
    dsReport: TfdcQuery;
    dxMemDataType_Payback: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dxMemDataAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ExecReport(Session : TOracleSession): boolean;

var
  qReportPaybackForm: TqReportPaybackForm;

implementation

uses MainDm, qReportUtil;

{$R *.dfm}

function ExecReport(Session : TOracleSession): boolean;
var
  F : TqReportPaybackForm;
begin
  F := TqReportPaybackForm.Create(nil);
  with F do
  try
    Result := False;
    if (xlrReport.XLSTemplate = '') then
      raise exception.Create('Нет соответствующего шаблона');
    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDate_From.Value := Trunc(Now);
    dxMemDataDate_To.Value := Trunc(Now);

    Result := (ShowModal = mrOk);
  finally
    F.Free;
  end;
end;

procedure TqReportPaybackForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlrReport.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                           ExtractFileName(xlrReport.XLSTemplate);
end;

procedure TqReportPaybackForm.actOkExecute(Sender: TObject);
begin
  inherited;
  dxMemData.CheckBrowseMode;
  // -- load query SQL
  LoadReportQueryEx(Self, xlrReport.XLSTemplate);
  // -- get report param
  dsHeader.ParamByName('pTypePayback').AsInteger := dxMemDataType_Payback.AsInteger;
  dsHeader.ParamByName('pTypeReport').AsInteger  := dxMemDataType_Report.AsInteger;
  dsHeader.ParamByName('pDateBegin').AsDate      := dxMemDataDate_From.AsDateTime;
  dsHeader.ParamByName('pDateEnd').AsDate        := dxMemDataDate_To.AsDateTime;
  dsHeader.Open;

  dsReport.SQL.Text := StringReplace(dsReport.SQL.Text,'--_for_replace_'+dxMemDataType_Report.AsString+'*/','/*_for_replace_'+dxMemDataType_Report.AsString+'*/',[rfReplaceAll, rfIgnoreCase]) ;
  dsReport.SQL.Text := StringReplace(dsReport.SQL.Text,'--_for_replace_'+dxMemDataType_Payback.AsString+'*/','/*_for_replace_'+dxMemDataType_Payback.AsString+'*/',[rfReplaceAll, rfIgnoreCase]);

  dsReport.ParamByName('pDateBegin').AsDate      := dsHeader.ParamByName('pDateBegin').AsDate;
  dsReport.ParamByName('pDateEnd').AsDate        := dsHeader.ParamByName('pDateEnd').AsDate;
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

procedure TqReportPaybackForm.dxMemDataAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dxMemDataType_Payback.Value := '4';
  dxMemDataType_Report.Value  := 0;
end;

end.
