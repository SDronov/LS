{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 2139 $
  $Author: alexvolo $
  $Date: 2006-12-21 13:51:06 +0400 (Р§С‚, 21 РґРµРє 2006) $
}
unit QATurnover;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, DB, xlcClasses,
  xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle,
  dxmdaset, fdcObjectCore, Grids, DBGrids, Menus, cxGraphics, OracleData;

type
  TQATurnoverForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item2: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    edtFrom: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtTo: TcxDBDateEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    srcMain: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1SUBJ_ID: TFloatField;
    dxMemData1SUBJ_NAME: TStringField;
    dxMemData1FROM_DATE: TDateField;
    dxMemData1TO_DATE: TDateField;
    dxMemData1CURR_ID: TFloatField;
    edtSubject: TcxDBButtonEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    actPasteFromBuffer: TAction;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    xlReport1: TxlReport;
    procedure actOkExecute(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dxMemData1FROM_DATEValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure xlReport1DataSources0BeforeDataTransfer(
      DataSource: TxlDataSource);
  private
    procedure OnSearchFinished(const ADragObject: TfdcDragObject);
  public
  end;


implementation

uses
  qReportUtil,
  fdcObjectServices,
  fdcCustomObjectGridFrm,
  IniFiles, ObjectBufferFrm, SubjIntf;

{$R *.dfm}

procedure FillVariablesFromDataSet(ODataSet: TOracleDataSet; DataSet: TDataSet);
var
  I: Integer;
  F: TField;
begin
  for I := 0 to ODataSet.VariableCount - 1 do    // Iterate
  begin
    F := DataSet.FindField(Copy(ODataSet.VariableName(I), 2, MaxInt));
    if F <> nil then
    begin
      ODataSet.SetVariable(I, F.AsVariant);
    end;
  end;    // for
end;

procedure TQATurnoverForm.actOkExecute(Sender: TObject);
begin
  dxMemData1.CheckBrowseMode;
//  if (dxMemData1Subj_Id.IsNull or dxMemData1Subj_Name.IsNull) then
//    raise exception.Create('Необходимо выбрать участника ВЭД');
  if dxMemData1Curr_Id.IsNull then
    raise exception.Create('Необходимо выбрать валюту');
  CheckDate(dxMemData1From_Date);
  CheckDate(dxMemData1To_Date);
  CmpDate(dxMemData1From_Date, dxMemData1To_Date);
  try
    xlReport1.Report(True);
    ModalResult := mrOk;
  except on e: exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end end;
end;


procedure TQATurnoverForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  F: TfdcCustomObjectGridForm;
  FC: TFormClass;
begin
  inherited;
  FC := TFormClass(FindClass('TSubjectFindGridForm'));
  F := FC.Create(edtSubject) as TfdcCustomObjectGridForm;
  F.SearchMode := True;
  F.SearchMultiple := False;
  F.SearchComponent := edtSubject;
  F.SearchTypeSysName := 'Declarant;Person;Broker';
  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;
  F.ShowModal;
end;


procedure TQATurnoverForm.OnSearchFinished(const ADragObject: TfdcDragObject);
begin
   dxMemData1SUBJ_ID.Value := ADragObject.SingleObject.ID;
   dxMemData1SUBJ_NAME.Value := ADragObject.SingleObject.ObjName;
end;


procedure TQATurnoverForm.dxMemData1FROM_DATEValidate(Sender: TField);
begin
  inherited;
  if dxMemData1TO_DATE.IsNull then dxMemData1TO_DATE.Value := dxMemData1FROM_DATE.Value;
end;


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
      if (AReport.DataSources[I].DataSet is TfdcQuery) and
         (Strings.IndexOf(AReport.DataSources[I].DataSet.Name) > -1) then
          IniFile.ReadSectionValues(AReport.DataSources[I].DataSet.Name,
          TfdcQuery(AReport.DataSources[I].DataSet).SQL);
    end;
  finally
    IniFile.Free;
    Strings.Free;
  end;
end;


procedure TQATurnoverForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport1.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport1.XLSTemplate;
  LoadReportQuery(xlReport1);
end;


procedure TQATurnoverForm.FormShow(Sender: TObject);
begin
  inherited;
//  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight + 14 * 2; // #214 - увеличение размера окна
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth;
  dxMemData1.Edit;
  dxMemData1SUBJ_ID.Value := GetActiveSubjectId;
  if dxMemData1SUBJ_ID.Value > 0 then
     dxMemData1SUBJ_NAME.Value :=  GetActiveSubjectName;
end;


procedure TQATurnoverForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and  Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;

procedure TQATurnoverForm.actPasteFromBufferExecute(Sender: TObject);
begin
  inherited;
  dxMemData1.Edit;
  dxMemData1SUBJ_ID.Value := ObjectBufferForm.CurObject.ID;
  dxMemData1SUBJ_NAME.Value :=  ObjectBufferForm.CurObject.ObjName;
end;


procedure TQATurnoverForm.xlReport1DataSources0BeforeDataTransfer(
  DataSource: TxlDataSource);
begin
  inherited;
  OracleDataSet1.SetVariable('Range', StringReplace(Copy(DataSource.Alias, 3, MaxInt), '_', '.', [rfReplaceAll	]));
  OracleDataSet1.Close;
  OracleDataSet1.Open;
end;

end.

