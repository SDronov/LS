unit qNoticeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, DB, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, dxmdaset,
  xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery,
  cxLookAndFeels, dxLayoutLookAndFeels, ActnList, dxLayoutControl,
  StdCtrls, cxButtons, cxControls, Oracle, Menus, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxGraphics;

type
  TqNoticeForm = class(TfdcCustomDlgForm)
    dsSysValues: TfdcQuery;
    xlrNotice: TxlReport;
    dxMemData: TdxMemData;
    edtDateFrom: TcxDBDateEdit;
    lciDate: TdxLayoutItem;
    dxMemDataDate_From: TDateField;
    srcMain: TDataSource;
    dxMemDataCustomInn: TStringField;
    dxMemDataCustomKPP: TStringField;
    dxMemDataCustomsName: TStringField;
    dxMemDataBossName: TStringField;
    dsMaster: TfdcQuery;
    srcMaster: TDataSource;
    dsSlave: TfdcQuery;
    dxMemDataPayBossName: TStringField;
    dxMemDataCustomsIA: TStringField;
    cmbxCurr: TfdcObjectLookupEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxMemDataCurr_Id: TFloatField;
    dxMemDataDate_To: TDateField;
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    dxMemDataCustomsCode: TStringField;
    dxMemDataPeriod: TStringField;
    procedure actOkExecute(Sender: TObject);
    procedure dxMemDataDate_FromChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure actHelpContextExecute(Sender: TObject);
  private
  public
  end;

function ExecReport(Session : TOracleSession): boolean;


implementation

{$R *.dfm}

uses
  IniFiles,
  qReportUtil;

procedure LoadReportQuery(AReport: TxlReport);
var
  IniFile: TMemIniFile;
  Strings: TStrings;
  I: Integer;
  AComp: TComponent;
begin
  Strings := nil;
  IniFile := TMemIniFile.Create(ChangeFileExt(AReport.XLSTemplate, '.sql'));
  try
    Strings := TStringList.Create;
    IniFile.ReadSections(Strings);
    for I := 0 to  AReport.DataSources.Count - 1 do
    begin
      if  (AReport.DataSources[I].DataSet is TfdcQuery) and
         (Strings.IndexOf(AReport.DataSources[I].DataSet.Name) > -1) then
          IniFile.ReadSectionValues(AReport.DataSources[I].DataSet.Name,
           TfdcQuery(AReport.DataSources[I].DataSet).SQL);
    end;
  finally
    IniFile.Free;
    Strings.Free;
  end;
end;


procedure ShowMsg(aText : string);
var
  TheDate : TDateTime;
begin
  TheDate := Now;
  aText := DateToStr(TheDate) + ' ' + TimeToStr(TheDate) + ' : ' + aText;
  ShowMessage(aText);
end;


function ExecReport(Session : TOracleSession): boolean;
var
  F : TqNoticeForm;
begin
  F := TqNoticeForm.Create(nil);
  with F do
  try
    Result := False;
    if (xlrNotice.XLSTemplate = '') then
      raise exception.Create('Нет соответствующего шаблона');
    LoadReportQuery(xlrNotice);
    // --- init session
    dsSysValues.Session := Session;
    dsMaster.Session := Session;
    dsSlave.Session := Session;
    // --- init dxMemData
    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDate_From.Value := Trunc(Now);
    dxMemDataDate_To.Value := Trunc(Now);
    // --- prepare template
    // --- get Result
    Result := (ShowModal = mrOk);
  finally
    F.Free;
  end;
end;


procedure TqNoticeForm.actOkExecute(Sender: TObject);
begin
  dxMemDataPeriod.AsString := dxMemDataDate_From.AsString + ' - ' + dxMemDataDate_To.AsString;
  dxMemData.UpdateRecord;
  if dxMemDataCurr_Id.IsNull then
    raise exception.Create('Необходимо выбрать валюту');
  CheckDate(dxMemDataDate_From);
  CheckDate(dxMemDataDate_To);
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);
  // --- open Query`s
  dsSysValues.Open;
  dsMaster.Open;
  dsSlave.Open;
  // --- fill System Values
  dsSysValues.First;
  while not dsSysValues.Eof do
  begin
    if (dsSysValues.FieldByName('SysName').AsString = 'CustomINN') then
      dxMemDataCustomInn.AsString := dsSysValues.fieldByName('StringValue').AsString
    else if (dsSysValues.FieldByName('SysName').AsString = 'CustomKPP') then
      dxMemDataCustomKPP.AsString := dsSysValues.fieldByName('StringValue').AsString
    else if (dsSysValues.FieldByName('SysName').AsString = 'CustomsName') then
      dxMemDataCustomsName.AsString := dsSysValues.fieldByName('StringValue').AsString
    else if (dsSysValues.FieldByName('SysName').AsString = 'BossName') then
      dxMemDataBossName.AsString := dsSysValues.fieldByName('StringValue').AsString
    else if (dsSysValues.FieldByName('SysName').AsString = 'PayBossName') then
      dxMemDataPayBossName.AsString := dsSysValues.fieldByName('StringValue').AsString
    else if (dsSysValues.FieldByName('SysName').AsString = 'CustomsIA') then
      dxMemDataCustomsIA.AsString := dsSysValues.fieldByName('StringValue').AsString
    else if (dsSysValues.FieldByName('SysName').AsString = 'CustomsCode') then
      dxMemDataCustomsCode.AsString := dsSysValues.fieldByName('StringValue').AsString;
    dsSysValues.Next;
  end;
  // --- generate Report
  try
    xlrNotice.Report(True);
    ModalResult := mrOk;
  except on e: exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end end;
  // --- close Query`s
  dsSysValues.Close;
  dsMaster.Close;
  dsSlave.Close;
end;


procedure TqNoticeForm.dxMemDataDate_FromChange(Sender: TField);
begin
  inherited;
  dxMemDataDate_To.Value := dxMemDataDate_From.Value;
end;


procedure TqNoticeForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlrNotice.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                           ExtractFileName(xlrNotice.XLSTemplate);
  LoadReportQuery(xlrNotice);
end;

procedure TqNoticeForm.actHelpContextExecute(Sender: TObject);
begin
  inherited;
  ShowReportContextHelp(Self.HelpContext);
end;


End.

