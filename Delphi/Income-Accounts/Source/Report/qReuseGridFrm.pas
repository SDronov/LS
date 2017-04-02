unit qReuseGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDataFrm, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, DB, dxmdaset,
  cxControls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  dxBarExtItems, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxPC, qCustomTurnoverSheetFrm,
  xlcClasses, xlEngine, xlReport, OracleData, StdCtrls, DateUtils, Oracle,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCheckBox;

type
  TqReuseGridForm = class(TfdcCustomDataForm)
    dsParams: TdxMemData;
    dsParamsBDATE: TDateField;
    dsParamsEDATE: TDateTimeField;
    dsParamsCURRID: TIntegerField;
    srcParams: TDataSource;
    actRefresh: TAction;
    btnRefresh: TdxBarButton;
    cciDateFrom: TdxBarControlContainerItem;
    dbdeDateFrom: TcxDBDateEdit;
    dbdeDateTo: TcxDBDateEdit;
    cciDateTo: TdxBarControlContainerItem;
    siDateFrom: TdxBarStatic;
    siDateTo: TdxBarStatic;
    siCurrency: TdxBarStatic;
    cciCurrency: TdxBarControlContainerItem;
    actExcelExport: TAction;
    btnExcelExport: TdxBarButton;
    excelExportReuse: TxlReport;
    dsetSystemParams: TOracleDataSet;
    dsetSystemParamsCUSTOMNAME: TStringField;
    dsetSystemParamsBOSSNAME: TStringField;
    dsetSystemParamsPAYBOSSNAME: TStringField;
    dsetSystemParamsCUSTOMCODE: TStringField;
    dsetSystemParamsPERIOD: TStringField;
    siMode: TdxBarStatic;
    cciMode: TdxBarControlContainerItem;
    dsParamsMODE: TStringField;
    qryCheckDates: TOracleQuery;
    actIdent: TAction;
    dsetData: TOracleDataSet;
    dsData: TDataSource;
    grdReuses: TcxGrid;
    grdReusesDBBandedTableView: TcxGridDBBandedTableView;
    grdReusesDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdReusesLevel: TcxGridLevel;
    dsetDataNN: TFloatField;
    dsetDataPP_NUMBER: TStringField;
    dsetDataPP_DATE: TDateTimeField;
    dsetDataPP_KBK: TStringField;
    dsetDataSUMMA: TFloatField;
    dsetDataPAYER_INN: TStringField;
    dsetDataPAYER_KPP: TStringField;
    dsetDataPAYER_NAME: TStringField;
    dsetDataREUSE_NUMBER: TStringField;
    dsetDataREUSE_DATE: TDateTimeField;
    dsetDataCUSTOMS_OLD: TStringField;
    dsetDataCUSTOMS_NEW: TStringField;
    dsetDataIN_REESTR_NAME: TStringField;
    dsetDataOUT_REESTR_NAME: TStringField;
    dsetDataREUSE_CONFIRM_DATE: TDateTimeField;
    grdReusesDBBandedTableViewPP_NUMBER: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewPP_DATE: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewREUSE_NUMBER: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewREUSE_DATE: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewCUSTOMS_OLD: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewCUSTOMS_NEW: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewIN_REESTR_NAME: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewOUT_REESTR_NAME: TcxGridDBBandedColumn;
    grdReusesDBBandedTableViewREUSE_CONFIRM_DATE: TcxGridDBBandedColumn;
    dsetDataIS_TS: TStringField;
    grdReusesDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dsetDataIS_TS_R: TStringField;
    procedure dsParamsBeforeOpen(DataSet: TDataSet);
    procedure dsParamsAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dsParamsBDATEChange(Sender: TField);
    procedure dsetSystemParamsApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure actExcelExportExecute(Sender: TObject);
    procedure grdReusesDBBandedTableViewDataControllerFilterChanged(
      Sender: TObject);
    procedure dsetDataBeforeQuery(Sender: TOracleDataSet);
    procedure dsetDataAfterOpen(DataSet: TDataSet);
    procedure dsetDataAfterClose(DataSet: TDataSet);
    procedure dbdeDateFromPropertiesChange(Sender: TObject);
    procedure dbdeDateToPropertiesChange(Sender: TObject);
  private
    procedure ParamsChanged;
  protected
  public
    is_check_date: boolean;
    procedure RefreshData;
  end;

