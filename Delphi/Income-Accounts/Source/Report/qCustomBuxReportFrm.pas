unit qCustomBuxReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomReportFrm, Menus, cxLookAndFeelPainters, cxGraphics,
  FDCCustomDataset, fdcQuery, Oracle, OracleData, xlcClasses, xlEngine,
  xlReport, DB, dxmdaset, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxTextEdit, cxMaskEdit, cxCalendar, cxDBEdit,
  StdCtrls, cxButtons, cxControls, IniFiles, MainDM, QueryList;

type
  TqCustomBuxReportForm = class(TqCustomReportForm)
    dsFooter: TfdcQuery;
    dsMemDataDepartmen: TStringField;
    dsMemDataCustomsLevel: TIntegerField;
    chkIsTs: TcxDBCheckBox;
    lciIsTs: TdxLayoutItem;
    dsMemDataISTS: TStringField;
    qlSQL: TQueryList;
    sqlAddReport: TsqlOp;
    dsMemDataReportId: TFloatField;
    sqlUpdReport: TsqlOp;
    procedure dsReportBeforeOpen(DataSet: TDataSet);
    procedure dsFooterBeforeOpen(DataSet: TDataSet);
    procedure dsMemDataAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure chkIsTsPropertiesEditValueChanged(Sender: TObject);
  private
    fBuxReport : TBuxReport;
    fDateReport: Variant;
    fReportID: Integer;
    fReportNumber: String;
    fCurrCode: String;
    fCurrID: Integer;
    fists: String;
    fisnew: boolean;
    function GetAccounts : string;
  protected
    function GetSysName  : string; override;
    function GetEvtNumber: string; override;
  public
    { Public declarations }
    constructor Create(Sender: TObject);
    class procedure ShowReport(aSession : TOracleSession; AReport : TBuxReport; aFields:TFields);
    property DateReport: Variant read fDateReport write fDateReport;
    property ReportID: Integer read fReportID write fReportID;
    property ReportNumber: String read fReportNumber write fReportNumber;
    property CurrCode: String read fCurrCode write fCurrCode;
    property CurrID: Integer read fCurrID write fCurrID;
    property ists: String read fists write fists;
    property isnew: boolean read fisnew write fisnew;
  end;



implementation

uses StrUtils;

{$R *.dfm}

constructor TqCustomBuxReportForm.Create(Sender: TObject);
begin
  inherited Create(nil);
  
  fDateDivider := '';
  fTimeDivider := '=';
  fDateFormat  := 'YYYY-MM-DD';
  fTimeFormat  := 'HH-MM-SS';
end;

function TqCustomBuxReportForm.GetAccounts: string;
var
  AccountIniFile: TMemIniFile;
  SectionStrings: TStrings;
  FileName      : string;
  AccountList   : TStrings;
begin
  FileName := ExtractFilePath(xlrReport.XLSTemplate)+ TemplateName + '.sql';

  // а есть ли файл с настройками?
  if not(FileExists(FileName))
  then
    raise Exception.CreateFmt('Ошибка получения ini файла отчета [%s]!', [FileName]);

  SectionStrings := nil;
  SectionStrings := TStringList.Create();
  AccountIniFile := TMemIniFile.Create(FileName);

  try
    // читаем секции, нас интересуют секции со счетами в разбивке по уровню таможен
    AccountIniFile.ReadSections(SectionStrings);
    if    (SectionStrings.IndexOf('FTSAccounts')    = -1)
       or (SectionStrings.IndexOf('RTUAccounts')    = -1)
       or (SectionStrings.IndexOf('CustomAccounts') = -1) then
      raise Exception.Create('Ошибка получения списка счетов в ini файле отчета');

    AccountList := TStringList.Create;
    // получаем счета для текущего уровня таможни
    case MainData.GetCustomsLevel of
      0       : AccountIniFile.ReadSectionValues( 'FTSAccounts',    AccountList );
      1       : AccountIniFile.ReadSectionValues( 'RTUAccounts',    AccountList );
      2, 3, 4 : AccountIniFile.ReadSectionValues( 'CustomAccounts', AccountList );
    else
      raise Exception.Create('Ошибка получения уровня таможни');
    end;

    Result:= AccountList.Text;              
    AccountList.Free;
  finally
    SectionStrings.Free;
    AccountIniFile.Free;
  end;
end;

procedure TqCustomBuxReportForm.dsReportBeforeOpen(DataSet: TDataSet);
  var l_index: Integer;
begin
  inherited;
  l_index:= dsReport.SQL.IndexOf('--GetAccounts--');
  if (l_index = -1) then
    begin
      raise Exception.Create('Не найдено место для вставки списка счетов!');
    end;
  dsReport.SQL[l_index]:= GetAccounts;
end;

procedure TqCustomBuxReportForm.dsFooterBeforeOpen(DataSet: TDataSet);
  var l_index: Integer;
begin
  inherited;
  l_index:= dsFooter.SQL.IndexOf('--GetAccounts--');
  if (l_index = -1) then
    begin
      raise Exception.Create('Не найдено место для вставки списка счетов!');
    end;
  dsFooter.SQL[l_index]:= GetAccounts;
end;

