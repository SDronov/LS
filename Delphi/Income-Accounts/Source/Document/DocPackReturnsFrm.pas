unit DocPackReturnsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxGraphics, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCurrencyEdit, cxSpinEdit, DocPackFrm, cxCheckBox, fdcObjectLookupEdit,
  cxButtonEdit, fdcObjectLinkEdit, xlcClasses, xlEngine, xlReport,
  DocPackReturnsErrorsGridFrm, PaymentOrderPaybackGridByPackFrm;

type
  TDocPackReturnsForm = class(TDocPackForm)
    dsDataREGIONAL_ACCOUNT: TStringField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataCLAIMED_DOC_COUNT: TFloatField;
    dsDataCLAIMED_SPENDING: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDATE_IN: TDateTimeField;
    dsDataDATE_SEND: TDateTimeField;
    edtRegionalAccount: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtDateIn: TcxDBDateEdit;
    lcGeneralItem4: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    edtDateSend: TcxDBDateEdit;
    lcGeneralItem5: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    spinEdtClaimedDocCount: TcxDBSpinEdit;
    lcGeneralItem6: TdxLayoutItem;
    edtClaimedSpending: TcxDBCurrencyEdit;
    lcGeneralItem7: TdxLayoutItem;
    lcbCurrency: TfdcObjectLookupEdit;
    lcGeneralItem1: TdxLayoutItem;
    dsDataCUSTOMS_NAME: TStringField;
    dsDataDESTINATION: TStringField;
    dsDataDESTINATION_NAME: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    edtCustomsSender: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtCustomsSenderName: TcxDBTextEdit;
    lcGeneralItem8: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    edtCustomsDestination: TcxDBTextEdit;
    lcGeneralItem9: TdxLayoutItem;
    edtCustomsDestinationName: TcxDBTextEdit;
    lcGeneralItem10: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    fdcPrintHeader: TfdcQuery;
    fdcPrint: TfdcQuery;
    xlrReestr: TxlReport;
    actPrint: TAction;
    barBtnPrint: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dsHeader: TfdcQuery;
    dsBody: TfdcQuery;
    xlrReestrReturns: TxlReport;
    tabErrors: TcxTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure fdcPrintHeaderBeforeOpen(DataSet: TDataSet);
    procedure fdcPrintBeforeOpen(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
    procedure actPrintUpdate(Sender: TObject);
    procedure tabDocsShow(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure tabErrorsShow(Sender: TObject);
    procedure cxDBIsTSClick(Sender: TObject);
  private
    fPO_Pb_Grid: TPayment_Order_PaybackGridByPackForm;

    fPO_Pb_Grid_Close: TCloseEvent;
    fPO_Pb_Grid_AfterOpen: TDataSetNotifyEvent;

    fErrorForm : TDocPackRetsErrorGridForm;
    procedure DocsForm_dsDataAfterOpen(DataSet: TDataSet);
    procedure popbGrid_Close(Sender: TObject;  var Action: TCloseAction);

    procedure UpdateErrorsTab;
  protected
    function GetDocsFormClassName : string; override;
  public
    { Public declarations }
  end;

var
  DocPackReturnsForm: TDocPackReturnsForm;

implementation

{$R *.dfm}

uses
  MainDM
 ,DictDM
 , fdcCustomDBDataFrm, fdcCustomCardFrm, fdcCustomObjectFrm
 ,IniFiles;

const
  cReportDir      = 'Report\';

procedure TDocPackReturnsForm.FormCreate(Sender: TObject);
var i : integer;
begin
  inherited;
  fErrorForm := nil;
  fPO_Pb_Grid:= nil;
  fPO_Pb_Grid_Close:= nil;
  fPO_Pb_Grid_AfterOpen:= nil;

  if not DictData.dsCurrency.Active then
    DictData.dsCurrency.Open;
  // Запретить переходы между статусами 'Сформирован' и "Отправлен', только кнопками !!!
  for i:= 0 to btnStateTransit.ItemLinks.Count - 1 do
    if (btnStateTransit.ItemLinks[i].Item.Caption = 'Сформирован -> Отправлен') or
       (btnStateTransit.ItemLinks[i].Item.Caption = 'Отправлен -> Сформирован')  then
      begin
        btnStateTransit.ItemLinks[i].Item.Enabled := False;
        Break;
      end;
end;

function TDocPackReturnsForm.GetDocsFormClassName: string;
begin
  Result := 'TPayment_Order_PaybackGridByPackForm';
  //Result := 'TPayment_Order_PaybackGridForm';
  //Result := 'TDecisionPaybackByPackGridForm';
end;

procedure TDocPackReturnsForm.pcMainChange(Sender: TObject);
begin
  inherited;
  if pcMain.ActivePage.Name = 'tabGeneral' then
    actRefresh.Execute;
end;

procedure TDocPackReturnsForm.dsDataAfterOpen(DataSet: TDataSet);
var i : integer;
begin
  if     not IsNew
     and ( MainData.GetSoftCustomsCode <> dsData.FieldByName( 'EXT_SOURCE' ).AsString ) then
    begin
      itemDocNumber.Tag := 33;
      itemDocDate.Tag   := 33;
      lcGeneral.LookAndFeel.GroupOptions.Color := clYellowLight;
    end;

  inherited;
  if not DictData.dsCurrency.Active then
    DictData.dsCurrency.Open;
  // Запретить переходы между статусами 'Сформирован' и "Отправлен', только кнопками !!!
  for i:= 0 to btnStateTransit.ItemLinks.Count - 1 do
    if (btnStateTransit.ItemLinks[i].Item.Caption = 'Сформирован -> Отправлен') or
       (btnStateTransit.ItemLinks[i].Item.Caption = 'Отправлен -> Сформирован')  then
      begin
        btnStateTransit.ItemLinks[i].Item.Enabled := False;
        Break;
      end;

  UpdateErrorsTab;
end;

procedure TDocPackReturnsForm.UpdateErrorsTab;
var
 shErr: boolean;
 s: string;
 cIS_TS: char;
begin
  s:= '';
  cIS_TS := 'N';
  if cxDBIsTS.Checked then
    cIS_TS := 'Y';  
  with dsState do
  if Active and not isEmpty then
    s:= dsStateSYSNAME.AsString;

  shErr:= (isNew or ( s = 'State.PackReturns.Created' ) or (s = 'State.PackReturns.Form')) and DocPackReturnsErrorsGridFrm.errors_present(cIS_TS);

  if (pcMain.ActivePage = tabErrors) and (not shErr) then
    pcMain.ActivePageIndex:= 0;

  tabErrors.Enabled:= shErr;
  if assigned(fErrorForm) and fErrorForm.dsData.Active then
    fErrorForm.dsData.Close;

end;


procedure TDocPackReturnsForm.fdcPrintHeaderBeforeOpen(DataSet: TDataSet);
begin
  fdcPrintHeader.ParamByName( 'doc_no' ).AsString       := dsData.FieldByName( 'doc_number' ).AsString;
  fdcPrintHeader.ParamByName( 'doc_date' ).AsDate       := dsData.FieldByName( 'doc_date' ).AsDateTime;
  fdcPrintHeader.ParamByName( 'customs_name' ).AsString := dsData.FieldByName( 'customs_name' ).AsString;
  fdcPrintHeader.ParamByName( 'customs_code' ).AsString := dsData.FieldByName( 'customs_code' ).AsString;
end;

procedure TDocPackReturnsForm.fdcPrintBeforeOpen(DataSet: TDataSet);
begin
  fdcPrint.ParamByName( 'pack_id' ).AsFloat := dsData.FieldByName( 'id' ).AsInteger;
end;

procedure TDocPackReturnsForm.actPrintExecute(Sender: TObject);
begin
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

procedure TDocPackReturnsForm.actPrintUpdate(Sender: TObject);
begin
    (Sender as TAction).Enabled := dsData.Active
                               and not dsData.IsEmpty
                               and dsState.Active
                               and not dsState.IsEmpty
                               and (dsState.FieldByName( 'name' ).AsString <> 'Создан')
                               and (dsState.FieldByName( 'name' ).AsString <> 'Формируется');
end;

procedure TDocPackReturnsForm.tabDocsShow(Sender: TObject);
begin
  inherited;
  if ( not assigned(fPO_Pb_Grid) ) then
    fPO_Pb_Grid:= GetDocsForm as TPayment_Order_PaybackGridByPackForm;

  if assigned(fPO_Pb_Grid) then begin
    if ( not assigned(fPO_Pb_Grid_Close)) then
      fPO_Pb_Grid_Close:= fPO_Pb_Grid.OnClose;
    if ( not assigned(fPO_Pb_Grid_AfterOpen) ) then
      fPO_Pb_Grid_AfterOpen:= fPO_Pb_Grid.dsData.AfterOpen;

    fPO_Pb_Grid.OnClose:= popbGrid_Close;
    fPO_Pb_Grid.dsData.AfterOpen:= DocsForm_dsDataAfterOpen;
  end;

  fPO_Pb_Grid.RefreshData;
end;

procedure TDocPackReturnsForm.popbGrid_Close(Sender: TObject;  var Action: TCloseAction);
begin
 if assigned(fPO_Pb_Grid_Close) then
   fPO_Pb_Grid_Close(sender, action);

 fPO_Pb_Grid:= nil;
 fPO_Pb_Grid_Close:= nil;
 fPO_Pb_Grid_AfterOpen:= nil;
end;

procedure TDocPackReturnsForm.DocsForm_dsDataAfterOpen(DataSet: TDataSet);
begin
  if Assigned(fPO_Pb_Grid_AfterOpen) then
    fPO_Pb_Grid_AfterOpen(DataSet);

  UpdateErrorsTab;
end;


procedure TDocPackReturnsForm.dxBarButton1Click(Sender: TObject);
  procedure LoadReportQueryEx(aFileName: string);
    var
      IniFile: TMemIniFile;
      Strings: TStrings;
  begin
    Strings := nil;
    IniFile := TMemIniFile.Create(ChangeFileExt(aFileName, '.sql'));
    try
      Strings := TStringList.Create;
      IniFile.ReadSections(Strings);
      if (Strings.IndexOf('dsBody') > -1) then
          IniFile.ReadSectionValues('dsBody',
          dsBody.SQL);
      if (Strings.IndexOf('dsHeader') > -1) then
          IniFile.ReadSectionValues('dsHeader',
          dsHeader.SQL);
    finally
      IniFile.Free;
      Strings.Free;
    end;
  end;
begin
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
  // --- prepare template
  xlrReestrReturns.XLSTemplate :=ExtractFilePath(Application.ExeName) + 'Report\' +
                           'ReestrReturns.xls';
  LoadReportQueryEx(xlrReestrReturns.XLSTemplate);
  // --- open Query`s
  dsHeader.ParamByName( 'reestr_id' ).AsInteger := dsDataID.AsInteger;
  dsHeader.Open;

  dsBody.ParamByName( 'reestr_id' ).AsInteger := dsDataID.AsInteger;
  dsBody.Open;
  // --- generate report
  try
    xlrReestrReturns.Report(True);
  except on e:exception do
    begin
      raise;
    end;
  end;
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
end;

procedure TDocPackReturnsForm.tabErrorsShow(Sender: TObject);
begin
  inherited;
  if (not Assigned(fErrorForm) ) then
     fErrorForm := ShowForm( 'TDocPackRetsErrorGridForm', Params, tabErrors )  as TDocPackRetsErrorGridForm
  else
    with fErrorForm.dsData do
    if (not active) then
     open
    else refresh;
end;

procedure TDocPackReturnsForm.cxDBIsTSClick(Sender: TObject);
begin
 inherited;
 UpdateErrorsTab;
end;

initialization
  RegisterClass( TDocPackReturnsForm );

end.
