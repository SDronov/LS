unit ChangeTableGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, ChangeTableFrm, cxDropDownEdit, cxCalendar, dxmdaset,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit,
  OracleData, cxCheckBox, fdcCustomNonObjectGridFrm;//ChangeColumnGridFrm;

type
  TChangeTableGridForm = class(TfdcCustomNonObjectGridForm)
    colUserName: TcxGridDBBandedColumn;
    colDateFrom: TcxGridDBBandedColumn;
    colEventName: TcxGridDBBandedColumn;
    colName: TcxGridDBBandedColumn;
    colSysName: TcxGridDBBandedColumn;
    colTypeName: TcxGridDBBandedColumn;
    colTypeSysName: TcxGridDBBandedColumn;
    actOpen: TAction;
    dxBarButton1: TdxBarButton;
    dsDataID: TFloatField;
    dsDataDATE_FROM: TDateTimeField;
    dsDataOBJECT_ID: TFloatField;
    dsDataEVENT_TYPE_ID: TFloatField;
    dsDataUSER_ID: TFloatField;
    dsDataTABLE_NAME: TStringField;
    dsDataEVENTNAME: TStringField;
    dsDataUSERNAME: TStringField;
    dsDataNAME: TStringField;
    dsDataSYSNAME: TStringField;
    dsDataTYPENAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    colID: TcxGridDBBandedColumn;
    colTableName: TcxGridDBBandedColumn;
    edtDateFrom: TcxDateEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtDateTo: TcxDateEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    lcSearchCriteriaGroup1: TdxLayoutGroup;
    edtUserName: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtTableName: TcxTextEdit;
    lciTableName: TdxLayoutItem;
    edtObjectTypeSysName: TcxTextEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtObjectName: TcxTextEdit;
    lcSearchCriteriaItem5: TdxLayoutItem;
    edtObjectTypeName: TcxTextEdit;
    lcSearchCriteriaItem6: TdxLayoutItem;
    edtObjectSysName: TcxTextEdit;
    lcSearchCriteriaItem7: TdxLayoutItem;
    lcSearchCriteriaGroup2: TdxLayoutGroup;
    colObjectID: TcxGridDBBandedColumn;
    dsMemData: TdxMemData;
    dsMemDataEvent_Type_Id: TFloatField;
    cmbxEventType: TfdcObjectLookupEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    srcMemData: TDataSource;
    dsEventType: TOracleDataSet;
    dsEventTypeID: TFloatField;
    dsEventTypeOBJECT_TYPE_ID: TFloatField;
    dsEventTypeSTATE_ID: TFloatField;
    dsEventTypeACCESSLEVEL: TFloatField;
    dsEventTypeDESCRIPT: TStringField;
    dsEventTypeOWNER_OBJECT_ID: TFloatField;
    dsEventTypeTYPENAME: TStringField;
    dsEventTypeTYPESYSNAME: TStringField;
    dsEventTypeNAME: TStringField;
    dsEventTypeSHORTNAME: TStringField;
    dsEventTypeSYSNAME: TStringField;
    dsEventTypeTABLENAME: TStringField;
    dsEventTypeICON: TStringField;
    dsEventTypeSTATE_SCHEME_ID: TFloatField;
    dsEventTypePARENT_OBJECT_TYPE_ID: TFloatField;
    dsEventTypeDEL_PROCEDURE_ID: TFloatField;
    dsEventTypeOBJECTTABLEINSTANCE: TIntegerField;
    dsEventTypePARENTTYPENAME: TStringField;
    dsEventTypePARENTTYPESYSNAME: TStringField;
    dsEventTypeSTATE_SCHEMENAME: TStringField;
    srcEventType: TDataSource;
    chbxTimeInclude: TcxCheckBox;
    lcSearchCriteriaItem9: TdxLayoutItem;
    procedure actOpenExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actSwitchSearchCriteriaExecute(Sender: TObject);
    procedure chbxTimeIncludePropertiesChange(Sender: TObject);
    function  SupportedTypeSysName: string; override;
    procedure actOpenUpdate(Sender: TObject);
  private
  public
  end;


implementation

{$R *.dfm}

uses
  MainFrm,
  MainDm;

procedure TChangeTableGridForm.actOpenExecute(Sender: TObject);
begin
  if not Params.ParamByName('The_Id').SourceField.IsNull then
    MainForm.ObjectServices.ShowForm('TChangeTableForm', Params, nil);
end;


procedure TChangeTableGridForm.grdDataDBBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actOpen.Execute;
end;

procedure TChangeTableGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsMemData.UpdateRecord;
  SetSearchParam('UserName', Trim(edtUserName.Text));
  SetSearchParam('TableName', Trim(edtTableName.Text));
  SetSearchParam('DateFrom', Trim(edtDateFrom.Text));
  SetSearchParam('DateTo', Trim(edtDateTo.Text));
  SetSearchParam('ObjectName', Trim(edtObjectName.Text));
  SetSearchParam('SysName', Trim(edtObjectSysName.Text));
  SetSearchParam('TypeName', Trim(edtObjectTypeName.Text));
  SetSearchParam('TypeSysName', Trim(edtObjectTypeSysName.Text));
  SetSearchParam('Event_Type_Id', dsMemDataEvent_Type_Id.AsString);
end;

procedure TChangeTableGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsMemData.Open;
  dsMemData.Insert;
  if MainForm.actLogSearchOnOpen.Checked then begin
    NoRecordOnShow := True;
    actSwitchSearchCriteria.Execute;
  end;
end;

procedure TChangeTableGridForm.actSwitchSearchCriteriaExecute(
  Sender: TObject);
begin
  inherited;
  dsEventType.Active := Self.SearchActive;
end;

procedure TChangeTableGridForm.chbxTimeIncludePropertiesChange(
  Sender: TObject);
var
  Kind : TcxCalendarKind;
begin
  if chbxTimeInclude.Checked then
    Kind := ckDateTime
  else
    Kind := ckDate;
  edtDateFrom.Properties.Kind := Kind;
  edtDateTo.Properties.Kind := Kind;
end;

function  TChangeTableGridForm.SupportedTypeSysName: string;
begin
  Result := 'DataChangeTable';
end;

procedure TChangeTableGridForm.actOpenUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled :=  not Params.ParamByName('The_Id').SourceField.IsNull;
end;

initialization
  RegisterClass(TChangeTableGridForm);

end.
