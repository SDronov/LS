unit srBudget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainDm, fdcCustomGridFrm, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl,
  cxButtons, ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar, cxGraphics, dxmdaset, dxBarExtItems, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData;

type
  TsrBudgetGridForm = class(TfdcCustomGridForm)
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView643: TcxGridDBBandedColumn;
    grdDataDBBandedTableView840: TcxGridDBBandedColumn;
    grdDataDBBandedTableView978: TcxGridDBBandedColumn;
    dxMemData1: TdxMemData;
    edtFrom: TdxBarDateCombo;
    edtTo: TdxBarDateCombo;
    dsDatadoc_date: TDateTimeField;
    dsDataacc_date: TDateTimeField;
    dsDatacurr_code: TStringField;
    dsDatas: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure grdDataDBBandedTableViewCustomDrawGroupCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actSwitchSearchCriteriaUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  srBudgetGridForm: TsrBudgetGridForm;

implementation

uses
  IniFiles, ObjServices, fdcObjectServices;

{$R *.dfm}

procedure BuildDataSet(SrcDataSet, DstDataSet: TDataSet; const PersFields: string; CurrFields: string);
var
  I,J: Integer;
  Codes: TStringList;
  F: TField;
  List: TList;
  List1: TList;
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
  DstDataSet.Fields.Clear;
  Codes := THashedStringList.Create;
  List := TList.Create;
  List1 := TList.Create;
  try
    SrcDataSet.First;
    while not SrcDataSet.Eof do
    begin
      if Codes.IndexOf(SrcDataSet['CURR_CODE']) = -1 then
          Codes.Add(SrcDataSet['CURR_CODE']);
      SrcDataSet.Next;
    end;    // while

    SrcDataSet.GetFieldList(List, PersFields);
    for i := 0 to List.Count - 1 do
    begin
      CloneField(TField(List[I]), DstDataSet);
    end;

    SrcDataSet.GetFieldList(List1, CurrFields);

    for J := 0 to List1.Count - 1 do
    begin
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
      if DstDataSet.Locate(PersFields, SrcDataSet.FieldValues[PersFields], []) then
      begin
        DstDataSet.Edit;
      end
      else
        begin
          DstDataSet.Append;
          DstDataSet.FieldValues[PersFields] := SrcDataSet.FieldValues[PersFields];
        end;

      for J := 0 to List1.Count - 1 do    // Iterate
      begin
        F := TField(List1[J]);
        DstDataSet.FieldValues[F.FieldName + SrcDataSet['CURR_CODE']] := F.Value;
      end;    // for
      DstDataSet.Post;

      SrcDataSet.Next;
    end;    // while

  finally
    List1.Free;
    List.Free;
    Codes.Free;
  end;
end;

procedure TsrBudgetGridForm.FormShow(Sender: TObject);
begin
  inherited;
  dsData.Open;
  GetObjectServices.NavigateForm(TfdcNavigableFormAdapter.Create(Self), False);
end;

procedure TsrBudgetGridForm.grdDataDBBandedTableViewCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
var
  GridViewInfo: TcxGridTableDataCellViewInfo;
begin
  inherited;
  Exit;
  ACanvas.FillRect(AViewInfo.Bounds);
  GridViewInfo := AViewInfo.RecordViewInfo.GetCellViewInfoByItem(grdDataDBBandedTableViewDOC_DATE);

  if assigned(GridViewInfo) then
  begin
    ACanvas.DrawTexT(AViewInfo.RecordViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewDOC_DATE.Index]
    ,GridViewInfo.TextAreaBounds,cxAlignLeft);
  end;

//  ACanvas.DrawTexT('Дата отправки: Дата Начисления:', AViewInfo.TextAreaBounds, cxAlignLeft);
  ADone := True;
end;

procedure TsrBudgetGridForm.dsDataAfterOpen(DataSet: TDataSet);
var
  F: TField;
begin
  inherited;
  BuildDataSet(dsData, dxMemData1, 'DOC_DATE;ACC_DATE', 'S');
  dxMemData1.First;
  F := dxMemData1.FieldByName('DOC_DATE');
  while not dxMemData1.Eof do
  begin
    if F.AsDateTime = EncodeDate(1000, 10, 10) then
    begin
      dxMemData1.Edit;
      F.Clear;
      dxMemData1.Post;
    end;
    dxMemData1.Next;
  end;
//  BuildDataSet(dsData, fdcQuery1, 'DOC_DATE;ACC_DATE', 'S');
end;

procedure TsrBudgetGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('F_DATE').Value := edtFrom.Date;
  dsData.ParamByName('TO_DATE').Value := edtTo.Date;
end;

procedure TsrBudgetGridForm.actSwitchSearchCriteriaUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Visible:= False;
end;

initialization
   RegisterClass(TsrBudgetGridForm);

end.
