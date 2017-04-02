unit CheckSvedAccDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, DB, Oracle, dxmdaset,
  xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TCheckSvedAccDocsForm = class(TfdcCustomDlgForm)
    dsHeader: TfdcQuery;
    dsHeaderCustomsName: TStringField;
    dsHeaderCustomsCode: TStringField;
    xlrAvansLong: TxlReport;
    srcdsMain: TDataSource;
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
    dsTotals: TfdcQuery;
    dsSysValues: TfdcQuery;
    dsLong: TfdcQuery;
    edtRepDate: TcxDBDateEdit;
    lcidateReport: TdxLayoutItem;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lciINN: TdxLayoutItem;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lciKPP: TdxLayoutItem;
    dxMemDataINN: TStringField;
    dxMemDataKPP: TStringField;
    dsHeaderdate_report: TStringField;
    dsHeaderINN: TStringField;
    dsHeaderKPP: TStringField;
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
  F: TCheckSvedAccDocsForm;
begin
  F := TCheckSvedAccDocsForm.Create(nil);
  with F do
  try
    // --- init Sessions
    dsSysValues.Session := Session;
    dsHeader.Session := Session;
    dsLong.Session := Session;
    dsTotals.Session:= Session;
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

procedure TCheckSvedAccDocsForm.FormCreate(Sender: TObject);
begin
  inherited;
  dxMemData.Open;
  dxMemData.Insert;

  edtRepDate.Properties.MaxDate := trunc( Now - 1 );
  dxMemDatadlgDate_From.Value := trunc( Now - 1 );

end;

procedure TCheckSvedAccDocsForm.actOkExecute(Sender: TObject);
begin
  dxMemDataDate_Now.Value := Trunc( Now );
  dxMemData.UpdateRecord;
  //--
  dsHeader.Close;
  dsLong.Close;

  //--
  // Собственно передача параметра
  dxMemDatadate_rep.Value :=dxMemDatadlgDate_From.Value;

  CheckDate(dxMemDatadate_rep);
  //dsLong.SQL.Text := Format(BaseSQLLong, ['--', 'NULL']);
  dsLong.Params.ParseSQL(dsLong.SQL.Text, True);
  // --- генерация отчета
  try
    dsHeader.Open;
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
