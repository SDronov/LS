unit qaTurnoverParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDBDataFrm, dxPSCore, dxPScxCommon, dxPScxTLLnk,
  cxInplaceContainer, cxTL, cxDBTL, cxControls, cxTLData, DB, OracleData,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGraphics,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  dxLayoutControl, cxTextEdit, dxmdaset, dxtrprds, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, xlcClasses,
  xlEngine, xlReport, cxCustomData, cxStyles, cxCurrencyEdit, Menus,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxSplitter, Oracle, JvSimpleXml, dxBarExtItems, QueryList;

type
  TAccTurnOverParamsGridForm = class(TfdcCustomDBDataForm)
    dsDataN: TOracleDataSet;
    DataSource1: TDataSource;
    tlData: TcxDBTreeList;
    cxDBTreeListCAPTION: TcxDBTreeListColumn;
    cxDBTreeListENABLE_FUNC: TcxDBTreeListColumn;
    cxDBTreeListOP_NAME: TcxDBTreeListColumn;
    cxDBTreeListACCOUNT_CODE: TcxDBTreeListColumn;
    cxDBTreeListACTION_SIGN: TcxDBTreeListColumn;
    cxDBTreeListIS_DEBIT: TcxDBTreeListColumn;
    acExpand: TAction;
    acCollapse: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    cxDBTreeListCODE: TcxDBTreeListColumn;
    cxDBTreeListACC_SDATE: TcxDBTreeListColumn;
    dsDetail: TdxBarStatic;
    bcciDetail: TdxBarControlContainerItem;
    dsDataNCLASS_ID: TFloatField;
    dsDataNCLASS_PARENT_ID: TFloatField;
    dsDataNCLASS_SYSNAME: TStringField;
    dsDataNCLASS_NAME: TStringField;
    dsDataNPARAM_FUNCTION_NAME: TStringField;
    dsDataNOP_CODE: TStringField;
    dsDataNOP_NAME: TStringField;
    dsDataNACCOUNT_CODE: TStringField;
    dsDataNACCOUNT_NAME: TStringField;
    dsDataNACTION_SIGN: TFloatField;
    dsDataNIS_DEBIT: TStringField;
    dsDataNENABLE_FUNC: TStringField;
    dsDataNACC_SDATE: TDateTimeField;
    dsDataNACC_EDATE: TDateTimeField;
    dsDataNOP_SDATE: TDateTimeField;
    dsDataNOP_EDATE: TDateTimeField;
    dsDataNNNAME: TStringField;
    dsDataNITEM_NO: TStringField;
    dsDataNPARENT_ITEM_NO: TStringField;
    cxDBTreeListACC_EDATE: TcxDBTreeListColumn;
    cxDBTreeListOP_SDATE: TcxDBTreeListColumn;
    cxDBTreeListOP_EDATE: TcxDBTreeListColumn;
    procedure acExpandExecute(Sender: TObject);
    procedure acCollapseExecute(Sender: TObject);
    procedure dsDataNApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure tlDataCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tlDataEdited(Sender: TObject; AColumn: TcxTreeListColumn);
    procedure tlDataEditing(Sender: TObject; AColumn: TcxTreeListColumn;
      var Allow: Boolean);
    procedure actRefreshExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure acMakeLUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsDataNAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure DoReCalc(AField: TField);
    function MakeCaption: string;
  public
    { Public declarations }
  end;

var
  AccTurnOverParamsGridForm: TAccTurnOverParamsGridForm;

implementation

uses
  MainDm, cxExportTL4Link, fdcMessages, fdcUtils, fdcObjectServices,
  DictDm, ITransportAcrh, AccInitialRestFrm, DocActivateErrorGridFrm,
  DocPackFrm, qTurnoverSheetsGridFrm, StrUtils, Math;

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

procedure TAccTurnOverParamsGridForm.acExpandExecute(Sender: TObject);
begin
  inherited;
  tlData.FullExpand;
end;

procedure TAccTurnOverParamsGridForm.acCollapseExecute(Sender: TObject);
begin
  inherited;
  tlData.FullCollapse;
end;

function TAccTurnOverParamsGridForm.MakeCaption: string;
begin
  // by Nau
  Result := '<none>';
end;

procedure TAccTurnOverParamsGridForm.dsDataNApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  inherited;
  Applied := True;
end;

procedure TAccTurnOverParamsGridForm.tlDataCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Node <> nil) and (AViewInfo.Node.Level = 0) then
     ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
end;

procedure TAccTurnOverParamsGridForm.tlDataEdited(Sender: TObject;
  AColumn: TcxTreeListColumn);
begin
  inherited;
  DoReCalc(TcxDBTreeListColumn(AColumn).DataBinding.Field);
end;

procedure TAccTurnOverParamsGridForm.tlDataEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin
  inherited;
  Allow := (TcxTreeList(Sender).FocusedNode <> nil) and
           (not TcxTreeList(Sender).FocusedNode.HasChildren) and
           (AColumn.PropertiesClassName = 'TcxCurrencyEditProperties');
end;

procedure TAccTurnOverParamsGridForm.DoReCalc(AField: TField);
var
  Bookmark: TBookmark;
  ParentId: String;
  ADelta: currency;
begin
  ADelta := AField.AsCurrency - AField.OldValue;
  if ADelta = 0 then Exit;
  dsDataN.CheckBrowseMode;
  ParentId := dsDataN['PARENT_ITEM'];
  Bookmark := dsDataN.GetBookmark;
  dsDataN.DisableControls;
  try
    while dsDataN.SearchRecord('CODE', ParentId, [srFromCurrent, srBackward]	) do
    begin
      dsDataN.Edit;
      AField.Value := AField.Value + ADelta;
      ParentId := dsDataN['PARENT_ITEM'];
      dsDataN.Post;
    end;
    dsDataN.GotoBookmark(Bookmark);
  finally // wrap up
    dsDataN.EnableControls;
    dsDataN.FreeBookMark(Bookmark);
  end;    // try/finally
end;

function PrintFields(DataSet: TDataSet): string;
var
  F: TField;
  I: Integer;
begin
  Result := '';
  for I := 0 to DataSet.FieldCount - 1 do    // Iterate
  begin
    F := DataSet.Fields[I];
    if F.FieldKind <> fkInternalCalc then
      Result := Result + Format(' %s="%s"', [F.FieldName, F.Text]);
  end;    // for
end;

procedure TAccTurnOverParamsGridForm.actRefreshExecute(Sender: TObject);
begin
  if dsDataN.Active then
    begin
      dsDataN.Refresh;
    end
  else
    begin
      dsDataN.Open;
    end;
end;

procedure TAccTurnOverParamsGridForm.actRefreshUpdate(Sender: TObject);
begin
//  inherited;

end;

procedure TAccTurnOverParamsGridForm.acMakeLUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := TAction(Sender).Visible and dsDataN.Active;
end;

procedure TAccTurnOverParamsGridForm.FormCreate(Sender: TObject);
  var
    lv_MinDate : TDateTime;
begin
  inherited;
end;

procedure TAccTurnOverParamsGridForm.dsDataNAfterOpen(DataSet: TDataSet);
  var
    TreeNode : TcxTreeListNode;
begin
  inherited;

  TreeNode := tlData.Nodes.TopVisibleNode;
  repeat
    TreeNode.Expand( False );
    TreeNode := TreeNode.getNextSibling;
  until not Assigned( TreeNode );
end;

procedure TAccTurnOverParamsGridForm.FormShow(Sender: TObject);
begin
  inherited;
  actRefresh.Execute;
end;

initialization
   RegisterClass(TAccTurnOverParamsGridForm);

end.
