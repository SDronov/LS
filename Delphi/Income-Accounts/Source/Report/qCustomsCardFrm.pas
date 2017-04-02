unit qCustomsCardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, FDCCustomDataset,
  fdcQuery, DB, dxmdaset, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxLookAndFeels,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls, cxButtons,
  cxControls, xlcClasses, xlEngine, xlReport, Oracle;

type
  TQCustomsCardForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    edtTo: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtFrom: TcxDBDateEdit;
    dxMemData1: TdxMemData;
    dxMemData1FROM_DATE: TDateField;
    dxMemData1TO_DATE: TDateField;
    srcMain: TDataSource;
    dsDeclMain: TfdcQuery;
    xlrDeclarant: TxlReport;
    procedure actOkExecute(Sender: TObject);
  private
  public
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation

{$R *.dfm}

uses
  qReportUtil;

function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TQCustomsCardForm;
begin
  F := TQCustomsCardForm.Create(nil);
  try
    F.dsDeclMain.Session := Session;
    F.dxMemData1.Open;
    F.dxMemData1.Insert;
    F.dxMemData1FROM_DATE.Value := Now;
    F.dxMemData1TO_DATE.Value := Now;
    F.xlrDeclarant.XLSTemplate := ExtractFilePath(Application.ExeName) + 'report\' +
                                  ExtractFileName(F.xlrDeclarant.XLSTemplate);
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;


procedure TQCustomsCardForm.actOkExecute(Sender: TObject);
begin
  dxMemData1.UpdateRecord;
  // --- check input params
  CheckDate(dxMemData1From_Date);
  CheckDate(dxMemData1To_Date);
  CmpDate(dxMemData1From_Date, dxMemData1To_Date);
  dsDeclMain.Open;
  try
    xlrDeclarant.Report(True);
    ModalResult := mrOk;
  except on e: exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end; end;
end;


End.
