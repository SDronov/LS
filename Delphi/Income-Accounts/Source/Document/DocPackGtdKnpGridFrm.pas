unit DocPackGtdKnpGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, DB, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl,
  cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxCalendar, dxmdaset,
  cxGraphics, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, Oracle, ztvregister, ztvBase,
  ztvZipTV, ztvUnLha, cxCurrencyEdit, QueryList, cxCheckBox;

type
  TDocPackGtdKnpGridForm = class(TObjectGridForm)
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataAGREEMENT_ID: TFloatField;
    dsDataAGREEMENT_NAME: TStringField;
    dsDataERR_COUNT: TFloatField;
    dsDataDOCPACK_SUMMA: TFloatField;
    dsDataSTATE_SYSNAME: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataSENDER_SOFT_CODE_ID: TFloatField;
    dsDataSENDER_SOFT_NAME: TStringField;
    dsDataSENDER_SOFT_CODE: TStringField;
    dsDataRECEIVER_SOFT_CODE_ID: TFloatField;
    dsDataRECEIVER_SOFT_NAME: TStringField;
    dsDataRECEIVER_SOFT_CODE: TStringField;
    dsDataDATE_SEND: TDateTimeField;
    dsDataEXECUTOR: TStringField;
    dsDataBROKER_ID: TFloatField;
    dsDataLICENCE_ID: TFloatField;
    dsDataBROKER_INN: TStringField;
    dsDataBROKER_KPP: TStringField;
    dsDataBROKER_NAME: TStringField;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJ_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJ_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJ_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewAGREEMENT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewAGREEMENT_NAME: TcxGridDBBandedColumn;
    lcgRegistry: TdxLayoutGroup;
    edtCustCode: TcxTextEdit;
    lciCustCode: TdxLayoutItem;
    edtFromDate: TcxDateEdit;
    lciFromDate: TdxLayoutItem;
    edtToDate: TcxDateEdit;
    lciToDate: TdxLayoutItem;
    edtNumRee: TcxTextEdit;
    lciNumRee: TdxLayoutItem;
    lcgKNP: TdxLayoutGroup;
    edtKNPName: TcxTextEdit;
    lciKNPName: TdxLayoutItem;
    edtKNPINN: TcxTextEdit;
    lciKNPINN: TdxLayoutItem;
    cmbxAgrmtId: TfdcObjectLookupEdit;
    lciAgrmtId: TdxLayoutItem;
    dsAgrmData: TdxMemData;
    srcAgrmData: TDataSource;
    dsAgrmDataID: TIntegerField;
    grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOCPACK_SUMMA: TcxGridDBBandedColumn;
    cmbxViewMode: TdxBarCombo;
    grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn;
    dxBarSubItem1: TdxBarSubItem;
    btnProcess: TdxBarButton;
    btnCancel: TdxBarButton;
    dsSetState: TfdcQuery;
    dsDataSUBJ_NAME: TStringField;
    dsDataSUBJ_INN: TStringField;
    dsDataSUBJ_KPP: TStringField;
    SaveXML: TSaveDialog;
    dlgOpenFile: TOpenDialog;
    actSend: TAction;
    actReceive: TAction;
    qryGetPackAsXML: TOracleQuery;
    oqGetReceive: TOracleQuery;
    btnSend: TdxBarButton;
    btnReceive: TdxBarButton;
    actProcess: TAction;
    dsDataSTATE_NAME: TStringField;
    grdDataDBBandedTableViewStateName: TcxGridDBBandedColumn;
    actExcel: TAction;
    btnExcel: TdxBarButton;
    actCancel: TAction;
    ZipTV: TZipTV;
    UnLha: TUnLha;
    QueryList1: TQueryList;
    sqlGetHeader: TsqlOp;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cmbxViewModeChange(Sender: TObject);
    procedure actProcessExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSendExecute(Sender: TObject);
    procedure actReceiveExecute(Sender: TObject);
    procedure actSendUpdate(Sender: TObject);
    procedure actProcessUpdate(Sender: TObject);
    procedure actExcelUpdate(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FStateName: String;
    FPartPayEnable: boolean;
    procedure SetObjectState(const StateName: String);
    procedure SetState(AGridTableView: TcxGridTableView; AIndex,
                    ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure SetVisibleComponent;

  public
    { Public declarations }
  end;

var
  AgreementRegistryGridForm: TDocPackGtdKnpGridForm;

implementation

uses MainDm, DictDm, fdcUtils, fdcCustomDBDataFrm, fdcCustomGridFrm,
  fdcCustomObjectGridFrm, fdcMessages, qBPReport, fdcCustomDataFrm, ITransportAcrh;

{$R *.dfm}

function ExecuteForm(const AFormClass: string): boolean;
var
  F: TForm;
begin
  F := TFormClass((FindClass(AFormClass)(* as TFormClass*))).Create(nil);
  try
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TDocPackGtdKnpGridForm.actAddExecute(Sender: TObject);
begin
  case MainData.GetCustomsLevel of
    2: inherited actAddExecute(Sender);
  3,4: ExecuteForm('TARegistryLoaderWzdForm');
  end;
  RefreshData;
  RefreshWaiters;
end;


procedure TDocPackGtdKnpGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSubsParam('viewmode', cmbxViewMode.ItemIndex);
//  dsData.ParamByName('CUST_CODE').Value := Trim(cmbxCustCode.Text);
  SetSearchParam('INN_KNP', Trim(edtKNPINN.Text));
  SetSearchParam('DECL_NAME', Trim(edtKNPName.Text));
//  SetSearchParam('KPP', Trim(edtKpp.Text));
  SetSearchParam('NUM_REE', Trim(edtNumRee.Text));
  SetSearchParam('CUST_CODE', Trim(edtCustCode.Text));
  SetSearchParam('FROM_DATE', edtFromDate.EditValue);
  SetSearchParam('TO_DATE', edtToDate.EditValue);
  SetSearchParam('AGRMT_ID', dsAgrmData['ID']);
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

procedure TDocPackGtdKnpGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  StateName: string;
  val: Integer;
begin
  inherited;
{
  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewAS_BIG_PAYER.Index], varInteger);
  if (val = 1) then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
        clGreenDark, clGreenBright);
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
}
{
  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewDEBT_COUNT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
     ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clLightRedFocused, clLightRed);
     ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
}
  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewERR_COUNT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;

    ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clBlueSky, clBlueLight);


    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  StateName := VarToStr(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewSTATE_SYSNAME.Index]);
  if StateName = 'State.DocPackGTDKNP.Processed' then
  begin
    ACanvas.Font.Color := clGrayText;
  end;

  ADone := False;
