unit qCustomReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, DB, dxmdaset, xlcClasses, xlEngine,
  xlReport, OracleData, Oracle, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcQuery, fdcObjectLookupEdit, FDCCustomDataset,
  cxCheckBox, MainDM, Registry, fdcCustomFrm;

type
  TqCustomReportForm = class(TfdcCustomDlgForm)
    dsMemData: TdxMemData;
    edtDateFrom: TcxDBDateEdit;
    lciDateFrom: TdxLayoutItem;
    dsMemDataDateFrom: TDateField;
    srcMemData: TDataSource;
    xlrReport: TxlReport;
    dsValueSys: TOracleDataSet;
    dsReportParam: TOracleDataSet;
    dsReportParamTEMPLATE_NAME: TStringField;
    qryCheckReport: TOracleQuery;
    dsMemDataCurrId: TFloatField;
    dsMemDataCurrName: TStringField;
    cmbxCurrency: TfdcObjectLookupEdit;
    lciCurrency: TdxLayoutItem;
    dsHeader: TfdcQuery;
    dsReport: TfdcQuery;
    dsXML: TfdcQuery;
    dlgSave: TSaveDialog;
    chbxXML: TcxCheckBox;
    lcichbxXML: TdxLayoutItem;
    dsCheckRate: TfdcQuery;
    lciDateTo: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dsMemDataDateTo: TDateField;
    procedure actOkExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsMemDataDateFromChange(Sender: TField);
  protected
    FTemplateName : String;
    FQuerysFileName : String;
    // в dsMemData вносятся поля из fdc_value_lst_sys; dsMemData устанавливается в режим редактирования
    procedure GetSysValues; virtual;
    procedure GetReportParam; virtual;
    function  GetSysName: string; virtual;
    function  GetEvtNumber: string; virtual;
    procedure XMLSave(aFileName: string = '');
    procedure SetSession(aSession : TOracleSession);
    procedure SetTemplateName ( AValue : string );
  public
    fDateDivider: string;
    fTimeDivider: string;
    fDateFormat: string;
    fTimeFormat: string;
    constructor Create(Sender: TObject);
    property TemplateName : string read FTemplateName;
    function ExecReport(aSession: TOracleSession): boolean;
  end;

implementation

{$R *.dfm}

uses
  DateUtils,
  qReportUtil;

const
  cReportDir    = 'Report\';
  cFldSysPrefix = 'Sys';
  cFldSysName   = 'SysName';
  cFldStrValue  = 'StringValue';
  cFldDefSize   = 400;
  cXMLRow       = 'xml_row';
  cXMLext       = '.xml';


function GetAppRegistryValue(const Name: string; const Default: string = ''): String;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKeyReadOnly(TfdcCustomForm(Application.MainForm).AppRegistryKey) then
      Result := Reg.ReadString(Name);
  finally
    Reg.Free;
  end;
  if Result = '' then
     Result := Default;
end;

procedure SetAppRegistryValue(const Name: String; const Value: Variant);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(TfdcCustomForm(Application.MainForm).AppRegistryKey, True) then
    begin
      case VarType(Value) of
       varString: Reg.WriteString(Name, Value);
       varInteger: Reg.WriteInteger(Name, Value);
       varBoolean: Reg.WriteBool(Name, Value);
      end;
    end;
  finally
    Reg.Free;
  end;
end;



constructor TqCustomReportForm.Create(Sender: TObject);
begin
  inherited Create(nil);

  fDateDivider := 'D';
  fTimeDivider := 'T';
  fDateFormat  := 'YYYYMMDD';
  fTimeFormat  := 'HHMMSS';
end;

procedure TqCustomReportForm.GetReportParam;
begin
//  ShowMessage(IntToStr(dsReportParam.RecordCount));
  if dsReportParam.RecordCount = 0 then
    raise exception.Create(Format('Не найден отчет по системному имени [%s]', [GetSysName]));
end;

procedure TqCustomReportForm.actOkExecute(Sender: TObject);
var
  fs : TFormatSettings;
  fRepDir: string;
