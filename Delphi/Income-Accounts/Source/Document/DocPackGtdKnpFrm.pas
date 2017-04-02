unit DocPackGtdKnpFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxMemo, cxTextEdit, cxPC, cxControls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, OracleData, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, fdcObjectCore, Oracle;

type
  TDocPackGtdKnpForm = class(TDocPackForm)
    dsDataDATE_SEND: TDateTimeField;
    dsDataEXECUTOR: TStringField;
    dsDataAGREEMENT_ID: TFloatField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataSUBJ_NAME: TStringField;
    dsDataSUBJ_INN: TStringField;
    dsDataSUBJ_KPP: TStringField;
    dsDataAGREEMENT_NAME: TStringField;
    edtDateSend: TcxDBDateEdit;
    itemDateSend: TdxLayoutItem;
    edtDestCustomsName: TcxDBMaskEdit;
    itemDestCustoms: TdxLayoutItem;
    lcGrpKNP: TdxLayoutGroup;
    edtInnKnp: TcxDBMaskEdit;
    lciINNKNP: TdxLayoutItem;
    itemExecutorMemo: TdxLayoutItem;
    edtExecutorMemo: TcxDBTextEdit;
    tabErrors: TcxTabSheet;
    dsKBKSum_T: TOracleDataSet;
    srcKBKSum: TDataSource;
    lciSum: TdxLayoutItem;
    grdSumByKBK: TcxGrid;
    grdSumByKBKDBTableView: TcxGridDBTableView;
    grdSumByKBKDBTableViewCODE: TcxGridDBColumn;
    grdSumByKBKDBTableViewKBK: TcxGridDBColumn;
    grdSumByKBKDBTableViewSUMMA: TcxGridDBColumn;
    grdSumByKBKLevel: TcxGridLevel;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataBROKER_ID: TFloatField;
    dsDataLICENCE_ID: TFloatField;
    dsDataBROKER_INN: TStringField;
    dsDataBROKER_KPP: TStringField;
    dsDataBROKER_NAME: TStringField;
    edtKNPName: TcxDBMaskEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtKPP: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGrpBroker: TdxLayoutGroup;
    edtBrokerInn: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtBrokerKpp: TcxDBMaskEdit;
    lcGeneralItem4: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    lcGrpAgreement: TdxLayoutGroup;
    dsDataAGRMT_NO: TStringField;
    dsDataAGRMT_DATE: TDateTimeField;
    edtAgrmNo: TcxDBMaskEdit;
    lcGeneralItem6: TdxLayoutItem;
    edtAgrmDate: TcxDBDateEdit;
    lcGeneralItem7: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    edtBrokerName: TfdcObjectLookupEdit;
    lcGeneralItem8: TdxLayoutItem;
    lcGrpLicence: TdxLayoutGroup;
    edtLicNo: TfdcObjectLinkEdit;
    lcGeneralItem5: TdxLayoutItem;
    dsDataLICENCENO: TStringField;
    dsDataLICENCEDATE: TDateTimeField;
    edtLicDate: TcxDBDateEdit;
    lcGeneralItem9: TdxLayoutItem;
    dsBrokerList: TOracleDataSet;
    dsBrokerListID: TFloatField;
    dsBrokerListNAME: TStringField;
    dsBrokerListINN: TStringField;
    dsBrokerListKPP: TStringField;
    srcBrokerList: TDataSource;
    dsKBKSum_TPAYTYPE: TStringField;
    dsKBKSum_TKBK: TStringField;
    dsKBKSum_TSUMMA: TFloatField;
    actSend: TAction;
    btnSend: TdxBarButton;
    SaveXML: TSaveDialog;
    qryGetPackAsXML: TOracleQuery;
    actExcel: TAction;
    btnExcel: TdxBarButton;
    dsKBKSum_K: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    procedure tabErrorsShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsKBKSumBeforeQuery(Sender: TOracleDataSet);
    procedure edtLicNoAfterAcceptObject(Sender: TObject);
    procedure edtLicNoBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure dsDataLICENCE_IDChange(Sender: TField);
    procedure edtBrokerNamePropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSendUpdate(Sender: TObject);
    procedure actSendExecute(Sender: TObject);
    procedure tabDocsShow(Sender: TObject);
    procedure actExcelUpdate(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actChangeStateExecute(Sender: TObject);override;
  private
    fLicNo : string;
  protected
    FErrorForm: TForm;
    function GetDocsFormClassName : string; override;
    function GetReadOnly: Boolean; override;
    procedure SetVisibleComponent;
  public
    procedure RefreshData; override;
  end;

implementation

uses fdcCustomObjectFrm, fdcCustomObjectGridFrm, fdcCustomCardFrm, MainDm,
fdcMessages, fdcCustomGridFrm, fdcCustomDataFrm, fdcUtils, qBPReport;

{$R *.dfm}

{ TDocPackGtdKnpForm }


procedure TDocPackGtdKnpForm.FormCreate(Sender: TObject);
begin
  inherited;
  if MainData.GetCustomsLevel = 2 then
    srcKBKSum.DataSet := dsKBKSum_T
  else
    srcKBKSum.DataSet := dsKBKSum_K;
end;

function TDocPackGtdKnpForm.GetDocsFormClassName: string;
begin
  Result := 'TAgrRegistryContextForm';
end;

procedure TDocPackGtdKnpForm.tabErrorsShow(Sender: TObject);
begin
  if not Assigned( FErrorForm ) then
    FErrorForm := ShowForm( 'TCustomDeclErrorGridForm', Params, tabErrors );
end;

procedure TDocPackGtdKnpForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsBrokerList.SetVariable('LIC_ID', dsDataLICENCE_ID.AsVariant);
  if dsBrokerList.Active then dsBrokerList.Refresh
   else dsBrokerList.Open;

  if srcKBKSum.DataSet.Active then srcKBKSum.DataSet.Refresh
   else srcKBKSum.DataSet.Open;
end;

procedure TDocPackGtdKnpForm.dsKBKSumBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('ID', dsDataID.Value);
end;

function TDocPackGtdKnpForm.GetReadOnly: Boolean;
begin
  Result := inherited GetReadOnly or (dsStateSYSNAME.Value = 'State.DocPackGTDKNP.Processed');
end;

procedure TDocPackGtdKnpForm.RefreshData;
begin
  inherited;
  if FErrorForm <> nil then
    TfdcCustomObjectGridForm(FErrorForm).RefreshData;
end;

procedure TDocPackGtdKnpForm.edtLicNoAfterAcceptObject(Sender: TObject);
begin
  inherited;
  dsData['LICENCENO'] := fLicNo;
end;

procedure TDocPackGtdKnpForm.edtLicNoBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject = nil then
    begin
      fLicNo := '';
      //dsDataLICENCENO.Clear;
      dsDataLICENCEDATE.Clear;
    end
  else
    begin
      dsData['LICENCEDATE'] := AObject.FieldValues['DOC_DATE'];
      fLicNo := AObject.FieldValues['DOC_NO'];
    end;
end;

procedure TDocPackGtdKnpForm.dsDataLICENCE_IDChange(Sender: TField);
begin
  inherited;
  // выбрать брокеров по разрешению
  dsBrokerList.SetVariable('LIC_ID', Sender.Value);
  if dsBrokerList.Active then dsBrokerList.Refresh
   else dsBrokerList.Open;
end;

procedure TDocPackGtdKnpForm.edtBrokerNamePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  dsDataBROKER_INN.Value := dsBrokerListINN.Value;
  dsDataBROKER_KPP.Value := dsBrokerListKPP.Value;
end;

procedure TDocPackGtdKnpForm.SetVisibleComponent;
begin
  lcGrpAgreement.Visible := not IsNew;
  lcGrpRouting.Visible   := not IsNew;
  lciSum.Visible         := not IsNew;
  actSend.Visible        := ( MainData.GetCustomsLevel = 2 );
end;

procedure TDocPackGtdKnpForm.FormShow(Sender: TObject);
begin
  inherited;
  SetVisibleComponent;
end;

procedure TDocPackGtdKnpForm.actSendUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled := not dsState.IsEmpty and
                           ( (dsStateSYSNAME.Value = 'State.DocPackGTDKNP.Formed') or
                             (dsStateSYSNAME.Value = 'State.DocPackGTDKNP.Sended')
                           );
end;

procedure TDocPackGtdKnpForm.actSendExecute(Sender: TObject);
var
  str  :string;
  vCLOB : TLOBLocator;
  vLog  : TLOBLocator;
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

procedure TDocPackGtdKnpForm.tabDocsShow(Sender: TObject);
begin
  inherited;
  if Assigned( tabDocsForm ) then
    begin
     (tabDocsForm as TfdcCustomGridForm).ParamByName('EnableFormPackage').AsBoolean :=
         (not dsState.IsEmpty and
         (dsStateSYSNAME.Value = 'State.DocPackGTDKNP.Created')
        );
      (tabDocsForm as TfdcCustomGridForm).RefreshData;
    end;  
end;

procedure TDocPackGtdKnpForm.actExcelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not dsState.IsEmpty and
          ( (dsStateSYSNAME.Value = 'State.DocPackGTDKNP.Formed') or
            (dsStateSYSNAME.Value = 'State.DocPackGTDKNP.Sended') or
            (dsStateSYSNAME.Value = 'State.DocPackGTDKNP.Processed')
          );
end;

procedure TDocPackGtdKnpForm.actExcelExecute(Sender: TObject);
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

procedure TDocPackGtdKnpForm.actChangeStateExecute(Sender: TObject);
  var
    vPayFlag, vPayTransit, vPartTransit, vPartProcTransit: Integer;
    TransitID: Double;
    vPartPayEnable: boolean;
begin
    if (not (Sender is TdxBarButton)) or
     (WarningDlg(
        TdxBarButton(Sender).Caption + '. Продолжить?',
        'Если Вы хотите выполнить данное действие, нажмите "Да", иначе нажмите "Нет"'
      ) <> mrYes)
  then
    Exit;

  { remind about saving }
  if Modified and
    (WarningDlg(
         'Данные не были сохранены. Сохранить?',
         'Для выполнения выбранного действия желательно сохранить внесенные изменения. ' +
         'Если Вы хотите сохранить изменения, нажмите "Да", иначе нажмите "Нет".'
       ) = mrYes)
  then
    SaveData(False);
  MainData.pkgCommon.PackageName := 'p_doc_pack_gtd_knp';
  vPartPayEnable := (MainData.pkgCommon.CallIntegerFunction('EnablePartialPay', []) = 1);
  { extract transit id from menu item's Data property }
  TransitID := Integer((Sender as TdxBarButton).Data);
  vPayTransit      := MainData.sqlGetObjectId.Exec('TypeName;SysName', ['StateTransit', 'StateTransit.DocPackGTDKNP.Loaded->Processed']);
  vPartProcTransit := MainData.sqlGetObjectId.Exec('TypeName;SysName', ['StateTransit', 'StateTransit.DocPackGTDKNP.PartPaid->Processed']);
  if (TransitID = vPayTransit) or (TransitID = vPartProcTransit) then // если оплата
    begin
      MainData.pkgCommon.PackageName := 'p_doc_pack_gtd_knp';
      vPayFlag := MainData.pkgCommon.CallIntegerFunction('Check_AbilityPay', [ID]);
      if vPayFlag = 0 then // нет денег для оплаты всего реестра
        begin
          // запретим частично оплаченные реестры оплачивать частично еще раз(нет транзитного перехода)
          if  vPartPayEnable and (TransitID <> vPartProcTransit) then
            vPayFlag := MainData.pkgCommon.CallIntegerFunction('Check_PartialPay', [ID]);
          if (vPayFlag = 0) then // нет денег для частичной оплаты
            begin
              InfoDlg('Недостаточно средств для оплаты реестра!');
              Exit;
            end
          else
            if WarningDlg( 'Внимание! Недостаточно средств для полной оплаты реестра ДТ КНП!',
                           'Если Вы хотите произвести частичную оплату, нажмите "Да", иначе нажмите "Нет"' ) = mrYes then
              begin
                vPartTransit := MainData.sqlGetObjectId.Exec('TypeName;SysName', ['StateTransit', 'StateTransit.DocPackGTDKNP.Loaded->PartPaid']);
                //dsUpdateState.ParamByName('STATE_TRANSIT_ID').AsInteger = vPartTransit;
                TransitID := vPartTransit;
              end
            else Exit;
        end;
    end;


  { update state }  
  dsUpdateState.ParamByName('ID').AsFloat := ID;
  dsUpdateState.ParamByName('STATE_TRANSIT_ID').AsFloat := TransitID;
  dsUpdateState.ExecSQL;

  { refresh data }
  RefreshData;
end;

initialization
   RegisterClass(TDocPackGtdKnpForm);

end.
