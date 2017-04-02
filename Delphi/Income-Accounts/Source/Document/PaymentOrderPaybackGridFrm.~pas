unit PaymentOrderPaybackGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalc, QueryList, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxMemo, cxCurrencyEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, cxCheckBox,
  xlcClasses, xlEngine, xlReport,ObjectFrm, Oracle;

type
  TPayment_Order_PaybackGridForm = class(TPaymentOrderGridForm)
    dsDataDECISION_DOC_NO: TStringField;
    dsDataDECISION_DOC_DATE: TDateTimeField;
    dsDataREG_RET_DOC_NO: TStringField;
    dsDataREG_RET_DOC_DATE: TDateTimeField;
    colDecisionDocNo: TcxGridDBBandedColumn;
    colDecisionDocDate: TcxGridDBBandedColumn;
    colRetRegDocNo: TcxGridDBBandedColumn;
    colRetRegDocDate: TcxGridDBBandedColumn;
    dsDataKBKCODE: TStringField;
    Label3: TLabel;
    colKBK: TcxGridDBBandedColumn;
    dsDataPO_NAME: TStringField;
    dsDataPO_INN: TStringField;
    dsDataPO_KPP: TStringField;
    grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_KPP: TcxGridDBBandedColumn;
    fdcPrint: TfdcQuery;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxbcTO: TdxBarCombo;
    dsDataCUSTOMSFULLNAME: TStringField;
    actPrint: TAction;
    grdDataDBBandedTableViewCUSTOMSFULLNAME: TcxGridDBBandedColumn;
    xlrReestr: TxlReport;
    dsDataLAST_DAYS: TFloatField;
    grdDataDBBandedTableViewLAST_DAYS: TcxGridDBBandedColumn;
    dxBarButton3: TdxBarButton;
    actWork: TAction;
    sqlSetStatusWork: TsqlOp;
    dsDataDECISION_BIC: TStringField;
    dsDataDECISION_BANK_NAME: TStringField;
    dsDataDECISION_CORR_ACCOUNT: TStringField;
    dsDataDECISION_ACCOUNT: TStringField;
    dsDataDECISION_PERSONAL_ACCOUNT: TStringField;
    grdDataDBBandedTableViewDECISION_BIC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_BANK_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_CORR_ACCOUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECISION_ACCOUNT: TcxGridDBBandedColumn;
    actOpenDecision: TAction;
    grdDataDBBandedTableViewDEC_PAY_ID: TcxGridDBBandedColumn;
    dsDataDEC_PAY_ID: TFloatField;
    barOpenDecision: TdxBarButton;
    fdcPrintHeader: TfdcQuery;
    pkgDocPackReturns: TOraclePackage;
    QueryList1: TQueryList;
    sqlCheckDocToReestr: TsqlOp;
    actFormPack: TAction;
    sqlGetDocPackExtSource: TsqlOp;
    barBtnFormPack: TdxBarButton;
    sqlGetIsTS: TsqlOp;
    dsDataDEBTS_SUMMA: TFloatField;
    dsDataDEBT_PAY_SUMMA: TFloatField;
    dsDataDEBT_PENY_SUMMA: TFloatField;
    dsDataDEBT_PROC_SUMMA: TFloatField;
    grdDataDBBandedTableViewDEBTS_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEBT_PAY_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEBT_PENY_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEBT_PROC_SUMMA: TcxGridDBBandedColumn;
    actGetDebts: TAction;
    dxBarButton4: TdxBarButton;
    sqlGetDebts: TsqlOp;
    procedure actDeleteUpdate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure fdcPrintBeforeOpen(DataSet: TDataSet);
    procedure dxbcTOChange(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actWorkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actOpenDecisionUpdate(Sender: TObject);
    procedure actOpenDecisionExecute(Sender: TObject);
    procedure actPrintUpdate(Sender: TObject);
    procedure fdcPrintHeaderBeforeOpen(DataSet: TDataSet);
    procedure actAddUpdate(Sender: TObject);
    procedure actAssureUpdate(Sender: TObject);
    procedure actReuseCreateUpdate(Sender: TObject);
    procedure actWorkUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFormPackExecute(Sender: TObject);
    procedure actFormPackUpdate(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actGetDebtsExecute(Sender: TObject);
    procedure actGetDebtsUpdate(Sender: TObject);
  private
    fDocPackExtSource : string;
  protected
    RestoredCustoms : string;
  public
    procedure LoadLayout; override;
    procedure SaveLayout; override;
  end;

implementation

{$R *.dfm}

uses
  fdcCustomGridFrm
 ,fdcCustomDataFrm
 ,fdcCustomDBDataFrm
 ,fdcUtils
 ,MainDM;

const
  cReportDir      = 'Report\';
  cRegKey_Customs = 'CurrentCustoms';


procedure TPayment_Order_PaybackGridForm.actDeleteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not dsData.ParamByName( 'pack_id' ).IsNull
                         and dsData.Active
                         and not dsData.IsEmpty;
  TAction(Sender).Visible := not dsData.ParamByName( 'pack_id' ).IsNull
                         and ( fDocPackExtSource = MainData.GetSoftCustomsCode );
end;

procedure TPayment_Order_PaybackGridForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  if fdcPrintHeader.Active then fdcPrintHeader.Close;
  if fdcPrint.Active       Then fdcPrint.Close;
  fdcPrintHeader.Open;
  fdcPrint.Open;
  if fdcPrint.IsEmpty Then
    showmessage('Нет данных для отображения')
  else
    begin
      xlrReestr.XLSTemplate := ExtractFilePath(Application.ExeName) + cReportDir + ExtractFileName( xlrReestr.XLSTemplate );
      xlrReestr.Report(True);
    end;
end;

procedure TPayment_Order_PaybackGridForm.fdcPrintBeforeOpen(
  DataSet: TDataSet);
begin
  fdcPrint.ParamByName('pTo').Value := MainData.GetChildCustomsCodeByName( dxbcTO.Text );
end;

procedure TPayment_Order_PaybackGridForm.dxbcTOChange(
  Sender: TObject);
begin
  RefreshData;
end;

procedure TPayment_Order_PaybackGridForm.dsDataBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if Params.FindParam('NA') = nil then
    case cmbxViewMode.ItemIndex of
      1: dsData.ParamByName('NA').Value := 1;
      2: dsData.ParamByName('NA').Value := 2;
      3: dsData.ParamByName('NA').Value := 3;
      4: dsData.ParamByName('NA').Value := 4;
      5: dsData.ParamByName('NA').Value := 5;
      else
        dsData.ParamByName('NA').Value := Null;
    end;

  dsData.ParamByName('pTo').Value := MainData.GetChildCustomsCodeByName( dxbcTO.Text );
end;

procedure TPayment_Order_PaybackGridForm.actWorkExecute(Sender: TObject);
var i : integer;
    j : integer;
begin
{ sqlSetStatusWork.Exec;
 i := sqlSetStatusWork.ParamValues['result'];
 MessageDlg('Обработано  '+IntToStr(i)+' заявок на возврат.', mtInformation,[mbYes],0);}

  if grdDataDBBandedTableView.Controller.SelectedRowCount = 1 then
  begin
    if MessageDlg( 'Обработать документ '+dsData.FieldByName( 'doc_no' ).AsString + ' от ' + FormatDateTime( 'DD.MM.YYYY', dsData.FieldByName( 'DOC_DATE' ).AsDateTime ) +'?',
                    mtConfirmation,
                    [mbYes, mbNo],
                    0 ) = mrYes then
    begin
      with  grdDataDBBandedTableView.Controller do
      sqlSetStatusWork.Exec('pId',dsData.FieldByName( 'ID' ).AsInteger);
      dsData.Session.Commit;
      RefreshData;
    end;
  end
  else
  begin
     j:= 0;
    if MessageDlg('Обработать выбранные документы ('+IntToStr(grdDataDBBandedTableView.Controller.SelectedRowCount)+'шт.)?',
                  mtConfirmation,
                  [mbYes, mbNo],
                  0 ) = mrYes then
    begin
      with  grdDataDBBandedTableView.Controller do
      if SelectedRowCount > 0 then
        		for i := 0 to SelectedRecordCount-1 do
        		begin
               try
          		   sqlSetStatusWork.Exec('pId',SelectedRecords[i].Values[grdDataDBBandedTableViewID.Index]);
          		   dsData.Session.Commit;
      			except
        				dsData.Session.Rollback;
        				j := j + 1;
               end;
        		end;
            if j > 0 Then
               MessageDlg('Не обработано заявок на возврат ('+IntToStr(j)+'шт.).', mtInformation,[mbYes],0);
            RefreshData;
      end;
  end;

end;

procedure TPayment_Order_PaybackGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  MainData.GetChildCustomsNames( dxbcTO.Items );

  if dxbcTO.Items.IndexOf( RestoredCustoms ) >= 0 then
    dxbcTO.Text := RestoredCustoms;
  // Разрешить для РТУ и ФТС
  actGetDebts.Visible :=  not ( MainData.GetCustomsLevel = 2 );

end;

procedure TPayment_Order_PaybackGridForm.SaveLayout;
begin
  inherited;

  WriteRegistryValue(FormLayoutRegistryKey, cRegKey_Customs, dxbcTO.Text);
end;

procedure TPayment_Order_PaybackGridForm.LoadLayout;
begin
  inherited;

  RestoredCustoms := ReadRegistryValue( FormLayoutRegistryKey, cRegKey_Customs, rvString );
end;

procedure TPayment_Order_PaybackGridForm.actOpenDecisionUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and ( grdDataDBBandedTableView.Controller.SelectedRowCount > 0 );
end;

procedure TPayment_Order_PaybackGridForm.actOpenDecisionExecute(
  Sender: TObject);
begin
  if not (    dsData.Active
          and not dsData.IsEmpty
          and ( grdDataDBBandedTableView.Controller.SelectedRowCount > 0 ) ) then
    Exit;

  ObjectServices.OpenObject( grdDataDBBandedTableView.Controller.SelectedRows[0].Values[ grdDataDBBandedTableViewDEC_PAY_ID.Index ], nil );
end;

procedure TPayment_Order_PaybackGridForm.actPrintUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and ( dxbcTO.Text <> 'Все' )
                             and ( dsData.ParamByName( 'NA' ).AsFloat = 5 )
                             and ParamByName( 'pDecId' ).IsNull
                             and ParamByName( 'pack_id' ).IsNull
                             and ParamByName( 'gl_subject_id' ).IsNull;
  (Sender as TAction).Visible := ParamByName( 'pDecId' ).IsNull
                             and ParamByName( 'pack_id' ).IsNull
                             and ParamByName( 'gl_subject_id' ).IsNull;
end;

procedure TPayment_Order_PaybackGridForm.fdcPrintHeaderBeforeOpen(
  DataSet: TDataSet);
begin
  fdcPrintHeader.ParamByName('customs_name').Value := dxbcTO.Text;
  fdcPrintHeader.ParamByName('customs_code').Value := MainData.GetChildCustomsCodeByName( dxbcTO.Text );
end;

procedure TPayment_Order_PaybackGridForm.actAddUpdate(Sender: TObject);
begin
  inherited;

  (Sender as TAction).Visible := (Sender as TAction).Visible
                             and ParamByName( 'pDecId' ).IsNull;
  (Sender as TAction).Enabled := (Sender as TAction).Enabled
                             and ParamByName( 'pDecId' ).IsNull;
end;

procedure TPayment_Order_PaybackGridForm.actAssureUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := False;
  (Sender as TAction).Visible := False;
end;

procedure TPayment_Order_PaybackGridForm.actReuseCreateUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := False;
  (Sender as TAction).Visible := False;
end;

procedure TPayment_Order_PaybackGridForm.actWorkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and (MainData.GetCustomsLevel < 2)
                             and (    dsData.ParamByName( 'pack_id' ).IsNull
                                   or ( fDocPackExtSource <> MainData.GetSoftCustomsCode ) );
  (Sender as TAction).Visible := (MainData.GetCustomsLevel < 2);
end;

procedure TPayment_Order_PaybackGridForm.dsDataAfterOpen(
  DataSet: TDataSet);
begin
  inherited;

  if     dsData.ParamByName( 'pDecId' ).IsNull
     and dsData.ParamByName( 'pack_id' ).IsNull
     and dsData.ParamByName( 'gl_subject_id' ).IsNull then
    dxbcTO.Visible := ivAlways
  else
    dxbcTO.Visible := ivNever;

  if dsData.ParamByName( 'pack_id' ).IsNull then
    fDocPackExtSource := ''
  else
    fDocPackExtSource := sqlGetDocPackExtSource.Exec( 'id', dsData.ParamByName( 'pack_id' ).AsFloat );
end;

procedure TPayment_Order_PaybackGridForm.actDeleteExecute(Sender: TObject);
  var
    i : integer;
    s : string;
begin
  if grdDataDBBandedTableView.Controller.SelectedRowCount = 1 then
    s := 'Исключить документ ' + dsData.FieldByName( 'doc_no' ).AsString + ' от ' + FormatDateTime( 'DD.MM.YYYY', dsData.FieldByName( 'DOC_DATE' ).AsDateTime ) + ' из реестра?'
  else
    s := 'Исключить выбранные(' + IntToStr(grdDataDBBandedTableView.Controller.SelectedRowCount) + 'шт.) документы из реестра?';
  if MessageDlg( s,
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
    begin
      with  grdDataDBBandedTableView.Controller do
      if SelectedRowCount > 0 then
        for i := 0 to SelectedRecordCount-1 do
        begin
          pkgDocPackReturns.CallProcedure( 'RemoveDoc', [ ParamByName( 'pack_id' ).AsInteger, SelectedRecords[i].Values[grdDataDBBandedTableViewID.Index] ] );
        end;
      RefreshData;
    end;
end;

procedure TPayment_Order_PaybackGridForm.actFormPackExecute(
  Sender: TObject);
  var
    NoY :Integer;
    NoW :Integer;
begin
  sqlGetIsTS.Exec('id',[ParamByName( 'pack_id' ).AsInteger]);
  sqlCheckDocToReestr.Exec('Is_TS',[sqlGetIsTS.ParamValues['result']]);
  NoY := sqlCheckDocToReestr.ParamValues['pNoY'];
  NoW := sqlCheckDocToReestr.ParamValues['pNoW'];
  If    ( NoY + NoW = 0 )
     or (MessageDlg('Не включенных - '+IntToStr(NoY)+' Не обработанные - ' +IntToStr(NoW)+'. Продолжить?', mtInformation,
                    [mbYes, mbNo],0) = mrYes) then
    begin
      pkgDocPackReturns.CallProcedure( 'FormPackage', [ParamByName( 'pack_id' ).AsInteger] );
      RefreshData;
    end;
end;

procedure TPayment_Order_PaybackGridForm.actFormPackUpdate(
  Sender: TObject);
begin
  TAction(Sender).Visible := not dsData.ParamByName( 'pack_id' ).IsNull
                         and ( fDocPackExtSource = MainData.GetSoftCustomsCode );

  TAction(Sender).Enabled := TAction(Sender).Visible;
end;

procedure TPayment_Order_PaybackGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ARecord.Values[ grdDataDBBandedTableViewSTATE_SYSNAME.Index ] = 'State.PayBack.Received' then
    AStyle := MainData.stlPOPaybackLoaded
  else if ARecord.Values[ grdDataDBBandedTableViewSTATE_SYSNAME.Index ] = 'State.PayBack.Confirm' then
    AStyle := MainData.stlPOPaybackConfirmed
  else if ARecord.Values[ grdDataDBBandedTableViewSTATE_SYSNAME.Index ] = 'State.PayBack.Denial' then
    AStyle := MainData.stlPOPaybackDenial
  else
    AStyle := MainData.stlPOPaybackWorked;
end;

procedure TPayment_Order_PaybackGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (
      ( IfElse( VarIsNull( AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDEBTS_SUMMA.Index] )
               ,0
               ,AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDEBTS_SUMMA.Index]
              ) ) <>
      ( IfElse( VarIsNull( AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDEBT_PAY_SUMMA.Index] )
               ,0
               ,AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDEBT_PAY_SUMMA.Index]
              ) ) +
      ( IfElse( VarIsNull( AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDEBT_PENY_SUMMA.Index] )
               ,0
               ,AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDEBT_PENY_SUMMA.Index]
              ) ) +
      ( IfElse( VarIsNull( AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDEBT_PROC_SUMMA.Index] )
               ,0
               ,AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDEBT_PROC_SUMMA.Index]
              ) )
      ) then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clYellowLight;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clYellowFocused;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
