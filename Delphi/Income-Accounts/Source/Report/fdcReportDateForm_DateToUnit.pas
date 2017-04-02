unit fdcReportDateForm_DateToUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, xlcClasses, xlEngine, xlReport, DB,
  FDCCustomDataset, fdcQuery, dxmdaset, Oracle, cxGraphics;

type
  TfdcReportDateForm_DateToForm = class(TfdcCustomDlgForm)
    xlrNoticeKindPay: TxlReport;
    dxLDate_From: TdxLayoutItem;
    edtDate_From: TcxDBDateEdit;
    dxLDate_To: TdxLayoutItem;
    edtDate_To: TcxDBDateEdit;
    dsHeader: TfdcQuery;
    dxMemData: TdxMemData;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    srcMain: TDataSource;
    dxMemDataCustomsName: TStringField;
    dsBody: TfdcQuery;
    dxMemDataPeriod: TStringField;
    procedure actOkExecute(Sender: TObject);
    procedure dxMemDataDate_FromChange(Sender: TField);
  private
    { Private declarations }
    freportname : string;
  public
    { Public declarations }
    property preportname: string read freportname write freportname;
  end;

function ExecReport(Session : TOracleSession; reportname : String): boolean;

//--  ����� �� ��������, ������������� � ����������� �� (���) (��������������� ��������� �������)
function ExecReportPayMK_MPS(Session : TOracleSession): boolean;
//--  ����� �� ��������, ������������� � ����������� ����������������� ���� (���������� ��������� �������)
function ExecReportPayMK_TPS(Session : TOracleSession): boolean;
//--  ����� �� ��������, ������������� � ����������� ����������������� ���� (���������� �����)
function ExecReportPayMK_TK(Session : TOracleSession): boolean;
//--  ������� ���/���
function ExecReportReestrs_RTU_FTS(Session : TOracleSession): boolean;

implementation

{$R *.dfm}

uses
  IniFiles,
  DateUtils,
  qReportUtil
 ,MainDM;

function ExecReport(Session : TOracleSession; reportname : String): boolean;
var
  Frm : TfdcReportDateForm_DateToForm;
begin
  Frm := TfdcReportDateForm_DateToForm.Create(nil);
  with Frm do
  try
    Result := False;
    preportname := reportname;
    // --- prepare template
    xlrNoticeKindPay.XLSTemplate :=ExtractFilePath(Application.ExeName) + 'Report\' +
                             preportname + '.xls';
    LoadReportQueryEx(Frm, xlrNoticeKindPay.XLSTemplate);

    dsHeader.Session := Session;
    dsBody.Session := Session;

    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDate_From.Value := Trunc(Now);
    dxMemDataDate_To.Value := Trunc(Now);

    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;

function ExecReportPayMK_TPS(Session : TOracleSession): boolean;
begin
  ExecReport(Session, 'paymk_tps');
end;

function ExecReportPayMK_TK(Session : TOracleSession): boolean;
begin
  ExecReport(Session, 'paymk_tk');
end;

function ExecReportPayMK_MPS(Session : TOracleSession): boolean;
begin
  ExecReport(Session, 'paymk_mps');
end;

function ExecReportReestrs_RTU_FTS(Session : TOracleSession): boolean;
begin
  ExecReport(Session, 'reestrs_rtu_fts');
end;

procedure TfdcReportDateForm_DateToForm.actOkExecute(Sender: TObject);
begin
  dxMemDataPeriod.AsString := dxMemDataDate_From.AsString + ' - ' + dxMemDataDate_To.AsString;
  dxMemData.CheckBrowseMode;
  // --- check input params
  CheckDate(dxMemDataDate_From);
  CheckDate(dxMemDataDate_To);
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);
  // --- open Query`s
  dsHeader.ParamByName( 'begin_date' ).AsDate := dxMemDataDate_From.AsDateTime;
  dsHeader.ParamByName( 'end_date' ).AsDate   := dxMemDataDate_To.AsDateTime;
  dsHeader.Open;

  dsBody.ParamByName( 'begin_date' ).AsDate := dxMemDataDate_From.AsDateTime;
  dsBody.ParamByName( 'end_date' ).AsDate   := dxMemDataDate_To.AsDateTime;
  dsBody.Open;
  // --- generate report
  try
    xlrNoticeKindPay.Report(True);
    ModalResult := mrOk;
  except on e:exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end; end;
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
end;

procedure TfdcReportDateForm_DateToForm.dxMemDataDate_FromChange(Sender: TField);
begin
  inherited;
  if (dxMemDataDate_From.Value > dxMemDataDate_To.Value) then
    begin
      dxMemDataDate_To.Value := dxMemDataDate_From.Value;
    end;
end;

end.
