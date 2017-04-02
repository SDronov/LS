unit InteractLogGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxDropDownEdit, cxCalendar;

type
  TInteractLogGridForm = class(TObjectGridForm)
    splDetail: TSplitter;
    pnlDetail: TPanel;
    grdDetail: TcxGrid;
    grdDetailDBTableView1: TcxGridDBTableView;
    grdDetailLevel1: TcxGridLevel;
    dsDetail: TfdcQuery;
    dsDetailID: TIntegerField;
    dsDetailNAME: TStringField;
    dsDetailOBJECT_ID: TIntegerField;
    srcDetail: TDataSource;
    grdDetailDBTableView1ID: TcxGridDBColumn;
    grdDetailDBTableView1NAME: TcxGridDBColumn;
    grdDetailDBTableView1OBJECT_ID: TcxGridDBColumn;
    dsDetaildocument_object_name: TStringField;
    grdDetailDBTableView1document_object_name: TcxGridDBColumn;
    dsDataCODE: TStringField;
    dsDataTYPE: TStringField;
    dsDataSTATE: TStringField;
    dsDataENVID: TStringField;
    dsDataSENDER: TStringField;
    dsDataRECEIVER: TStringField;
    dsDataRECIPIENT_TO: TStringField;
    dsDataFIRSTSENDDATE: TDateTimeField;
    dsDataFORMDATE: TDateTimeField;
    dsDataLASTSENDDATE: TDateTimeField;
    grdDataDBBandedTableViewCode: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewType: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewState: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewENVID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSENDER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRECEIVER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRECIPIENT_TO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFORMDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFIRSTSENDDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLASTSENDDATE: TcxGridDBBandedColumn;
    dsDataAUTHID: TStringField;
    edtType: TcxComboBox;
    lciType: TdxLayoutItem;
    edtCode: TcxTextEdit;
    lciCode: TdxLayoutItem;
    edtGuid: TcxTextEdit;
    lciGuid: TdxLayoutItem;
    edtSender: TcxTextEdit;
    lciSender: TdxLayoutItem;
    edtReceiver: TcxTextEdit;
    lciReceiver: TdxLayoutItem;
    edtRecipientTo: TcxTextEdit;
    lciRecipientTo: TdxLayoutItem;
    edtBeginDate: TcxDateEdit;
    lciBeginDate: TdxLayoutItem;
    edtEndDate: TcxDateEdit;
    lciEndDate: TdxLayoutItem;
    procedure grdDataDBBandedTableViewCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grdDataDBBandedTableViewSelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure dsDataAfterRefresh(DataSet: TDataSet);
    procedure dsDataBeforeRefresh(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataAfterClose(DataSet: TDataSet);
    procedure dsDetailAfterOpen(DataSet: TDataSet);
    procedure dsDetailAfterClose(DataSet: TDataSet);
    procedure dsDetailBeforeRefresh(DataSet: TDataSet);
    procedure dsDetailAfterRefresh(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InteractLogGridForm: TInteractLogGridForm;

implementation

{$R *.dfm}

procedure TInteractLogGridForm.grdDataDBBandedTableViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
//    Sender.

// Sender.Controller.FocusedRecord.Values[Sender.FindItemByName("ID").Index];

end;

procedure TInteractLogGridForm.grdDataDBBandedTableViewSelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  inherited;

  if not dsDetail.Active then begin
    dsDetail.Open;
  end;
  if Sender.Controller.FocusedRecord <> nil then begin
   dsDetail.ParamByName('PRN').Value := Sender.Controller.FocusedRecord.Values[0];
  end else begin
    dsDetail.ParamByName('PRN').Value := null;
  end;
  dsDetail.ReQuery;


//grdDetailDBTableView1.LayoutChanged();
// Sender.Controller.FocusedRecord.Values[Sender.FindItemByName('ID').Index];
end;

procedure TInteractLogGridForm.dsDataAfterRefresh(DataSet: TDataSet);
begin                   
//    OutputDebugString(PChar('xx='+inttostr(grdDataDBTableView.DataController.FocusedRowIndex)));
  inherited;               
    //OutputDebugString('after refresh');
//     dsDetail.Refresh;
//if   grdDataDBTableView.DataController.FocusedRowIndex = -1 then begin
//     grdDataDBTableView.DataController.FocusedRowIndex := 0;
//end;

end;

procedure TInteractLogGridForm.dsDataBeforeRefresh(DataSet: TDataSet);
begin
  inherited;
    //OutputDebugString('Before refresh');
end;

procedure TInteractLogGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
    //OutputDebugString('after open'); 
    grdDataDBTableView.DataController.FocusedRowIndex := 0;
    grdDataDBBandedTableView.DataController.FocusedRowIndex := 0;     
//   if not dsDetail.Active then begin
//      dsDetail.Open;
//    end;

//dsDetail.ParamByName('PRN').Value := grdDataDBTableView.Controller.FocusedRecord.Values[0];
//dsDetail.ReQuery;

//    grdDataDBTableView.DataController.FocusedRowIndex := 0;
//    grdDataDBBandedTableViewSelectionChanged(grdDataDBTableView);

//     dsDetail.ParamByName('PRN').AsInteger := dsData.ParamByName('ID').AsInteger;
//     if dsDetail.Active then  dsDetail.Close;
//     dsDetail.Open;

end;

procedure TInteractLogGridForm.dsDataAfterClose(DataSet: TDataSet);
begin
  inherited;
    //OutputDebugString('after close');

end;


procedure TInteractLogGridForm.dsDetailAfterOpen(DataSet: TDataSet);
begin
  inherited;
    //OutputDebugString('after open detail');

end;

procedure TInteractLogGridForm.dsDetailAfterClose(DataSet: TDataSet);
begin
  inherited;
    //OutputDebugString('after close detail');

end;

procedure TInteractLogGridForm.dsDetailBeforeRefresh(DataSet: TDataSet);
begin
  inherited;
    //OutputDebugString('before refresh detail');

end;

procedure TInteractLogGridForm.dsDetailAfterRefresh(DataSet: TDataSet);
begin
  inherited;
    //OutputDebugString('after refresh detail');

end;

procedure TInteractLogGridForm.grdDataDBBandedTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
    //OutputDebugString('grdDataDBBandedTableViewCanSelectRecord');
    grdDataDBTableView.DataController.FocusedRowIndex := 0;
end;

procedure TInteractLogGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;                                    

  SetSearchParam('NTYPE', edtType.ItemIndex-1);
  SetSearchParam('CODE', Trim(edtCode.Text));
  SetSearchParam('ENVID', Trim(edtGuid.Text));
  SetSearchParam('SENDER', Trim(edtSender.Text));
  SetSearchParam('RECEIVER', Trim(edtReceiver.Text));
  SetSearchParam('RECIPIENT_TO', Trim(edtRecipientTo.Text));
  if edtBeginDate.Text = '' then
    SetSearchParam('BEGIN_DATE', null)
  else
    SetSearchParam('BEGIN_DATE', edtBeginDate.Date);
  if edtEndDate.Text = '' then
    SetSearchParam('END_DATE', null)
  else
    SetSearchParam('END_DATE', edtEndDate.Date);

end;

procedure TInteractLogGridForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
// Отключен инхерит, т.к. "редактирование" не нужно
//  inherited;

end;

initialization
  RegisterClass(TInteractLogGridForm);
end.
