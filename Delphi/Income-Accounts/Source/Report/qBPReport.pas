unit qBPReport;

interface

uses
  SysUtils, Classes, MainDm, dxmdaset, DB, OracleData, xlcClasses,
  xlEngine, xlReport, FDCCustomDataset, fdcQuery;

type
  TBPReport = class(TDataModule)
    xlrKNP: TxlReport;
    dsHeader: TfdcQuery;
    dsReport: TfdcQuery;
    dsTotal: TfdcQuery;
    dsTotalKBK: TfdcQuery;
    dsCharges: TfdcQuery;
    dsKBK: TfdcQuery;
    mdsRep: TdxMemData;
    procedure DataModuleCreate(Sender: TObject);
    procedure xlrKNPBeforeBuild(Report: TxlReport);
  private
    FFirstIndex : integer;
    procedure AddRecordAsField( ADest, ASource : TDataSet);
    procedure PrepareReport;
  public
    { Public declarations }
    procedure ShowExcelReport(const Id: double; const AFileName: string = '');
  end;

implementation

uses
  qReportUtil, Variants, IniFiles, Excel8G2, Forms, Math;

{$R *.dfm}

procedure TBPReport.DataModuleCreate(Sender: TObject);

  var
    vName : TFileName;
begin
  xlrKNP.XLSTemplate := ExtractFilePath(Application.ExeName) + '\Report\' +
                             ExtractFileName(xlrKNP.XLSTemplate);

  if MainData.GetCustomsLevel = 2 then
    vName := '_T.sql'
  else
    vName := '.sql';

  LoadReportQueryEx(TForm(Self), ChangeFileExt(xlrKNP.XLSTemplate, vName));

end;

procedure TBPReport.AddRecordAsField( ADest, ASource : TDataSet);
  var
    FF : TFloatField;
    FFName : string;
begin
  if not Assigned(ADest) or not Assigned(ASource) then exit;
  FFirstIndex := -1;
  if ADest.Active then ADest.Close;
  if not ASource.Active then ASource.Open;
  ASource.First;
  // Добавим поля с суммами по КБК
  while not ASource.Eof do
  begin
    FFName := ASource.FieldByName('PAY_TYPE').AsString + '_'+ASource.FieldByName('KBKCode').AsString;
    if ADest.FieldDefs.IndexOf(FFName) < 0 then
    begin
      FF := TFloatField.Create(ADest);
      FF.FieldName := FFName;
      FF.DisplayLabel := StringReplace(FFName, '_', '       ', [rfReplaceAll, rfIgnoreCase]);
      FF.DataSet := ADest;
      ADest.FieldDefs.Add(FF.FieldName, FF.DataType);
      if FFirstIndex = -1 then
        FFirstIndex := FF.Index;      
    end;
    ASource.Next;
  end;
end;


procedure TBPReport.PrepareReport;
  var
    FF : TFloatField;
    FFName : string;
    i : integer;
begin
  if not dsReport.Active then
    dsReport.Open;
  if not dsCharges.Active then
    dsCharges.Open;
  mdsRep.CreateFieldsFromDataSet(dsReport);
  AddRecordAsField(mdsRep, dsKBK);
  mdsRep.LoadFromDataSet(dsReport);
  mdsRep.DisableControls;
  dsCharges.DisableControls;
  Try
    // Заполним все суммы по КБК нулями
    mdsRep.First;
    while not mdsRep.Eof do
    begin
      mdsRep.Edit;
      for i := FFirstIndex to mdsRep.FieldCount - 1 do
        if mdsRep.Fields[i] is TFloatField then
          mdsRep.Fields[i].Value := 0;
      mdsRep.Post;    
      mdsRep.Next;
    end;      
    dsCharges.First;
    // Заполним суммы списаний по КБК для каждой ДТ
    while not dsCharges.Eof do
    begin
      FFName := dsCharges.FieldByName('PAY_TYPE').AsString + '_'+dsCharges.FieldByName('KBKCode').AsString;
      FF     := mdsRep.FindField(FFName) as TFloatField;
      if ( mdsRep.Locate('decl_id', dsCharges.FieldValues['decl_id'], [loCaseInsensitive])) and
         Assigned(FF) then
        begin
          mdsRep.Edit;
          FF.Value := dsCharges.FieldValues['Summa'];
          mdsRep.Post;
        end;

      dsCharges.Next;
    end;
  finally
    mdsRep.EnableControls;
    dsCharges.EnableControls;
  end;
