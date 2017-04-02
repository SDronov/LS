unit AccInitialRestFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDBDataFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxControls, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCalendar,
  cxCurrencyEdit, cxTextEdit;

type
  TAccInitialRestForm = class(TfdcCustomDBDataForm)
    tlData: TcxDBTreeList;
    dsDataID: TFloatField;
    dsDataCODE: TStringField;
    dsDataNAME: TStringField;
    dsDataPARENT_ID: TFloatField;
    dsDataDOC_ID: TFloatField;
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataREST_SUM: TFloatField;
    tlDataID: TcxDBTreeListColumn;
    tlDataCODE: TcxDBTreeListColumn;
    tlDataNAME: TcxDBTreeListColumn;
    tlDataPARENT_ID: TcxDBTreeListColumn;
    tlDataDOC_ID: TcxDBTreeListColumn;
    tlDataDOC_NUMBER: TcxDBTreeListColumn;
    tlDataDOC_DATE: TcxDBTreeListColumn;
    tlDataREST_SUM: TcxDBTreeListColumn;
    qryInsert: TfdcQuery;
    qryUpdate: TfdcQuery;
    qryDelete: TfdcQuery;
    actSave: TAction;
    dxBarButton1: TdxBarButton;
    actRemove: TAction;
    dxBarButton2: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    procedure FormShow(Sender: TObject);
    procedure tlDataCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure dsDataBeforePost(DataSet: TDataSet);
    procedure tlDataFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure actRemoveUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataAfterCancel(DataSet: TDataSet);
    procedure dsDataAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccInitialRestForm: TAccInitialRestForm;

implementation

{$R *.dfm}

uses
  MainDM
 ,DictDm
  ;

const
  c_cptMain : string = 'Начальные остатки по счетам';


procedure TAccInitialRestForm.FormShow(Sender: TObject);
begin
  inherited;

  if not dsData.Active then
    dsData.Open;
end;

procedure TAccInitialRestForm.tlDataCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  inherited;

  if AViewInfo.Selected then
    Exit;

  if AViewInfo.Node.HasChildren then
    ACanvas.Brush.Color := clcxLightGray
  else if AViewInfo.Node.Values[tlDataDOC_ID.ItemIndex] = null then
    ACanvas.Brush.Color := clInfoBk;
end;

procedure TAccInitialRestForm.dsDataBeforePost(DataSet: TDataSet);
begin
  inherited;

  if DataSet.FieldByName( 'doc_id' ).IsNull then
    begin
      with qryInsert.Params do
        begin
          ParamByName( 'DocNumber'  ).AsString  := DataSet.FieldByName( 'doc_number' ).AsString;
          ParamByName( 'DocDate'    ).AsDate    := DataSet.FieldByName( 'doc_date'   ).AsDateTime;
          ParamByName( 'AccountID'  ).AsInteger := DataSet.FieldByName( 'id'         ).AsInteger;
          ParamByName( 'CurrencyID' ).AsInteger := (DataSet as TfdcQuery).Params.ParamByName( 'currency_id' ).AsInteger;
          ParamByName( 'RestSum'    ).AsFloat   := DataSet.FieldByName( 'rest_sum'   ).AsFloat;
        end;
      qryInsert.ExecSQL;

      DataSet.FieldByName( 'doc_id' ).AsInteger := qryInsert.Params.ParamByName( 'id' ).AsInteger;
    end
  else 
    begin
      with qryUpdate.Params do
        begin
          ParamByName( 'DocID'     ).AsInteger := DataSet.FieldByName( 'doc_id'     ).AsInteger;
          ParamByName( 'DocNumber' ).AsString  := DataSet.FieldByName( 'doc_number' ).AsString;
          ParamByName( 'DocDate'   ).AsDate    := DataSet.FieldByName( 'doc_date'   ).AsDateTime;
          ParamByName( 'RestSum'   ).AsFloat   := DataSet.FieldByName( 'rest_sum'   ).AsFloat;
        end;
      qryUpdate.ExecSQL;
    end;

  (DataSet as TfdcQuery).Session.Commit;
end;

procedure TAccInitialRestForm.tlDataFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
  var
    IsEditingEnable : Boolean;
begin
  inherited;

  IsEditingEnable := not AFocusedNode.HasChildren;

  tlDataDOC_NUMBER.Options.Editing := IsEditingEnable;
  tlDataDOC_DATE.Options.Editing   := IsEditingEnable;
  tlDataREST_SUM.Options.Editing   := IsEditingEnable;
end;

procedure TAccInitialRestForm.actSaveExecute(Sender: TObject);
begin
  inherited;

  if dsData.State = dsEdit then
    dsData.Post;
end;

procedure TAccInitialRestForm.actSaveUpdate(Sender: TObject);
begin
  inherited;

  (Sender as TAction).Enabled := dsData.Active
                             and (not dsData.IsEmpty)
                             and (dsData.State = dsEdit);
end;

procedure TAccInitialRestForm.actRemoveExecute(Sender: TObject);
begin
  inherited;

  if MessageDlg( Format( 'Очистить начальные остатки по счёту %s?', [dsData.FieldByName( 'code' ).AsString]), mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  qryDelete.Params.ParamByName( 'id' ).AsInteger := dsData.FieldByName( 'doc_id' ).AsInteger;
  qryDelete.ExecSQL;
  qryDelete.Session.Commit;

  tlData.BeginUpdate;
  try
    RefreshData;
  finally
    tlData.EndUpdate;
  end;
end;

procedure TAccInitialRestForm.actRemoveUpdate(Sender: TObject);
begin
  inherited;

  (Sender as TAction).Enabled := dsData.Active
                             and (not dsData.IsEmpty)
                             and (not dsData.FieldByName( 'doc_id' ).IsNull);
end;

procedure TAccInitialRestForm.dsDataAfterOpen(DataSet: TDataSet);
  var
    CurrCode : string;
    CurrName : string;
begin
  inherited;

  if Caption = c_cptMain then
    begin
      with (DataSet as TfdcQuery) do
        begin
          CurrCode := DictData.dsCurrency.Lookup( 'id', Params.ParamByName( 'currency_id' ).AsInteger, 'code' );
          CurrName := DictData.dsCurrency.Lookup( 'id', Params.ParamByName( 'currency_id' ).AsInteger, 'name' );
        end;

      Caption := Caption + ' (' + CurrCode + ' - ' + CurrName + ')';
    end;
end;

procedure TAccInitialRestForm.dsDataAfterCancel(DataSet: TDataSet);
begin
  inherited;

  tlData.BeginUpdate;
  try
    RefreshData;
  finally
    tlData.EndUpdate;
  end;
end;

procedure TAccInitialRestForm.dsDataAfterPost(DataSet: TDataSet);
begin
  inherited;

  tlData.BeginUpdate;
  try
    RefreshData;
  finally
    tlData.EndUpdate;
  end;
end;

procedure TAccInitialRestForm.FormCreate(Sender: TObject);
begin
  inherited;

  if not DictData.dsCurrency.Active then
    DictData.dsCurrency.Open;
end;

initialization
  RegisterClass( TAccInitialRestForm );

end.
