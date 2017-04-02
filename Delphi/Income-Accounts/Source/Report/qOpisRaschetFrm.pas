unit qOpisRaschetFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, Oracle, DB, dxmdaset, xlcClasses, xlEngine,
  xlReport, FDCCustomDataset, fdcQuery, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, Menus;

type
  TqOpisRaschetForm = class(TfdcCustomDlgForm)
    dxMemData: TdxMemData;
    dxMemDataBossName: TStringField;
    dxMemDataCustomsName: TStringField;
    xlrOpisRaschet: TxlReport;
    dxMemDataDate_From: TDateField;
    dsSysValues: TfdcQuery;
    srcMain: TDataSource;
    edtDate: TcxDBDateEdit;
    lciDate: TdxLayoutItem;
    dsCredit: TfdcQuery;
    dsDebet: TfdcQuery;
    dsdebetTotal: TfdcQuery;
    procedure actOkExecute(Sender: TObject);
    procedure actHelpContextExecute(Sender: TObject);
  private
  public
  end;


function ExecReport(Session : TOracleSession): boolean;


implementation

{$R *.dfm}

uses
  qReportUtil;


function ExecReport(Session : TOracleSession): boolean;
var
  F : TqOpisRaschetForm;
begin
  F := TqOpisRaschetForm.Create(nil);
  with F do
  try
    // --- init Session
    dsSysValues.Session := Session;
    dsDebet.Session := Session;
    dsCredit.Session := Session;
    dsDebetTotal.Session := Session;
    // --- prepare template
    xlrOpisRaschet.XLSTemplate := ExtractFilePath(Application.ExeName) + '\Report\' +
                                  ExtractFileName(xlrOpisRaschet.XLSTemplate);

    LoadReportQuery(xlrOpisRaschet);
    // -- prepare dxMemData
    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDate_From.Value := Trunc(Now);
    Result := (ShowModal = mrOk);
  finally
    F.Free;
  end;
end;


procedure TqOpisRaschetForm.actOkExecute(Sender: TObject);
begin
  dxMemData.UpdateRecord;
  // --- check input params
  CheckDate(dxMemDataDate_From);
  // --- open Query`s
  dsSysValues.Open;
  dsDebet.Open;
  dsCredit.Open;
  dsDebetTotal.Open;
  // --- fill SysValues
  dsSysValues.First;
  while not dsSysValues.Eof do
  begin
    if (dsSysValues.FieldByName('SysName').AsString = 'CustomsName') then
      dxMemDataCustomsName.AsString := dsSysValues.fieldByName('StringValue').AsString
    else if (dsSysValues.FieldByName('SysName').AsString = 'BossName') then
      dxMemDataBossName.AsString := dsSysValues.fieldByName('StringValue').AsString;
    dsSysValues.Next;
  end;
  // --- generate Report
  try
    xlrOpisRaschet.Report(True);
    ModalResult := mrOk;
  except on e:exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end; end;
  // --- close Query`s
  dsSysValues.Close;
  dsDebet.Close;
  dsCredit.Close;
  dsDebetTotal.Close;
  dxMemData.Close;
end;



procedure TqOpisRaschetForm.actHelpContextExecute(Sender: TObject);
begin
  inherited;
  ShowReportContextHelp(Self.HelpContext);
end;

Initialization
    RegisterClass(TqOpisRaschetForm);

End.

