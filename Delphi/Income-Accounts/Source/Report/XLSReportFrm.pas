unit XLSReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle,
  FDCCustomDataset, fdcQuery, QueryList, DB, OracleData, dxmdaset,
  xlcClasses, xlEngine, xlReport;

type
  TXLSReportForm = class(TfdcCustomDlgForm)
    dsHeader: TfdcQuery;
    dsData: TfdcQuery;
    xlReport: TxlReport;
    dsParam: TdxMemData;
    srcParam: TDataSource;
    dsParamCUSTOMS_NAME: TStringField;
    dsParamCUSTOMS_CODE: TStringField;
    dsParamSYSDATE: TDateField;
    procedure actOkExecute(Sender: TObject);
    procedure dsParamAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    function ExistsSource( ADataSet: TDataSet ): boolean;
  protected
    procedure SetSession(ASession: TOraclesession); virtual;
    procedure CheckParams; virtual; //проверка параметров перед построением отчета
    procedure TransferParams; virtual; //передача параметров в отчет
    procedure CreateDataSources; virtual; //Создание источников данных для отчета в RunTime, т.к. не работает наследование форм в случае содания их в DesignTime
  public
    class procedure ExecuteReport(const ACaption: string = ''; const ATemplateFile: string = ''); virtual;
  end;

  TXLSReportClass = class of TXLSReportForm;

implementation

uses qReportUtil, MainDm, StrUtils, fdcMessages, fdcUtils;

{$R *.dfm}

{ TXLSReportForm }

procedure TXLSReportForm.SetSession(ASession: TOraclesession);
var
  i: integer;
begin
  for i:=0 to ComponentCount-1 do
  begin
    { TfdcQuery }
    if (Components[i] is TfdcQuery) and
       (not Assigned((Components[i] as TfdcQuery).Session)) then
      (Components[i] as TfdcQuery).Session := ASession;

    { TOracleDataset }
    if (Components[i] is TOracleDataset) and
       (not Assigned((Components[i] as TOracleDataset).Session)) then
      (Components[i] as TOracleDataset).Session := ASession;

    { TOracleQuery }
    if (Components[i] is TOracleQuery) and
       (not Assigned((Components[i] as TOracleQuery).Session)) then
      (Components[i] as TOracleQuery).Session := ASession;

    { TOraclePackage }
    if (Components[i] is TOraclePackage) and
       (not Assigned((Components[i] as TOraclePackage).Session)) then
      (Components[i] as TOraclePackage).Session := ASession;

    { TQueryList }
    if (Components[i] is TQueryList) and
       (not Assigned((Components[i] as TQueryList).Session)) then
      (Components[i] as TQueryList).Session := ASession;

  end;
end;

class procedure TXLSReportForm.ExecuteReport(const ACaption: string = ''; const ATemplateFile: string = '');
  var
    vFileName: TFileName;
    F: TXLSReportForm;
begin
  F := Self.Create(Application);
  with F do
  Try
    if ACaption <> '' then
      Caption := ACaption;
    vFileName := IfThen( Trim(ATemplateFile) = EmptyStr, xlReport.XLSTemplate, Trim(ATemplateFile));
    vFileName := ExtractFilePath(Application.ExeName)+'Report\'+ ChangeFileExt(ExtractFileName(vFileName), '.xls');
    if FileExists(vFileName) then
      xlReport.XLSTemplate := vFileName
    else
      raise Exception.CreateFmt('Не найден шаблон отчета [%s]!', [vFileName]);
    LoadReportQueryEx(F, xlReport.XLSTemplate);
    SetSession(MainData.Session);
    ShowModal;
  finally
    free;
  end;
end;

procedure TXLSReportForm.CheckParams;
begin
  dsParam.CheckBrowseMode;
end;

procedure TXLSReportForm.actOkExecute(Sender: TObject);
begin
  inherited;
  CreateDataSources;
  CheckParams;
  TransferParams;
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

procedure TXLSReportForm.TransferParams;
 var
   i: Integer;
begin
  for i:=0 to dsParam.FieldCount - 1 do
    if dsParam.Fields[i].Visible then
    with xlReport.Params.Add do
    begin
      case dsParam.Fields[i].DataType of
        ftDate, ftDateTime:  AsDateTime := dsParam.Fields[i].Value;
        ftInteger : AsInteger := dsParam.Fields[i].Value;
        ftString: AsString := VarToStr(dsParam.Fields[i].Value);
        ftFloat, ftCurrency: AsFloat := dsParam.Fields[i].Value;
        ftBoolean : AsBoolean := dsParam.Fields[i].Value;
      else
        Value := dsParam.Fields[i].Value;
      end;
      Name := dsParam.Fields[i].FieldName;
    end;
  with xlReport.Params.Add do
  begin
    Name := 'SYSDATE_TEXT';
    Value := DateAsText(dsParamSYSDATE.Value);
  end;
end;

procedure TXLSReportForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  DataSet.Insert;
  dsParamCUSTOMS_NAME.Value := MainData.GetSystemValue('CustomsName', rvString);
  dsParamCUSTOMS_CODE.Value := MainData.GetCustomsCode;
  dsParamSYSDATE.Value      := MainData.GetServerDate;
end;

procedure TXLSReportForm.FormShow(Sender: TObject);
begin
  inherited;
  if not dsParam.Active then
    dsParam.Open;
end;

function TXLSReportForm.ExistsSource(ADataSet: TDataSet): boolean;
 var
   i: integer;
begin
  Result := False;
  for i := 0 to xlReport.DataSources.Count - 1 do
    if xlReport.DataSources[i].DataSet = ADataSet then
      begin
        Result := True;
        Break;
      end;
end;

procedure TXLSReportForm.CreateDataSources;
begin
  if (Trim(dsHeader.SQL.Text) <> EmptyStr) and
     not ExistsSource(dsHeader) then
   with xlReport.DataSources.Add do
   begin
     DataSet := dsHeader;
     Alias := 'dsHeader';
   end;
  if (Trim(dsData.SQL.Text) <> EmptyStr) and
      not ExistsSource(dsData) then
   with xlReport.DataSources.Add do
   begin
     DataSet := dsData;
     Range := 'rngData';
     Alias := 'dsData';
   end;
end;

initialization
  RegisterClass(TXLSReportForm);
end.
