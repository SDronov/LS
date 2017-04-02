unit checkSvedCustomReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, xlcClasses,
  xlEngine, xlReport, FDCCustomDataset, fdcQuery, DB, Oracle, dxmdaset, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit;

type
  TCheckSvedCustomReportForm = class(TfdcCustomDlgForm)
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
    srcdsMain: TDataSource;
    dsSysValues: TfdcQuery;
    dsLong: TfdcQuery;
    dsHeader: TfdcQuery;
    xlrAvansLong: TxlReport;
    edtDate_from: TcxDBDateEdit;
    lciDateFrom: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    lciDateTo: TdxLayoutItem;
    procedure actOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  F: TCheckSvedCustomReportForm;
begin
  F := TCheckSvedCustomReportForm.Create(nil);
  with F do
  try
    // --- init Sessions
    dsSysValues.Session := Session;
    dsHeader.Session := Session;
    dsLong.Session := Session;

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

procedure TCheckSvedCustomReportForm.actOkExecute(Sender: TObject);
begin
  dxMemDataDate_Now.Value := Trunc( Now );
  dxMemData.UpdateRecord;
  //--
  dsHeader.Close;
  dsLong.Close;
  //--
  dxMemDataDate_From.Value :=dxMemDatadlgDate_From.Value;
  dxMemDataDate_To.Value   := dxMemDatadlgDate_To.Value;
  CheckDate(dxMemDataDate_From);
  CheckDate(dxMemDataDate_To);
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);
                               
  //dsLong.SQL.Text := Format(BaseSQLLong, ['--', 'NULL']);

  dsLong.Params.ParseSQL(dsLong.SQL.Text, True);
  //--

  // --- заполнение полей из системных значений
{
  dsSysValues.Open;
  dsSysValues.First;
  while not dsSysValues.Eof do
    begin
      if (dsSysValues.FieldByName('SysName').AsString = 'BossName') then
        dxMemDataBossName.AsString := dsSysValues.FieldByName('StringValue').AsString
      else if (dsSysValues.FieldByName('SysName').AsString = 'CustomsName') then
        dxMemDataCustomsName.AsString := dsSysValues.FieldByName('StringValue').AsString;
      dsSysValues.Next;
    end;
  dsSysValues.Close;
  }
  // --- формирование строки периода
  //dxMemDataPeriod.AsString := 'c ' + dxMemDataDate_From.AsString + '  по  ' + dxMemDataDate_To.AsString;

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

procedure TCheckSvedCustomReportForm.FormCreate(Sender: TObject);
begin
  inherited;
  dxMemData.Open;
  dxMemData.Insert;
  dxMemDatadlgDate_From.Value := trunc( Now - 1 );
  dxMemDatadlgDate_To.Value := dxMemDatadlgDate_From.Value;
  edtDate_From.Properties.MaxDate := trunc( Now - 1 );
end;

end.
