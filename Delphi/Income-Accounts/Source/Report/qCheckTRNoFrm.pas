unit qCheckTRNoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, DB, OracleData,
  xlcClasses, xlEngine, xlReport, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle;

type
  TqCheckTRNoForm = class(TfdcCustomDlgForm)
    edtCC: TcxTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtbDate: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtEDate: TcxDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtMinNo: TcxMaskEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edtMaxNo: TcxMaskEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    xlReport: TxlReport;
    dsData: TOracleDataSet;
    dsDetail: TOracleDataSet;
    procedure dsDataBeforeQuery(Sender: TOracleDataSet);
    procedure xlReportBeforeBuild(Report: TxlReport);
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dsDetailBeforeQuery(Sender: TOracleDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation

uses
  fdcUtils, DateUtils, MainDM;

{$R *.dfm}

function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TqCheckTRNoForm;
begin
  F := TqCheckTRNoForm.Create(nil);
  try
    F.dsData.Session := Session;
    F.dsDetail.Session:= Session;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TqCheckTRNoForm.dsDataBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('FDATE', edtbDate.EditValue);
  Sender.SetVariable('EDATE', edtEDate.EditValue);
  Sender.SetVariable('CUSTOMS_CODE', edtCC.EditValue);
  Sender.SetVariable('MINNO', edtMinNo.EditValue);
  Sender.SetVariable('MAXNO', edtMaxNo.EditValue);
end;

procedure TqCheckTRNoForm.xlReportBeforeBuild(Report: TxlReport);
begin
  inherited;
  Report.ParamByName['BDATE'].Value := edtbDate.EditValue;
  Report.ParamByName['EDATE'].Value := edtEDate.EditValue;
end;

procedure TqCheckTRNoForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport.XLSTemplate;
  edtbDate.Date := StartOfTheYear(Date);
  edtEDate.Date := Date;
end;

procedure TqCheckTRNoForm.actOkExecute(Sender: TObject);
begin
//  inherited;
  DisplayBusyCursor;
  dsData.Close;
  dsDetail.Close;
  dsData.Open;
  dsDetail.Open;

//  MainData.RegisterEvent('REP','00000');

  xlReport.Report(True);
  ModalResult := mrOk;
end;

procedure TqCheckTRNoForm.dsDetailBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('FDATE', edtbDate.EditValue);
  Sender.SetVariable('EDATE', edtEDate.EditValue);
  Sender.SetVariable('MINNO', edtMinNo.EditValue);
  Sender.SetVariable('MAXNO', edtMaxNo.EditValue);
end;

end.