end;


procedure TDocPackGtdKnpGridForm.cmbxViewModeChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TDocPackGtdKnpGridForm.SetObjectState(const StateName: String);
begin
  try
   FStateName := StateName;
   Self.IterateRecords(SetState, True, True);
  finally
   ActiveGridTableView.Controller.ClearSelection;
   RefreshData;
  end;
end;

procedure TDocPackGtdKnpGridForm.SetState(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
  var
    vPartState: boolean;
    vPayFlag: Integer;
    TransitID: Double;
begin
  if dsDataSTATE_SYSNAME.Value <> FStateName then
  begin
    vPartState := (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.PartPaid');
    if FStateName = 'State.DocPackGTDKNP.Processed' then // оплата
      begin
        MainData.pkgCommon.PackageName := 'p_doc_pack_gtd_knp';
        vPayFlag := MainData.pkgCommon.CallIntegerFunction('Check_AbilityPay', [dsDataID.Value]);
        if vPayFlag = 0 then // нет денег для оплаты всего реестра
          begin
            // запретим частично оплаченные реестры оплачивать частично еще раз(нет транзитного перехода)
            if FPartPayEnable and not vPartState then
              vPayFlag := MainData.pkgCommon.CallIntegerFunction('Check_PartialPay', [dsDataID.Value]);
            if (vPayFlag = 0) then // нет денег для частичной оплаты
              begin
                InfoDlg(Format('Недостаточно средств для оплаты реестра №%s от %s !', [dsDataDOC_NUMBER.Value, dsDataDOC_DATE.AsString]));
                Exit;
              end
            else
              if WarningDlg( Format('Внимание! Недостаточно средств для полной оплаты реестра ДТ КНП №%s от %s!', [dsDataDOC_NUMBER.Value, dsDataDOC_DATE.AsString]),
                             'Если Вы хотите произвести частичную оплату, нажмите "Да", иначе нажмите "Нет"' ) = mrYes then
                TransitID := MainData.sqlGetObjectId.Exec('TypeName;SysName', ['StateTransit', 'StateTransit.DocPackGTDKNP.Loaded->PartPaid'])
              else
                Exit;
          end
        else
          TransitID := MainData.sqlGetObjectId.Exec('TypeName;SysName',
             ['StateTransit',
               IfElse( vPartState,
                       'StateTransit.DocPackGTDKNP.PartPaid->Processed',
                       'StateTransit.DocPackGTDKNP.Loaded->Processed'
                     )
             ]);
      end
    else // отмена оплаты
      TransitID := MainData.sqlGetObjectId.Exec('TypeName;SysName',
             ['StateTransit',
               IfElse( vPartState,
                       'StateTransit.DocPackGTDKNP.PartPaid->Loaded',
                       'StateTransit.DocPackGTDKNP.Processed->Loaded'
                     )
             ]);
    dsSetState.ParamByName('STATE_TRANSIT_ID').AsFloat :=  TransitID;
    dsSetState.ExecSQL;
  end;
end;

procedure TDocPackGtdKnpGridForm.actProcessExecute(Sender: TObject);
begin
  inherited;
  SetObjectState('State.DocPackGTDKNP.Processed');
end;

procedure TDocPackGtdKnpGridForm.SetVisibleComponent;
  var
    IsCustomsLevel : boolean;
    IsKNPLevel: boolean;
begin
  IsCustomsLevel     := ( MainData.GetCustomsLevel = 2 );
  IsKNPLevel         := ( MainData.GetCustomsLevel in [3,4] );
  lcgKNP.Visible     := not IsCustomsLevel;
  lciAgrmtId.Visible := not IsCustomsLevel;
  actSend.Visible    := IsCustomsLevel;
  actReceive.Visible := IsKNPLevel;
  actAdd.Visible     := IsCustomsLevel;
  actProcess.Visible := IsKNPLevel;
  actCancel.Visible  := IsKNPLevel;
end;

procedure TDocPackGtdKnpGridForm.FormShow(Sender: TObject);
begin
  inherited;
  SetVisibleComponent;
end;

procedure TDocPackGtdKnpGridForm.actSendExecute(Sender: TObject);
var
  str  :string;
  vCLOB : TLOBLocator;
  vLog  : TLOBLocator;

  procedure CreateArchive(FileName: string);
  var
    Archive: TIAccTransportArchive;
    Path: String;
  begin
    Path:= ExtractFilePath(FileName);
    try
      if CreateTransportArchive('186', Archive, Path) then
      begin
        //Archive.Description := sqlGetHeader.Exec;
       Archive.AddFiles(FileName);

       Archive.Save;
      end;
    finally
      Archive.Free;
    end;
  end;
begin
  try
    if not dsDataID.IsNull and
      SaveXML.Execute then
    begin
      if FileExists(SaveXML.FileName)then
        DeleteFile(SaveXML.FileName);
      str := ExtractFilePath(SaveXML.FileName);
      if not SysUtils.DirectoryExists(str) then
        SysUtils.ForceDirectories(str);

      vCLOB := TLOBLocator.Create(qryGetPackAsXML.Session, otCLOB);
      vLog  := TLOBLocator.Create(qryGetPackAsXML.Session, otCLOB);
      Try
        qryGetPackAsXML.SetVariable('vPackId', dsDataID.Value);
        qryGetPackAsXML.SetComplexVariable('vXML', vCLOB);
        qryGetPackAsXML.SetComplexVariable('vLog', vLog );
        qryGetPackAsXML.Execute;
        if vCLOB.IsNull then
          ErrorDlg(Exception.Create('Невозможно создать файл, т.к. не удалось получить XML-представление объекта! '))
        else
          Try
            vCLOB.SaveToFile(SaveXML.FileName);
            CreateArchive(SaveXML.FileName);
          except
            on E: Exception do
              ErrorDlg(Exception.CreateFmt('Не удалось сохранить файл из-за ошибки: <%s>!', [E.Message]));
          end;
      finally
       vCLOB.Free;
       vLog.Free;
       RefreshData;
       RefreshWaiters;
      end;
    end;
  except
    on E: Exception do
      ErrorDlg(E);
  end
end;

procedure TDocPackGtdKnpGridForm.actReceiveExecute(Sender: TObject);
var
  FileName  : string;
  vFileList : TStringList;
  i         : integer;

  procedure LoadFile (const AFileName: TFileName);
   var
    vCLOB : TLOBLocator;
    vLog  : TLOBLocator;
  begin
    if not FileExists(AFileName) then
      raise Exception.CreateFmt('Файл <%s> не найден!', [AFileName]);

    vCLOB := TLOBLocator.CreateTemporary(oqGetReceive.Session, otCLOB, True);
    vLog  := TLOBLocator.CreateTemporary(oqGetReceive.Session, otCLOB, True);
    with oqGetReceive do
    Try
      vCLOB.LoadFromFile(AFileName);
      if vCLOB.IsNull then
        raise Exception.CreateFmt('Файл <%s> не содержит данных!', [AFileName]);
      SetComplexVariable('xmldoc', vCLOB);
      SetComplexVariable('log',    vLog);
      Execute;
      oqGetReceive.Session.Commit;
    finally
      vCLOB.Free;
      vLog.Free;
    end;
  end;

begin
  if dlgOpenFile.Execute then
    try
      FileName := dlgOpenFile.FileName;
       if (UpperCase(ExtractFileExt(FileName)) = '.LZH') then
       begin
         vFileList := TStringList.Create;
         try
           ZipTV.ArchiveFile := FileName;
           ZipTV.FilesInArchive(vFileList);
           if (vFileList.Count = 0) then
             raise Exception.CreateFmt('Архив <%s> - не содержит ни одного файла с расширением "xml"!', [FileName]);

           UnLha.ExtractDir  := ExtractFileDir(FileName);
           UnLha.ArchiveFile := ZipTV.ArchiveFile;
           UnLha.Extract;

           for i := 0 to vFileList.Count-1 do
             begin
               FileName := ExtractFilePath(UnLha.ArchiveFile)+ExtractFileName(vFileList.Strings[i]);
               LoadFile(FileName);
               DeleteFile(FileName);
             end;
         finally
           vFileList.Free;
         end;
       end
     else
       begin
         FileName := ChangeFileExt(FileName, '.xml');
         LoadFile(FileName);
      end;

      RefreshData;
    except
      on E: Exception do
        ErrorDlg(E);
    end;
end;

procedure TDocPackGtdKnpGridForm.actSendUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveGridTableView.Controller.SelectedRowCount = 1) and
                             ( (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.Formed') or
                               (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.Sended')
                              );
end;


procedure TDocPackGtdKnpGridForm.actProcessUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ( (ActiveGridTableView.Controller.SelectedRowCount = 1) and
                               ((dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.Loaded') or
                                (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.PartPaid')
                               )
                             )
                         or
                          ( grdDataDBBandedTableView.Controller.SelectedRowCount > 1);
end;

procedure TDocPackGtdKnpGridForm.actExcelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (ActiveGridTableView.Controller.SelectedRowCount = 1)
                             and ( (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.Processed') or
                                   (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.PartPaid') or
                                   (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.Loaded') or
                                   (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.Formed') or
                                   (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.Sended')
                                 );
end;

procedure TDocPackGtdKnpGridForm.actExcelExecute(Sender: TObject);
begin
  //MainData.CheckTask('Tsk_Report_Big_Payer', True);   
  DisplayBusyCursor;
  with TBPReport.Create(nil) do
  try
    ShowExcelReport(dsDataID.Value, '');
  finally
    Free;
  end;
end;

procedure TDocPackGtdKnpGridForm.actCancelUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ( (ActiveGridTableView.Controller.SelectedRowCount = 1) and
                               ((dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.Processed') or
                                (dsDataSTATE_SYSNAME.Value = 'State.DocPackGTDKNP.PartPaid'))
                             )
                         or
                          ( grdDataDBBandedTableView.Controller.SelectedRowCount > 1);

end;

procedure TDocPackGtdKnpGridForm.actCancelExecute(Sender: TObject);
begin
  SetObjectState('State.DocPackGTDKNP.Loaded');
end;

procedure TDocPackGtdKnpGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  MainData.pkgCommon.PackageName := 'p_doc_pack_gtd_knp';
  FPartPayEnable := (MainData.pkgCommon.CallIntegerFunction('EnablePartialPay', []) = 1);
end;

initialization
   RegisterClass(TDocPackGtdKnpGridForm);
   
end.