end;

procedure TPayment_Order_PaybackGridForm.actGetDebtsExecute(
  Sender: TObject);
begin
  inherited;
   try
    sqlGetDebts.Exec;
    if (sqlGetDebts.ParamValues['pCount'] = 0) and (sqlGetDebts.ParamValues['pSendCount'] = 0) then
      if MessageDlg('Нет заявок на возврат по которым необходимо отправить запрос в АПС "Задолженность".', mtInformation,
        [mbOk], 0) = mrOk then
        exit;
    if (sqlGetDebts.ParamValues['pCount'] <> 0) and (sqlGetDebts.ParamValues['pSendCount'] = 0) then
      if MessageDlg('Найдено ' + sqlGetDebts.ParamValues['pCount']
          + ' заявок на возврат по которым необходимо отправить запрос в АПС "Задолженность". '
          + ' Запросы не сформированы, так как взаимодействие с АПС "Задолженность" отключено.', mtInformation,
        [mbOk], 0) = mrOk then
        exit;
    if MessageDlg( 'Сформировано - '+ sqlGetDebts.ParamValues['pSendCount']+' запросов в АПС "Задолженность". Отправить?',
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
        sqlGetDebts.QueryList.Session.Commit
     else
        sqlGetDebts.QueryList.Session.Rollback;
   except
      sqlGetDebts.QueryList.Session.Rollback;
      raise;
   end;

end;

procedure TPayment_Order_PaybackGridForm.actGetDebtsUpdate(
  Sender: TObject);
begin
  inherited;
      (Sender as TAction).Enabled :=    ( MainData.GetCustomsLevel <> 2 );
end;

initialization
  RegisterClass(TPayment_Order_PaybackGridForm);

end.
