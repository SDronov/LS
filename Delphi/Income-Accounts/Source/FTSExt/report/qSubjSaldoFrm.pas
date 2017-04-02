unit qSubjSaldoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, DB, OracleData,
  xlcClasses, xlEngine, xlReport, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle;

type
  TqSubjSaldoForm = class(TfdcCustomDlgForm)
    edtbDate: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtEDate: TcxDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsMain: TOracleDataSet;
    dsData: TOracleDataSet;
    xlReport: TxlReport;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dsMainBeforeQuery(Sender: TOracleDataSet);
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
  F: TqSubjSaldoForm;
begin
  F := TqSubjSaldoForm.Create(nil);
  try
    F.dsMain.Session := Session;
    F.dsData.Session := Session;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TqSubjSaldoForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport.XLSTemplate;
  LoadReportQueryEx(TForm(Self), xlReport.XLSTemplate);

  edtbDate.Date := StartOfTheYear(Date);
  edtEDate.Date := Date;
end;

procedure TqSubjSaldoForm.actOkExecute(Sender: TObject);
begin
//  inherited;
  DisplayBusyCursor;
  dsMain.Close;
  dsMain.Open;
  dsData.Open;
  xlReport.Report(True);
  ModalResult := mrOk;
end;

procedure TqSubjSaldoForm.dsMainBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('FDATE', edtbDate.EditValue);
  Sender.SetVariable('EDATE', edtEDate.EditValue);
end;

end.