implementation

uses
  DictDm
 ,fdcUtils
 ,MainDm;

{$R *.dfm}

const
  cNsiYear         = 2009;
  cNsiMonth        = 01;
  cNsiDay          = 01;
  cFldTemplateName = 'Template_Name';

procedure TqReuseGridForm.RefreshData;
begin
  if dsetData.Active then
    dsetData.Refresh
  else
    dsetData.Open;
  //--
  grdReusesDBBandedTableView.ApplyBestFit();
  //--
end;

procedure TqReuseGridForm.ParamsChanged;
begin
  if dsetData.Active then
    dsetData.CloseAll;
end;

procedure TqReuseGridForm.dsParamsBDATEChange(Sender: TField);
begin
  ParamsChanged;
  is_check_date := false;
end;

procedure TqReuseGridForm.dsParamsBeforeOpen(DataSet: TDataSet);
begin
  DictData.dsCurrency.Open;
end;

procedure TqReuseGridForm.dsParamsAfterOpen(DataSet: TDataSet);
begin
  if not DictData.dsCurrency.Locate( 'CODE', '643', [] ) then
    DictData.dsCurrency.First;
  DataSet.InsertRecord([1, Date, Date, DictData.dsCurrency.FieldByName( 'ID' ).AsFloat, 'ќбороты']);
end;

procedure TqReuseGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsParams.Open;
  is_check_date := false;
end;

procedure TqReuseGridForm.actRefreshUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := true;
end;

procedure TqReuseGridForm.actRefreshExecute(Sender: TObject);
begin

  if not is_check_date then
  begin
    qryCheckDates.SetVariable('bdate', dbdeDateFrom.Date);
    qryCheckDates.SetVariable('edate', dbdeDateTo.Date);
    qryCheckDates.Execute;
    is_check_date := true;
  end;

  dsParams.CheckBrowseMode;
  RefreshData;
end;

procedure TqReuseGridForm.dsetSystemParamsApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  if Action = 'U' then
    Applied := True;
end;

procedure TqReuseGridForm.actExcelExportExecute(Sender: TObject);
  var
    TurnoverSheet : TCustomTurnoverSheetForm;
    InTransaction : boolean;
begin

  if not dsetSystemParams.Active then
    dsetSystemParams.Open;

  with dsetSystemParams do
    begin
      InTransaction := Session.InTransaction;
      Edit;

      FieldByName( 'Period' ).AsString       := 'с '   + FormatDateTime( 'DD.MM.YYYY', dsParams.FieldByName('BDATE').AsDateTime ) +
                                                ' по ' + FormatDateTime( 'DD.MM.YYYY', dsParams.FieldByName('EDATE').AsDateTime );
      Post;
      if not InTransaction then
        Session.Rollback;
    end;

  excelExportReuse.XLSTemplate            := ExtractFilePath(Application.ExeName) + 'Report\' + 'qReuses.xls';
  excelExportReuse.DataSources[1].DataSet := dsetData;

  excelExportReuse.Report( True );
end;

procedure TqReuseGridForm.grdReusesDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdReusesDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqReuseGridForm.dsetDataBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  TOracleDataSet(Sender).SetVariable('BDATE',dsParamsBDATE.AsVariant);
  TOracleDataSet(Sender).SetVariable('EDATE',dsParamsEDATE.AsVariant);
end;

procedure TqReuseGridForm.dsetDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  actExcelExport.Enabled := true;
end;

procedure TqReuseGridForm.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  actExcelExport.Enabled := false;
end;

procedure TqReuseGridForm.dbdeDateFromPropertiesChange(Sender: TObject);
begin
  inherited;
  if (dsParams.State = dsEdit) then
    begin
      dsParams.Post;
    end;
end;

procedure TqReuseGridForm.dbdeDateToPropertiesChange(Sender: TObject);
begin
  inherited;
  if (dsParams.State = dsEdit) then
    begin
      dsParams.Post;
    end;
end;

initialization
  RegisterClass ( TqReuseGridForm );

end.
