unit fdcEventDelGtd_ChangeNPPUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, xlcClasses, xlEngine, xlReport, DB,
  FDCCustomDataset, fdcQuery, dxmdaset, Oracle, xlReportG2;

type
  TfdcEventDelGtd_ChangeNPPForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDate_From: TcxDBDateEdit;
    dsHeader: TfdcQuery;
    dxMemData: TdxMemData;
    dxMemDataDate_From: TDateField;
    srcMain: TDataSource;
    dsBody: TfdcQuery;
    dxMemDataFIO: TStringField;
    dxMemDataLOGIN: TStringField;
    dxMemDatareport_name: TStringField;
    xlrEvent: TxlReportG2;
    procedure actOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ExecReport(Session : TOracleSession): boolean;

var
  fdcEventDelGtd_ChangeNPPForm: TfdcEventDelGtd_ChangeNPPForm;

implementation

{$R *.dfm}

uses
  IniFiles,
  DateUtils,
  qReportUtil
 ,MainDM;

function ExecReport(Session : TOracleSession): boolean;
var
  Frm : TfdcEventDelGtd_ChangeNPPForm;
begin
  Frm := TfdcEventDelGtd_ChangeNPPForm.Create(nil);
  with Frm do
  try
    Result := False;
    // --- prepare template
    xlrEvent.XLSTemplate :=ExtractFilePath(Application.ExeName) + 'Report\' +
                             'EventDelGtd_ChangeNPP.xls';
    LoadReportQueryEx(Frm, xlrEvent.XLSTemplate);

    dsHeader.Session := Session;

    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDate_From.Value := Trunc(Now);

    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;

procedure TfdcEventDelGtd_ChangeNPPForm.actOkExecute(Sender: TObject);
begin
  dxMemData.CheckBrowseMode;
  // --- check input params
  CheckDate(dxMemDataDate_From);
  // --- open Query`s
  dsHeader.ParamByName( 'begin_date' ).AsDate := dxMemDataDate_From.AsDateTime;
  dsHeader.Open;
  dsBody.ParamByName( 'event_date' ).AsDate := dxMemDataDate_From.AsDateTime;
  dsBody.ParamByName( 'login' ).AsString   := dsHeader.FieldByName('login').AsString;
  dsBody.Open;
  // --- generate report
  try
    xlrEvent.Report(True);
    ModalResult := mrOk;
  except on e:exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end; end;
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
end;

end.