end;

procedure TBPReport.ShowExcelReport(const Id: double;
  const AFileName: string);
begin
  dsHeader.Params[0].AsFloat := id;
  dsReport.Params[0].AsFloat := id;
  dsTotal.Params[0].AsFloat := id;
  dsTotalKBK.Params[0].AsFloat := id;
  dsCharges.Params[0].AsFloat := id;
  dsKBK.Params[0].AsFloat := id;
  
  dsHeader.Open;
  dsReport.Open;
  dsTotal.Open;
  dsTotalKBK.Open;
  dsCharges.Open;
  dsKBK.Open;
  PrepareReport;
  if AFileName <> '' then
    begin
      xlrKNP.Options := xlrKNP.Options +
         [xroNewInstance, xroAutoSave, xroAutoOpen, xroHideExcel] - [xroDisplayAlerts];
     xlrKNP.ReportTo('', AFileName);
   end
  else
    xlrKNP.Report(True);
end;

procedure TBPReport.xlrKNPBeforeBuild(Report: TxlReport);
  var
    lv_C     : char;
    lv_Count : Integer;
    j     : Integer;
begin
  lv_C     := 'H';
  lv_Count := 0;
  if not dsKBK.Active then
    dsKBK.Open;
  dsKBK.First;
  while not dsKBK.Eof do
  begin
    Report.IXLSApp.Range[lv_C + '14', lv_C + '14'].Value := dsKBK.FieldByName('Pay_Type').AsString+ '        '+
                                                            dsKBK.FieldByName('KBKCode').AsString;
    Report.IXLSApp.Range[lv_C + '15', lv_C + '15'].Value := 6 + lv_Count;
    Report.IXLSApp.Range[lv_C + '16', lv_C + '16'].Value :=  '=aReport_' +
                                                            dsKBK.FieldByName('Pay_Type').AsString+ '_'+
                                                            dsKBK.FieldByName('KBKCode').AsString;
    //Report.IXLSApp.Range[lv_C + '17', lv_C + '17'].Value := '';
    for j := 7 to 12 do
      if (j <> xlInsideVertical) then
        begin
          Report.IXLSApp.Range[lv_C + '14', lv_C + '17'].Borders[j].LineStyle  := xlContinuous;
          Report.IXLSApp.Range[lv_C + '14', lv_C + '17'].Borders[j].Weight     := xlHairline;
          Report.IXLSApp.Range[lv_C + '14', lv_C + '17'].Borders[j].ColorIndex := xlAutomatic;
        end;
    Report.IXLSApp.Range[lv_C + '16', lv_C + '16'].Borders[xlEdgeBottom].LineStyle := xlLineStyleNone;
    Report.IXLSApp.Range[lv_C + '14', lv_C + '14'].EntireColumn.ColumnWidth := 21;
    inc( lv_C );
    inc( lv_Count );
    dsKBK.Next
  end;
  Dec( lv_C );
  Report.IXLSApp.Range['H13', lv_C + '13'].Merge(True);
  Report.IXLSApp.Range['H13', lv_C + '13'].HorizontalAlignment := xlCenter;
  Report.IXLSApp.Range['H13', lv_C + '13'].VerticalAlignment   := xlCenter;
  if (lv_C <> 'H') then
    for j := 7 to 12 do
    if j <> xlInsideHorizontal then
      begin
        Report.IXLSApp.Range['H13', lv_C + '13'].Borders[j].LineStyle  := xlContinuous;
        Report.IXLSApp.Range['H13', lv_C + '13'].Borders[j].Weight     := xlHairline;
        Report.IXLSApp.Range['H13', lv_C + '13'].Borders[j].ColorIndex := xlAutomatic;
      end;
end;

end.
