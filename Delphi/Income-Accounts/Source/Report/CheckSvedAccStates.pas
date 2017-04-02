unit CheckSvedAccStates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, DB, Oracle, dxmdaset,
  xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit;

type
  TcheckSvedAccStatesForm = class(TfdcCustomDlgForm)
    dsSysValues: TfdcQuery;
    dsLong: TfdcQuery;
    dsHeader: TfdcQuery;
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
    edtRepDate: TcxDBDateEdit;
    lciReport_Date: TdxLayoutItem;
    dxMemDataCustomsCode: TStringField;
    dsHeaderdate_report: TStringField;
    dsHeaderCustomsName: TStringField;
    dsHeaderCustomsCode: TStringField;
    dxMemDatadate_rep: TDateField;
    dsTotals: TfdcQuery;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lciINN: TdxLayoutItem;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lciKPP: TdxLayoutItem;
    dxMemDataINN: TStringField;
    dxMemDataKPP: TStringField;
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
  F: TcheckSvedAccStatesForm;
begin
  F := TcheckSvedAccStatesForm.Create(nil);
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

procedure TcheckSvedAccStatesForm.FormCreate(Sender: TObject);
begin
  inherited;
  dxMemData.Open;
  dxMemData.Insert;
  dxMemDatadlgDate_From.Value := trunc( Now - 1 );
  dxMemDatadlgDate_To.Value := dxMemDatadlgDate_From.Value;
  dxMemDataINNReport.Value := 0;

  edtRepDate.Properties.MaxDate := trunc( Now - 1 );

end;

procedure TcheckSvedAccStatesForm.actOkExecute(Sender: TObject);
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

end.
