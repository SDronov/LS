unit DeclarantChecksFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxGraphics, cxDropDownEdit,
  cxMaskEdit, cxCalendar, OracleData, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, checkutils;

type
  TDeclarantChecksForm = class(TObjectForm)
    edtreqContent: TcxDBMemo;
    lcireqContent: TdxLayoutItem;
    edtansContent: TcxDBMemo;
    lciAnsContent: TdxLayoutItem;
    dsDataCHECKDATE: TDateTimeField;
    dsDataREQCONT: TStringField;
    dsDataNSTATUS: TIntegerField;
    dsDataANSDATE: TDateTimeField;
    dsDataANSCONT: TStringField;
    dsDataCHECKNUMB: TIntegerField;
    dsDataSUBJECT_ID: TIntegerField;
    dsDataDOCUMENT_ID: TIntegerField;
    edtcheckNumber: TcxDBTextEdit;
    lciCheckNumber: TdxLayoutItem;
    edtCheckDate: TcxDBDateEdit;
    lcicheckDate: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    dsDataSCHECKTYPE: TStringField;
    cmbxChecktype: TfdcObjectLookupEdit;
    lcGeneralItem1: TdxLayoutItem;
    dsChecktype: TOracleDataSet;
    srcChecktype: TDataSource;
    dsChecktypesDESCRIPTION: TStringField;
    dsDatanCHECKTYPE: TIntegerField;
    dsChecktypeID: TFloatField;
    lcGeneralGroup3: TdxLayoutGroup;
    grdParamsDBTableView1: TcxGridDBTableView;
    grdParamsLevel1: TcxGridLevel;
    grdParams: TcxGrid;
    lciParamsGrid: TdxLayoutItem;
    colName: TcxGridDBColumn;
    colType: TcxGridDBColumn;
    colValue: TcxGridDBColumn;
    srcCheckTypeParams: TDataSource;
    dsCheckTypeParamsQ: TfdcQuery;
    dsCheckTypeParamsQsDESCRIPTION: TStringField;
    dsCheckTypeParamsQTYPE: TIntegerField;
    dsCheckTypeParamsQVALUE: TStringField;
    dsDeclarantData: TfdcQuery;
    dsPullParams: TfdcQuery;
    dsCheckTypeParamsQSNAME: TStringField;
    dsgetSubjectID: TfdcQuery;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cmbxChecktypePropertiesChange(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    nSubjectType: integer;
    nSubjectID : integer;
    function getDefaultValue(sParamName:String) :String;
    procedure wrapDataSet(ds:TDataSource);
    procedure pullParamsFromGrid();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeclarantChecksForm: TDeclarantChecksForm;

implementation

{$R *.dfm}
procedure TDeclarantChecksForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  lciNameEdit.Visible := not IsNew;
  lciCheckNumber.Visible := not IsNew;
  lcireqContent.Visible := not IsNew;
  lciansContent.Visible := not IsNew;
  lciCheckDate.Visible := not IsNew;
  lciParamsGrid.Visible := IsNew;

  cmbxChecktype.Properties.ReadOnly := not IsNew;
  edtName.Properties.ReadOnly := not IsNew;
  edtcheckNumber.Properties.ReadOnly := not IsNew;
  edtReqContent.Properties.ReadOnly := not IsNew;
  edtAnsContent.Properties.ReadOnly := not IsNew;
  edtCheckDate.Properties.ReadOnly := not IsNew;

// так было раньше, из учвэд работало
//  dsInsert.ParamByName('SUBJECT_ID').Value := ParamsHolder.Params.ParamValues['SUBJECT_ID'];

  dsInsert.ParamByName('SUBJECT_ID').Value := nSubjectID;
  dsInsert.ParamByName('DOCUMENT_ID').Value := ParamsHolder.Params.ParamValues['DOCUMENT_ID'];

  if IsNew then
  begin
   dsDeclarantData.ParamByName('ID').Value := nSubjectID;
   dsDeclarantData.ExecSQL;
   dsDeclarantData.Post;
   nSubjectType :=  dsDeclarantData.ParamByName('NTYPE').AsInteger;
   dsCheckTypeParamsQ.ParamByName('NSUBJECT_TYPE').Value := nSubjectType;
  end;

end;

procedure TDeclarantChecksForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsCheckTypeParamsq.Active := true;
  dsGetSubjectId.ExecSQL;
  nSubjectID:=dsGetSubjectId.Params.ParamByName('nID').AsInteger;
end;

procedure TDeclarantChecksForm.pullParamsFromGrid();
// Передача параметров из грида в пакет
begin
  with srcCheckTypeParams.DataSet do begin
   First;
   while (not Eof) do
   begin
    if FieldValues['sNAME'] = 'INN' then
     CheckINN(FieldByName('VALUE').AsString);
    if (FieldValues['sNAME'] = 'KPP') and (Length(Trim(FieldByName('VALUE').AsString))>0) then
     CheckKPP(FieldByName('VALUE').AsString);

    dsPullParams.ParamByName('sParamName').Value := FieldValues['sNAME'];
    dsPullParams.ParamByName('sParamValue').Value := FieldByName('VALUE').AsString;
    dsPullParams.ExecSQL;
    Next;
  end;
 end;
end;

function TDeclarantChecksForm.getDefaultValue(sParamName:String) :String;
begin
   try
    Result := dsDeclarantData.ParamByName(sParamName).AsString
   except
    Result := '';
   end;
end;

procedure TDeclarantChecksForm.wrapDataSet(ds:TDataSource);
var sParam, sValue :string;
begin
  with ds.DataSet do begin
   First;
   while (not Eof) do
   begin
    sParam := FieldValues['sNAME'];
    sValue := getDefaultValue(sParam);
    if sValue <> '' then
     begin
       FieldByName('VALUE').AsString := sValue;
       Post;
     end;
   Next;
  end;
 end;
end;

procedure TDeclarantChecksForm.cmbxChecktypePropertiesChange(
  Sender: TObject);
  var vHeight:integer;
  begin
  inherited;
  Modify(Sender);
  dsCheckTypeParamsQ.ParamByName('PRN').Value := cmbxChecktype.ItemIndex+1;
  dsCheckTypeParamsQ.ReQuery;
  wrapDataSet(srcCheckTypeParams);
  // По новому варианту - не сжимаем грид, а оставляем высоким
{  vHeight :=  19 + dsCheckTypeParamsQ.RecordCount* 22;
  if cmbxChecktype.ItemIndex > 0 then
   vHeight := vHeight + 2;
  grdParams.Height := vHeight;
}
  grdParams.Repaint;
  
end;

procedure TDeclarantChecksForm.actSaveExecute(Sender: TObject);
begin
  pullParamsFromGrid();
  inherited;
end;

initialization
RegisterClass(TDeclarantChecksForm);
end.