class procedure TqCustomBuxReportForm.ShowReport(aSession : TOracleSession; AReport: TBuxReport; aFields: TFields);
begin
  with Self.Create( nil ) do
    try
      Caption    := AReport.Name;
      fBuxReport := AReport;
      SetTemplateName( AReport.Template );
      if  ( 0 <> pos('0543011', AReport.Template ) ) then
        xlrReport.MacroAfter := 'autoHigh' ;

      SetSession( aSession );
      edtDateFrom.Properties.MinDate := AReport.DateFrom;
      edtDateTo.Properties.MinDate := AReport.DateFrom;
      if AReport.DateTo > 0 then
        begin
          edtDateFrom.Properties.MaxDate := AReport.DateTo;
          edtDateTo.Properties.MaxDate := AReport.DateTo;
        end;
      lciDateTo.Visible := AReport.ForPeriod;
      lcichbxXML.Visible := not(AReport.ForPeriod);
      if (AReport.ForPeriod) then
        begin
          lciDateFrom.Caption := 'Период с';
        end;
      //--
      if (aFields = nil) then
        begin
          isnew := true;
        end
      else
        begin
         DateReport := aFields.FieldByName('REP_DATE').Value;
         ReportID := aFields.FieldByName('ID').Value;
         ReportNumber := aFields.FieldByName('REP_NUMBER').Value;
         ists := aFields.FieldByName('IS_TS').Value;
         CurrCode := aFields.FieldByName('CURR_CODE').Value;
         //CurrID := aFields.FieldByName('').Value;
         isnew := false;
        end;
      //--
      ShowModal;
    finally
      Free;
    end;
end;

function TqCustomBuxReportForm.GetEvtNumber: string;
begin
  Result := fBuxReport.EvtCode;
end;

function TqCustomBuxReportForm.GetSysName: string;
begin
  Result := ''; //fBuxReport.SysName;
end;

procedure TqCustomBuxReportForm.dsMemDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  if MainData.GetCustomsLevel in [ 1, 4 ] then
    DataSet.FieldByName( 'Department' ).AsString := 'СФТД'
  else if MainData.GetCustomsLevel = 2 then
    DataSet.FieldByName( 'Department' ).AsString := 'ОТП'
  else if MainData.GetCustomsLevel = 0 then
    DataSet.FieldByName( 'Department' ).AsString := 'ГУФТДиТР'
  else
    DataSet.FieldByName( 'Department' ).AsString := '';

  DataSet.FieldByName( 'CustomsLevel' ).AsInteger := MainData.GetCustomsLevel;
end;

procedure TqCustomBuxReportForm.FormShow(Sender: TObject);
begin
  inherited;
  if not(isnew) then
    begin
      dsMemDataReportId.Value := ReportID;
      dsMemDataDateFrom.Value := DateReport;
      dsMemDataDateTo.Value := dsMemDataDateFrom.Value;
      dsMemDataISTS.Value := ists;
      dsMemData.FieldByName('CurrID').AsFloat := cmbxCurrency.Properties.ListSource.DataSet.Lookup( 'CODE', CurrCode, 'ID' );
      //--
      edtDateFrom.Enabled := false;
      chkIsTs.Enabled := false;
      cmbxCurrency.Enabled := false;
      chbxXML.Visible := not(chkIsTs.Checked);
      //--
    end
  else
    begin
      lciIsTs.Visible := False;
    end;
end;

procedure TqCustomBuxReportForm.actOkExecute(Sender: TObject);
  var l_itogo: Double;
      l_count: Integer;
      fieldNme: string;
begin
  l_count := 0;
  fieldNme := 'RegSum';
  if  ( 0 <> pos('0543011', TemplateName ) ) then
    fieldNme := 'Sal';

  repeat
    if (isnew)and not(fBuxReport.ForPeriod) then
      begin
        sqlAddReport.ParamValues['prepdate']:= dsMemDataDateFrom.Value;
        sqlAddReport.ParamValues['preport_type']:= fBuxReport.ID;
        sqlAddReport.ParamValues['pcurrency']:= dsMemDataCurrId.Value;
        sqlAddReport.ParamValues['pists']:= ifthen((l_count = 0),'N','Y');//--dsMemDataISTS.Value;
        sqlAddReport.ParamValues['pid']:= dsMemDataReportId.Value;
        sqlAddReport.Exec;
        dsMemDataReportId.Value := sqlAddReport.ParamValues['id'];
      end;
    //--
    inherited;
    //--
    if (dsReport.Active)and not(fBuxReport.ForPeriod) then
      begin
        dsReport.First;
        l_itogo := 0;
        while not(dsReport.Eof) do
          begin
            if (not dsReport.FieldByName('KbkCode').IsNull) then
               l_itogo := l_itogo + dsReport.Fields.FieldByName( fieldNme ).AsFloat;
            dsReport.Next;
          end;
        //--
        sqlUpdReport.ParamValues['report_id']:= dsMemDataReportId.Value;
        sqlUpdReport.ParamValues['template_name']:= fBuxReport.Template;
        sqlUpdReport.ParamValues['itogo']:= l_itogo;
        sqlUpdReport.Exec;
        //--
      end;
    inc(l_count);
  until (fBuxReport.ForPeriod) or not(isnew) or (l_count >= 2);
end;

procedure TqCustomBuxReportForm.chkIsTsPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  chbxXML.Checked := false;
  chbxXML.Visible := not(TcxDBCheckBox(Sender).Checked);
end;

end.
