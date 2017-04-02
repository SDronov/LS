{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 15584 $
  $Author: adavletyarov $
  $Date: 2012-10-15 10:59:50 +0400 (РџРЅ, 15 РѕРєС‚ 2012) $
}
unit qDeclCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, DB, xlcClasses,
  xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle,
  dxmdaset, fdcObjectCore, Grids, DBGrids, Menus, cxGraphics, cxCheckBox,
  MainDm;

type
  TQDeclCardForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item2: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    edtFrom: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtTo: TcxDBDateEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    srcMain: TDataSource;
    xlrDeclarant: TxlReport;
    dsSaldo: TfdcQuery;
    dsOper: TfdcQuery;
    srcHeader: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1SUBJ_ID: TFloatField;
    dxMemData1SUBJ_NAME: TStringField;
    dxMemData1FROM_DATE: TDateField;
    dxMemData1TO_DATE: TDateField;
    dxMemData1CURR_ID: TFloatField;
    edtSubject: TcxDBButtonEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    actPasteFromBuffer: TAction;
    dsSaldo2: TfdcQuery;
    dsOper2: TfdcQuery;
    dsHeader: TfdcQuery;
    chbxIsGenRepINN: TcxDBCheckBox;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxMemData1IS_GEN_REP_INN: TIntegerField;
    procedure actOkExecute(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dxMemData1FROM_DATEValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure actHelpContextExecute(Sender: TObject);
  private
    procedure OnSearchFinished(const ADragObject: TfdcDragObject);
  public
  end;


  function  ExecReport(Session: TOracleSession): Boolean; overload;
  function  ExecReport(Session: TOracleSession; const SubName: string;
                       const SubjId: Variant; const CurrId: Variant): Boolean; overload;

implementation

uses
  qReportUtil,
  fdcObjectServices,
  fdcCustomObjectGridFrm,
  IniFiles, ObjectBufferFrm, SubjIntf;

{$R *.dfm}

function  ExecReport(Session: TOracleSession): Boolean;
begin
  Result := ExecReport(Session, '', Null, Null);
end;


function  ExecReport(Session: TOracleSession; const SubName: string;
                     const SubjId: Variant; const CurrId: Variant): Boolean; overload;
var
  F: TQDeclCardForm;
begin
  F := TQDeclCardForm.Create(nil);
  try
    F.dsHeader.Session  := Session;
    F.dsSaldo.Session   := Session;
    F.dsOper.Session    := Session;
    F.dsSaldo2.Session  := Session;
    F.dsOper2.Session   := Session;
    F.dxMemData1.Open;
    F.dxMemData1.Insert;
    F.dxMemData1SUBJ_ID.AsVariant := SubjId;
    F.dxMemData1SUBJ_NAME.Value := SubName;
    F.dxMemData1CURR_ID.AsVariant := CurrId;
    F.dxMemData1FROM_DATE.Value := Now;
    F.dxMemData1TO_DATE.Value := Now;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;


procedure TQDeclCardForm.actOkExecute(Sender: TObject);
begin
  dxMemData1.CheckBrowseMode;
  if (dxMemData1Subj_Id.IsNull or dxMemData1Subj_Name.IsNull) then
    raise exception.Create('Необходимо выбрать участника ВЭД');
  if dxMemData1Curr_Id.IsNull then
    raise exception.Create('Необходимо выбрать валюту');
  CheckDate(dxMemData1From_Date);
  CheckDate(dxMemData1To_Date);
  CmpDate(dxMemData1From_Date, dxMemData1To_Date);
  dsHeader.Open;

  MainData.RegisterEvent('REP','00001');

  try
    xlrDeclarant.Report(True);
    ModalResult := mrOk;
  except on e: exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end end;
end;


procedure TQDeclCardForm.cxButtonEdit1PropertiesButtonClick(
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
  F.SearchTypeSysName := 'Declarant;Person;Subject';
  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;
  F.ShowModal;
end;


procedure TQDeclCardForm.OnSearchFinished(const ADragObject: TfdcDragObject);
begin
   dxMemData1.Edit; 
   dxMemData1SUBJ_ID.Value := ADragObject.SingleObject.ID;
   dxMemData1SUBJ_NAME.Value := ADragObject.SingleObject.ObjName;
end;


procedure TQDeclCardForm.dxMemData1FROM_DATEValidate(Sender: TField);
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


procedure TQDeclCardForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlrDeclarant.XLSTemplate := ExtractFilePath(Application.ExeName) + xlrDeclarant.XLSTemplate;
  LoadReportQuery(xlrDeclarant);
end;


procedure TQDeclCardForm.FormShow(Sender: TObject);
begin
  inherited;
//  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight + 14 * 2; // #214 - увеличение размера окна
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth;
  dxMemData1.Edit;
  dxMemData1SUBJ_ID.Value := GetActiveSubjectId;
  if dxMemData1SUBJ_ID.Value > 0 then
     dxMemData1SUBJ_NAME.Value :=  GetActiveSubjectName;
  dxMemData1IS_GEN_REP_INN.Value := 0;
end;


procedure TQDeclCardForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and  Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;

procedure TQDeclCardForm.actPasteFromBufferExecute(Sender: TObject);
begin
  inherited;
  dxMemData1.Edit;
  dxMemData1SUBJ_ID.Value := ObjectBufferForm.CurObject.ID;
  dxMemData1SUBJ_NAME.Value :=  ObjectBufferForm.CurObject.ObjName;
end;


procedure TQDeclCardForm.actHelpContextExecute(Sender: TObject);
begin
  inherited;
  ShowReportContextHelp(Self.HelpContext);
end;


End.

