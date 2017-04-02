unit qKNPKBKFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, DB, OracleData,
  xlcClasses, xlEngine, xlReport, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle;

type
  TqKNPKBKForm = class(TfdcCustomDlgForm)
    edtbDate: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtEDate: TcxDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    xlReport: TxlReport;
    dsMain3: TOracleDataSet;
    dsData3: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dsMainBeforeQuery(Sender: TOracleDataSet);
    procedure xlReportDataSources2BeforeDataTransfer(
      DataSource: TxlDataSource);
    procedure xlReportBeforeBuild(Report: TxlReport);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation

uses
  fdcUtils, DateUtils, MainDm, qReportUtil;

{$R *.dfm}

function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TqKNPKBKForm;
begin
  F := TqKNPKBKForm.Create(nil);
  try
    F.dsMain3.Session := Session;
    F.dsData3.Session := Session;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TqKNPKBKForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport.XLSTemplate;
  LoadReportQueryEx(TForm(Self), xlReport.XLSTemplate);
  edtbDate.Date := StartOfTheMonth(Date);
  edtEDate.Date := Date;
end;

procedure TqKNPKBKForm.actOkExecute(Sender: TObject);
var
 vDate: TDate;
 vYear, vMonth, vDay: Word;
begin
  vDate := edtbDate.EditValue;

  decodedate(vDate,vYear, vMonth, vDay);

  vDate := encodedate(vYear,1,1);
//  inherited;
  DisplayBusyCursor;
  dsMain3.Filtered := False;
  dsData3.Filtered := False;
  dsMain3.Close;
  dsMain3.SetVariable('FYEARSTART', vDate);
  dsMain3.Open;
  dsData3.Close;
  dsData3.SetVariable('FYEARSTART', vDate);
  dsData3.Open;
  xlReport.Report(True);
  ModalResult := mrOk;
end;

procedure TqKNPKBKForm.dsMainBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('FDATE', edtbDate.EditValue);
  Sender.SetVariable('EDATE', edtEDate.EditValue);
end;

procedure TqKNPKBKForm.xlReportDataSources2BeforeDataTransfer(
  DataSource: TxlDataSource);
begin
  inherited;
  dsMain3.Filtered := True;
  dsData3.Filtered := True;
end;

procedure TqKNPKBKForm.xlReportBeforeBuild(Report: TxlReport);
begin
  inherited;
  Report.ParamByName['SDATE'].AsDateTime := edtBDate.Date;
  Report.ParamByName['EDATE'].AsDateTime := edtEDate.Date;
end;

end.
