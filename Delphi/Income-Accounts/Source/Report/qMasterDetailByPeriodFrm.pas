unit qMasterDetailByPeriodFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, DB, OracleData,
  xlcClasses, xlEngine, xlReport, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle,
  dxmdaset, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxDBEdit, cxGraphics;

type
  TqMasterDetailByPeriodForm = class(TfdcCustomDlgForm)
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsMaster: TOracleDataSet;
    dsDetail: TOracleDataSet;
    xlReport: TxlReport;
    dsParam: TdxMemData;
    srcParam: TDataSource;
    dsHeader: TOracleDataSet;
    dsParamDATE_FROM: TDateField;
    dsParamDATE_TO: TDateField;
    procedure actOkExecute(Sender: TObject);
    procedure dsHeaderBeforeQuery(Sender: TOracleDataSet);
    procedure dsParamAfterOpen(DataSet: TDataSet);
    procedure dsParamDATE_FROMChange(Sender: TField);
  private
    function GetReportName: string;
    procedure SetReportName(const Value: string);
    { Private declarations }
  public
    property ReportName: string read GetReportName write SetReportName;
  end;

  function  ExecReport(const AReportName : string): Boolean;

implementation

uses
  fdcUtils, DateUtils, MainDm, IniFiles, DictDm, Excel8G2, ActiveX,
  FormUtils, qReportUtil;

{$R *.dfm}

procedure SetSession(AForm: TForm; ASession: TOraclesession);
var
  i: integer;
begin
  for i:=0 to AForm.ComponentCount-1 do
  begin

    { TfdcQuery }
//    if (AForm.Components[i] is TfdcQuery) and
//       (not Assigned((AForm.Components[i] as TfdcQuery).Session)) then
//      (AForm.Components[i] as TfdcQuery).Session := ASession;
//

    { TOracleDataset }
    if (AForm.Components[i] is TOracleDataset) and
       (not Assigned((AForm.Components[i] as TOracleDataset).Session)) then
      (AForm.Components[i] as TOracleDataset).Session := ASession;

    { TOracleQuery }
    if (AForm.Components[i] is TOracleQuery) and
       (not Assigned((AForm.Components[i] as TOracleQuery).Session)) then
      (AForm.Components[i] as TOracleQuery).Session := ASession;

  end;
end;


function  ExecReport(const AReportName : string): Boolean;
var
  F: TqMasterDetailByPeriodForm;
begin
  F := TqMasterDetailByPeriodForm.Create(nil);
  try
    SetSession(F, MainData.Session);
    if not F.dsParam.Active then
      F.dsParam.Open;
    F.ReportName := AReportName;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TqMasterDetailByPeriodForm.actOkExecute(Sender: TObject);
begin
//  inherited;
  dsParam.CheckBrowseMode;
  // --- check input params
  CheckDate(dsParamDATE_FROM);
  CheckDate(dsParamDATE_TO);
  CmpDate(dsParamDATE_FROM, dsParamDATE_TO);

  //LSTST-2047
  //снимает мастер дитеил чтобы получать на экран не достаточно прав
  // а не Поле 'ID' не найдено"
  try
    dsMaster.Open;
  except
    dsDetail.Master:=nil;
  end;

  DisplayBusyCursor;
  try
    xlReport.Report(True);
    ModalResult := mrOk;
  except on e:exception do
    begin
      e.Message := ReportError + e.Message;
      raise;
    end;
  end;
end;

procedure TqMasterDetailByPeriodForm.dsHeaderBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('DATE_FROM', dsParamDATE_FROM.AsVariant);
  Sender.SetVariable('DATE_TO',   dsParamDATE_TO.AsVariant);
end;

procedure TqMasterDetailByPeriodForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Insert;
  dsParamDATE_FROM.Value := MainData.GetServerDate;
  dsParamDATE_TO.Value   := dsParamDATE_FROM.Value;
end;

function TqMasterDetailByPeriodForm.GetReportName: string;
begin
  Result := ExtractFileName( xlReport.XLSTemplate );
end;

procedure TqMasterDetailByPeriodForm.SetReportName(const Value: string);
begin
  xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\'
                        + ExtractFileName( Value );
  LoadReportQueryEx(TForm(Self), xlReport.XLSTemplate);
end;

procedure TqMasterDetailByPeriodForm.dsParamDATE_FROMChange(
  Sender: TField);
begin
  inherited;
  if (dsParamDATE_FROM.Value > dsParamDATE_TO.Value) then
    dsParamDATE_TO.Value := dsParamDATE_FROM.Value;
end;

end.
