unit BadPaymentFrm;

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
  dxStatusBar, cxMemo, cxDBEdit, QueryList, OracleData;

type
  TBadPaymentForm = class(TfdcCustomGridForm)
    dsDataNNN: TStringField;
    dsDataINN: TStringField;
    dsDataINN_NAME: TStringField;
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_TYPE: TStringField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataPAYER_ID: TFloatField;
    dsDataCURR_ID: TFloatField;
    dsDataINFO: TStringField;
    dsDataERR_TEXT: TStringField;
    dsDataID: TFloatField;
    grdDataDBBandedTableViewNNN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINFO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewERR_TEXT_: TcxGridDBBandedColumn;
    cxDBMemo1: TcxDBMemo;
    Splitter1: TSplitter;
    dsDataTYPE_NAME: TStringField;
    grdDataDBBandedTableViewCUR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPE_NAME: TcxGridDBBandedColumn;
    actSetSubject: TAction;
    dxBarButton1: TdxBarButton;
    QueryList1: TQueryList;
    sqlSetSubject: TsqlOp;
    sqlConvert: TsqlOp;
    actAdd: TAction;
    dxBarButton2: TdxBarButton;
    actOpen: TAction;
    dxBarButton3: TdxBarButton;
    dsDataKPP: TStringField;
    dsDataCURR_CODE: TStringField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    dsDataERR_TEXT_: TStringField;
    actDelete: TAction;
    sqlDel: TsqlOp;
    dxBarButton5: TdxBarButton;
    actMove: TAction;
    dxBarButton6: TdxBarButton;
    dsMain: TOracleDataSet;
    dsMainNNN: TStringField;
    dsMainINN: TStringField;
    dsMainINN_NAME: TStringField;
    dsMainDOC_NO: TStringField;
    dsMainDOC_DATE: TDateTimeField;
    dsMainDOC_TYPE: TStringField;
    dsMainDOC_SUMMA: TFloatField;
    dsMainSUMMA: TFloatField;
    dsMainPAYER_ID: TFloatField;
    dsMainCURR_ID: TFloatField;
    dsMainINFO: TStringField;
    dsMainERR_TEXT: TStringField;
    dsMainID: TFloatField;
    dsMainKPP: TStringField;
    dsMainCURR_CODE: TStringField;
    dsMainLAST_DATE: TDateTimeField;
    dsMainACC_DATE: TDateTimeField;
    dsMainBANK_DATE: TDateTimeField;
    dsMainLOAD_DATE: TDateTimeField;
    dsMainTYPE_NAME: TStringField;
    dsMainERR_TEXT_: TStringField;
    comboView: TdxBarCombo;
    sqlDataAll: TsqlOp;
    sqlDataErr: TsqlOp;
    sqlDataContr: TsqlOp;
    sqlDataGood: TsqlOp;
    sqlCancel: TsqlOp;
    actCancel: TAction;
    dxBarButton7: TdxBarButton;
    actSetUnknown: TAction;
    sqlSetUnknown: TsqlOp;
    dxBarButton8: TdxBarButton;
    actLoad: TAction;
    btnLoad: TdxBarButton;
    procedure actSetSubjectExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSetSubjectUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actMoveUpdate(Sender: TObject);
    procedure actMoveExecute(Sender: TObject);
    procedure comboViewChange(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure actSetUnknownUpdate(Sender: TObject);
    procedure actSetUnknownExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actLoadExecute(Sender: TObject);
  private
    { Private declarations }
    FSubjId: double;
  procedure SubjectFound(AGridTableView: TcxGridTableView; AIndex,
    ACount: integer; var ADescr: string; var ABreak: boolean);
  procedure SetUnknown(AGridTableView: TcxGridTableView; AIndex,
    ACount: integer; var ADescr: string; var ABreak: boolean);
  procedure SetSubject(AGridTableView: TcxGridTableView; AIndex,
    ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DeleteObject(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure RefreshRecord;
    procedure DoRefreshRecords(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
  public
    { Public declarations }
    procedure DoDeleteObject;
  end;

var
  BadPaymentForm: TBadPaymentForm;

implementation

uses DataDM, SubejctGridFrm, fdcCustomDBDataFrm, PaymentFrm, Math, fdcMessages,
     DLWizardFrm;

{$R *.dfm}

{ TBadPaymentForm }

procedure TBadPaymentForm.SubjectFound(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
 FSubjId := TcxGridDBTableView(AGridTableView).DataController.DataSet['ID'];
 IterateRecords(SetSubject, True, True);
// grdData.ActiveView.DataController.DeleteSelection;
// sqlConvert.Exec;
 RefreshData;
end;

procedure TBadPaymentForm.actSetSubjectExecute(Sender: TObject);
var
  F: TSubjectGridForm;
begin
  inherited;
  F := TSubjectGridForm.Create(nil);
  try
    F.SearchMode := True;
    F.OnSearchFinished := SubjectFound;
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TBadPaymentForm.SetSubject(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  sqlSetSubject.Exec('subj_id', FSubjId);
end;

procedure TBadPaymentForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
  inherited;
  if IsCursorUnderData and actOpen.Update then
    actOpen.Execute;
end;

procedure TBadPaymentForm.actAddExecute(Sender: TObject);
var
  NewNNN: string;
begin
  inherited;
  NewNNN := PaymentFrm.Add;
  if NewNNN <> '' then
  begin
    dsData.Append;
    dsDataNNN.Value := NewNNN;
//    grdDataDBTableView.DataController.SaveDataSetPos;
    RefreshRecord;
//    grdDataDBTableView.DataController.GetRowIndexByRecordIndex()
    grdDataDBTableView.DataController.RecNo :=
    grdDataDBTableView.DataController.FindRecordIndexByKey(NewNNN);
  end;
end;

procedure TBadPaymentForm.actOpenExecute(Sender: TObject);
begin
  inherited;
  if PaymentFrm.Edit(dsDataNNN.Value) then
     RefreshRecord;
end;

procedure TBadPaymentForm.actOpenUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := TAction(Sender).Visible and
  (grdDataDBBandedTableView.Controller.SelectedRowCount = 1);
end;

const
  clBlueDark = TColor($00C56A31);
  clBlueLight = TColor($00F7EAD9);
  clBlueBright = TColor($00FF953D);
  clBlueSky = TColor($00EBC4A4);

  clGold = TColor($0047D5FE);
  clGoldDark = TColor($0001BDF3);

  clGreyLight = TColor($00E2EFF1);
  clGreyDark = TColor($00B9D9DD);
  clYellowLight = TColor($00E1FFFF);

  clGreenBright = TColor($0082E887);
  clGreenLight = TColor($00C9F5CB);
  clGreenObscured = TColor($00ACF0AF);
  clGreenDark = TColor($0044DD4B);

  clSilverDark = TColor($00A6A6A6);

  clLightRed = TColor($00B4B7EB);
  clLightRedFocused = TColor($00363EC9);

procedure TBadPaymentForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if not VarIsNull(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewERR_TEXT_.Index]) then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clLightRed;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused then
        ACanvas.Canvas.Brush.Color := clLightRedFocused;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  if not VarIsNull(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewID.Index]) then
  begin
    ACanvas.Canvas.Font.Color := clDkGray;
  end;

  ADone := False;
end;

procedure TBadPaymentForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Action = caFree then
    BadPaymentForm := nil;
end;

procedure TBadPaymentForm.actSetSubjectUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := grdDataDBBandedTableView.Controller.SelectedRowCount > 0;
end;

procedure TBadPaymentForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := grdDataDBBandedTableView.Controller.SelectedRowCount > 0;
end;

procedure TBadPaymentForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  with ActiveGridTableView.Controller,
       ActiveGridTableView.DataController do
  begin
    { показать предупреждение }
    if WarningDlg(
           'Удаление выделенных объектов. Продолжить?',
           Format('Все выделенные объекты (%d из %d) будут удалены. ' +
             'Удаление выделенных объектов невозможно будет отменить. ' +
             'Удалить выделенные объекты?', [SelectedRecordCount, RecordCount])
          ) <> mrYes
    then
      Exit;

    { удалить выделенные объекты и перечитать данные }
    try
      Refresh;
      IterateRecords(DeleteObject, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;
  end;
end;

procedure TBadPaymentForm.DeleteObject(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  try
    ADescr := 'Удаление объектов...';
    ShowProgress(ADescr);
    DoDeleteObject;
  except
    on E: Exception do
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          if WarningDlg(
               'Ошибка удаления объекта',
               'Если вы хотите продолжить удаление ' +
               'оставшихся объектов нажмите "Да", иначе нажмите "Нет".',
               E.Message) <> mrYes
          then
            ABreak := True;
        end else
          MessageDlg(
            'Ошибка удаления объекта',
            'При попытке удаления объекта ' +
            'произошла ошибка',
            E.Message, mtWarning, [mbOk], 0);
  end;
end;

procedure TBadPaymentForm.DoDeleteObject;
begin
  sqlDel.Exec
end;

procedure TBadPaymentForm.actMoveUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := ( comboView.ItemIndex = 4) // неперенесенные
             and (grdDataDBBandedTableView.Controller.SelectedRowCount > 0);
end;

procedure TBadPaymentForm.actMoveExecute(Sender: TObject);
begin
  inherited;
  with TDLLoaderForm.Create(nil) do
  try
    GridForm := Self;
    LoadMode := lmDocPackPayments;
    if ShowModal = mrOk then
      IterateRecords(DoRefreshRecords, True, False);
  finally
    Free;
  end;
end;

procedure TBadPaymentForm.RefreshRecord;
var
 I: Integer;
begin
  dsMain.SetVariable('NNN', dsDataNNN.Value);
  if dsMain.Active then dsMain.Refresh
     else dsMain.Open;
  dsData.Edit;
  try
   for I := 0 to dsData.FieldCount - 1 do
    dsData.Fields[I].Value := dsMain.FieldValues[dsData.Fields[I].FieldName];
  finally
    dsData.Post;
  end;
end;

procedure TBadPaymentForm.DoRefreshRecords(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
begin
   RefreshRecord;
end;

procedure TBadPaymentForm.comboViewChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TBadPaymentForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('MODE_').Value := comboView.ItemIndex;
end;

procedure TBadPaymentForm.actCancelExecute(Sender: TObject);
begin
  inherited;
  if ConfirmDlg('Отменить перенос платежного документа', '') = mrYes then
  begin
    sqlCancel.Exec;
    RefreshRecord;
  end;
end;

procedure TBadPaymentForm.actCancelUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := (grdDataDBBandedTableView.Controller.SelectedRowCount = 1)
                               and not dsDataID.IsNull;
end;

procedure TBadPaymentForm.actSetUnknownUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := grdDataDBBandedTableView.Controller.SelectedRowCount > 0;
end;

procedure TBadPaymentForm.actSetUnknownExecute(Sender: TObject);
begin
  inherited;
  if ConfirmDlg('Отметить выбранные документы как неидентифицированные?', '') = mrYes then
  begin
    try
     try
       IterateRecords(SetUnknown, True, True);
       MainData.Session.Commit;
     except
       MainData.Session.Rollback;
       raise;
     end;
    finally
       RefreshData;
    end;
  end;
end;

procedure TBadPaymentForm.SetUnknown(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  sqlSetUnknown.Exec;
end;

procedure TBadPaymentForm.FormShow(Sender: TObject);
begin
  inherited;
  actMove.Visible := (ParamCount > 0) and (ParamStr(1) = '/ADM_MODE');
  dsMain.Open;
end;

procedure TBadPaymentForm.actLoadExecute(Sender: TObject);
begin
  inherited;
  with TDLLoaderForm.Create(nil) do
  try
    LoadMode := lmDocPackPayments;
    if ShowModal = mrOk then
      RefreshData;
  finally
    Free;
  end;
end;

end.
