unit srReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, dxBarExtItems, MainDm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, Oracle;

type
  TsrReportGridForm = class(TfdcCustomGridForm)
    edtFrom: TdxBarDateCombo;
    edtTo: TdxBarDateCombo;
    actOpen: TAction;
    dxBarButton1: TdxBarButton;
    qryCheckRange: TOracleQuery;
    procedure FormShow(Sender: TObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
  public
  end;

procedure BuildDataSet(SrcDataSet, DstDataSet: TDataSet; const PersFields, CurrField, SummaFields: string);

implementation

uses
  ObjServices, fdcObjectServices, IniFiles, cxGridDBDataDefinitions;

{$R *.dfm}


procedure BuildDataSet(SrcDataSet, DstDataSet: TDataSet; const PersFields, CurrField, SummaFields: string);
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
  DstDataSet.DisableControls;
  try
    DstDataSet.Fields.Clear;
    Codes := THashedStringList.Create;
    List := TList.Create;
    List1 := TList.Create;
    try
      SrcDataSet.First;
      while not SrcDataSet.Eof do
      begin
        if Codes.IndexOf(SrcDataSet[CurrField]) = -1 then
            Codes.Add(SrcDataSet[CurrField]);
        SrcDataSet.Next;
      end;    // while

      SrcDataSet.GetFieldList(List, PersFields);
      for i := 0 to List.Count - 1 do
      begin
        CloneField(TField(List[I]), DstDataSet);
      end;

      SrcDataSet.GetFieldList(List1, SummaFields);

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
          with DstDataSet.FieldByName(F.FieldName + SrcDataSet[CurrField]) do
            AsFloat := AsFloat + F.Value;
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

procedure TsrReportGridForm.FormShow(Sender: TObject);
begin
  inherited;
  dsData.Active := True;
  GetObjectServices.NavigateForm(TfdcNavigableFormAdapter.Create(Self), False);
end;

procedure TsrReportGridForm.actOpenUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(ActiveGridTableView) and
                    (ActiveGridTableView.Controller.SelectedRowCount  = 1);
end;

procedure TsrReportGridForm.actOpenExecute(Sender: TObject);
begin
  inherited;
  GetObjectServices.OpenObject(TcxGridDBDataController(ActiveGridTableView.DataController).DataSource.DataSet['ID'], nil);
end;

procedure TsrReportGridForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
  inherited;
  actOpen.Execute;
end;

procedure TsrReportGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryCheckRange.SetVariable('SDATE', edtFrom.Date);
  qryCheckRange.SetVariable('EDATE', edtTo.Date);
  qryCheckRange.Execute;
end;

end.
