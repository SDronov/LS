unit qKNPDedAllFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, DB, OracleData,
  xlcClasses, xlEngine, xlReport, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle,
  dxmdaset, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit;

type
  TqKNPDedAllForm = class(TfdcCustomDlgForm)
    edtbDate: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtEDate: TcxDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsMain: TOracleDataSet;
    dsTotal: TOracleDataSet;
    xlReport: TxlReport;
    dsParam: TdxMemData;
    dsParamKNP_ID: TFloatField;
    dsParamSUBJ_ID: TFloatField;
    srcParam: TDataSource;
    dsParamSUBJ_NAME: TStringField;
    dsData: TdxMemData;
    srcPayerList: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dsMainBeforeQuery(Sender: TOracleDataSet);
    procedure xlReportDataSources1BeforeDataTransfer(
      DataSource: TxlDataSource);
    procedure dsHeaderBeforeQuery(Sender: TOracleDataSet);
    procedure xlReportBeforeBuild(Report: TxlReport);
  private
    procedure BuildTemplate(DataSource: TxlDataSource; ADataSet: TDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation

uses
  fdcUtils, DateUtils, MainDm, IniFiles, DictDm, Excel8G2, ActiveX, qReportUtil;

{$R *.dfm}

procedure BuildDataSet(SrcDataSet, DstDataSet: TDataSet; const PersFields, CurrField, SummaFields: string);
var
  I,J: Integer;
  Codes: TStringList;
  AllFields: TStringList;
  F: TField;
  SFName: String;
  List: TList;
  List1: TList;
  APersFields: string;
  S: string;
  procedure CloneField(F: TField; DataSet: TDataSet);
  var
    AField: TField;
  begin
    AField := DefaultFieldClasses[F.DataType].Create(DataSet);
    AField.DisplayLabel := F.DisplayLabel;
    AField.DisplayWidth := F.DisplayWidth;
    AField.EditMask := F.EditMask;
    AField.FieldName := F.FieldName;
    if (AField is TStringField) or (AField is TBlobField) then
      AField.Size := F.Size;
    if AField is TFloatField then
    begin
      TFloatField(AField).Currency := TFloatField(F).Currency;
      TFloatField(AField).Precision := TFloatField(F).Precision;
    end;
    AField.DataSet := DataSet;
  end;
begin
  NullStrictConvert := False;
  DstDataSet.Close;
  DstDataSet.DisableControls;
  APersFields := PersFields;
  try
    DstDataSet.Fields.Clear;
//    Codes := THashedStringList.Create;
    Codes := TStringList.Create;
    Codes.Sorted := True;
    List := TList.Create;
    List1 := TList.Create;
    try
      SrcDataSet.First;
       if CurrField <> '' then
       begin
          while not SrcDataSet.Eof do
          begin
            S := SrcDataSet[CurrField];
            if S <> '' then
              if Codes.IndexOf(S) = -1 then
                  Codes.Add(S);
            SrcDataSet.Next;
          end;    // while
       end;

      SrcDataSet.GetFieldList(List1, SummaFields);

      if APersFields <> '*' then
         SrcDataSet.GetFieldList(List, APersFields)
      else
      begin
        AllFields := TStringList.Create;
        try
          SrcDataSet.GetFieldNames(AllFields);
          for I := 0 to AllFields.Count - 1 do
           if (AllFields[I] <> CurrField) and (List1.IndexOf(AllFields.Objects[I]) < 0) then
           begin
              List.Add(AllFields.Objects[I]);
              APersFields := APersFields + ';' + AllFields[I];
           end;
           Delete(APersFields, 1, 2);
         finally
           AllFields.Free;
         end;
      end;
      for i := 0 to List.Count - 1 do
      begin
        CloneField(TField(List[I]), DstDataSet);
      end;


      for J := 0 to List1.Count - 1 do
      begin
        if Codes.Count = 0 then
        begin
          F := TFloatField.Create(DstDataSet);
          F.FieldName := TField(List1[J]).FieldName;
          F.DataSet := DstDataSet;
          TFloatField(F).DisplayFormat := ',0.00';
        end
        else
        for I := 0 to Codes.Count - 1 do    // Iterate
        begin
          F := TFloatField.Create(DstDataSet);
          F.FieldName := TField(List1[J]).FieldName + Codes[I];
          F.DataSet := DstDataSet;
          TFloatField(F).DisplayFormat := ',0.00';
        end;    // for
      end;

  //    TdxMemData(DstDataSet).Indexes.Add.FieldName := PersFields;
      DstDataSet.Open;

      SrcDataSet.First;

      while not SrcDataSet.Eof do
      begin
        if DstDataSet.Locate(APersFields, SrcDataSet.FieldValues[APersFields], []) then
        begin
          DstDataSet.Edit;
        end
        else
          begin
            DstDataSet.Append;
            DstDataSet.FieldValues[APersFields] := SrcDataSet.FieldValues[APersFields];
          end;

        for J := 0 to List1.Count - 1 do    // Iterate
        begin
          F := TField(List1[J]);
          if not F.IsNull then
          begin
            SFName := F.FieldName;
            if CurrField <> '' then
                SFName := SFName + SrcDataSet[CurrField];
            with DstDataSet.FieldByName(SFName) do
              AsFloat := AsFloat + F.Value;
          end;
        end;    // for
        DstDataSet.Post;

        SrcDataSet.Next;
      end;    // while

    finally
      List1.Free;
      List.Free;
      Codes.Free;
    end;
  finally
     DstDataSet.EnableControls;
  end;
end;

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


function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TqKNPDedAllForm;
begin
  F := TqKNPDedAllForm.Create(nil);
  try
    SetSession(F, Session);
//    F.dsPayerList.Open;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TqKNPDedAllForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport.XLSTemplate;
  LoadReportQueryEx(TForm(Self), xlReport.XLSTemplate);
  edtbDate.Date := Date;
  edtEDate.Date := Date;
end;

procedure TqKNPDedAllForm.actOkExecute(Sender: TObject);
begin
//  inherited;
  dsParam.CheckBrowseMode;
  DisplayBusyCursor;
  dsMain.Close;
  xlReport.Report(True);
  ModalResult := mrOk;
end;

procedure TqKNPDedAllForm.dsMainBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('SDATE', edtBDate.EditValue);
  Sender.SetVariable('EDATE', edtEDate.EditValue);
//  Sender.SetVariable('KNP_ID', dsParamKNP_ID.AsVariant);
//  Sender.SetVariable('PAYER_ID', dsParamSUBJ_ID.AsVariant);
end;

procedure TqKNPDedAllForm.xlReportDataSources1BeforeDataTransfer(
  DataSource: TxlDataSource);
begin
  inherited;
  if dsMain.Active then dsMain.Refresh
    else dsMain.Open;
  dsData.SortedField := 'KNP_NAME';
  BuildDataSet(dsMain, dsData, 'KNP_NAME;PAY_NAME;SS;DSUMMA;PO_SUMMA','KBK', 'SUMMA');
//  dsData.Indexes.Clear;
  BuildTemplate(DataSource, dsData);
//  dsData.Indexes.Add.FieldName := 'KNP_NAME';
//  dsData.Filtered := False;
//  dsData.Filter := '1';
//  dsData.Filtered := True;
end;

procedure TqKNPDedAllForm.BuildTemplate(DataSource: TxlDataSource; ADataSet: TDataSet);
const
  LeftRow = 8;
var ISheet: IxlWorksheet;
  S: string;
    IRange, Cell1, Cell2: IxlRange;
    Fields: TFields;
    C1, C2: string;
    i, RowCount: integer;
begin
  Fields := DataSource.DataSet.Fields;
  IRange := DataSource.IRange;
  IRange.Cells.Item[2, 1].Value := 'colsfit';
  ISheet := IRange.Parent as IxlWorksheet;
  RowCount := 0;
  for i := 0 to Fields.Count - 1 do
    if Pos('SUMMA', Fields[i].FieldName) = 1 then
    begin
      // Insert column to range
      C1 := ISheet.Cells.Item[7, LeftRow + 1].AddressLocal;
      C2 := ISheet.Cells.Item[13, LeftRow + 1].AddressLocal;

      IxlRange(IDispatch(ISheet.Range[C1, C2])).Insert(xlShiftToRight);
      S := Copy(Fields[i].FieldName, 6, 20);
      if S = '00000000000000000000' then S := '';
      IxlRange(IDispatch(ISheet.Cells.Item[8,LeftRow + 1])).Value := S;
      IxlRange(IDispatch(ISheet.Cells.Item[9,LeftRow + 1])).Value := Copy(Fields[i].FieldName, 27, MaxInt);
      IxlRange(IDispatch(ISheet.Cells.Item[10,LeftRow + 1])).Formula := '=' + Fields.DataSet.Name + '_' + Fields[i].FieldName;
      IxlRange(IDispatch(ISheet.Cells.Item[11,LeftRow + 1])).Value := 'sum';

//      IxlRange(IDispatch(ISheet.Cells.Item[13,LeftRow + 1])).Formula := '=dsTotal' + '_' + Fields[i].FieldName;

      Inc(RowCount);
//      C1 := IRange.Cells.Item[1, IRange.Columns.Count].AddressLocal;
//      C2 := IRange.Cells.Item[IRange.Rows.Count, IRange.Columns.Count].AddressLocal;
//      IDispatch(Cell1) := ISheet.Range[C1, C2];
//      Cell1.Insert(TOLEEnum(xlShiftToRight));
//      // Get field cell
//      IDispatch(Cell2) := IRange.Cells.Item[1, 2 + RowCount];
//      // Copy formats to new cell
//      Cell1.Copy(Cell2);
//      // Set field formula
//      Cell2.Formula := '=' + Fields.DataSet.Name + '_' + Fields[i].FieldName;
      // Set number format
      { Change formats for your locale and uncomment
      case Fields[i].DataType of
        ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint: Cell2.NumberFormat := '# ##0';
        ftFloat, ftCurrency, ftBCD: Cell2.NumberFormat := '# ##0,00';
        ftDate: Cell2.NumberFormat := 'ÄÄ.ÌÌ.ÃÃÃÃ';
        ftTime: Cell2.NumberFormat := '÷÷:ìì:ññ';
        ftDateTime: Cell2.NumberFormat := 'ÄÄ.ÌÌ.ÃÃÃÃ ÷÷:ìì:ññ';
      end;
      }
      // Set colunm caption
//      IDispatch(Cell1) := ISheet.Cells.Item[IRange.Row - 1, IRange.Column + RowCount + 1];
//      Cell1.Insert(TOLEEnum(xlShiftToRight));
//      IDispatch(Cell2) := ISheet.Cells.Item[IRange.Row - 1, IRange.Column + RowCount + 1];
//      Cell1.Copy(Cell2);
//      Cell2.Value := Fields[i].DisplayLabel;
//      Inc(RowCount);
    end;
  // Delete temporary column
    C1 := ISheet.Cells.Item[7, LeftRow].AddressLocal;
    C2 := ISheet.Cells.Item[13, LeftRow].AddressLocal;

    S := IxlRange(IDispatch(ISheet.Cells.Item[7, LeftRow])).Value;

    IxlRange(IDispatch(ISheet.Range[C1, C2])).Delete(xlShiftToLeft);

    C1 := ISheet.Cells.Item[7, LeftRow].AddressLocal;
    C2 := ISheet.Cells.Item[7, LeftRow + RowCount - 1].AddressLocal;

    IxlRange(IDispatch(ISheet.Range[C1, C2])).Merge(True);
    IxlRange(IDispatch(ISheet.Cells.Item[7, LeftRow])).Value := S;

    C1 := ISheet.Cells.Item[7, LeftRow + RowCount].AddressLocal;
    C2 := ISheet.Cells.Item[13, LeftRow + RowCount].AddressLocal;
    IxlRange(IDispatch(ISheet.Range[C1, C2])).Delete(xlShiftToLeft);

    //  IDispatch(Cell1) := ISheet.Cells.Item[IRange.Row - 1, IRange.Column + IRange.Columns.Count - 1];
//  Cell1.Delete(TOLEEnum(xlShiftToLeft));
//  C1 := IRange.Cells.Item[1, IRange.Columns.Count].AddressLocal;
//  C2 := IRange.Cells.Item[IRange.Rows.Count, IRange.Columns.Count].AddressLocal;
//  ISheet.Range[C1, C2].Delete(TOLEEnum(xlShiftToLeft));
end;

procedure TqKNPDedAllForm.dsHeaderBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('SDATE', edtbDate.Date);
  Sender.SetVariable('EDATE', edtEDate.Date);
//  Sender.SetVariable('SID', dsParamSUBJ_ID.AsVariant);
//  Sender.SetVariable('AID', dsParamKNP_ID.AsVariant);
end;

procedure TqKNPDedAllForm.xlReportBeforeBuild(Report: TxlReport);
begin
  inherited;
  Report.ParamByName['SDATE'].AsDateTime := edtBDate.Date;
  Report.ParamByName['EDATE'].AsDateTime := edtEDate.Date;
end;

end.