begin
  dsMemData.UpdateRecord;
  // -- check date
  qryCheckReport.SetVariable('DateFrom', dsMemDataDateFrom.Value);
  qryCheckReport.Execute;
  if (lciDateTo.Visible) then
    begin
      qryCheckReport.SetVariable('DateFrom', dsMemDataDateTo.Value);
      qryCheckReport.Execute;
    end;
  // -- check currency
  if lciCurrency.Visible then
  begin
    if dsMemDataCurrId.IsNull then
      raise exception.Create('Необходимо выбрать валюту')
    else
      try
        dsCheckRate.Open;
      finally
        dsCheckRate.Close;
      end;
  end;
  // -- get report param
  {dsReportParam.SetVariable('DateFrom', dsMemDataDateFrom.Value);
  dsReportParam.SetVariable('SysName', GetSysName);
  dsReportParam.Open;
  GetReportParam;
  dsReportParam.Close;}
  // -- load query SQL
  LoadReportQuery(xlrReport);
  // -- save to XML
  fs := GetFormatSettings(fDateFormat, fTimeFormat);
  dlgSave.FileName := GetSysName + fDateDivider + DateToStr(Now, fs) + fTimeDivider + TimeToStr(Now,fs) + cXmlExt;
  fRepDir := GetAppRegistryValue('LastReportDir', '');
  if fRepDir='' then dlgSave.InitialDir := ExtractFilePath(Application.ExeName);

  if chbxXML.Checked then
  begin
    //if trim(fRepDir)='' then
      //begin

      if trim(fRepDir)<>'' then
      dlgSave.InitialDir := fRepDir;

        if dlgSave.Execute then
          begin
            XMLSave(dlgSave.FileName);
            fRepDir := ExtractFilePath(dlgSave.FileName);
            SetAppRegistryValue('LastReportDir', fRepDir);
          end;
      //end
    //else
      //XMLSave(fRepDir + dlgSave.FileName);
  end;

  MainData.RegisterEvent('REP', GetEvtNumber);
  // -- show report
  if (lciDateTo.Visible) then
    begin
       xlrReport.XLSTemplate := ChangeFileExt(xlrReport.XLSTemplate,'Period'+ExtractFileExt(xlrReport.XLSTemplate));
    end;
  xlrReport.Report(True);
  ModalResult := mrOk;
end;

procedure TqCustomReportForm.GetSysValues;
var
  Fld : TStringField;
  function GetMemDataName: string;
  begin
    Result := cFldSysPrefix + dsValueSys.FieldByName(cFldSysName).Value;
  end;
begin
  dsMemData.Active := False;
  dsValueSys.Open;
  dsValueSys.First;
  while not dsValueSys.Eof do
    if (dsMemData.FieldAddress(GetMemDataName) = nil) then
    begin
      Fld := TStringField.Create(dsMemData);
      Fld.FieldName := GetMemDataName;
      Fld.Size := cFldDefSize;
      Fld.DataSet := dsMemData;
      dsMemData.FieldDefs.Add(Fld.FieldName, Fld.DataType);
      dsValueSys.Next;
    end
    else
      dsValueSys.Next;
  dsMemData.Active := True;
  dsMemData.Insert;
  dsValueSys.First;
  while not dsValueSys.Eof do
  begin
    dsMemData.FieldByName(GetMemDataName).Value := dsValueSys.FieldByName(cFldStrValue).Value;
    dsValueSys.Next;
  end;
  dsValueSys.Close;
  dsMemDataDateFrom.Value := Trunc(Now);
  dsMemDataDateTo.Value := dsMemDataDateFrom.Value;
  dsMemData.FieldByName('CurrID').AsFloat := cmbxCurrency.Properties.ListSource.DataSet.Lookup( 'CODE', '643', 'ID' );
end;

procedure TqCustomReportForm.FormShow(Sender: TObject);
begin
  inherited;
  GetSysValues;
end;

procedure TqCustomReportForm.SetSession(aSession : TOracleSession);
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i].ClassName = 'TOracleDataSet' then
      TOracleDataSet(Components[i]).Session := aSession
    else if Components[i].ClassName = 'TOracleQuery' then
      TOracleQuery(Components[i]).Session := aSession
    else if Components[i].ClassName = 'TfdcQuery' then
      TfdcQuery(Components[i]).Session := aSession;
end;

procedure TqCustomReportForm.XMLSave(aFileName: string = '');
var
  f : TextFile;
  w : WideString;
begin
  if (aFileName = '') then
    raise exception.Create('Не задано имя XML файла');
  AssignFile(f, aFileName);
  Rewrite(f);
  dsXML.Open;
  while not dsXML.Eof do
  begin
    w := WideString(WideString(dsXML.FieldByName(cXMLRow).AsString));
    WriteLn(f, w);
    dsXML.Next;
  end;
  dsXML.Close;
  CloseFile(f);
end;

function  TqCustomReportForm.GetSysName: string;
begin
  Result := '';
end;

function  TqCustomReportForm.GetEvtNumber: string;
begin
  Result := '';
end;

function TqCustomReportForm.ExecReport(aSession: TOracleSession): boolean;
begin
  SetSession( aSession );

end;

procedure TqCustomReportForm.SetTemplateName(AValue: string);
begin
  if FTemplateName <> AValue then
    begin
      FTemplateName         := AValue;
      xlrReport.XLSTemplate := ExtractFilePath(Application.ExeName) + cReportDir + FTemplateName + '.xls';
    end;
end;

procedure TqCustomReportForm.dsMemDataDateFromChange(Sender: TField);
begin
  inherited;
  if not(lciDateTo.Visible) then
    begin
      dsMemDataDateTo.Value := Sender.Value;
    end
  else
    begin
      if (Sender.Value > dsMemDataDateTo.Value) then
        begin
          dsMemDataDateTo.Value := Sender.Value;
        end;
    end;
  if (dsMemData.State in [dsEdit]) then
    begin
      dsMemData.Post;
    end;
end;

end.

