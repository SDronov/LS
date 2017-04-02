unit CheckSvedControlConfirm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, FDCCustomDataset,
  fdcQuery, DB, dxmdaset, xlcClasses, xlEngine, xlReport, cxEdit, Oracle,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxDBEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TCheckSvedControlConfirmForm = class(TfdcCustomDlgForm)
    srcdsMain: TDataSource;
    xlrAvansLong: TxlReport;
    dxMemData: TdxMemData;
    dxMemDataBossName: TStringField;
    dxMemDataCustomsName: TStringField;
    dxMemDataSubj_Id: TFloatField;
    dxMemDataSubj_Name: TStringField;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    dxMemDataRest: TStringField;
    dxMemDataPeriod: TStringField;
    dxMemDatadlgDate_From: TDateField;
    dxMemDatadlgDate_To: TDateField;
    dxMemDataDate_Now: TDateField;
    dxMemDataINNReport: TIntegerField;
    dxMemDataSubj_INN: TStringField;
    dxMemDataCustomsCode: TStringField;
    dxMemDatadate_rep: TDateField;
    dxMemDataINN: TStringField;
    dxMemDataKPP: TStringField;
    dsTotals1: TfdcQuery;
    dsLong: TfdcQuery;
    dsHeader: TfdcQuery;
    dsHeaderINN: TStringField;
    dsHeaderKPP: TStringField;
    edtDate_from: TcxDBDateEdit;
    lciDateFrom: TdxLayoutItem;
    edtDate_to: TcxDBDateEdit;
    lciDateTo: TdxLayoutItem;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lciINN: TdxLayoutItem;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lciKPP: TdxLayoutItem;
    dsTotals2: TfdcQuery;
    dsHeaderdate_from: TStringField;
    dsHeaderdate_to: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    private
    { Private declarations }
    BaseSQLLong: string;
  public
    { Public declarations }
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation

{$R *.dfm}
 uses
  qReportUtil,
  fdcObjectServices,
  fdcCustomObjectGridFrm,
  CustomDeclGridFrm,
  PaymentOrderGridFrm,
  IniFiles, ObjectBufferFrm, SubjIntf, MainDm;

function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TCheckSvedControlConfirmForm;
begin
  F := TCheckSvedControlConfirmForm.Create(nil);
  with F do
  try
    // --- init Sessions

    dsHeader.Session := Session;
    dsLong.Session := Session;
    dsTotals1.Session:= Session;
    dsTotals2.Session:= Session;
    // --- prepare Template
    xlrAvansLong.XLSTemplate  := ExtractFilePath(Application.ExeName) + 'Report\' +
                                 ExtractFileName(F.xlrAvansLong.XLSTemplate);
    LoadReportQueryEx(F, xlrAvansLong.XLSTemplate);
    BaseSQLLong := dsLong.SQL.Text;
    Result := (F.ShowModal = mrOk);
  finally
    F.Free;
  end;
end;

procedure TCheckSvedControlConfirmForm.FormCreate(Sender: TObject);
begin
  inherited;
  dxMemData.Open;
  dxMemData.Insert;
  dxMemDatadlgDate_From.Value := trunc( Now - 1 );
  dxMemDatadlgDate_To.Value := dxMemDatadlgDate_From.Value;
  edtDate_From.Properties.MaxDate := trunc( Now - 1 );
end;

procedure TCheckSvedControlConfirmForm.actOkExecute(Sender: TObject);
begin
  dxMemDataDate_Now.Value := Trunc( Now );
  dxMemData.UpdateRecord;
  //--
  dsHeader.Close;
  dsLong.Close;

  //--
  // Собственно передача параметра
  dxMemDataDate_From.Value :=dxMemDatadlgDate_From.Value;
  dxMemDataDate_To.Value   := dxMemDatadlgDate_To.Value;
  CheckDate(dxMemDataDate_From);
  CheckDate(dxMemDataDate_To);
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);

  //dsLong.SQL.Text := Format(BaseSQLLong, ['--', 'NULL']);
  dsLong.Params.ParseSQL(dsLong.SQL.Text, True);
  //--
  // --- генерация отчета
  try
    //dsHeader.Open;
    dsLong.Open;
    xlrAvansLong.Report(True);

    MainData.RegisterEvent('REP','00002');

    ModalResult := mrOk;
  except
    on e: exception do
      begin
        e.Message := ReportError + e.Message;
        raise;
      end;
  end;

end;

end.
