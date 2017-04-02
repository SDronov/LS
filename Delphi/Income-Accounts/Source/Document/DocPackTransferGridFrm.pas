unit DocPackTransferGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel, fdcUtils,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, Oracle, fdcMessages, cxDropDownEdit, cxCalendar, OracleData,
  QueryList;

type
  TDocPackTransferGridForm = class(TDocPackGridForm)
    cbxFilter: TdxBarCombo;
    dsDataCUSTOMS_OUT_ID: TFloatField;
    dsDataCUSTOMS_IN_ID: TFloatField;
    dsDataSEND_DATE: TDateTimeField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataCUSTOMS_OUT_NAME: TStringField;
    dsDataCUSTOMS_IN_NAME: TStringField;
    grdDataDBBandedTableViewCUSTOMS_IN_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_OUT_NAME: TcxGridDBBandedColumn;
    barBtnSend: TdxBarButton;
    actSend: TAction;
    pkgDocPackTransfer: TOraclePackage;
    SaveXML: TSaveDialog;
    actMail: TAction;
    dxBarButton2: TdxBarButton;
    oqGetMail: TOracleQuery;
    OpenXML: TOpenDialog;
    dsDataSTATE_SYSNAME: TStringField;
    dsDataDOC_COUNT: TFloatField;
    grdDataDBBandedTableViewDOC_COUNT: TcxGridDBBandedColumn;
    lcSearchCriteriaItem7: TdxLayoutItem;
    edtCusInName: TcxTextEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    edtCusOutName: TcxTextEdit;
    grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn;
    actGeneratePacks: TAction;
    btnGeneratePacks: TdxBarButton;
    dsDataFILE_NAME: TStringField;
    grdDataDBBandedTableViewFILE_NAME: TcxGridDBBandedColumn;
    dsDataLOAD_DATE: TDateTimeField;
    grdDataDBBandedTableViewLOAD_DATE: TcxGridDBBandedColumn;
    lcSearchCriteriaItem6: TdxLayoutItem;
    Label2: TLabel;
    edtFromLoadDate: TcxDateEdit;
    lcSearchCriteriaItem9: TdxLayoutItem;
    edtToLoadDate: TcxDateEdit;
    lcSearchCriteriaItem10: TdxLayoutItem;
    dsDataUPLOAD_PATH: TStringField;
    grdDataDBBandedTableViewUPLOAD_PATH: TcxGridDBBandedColumn;
    actSendAll: TAction;
    dsetForSendAll: TOracleDataSet;
    barBtnSendAll: TdxBarButton;
    grdDataDBBandedTableViewSEND_DATE: TcxGridDBBandedColumn;
    actSendTTP: TAction;
    dxBarButtonSend: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    barBtnSendTTP: TdxBarSubItem;
    btnSendFile: TdxBarButton;
    btnSendTTP: TdxBarButton;
    qlSQLResult: TQueryList;
    sqlSendTTP: TsqlOp;
    btnSendFileAll: TdxBarButton;
    procedure actSendExecute(Sender: TObject);
    procedure actMailExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actSendUpdate(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure cbxFilterChange(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure actGeneratePacksExecute(Sender: TObject);
    procedure actSendAllExecute(Sender: TObject);
    procedure actSendAllUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataAfterRefresh(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actSendTTPUpdate(Sender: TObject);
    procedure actSendTTPExecute(Sender: TObject);
  private
    procedure SetVisibleControls;
  public
    procedure RefreshData; override;
  end;

implementation

uses
  MainDM
 ,uWizSendFile
 ,uWizGetMailFile
  {$ifdef _DEBUG_}
 ,uDebug
  {$endif}
 , fdcCustomDBDataFrm, fdcCustomDataFrm, fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TDocPackTransferGridForm.actSendExecute(Sender: TObject);
var
  wizSendFile: TwizSendFile;
begin
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( 'Выгрузка конверта...' );
  {$endif}
  if MainData.AppParamExists('DBFUpload') then
    MainData.ConvertTransferPackToDBF(dsData.FieldByName( 'ID' ).AsInteger)
  else
  begin
   wizSendFile:= TwizSendFile.Create(Self, dsData.FieldByName( 'ID' ).AsInteger);
   Try
     if wizSendFile.ShowModal = mrOk  then
       begin
         dsData.Session.commit;
         RefreshData;
       end
       else
         dsData.Session.Rollback;
   finally
     wizSendFile.Free;
   end;
  end;
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( 'Выгрузка конверта завершена.' );
  {$endif}
end;

procedure TDocPackTransferGridForm.actMailExecute(Sender: TObject);
var
  fWizGetMailFile: TfWizGetMailFile;
begin
   fWizGetMailFile:= TfWizGetMailFile.Create(Self);
   Try
     if fWizGetMailFile.ShowModal = mrOk  then
     begin
       dsData.Session.commit;
       RefreshData;
     end
     else
       dsData.Session.Rollback;
   finally
     fWizGetMailFile.Free;
   end;
end;

procedure TDocPackTransferGridForm.actAddExecute(Sender: TObject);
begin
  RegisterAsWaiterFor(ObjectServices.CreateObject('DocPackTransferOut', True, Params));
end;

procedure TDocPackTransferGridForm.actSendUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ( dsData.FieldByName( 'RECEIVER_SOFT_CODE' ).AsString <> 'EXCH' )
                         and (   (dsDataState_SysName.AsString = 'State.DocPackTransferOUT.Formed')
                              or (dsDataState_SysName.AsString = 'State.DocPackTransferOUT.Sended') );
end;

procedure TDocPackTransferGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  dsData.ParamByName('filter').AsInteger := cbxFilter.ItemIndex;
  inherited;
  SetSearchParam('CUSTOMS_IN_NAME', Trim(edtCusINName.Text));
  SetSearchParam('CUSTOMS_OUT_NAME', Trim(edtCusOutName.Text));
  SetSearchParam( 'FROM_LOAD_DATE', edtFromLoadDate.EditValue );
  SetSearchParam( 'TO_LOAD_DATE',   edtToLoadDate.EditValue );
end;

procedure TDocPackTransferGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;

  if ARecord.Values[ grdDataDBBandedTableViewTYPESYSNAME.Index ] <> 'DocPackTransferOut' then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackAlienSelected
    else
      AStyle := MainData.stlDocPackAlien
  else
    if ARecord.Values[ grdDataDBBandedTableViewSTATE_SYSNAME.Index ] = 'State.DocPackTransferOUT.Sended' then
      if ARecord.Selected then
        AStyle := MainData.stlDocPackSendedSelected
      else
        AStyle := MainData.stlDocPackSended
    else if ARecord.Values[ grdDataDBBandedTableViewSTATE_SYSNAME.Index ] = 'State.DocPackTransferOUT.Formed' then
      if VarIsNull( ARecord.Values[ grdDataDBBandedTableViewUPLOAD_PATH.Index ] ) then
        AStyle := MainData.stlDocPackTransNoAuto;
end;

procedure TDocPackTransferGridForm.cbxFilterChange(Sender: TObject);
begin
  RefreshData;
end;

procedure TDocPackTransferGridForm.actGeneratePacksExecute(
  Sender: TObject);
begin
  MainData.pkgCommon.PackageName := 'p_Doc_Pack_Transfer';
  MainData.pkgCommon.CallProcedure('Generate_OutPacks', []);
  MainData.pkgCommon.Session.Commit;
  actRefresh.Execute;
end;

procedure TDocPackTransferGridForm.actSendAllExecute(Sender: TObject);
  var
    wizSendFile: TwizSendFile;
begin
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( 'Выгрузка конвертов...' );
  {$endif}

  wizSendFile := TwizSendFile.Create(Self, -1);
  Try
    if wizSendFile.ShowModal = mrOk  then
      begin
        dsData.Session.commit;
        RefreshData;
      end
    else
      dsData.Session.Rollback;
  finally
    wizSendFile.Free;
  end;

  {$ifdef _DEBUG_}
  uDebug.WriteDebug( 'Выгрузка конвертов завершена.' );
  {$endif}
end;

procedure TDocPackTransferGridForm.RefreshData;
begin
  inherited;

  if dsetForSendAll.Active then
    dsetForSendAll.Refresh
  else
    dsetForSendAll.Open;
end;

procedure TDocPackTransferGridForm.actSendAllUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsetForSendAll.Active
                             and not dsetForSendAll.IsEmpty
                             and ( dsetForSendAll.FieldByName( 'envelop_count' ).AsInteger > 0 );
end;

procedure TDocPackTransferGridForm.SetVisibleControls;
begin
  if not ParamByName( 'pack_id' ).IsNull then
    begin
      dxbcTO.Visible           := ivNever;
      cbxFilter.Visible        := ivNever;
      actAdd.Visible           := False;
      actDelete.Visible        := False;
      actSendAll.Visible       := False;
      actMail.Visible          := False;
      actGeneratePacks.Visible := False;
    end
  else
    begin
      dxbcTO.Visible           := ivAlways;
      cbxFilter.Visible        := ivAlways;
      actAdd.Visible           := True;
      actDelete.Visible        := True;
      actSendAll.Visible       := True;
      actMail.Visible          := True;
      actGeneratePacks.Visible := True;
    end;
end;

procedure TDocPackTransferGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  SetVisibleControls;
end;

procedure TDocPackTransferGridForm.dsDataAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  SetVisibleControls;
end;

procedure TDocPackTransferGridForm.FormShow(Sender: TObject);
  var lv_Exch_OnOffTTP: Variant;
begin
  inherited;
  //-- Определение состояния переключателя "Взаимодействие с ТТП"
  lv_Exch_OnOffTTP := MainData.GetSystemValue('Exch.OnOffTTP',rvInteger);
  actSendTTP.Visible := (lv_Exch_OnOffTTP = 1);
  if (lv_Exch_OnOffTTP = 1) then
    begin
      barBtnSendTTP.Visible := ivAlways;
      barBtnSend.Visible := ivNever;
    end
  else
    begin
      barBtnSendTTP.Visible := ivNever;
      barBtnSend.Visible := ivAlways;
    end;
  barBtnSendAll.Visible := barBtnSend.Visible;
end;

procedure TDocPackTransferGridForm.actSendTTPUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ( dsData.FieldByName( 'RECEIVER_SOFT_CODE' ).AsString <> 'EXCH' )
                         and (   (dsDataState_SysName.AsString = 'State.DocPackTransferOUT.Formed')
                              or (dsDataState_SysName.AsString = 'State.DocPackTransferOUT.Sended') );
end;

procedure TDocPackTransferGridForm.actSendTTPExecute(Sender: TObject);
begin
  sqlSendTTP.Exec('packid',[dsDataID.AsFloat]);
end;

initialization
  RegisterClass( TDocPackTransferGridForm );

end.
