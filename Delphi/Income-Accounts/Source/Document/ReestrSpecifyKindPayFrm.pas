unit ReestrSpecifyKindPayFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, QueryList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, OracleData, Menus, cxCurrencyEdit, Oracle,
  cxGridBandedTableView, cxGridDBBandedTableView, cxCalc, cxCheckBox, fdcObjectCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, xlcClasses, xlEngine, xlReport,
  cxGroupBox, cxButtonEdit, ComCtrls, ToolWin;

type
  TReestrSpecifyKindPayForm = class(TObjectForm)
    tabPayments: TcxTabSheet;
    edtCurrCode: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtSUMMA: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtDOC_DATE: TcxDBDateEdit;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    QueryList1: TQueryList;
    dxBarButton1: TdxBarButton;
    grdSumByKBKDBTableView: TcxGridDBTableView;
    grdSumByKBKLevel: TcxGridLevel;
    grdSumByKBK: TcxGrid;
    lcItemKBKSum: TdxLayoutItem;
    srcSumByKBK: TDataSource;
    grdSumByKBKDBTableViewCODE_S: TcxGridDBColumn;
    grdSumByKBKDBTableViewSUMMA: TcxGridDBColumn;
    actSaveToFile: TAction;
    dlgExportData: TSaveDialog;
    pmnGrid: TPopupMenu;
    N1: TMenuItem;
    edtDATE_CONFIRM: TcxDBDateEdit;
    lcGeneralItem5: TdxLayoutItem;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDATE_INPUT: TDateTimeField;
    dsDataDATE_SEND: TDateTimeField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCURRENCY: TStringField;
    dsDataDATE_CONFIRM: TDateTimeField;
    dsDataTOTAL_SUMMA: TFloatField;
    grdSumByKBKDBTableViewCODE_T: TcxGridDBColumn;
    tabNotice: TcxTabSheet;
    tcNotice: TcxTabControl;
    grdNoticeData: TcxGrid;
    grdNoticeDataDBTableView: TcxGridDBTableView;
    grdNoticeDataDBTableViewID: TcxGridDBColumn;
    grdNoticeDataDBTableViewTYPESYSNAME: TcxGridDBColumn;
    grdNoticeDataDBTableViewTYPENAME: TcxGridDBColumn;
    grdNoticeDataDBTableViewNAME: TcxGridDBColumn;
    grdNoticeDataDBTableViewDESCRIPT: TcxGridDBColumn;
    grdNoticeDataDBBandedTableView: TcxGridDBBandedTableView;
    grdNoticeDataLevel: TcxGridLevel;
    grdNoticeDataDBBandedTableViewKBK_SOURCE: TcxGridDBBandedColumn;
    grdNoticeDataDBBandedTableViewKBK_TARGET: TcxGridDBBandedColumn;
    grdNoticeDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdNoticeDataDBBandedTableViewDirection: TcxGridDBBandedColumn;
    grdNoticeDataDBBandedTableViewCURRENCY: TcxGridDBBandedColumn;
    srcNoticeData: TDataSource;
    dsNoticeData: TfdcQuery;
    dsDeductionData: TfdcQuery;
    srcDeductionData: TDataSource;
    dsSumByKBK: TfdcQuery;
    dsDeductionDataID: TFloatField;
    dsDeductionDataNAME: TStringField;
    dsDeductionDataSHORTNAME: TStringField;
    dsDeductionDataOBJECT_TYPE_ID: TFloatField;
    dsDeductionDataSTATE_ID: TFloatField;
    dsDeductionDataACCESSLEVEL: TFloatField;
    dsDeductionDataSYSNAME: TStringField;
    dsDeductionDataDESCRIPT: TStringField;
    dsDeductionDataOWNER_OBJECT_ID: TFloatField;
    dsDeductionDataTYPENAME: TStringField;
    dsDeductionDataTYPESYSNAME: TStringField;
    dsDeductionDataOBJECTKINDLIST: TStringField;
    dsDeductionDataPAYMENT_ID: TFloatField;
    dsDeductionDataPAY_TYPE_ID: TFloatField;
    dsDeductionDataSUMMA: TFloatField;
    dsDeductionDataDECL_ID: TFloatField;
    dsDeductionDataPAYER_ID: TFloatField;
    dsDeductionDataDOC_NAME: TStringField;
    dsDeductionDataDOC_NO: TStringField;
    dsDeductionDataDOC_DATE: TDateTimeField;
    dsDeductionDataDOC_SUMMA: TFloatField;
    dsDeductionDataPAYER_INN: TStringField;
    dsDeductionDataPAYER_NAME: TStringField;
    dsDeductionDataPAYMENT_CODE: TStringField;
    dsDeductionDataPAYMENT_NAME: TStringField;
    dsDeductionDataCURR_CODE: TStringField;
    dsDeductionDataCURR_NAME: TStringField;
    dsDeductionDataPAYMENT_DATE: TDateTimeField;
    dsDeductionDataPAYMENT_MONTH: TDateTimeField;
    dsDeductionDataCHARGE_CURR_ID: TFloatField;
    dsDeductionDataCHARGE_SUMMA: TFloatField;
    dsDeductionDataACC_DATE: TDateTimeField;
    dsDeductionDataKBKCODE: TStringField;
    dsDeductionDataKBKCODE_SOURCE: TStringField;
    dsDeductionDataOPERATION_DATE: TDateTimeField;
    dsDeductionDataIS_ACTIVE: TStringField;
    dsDeductionDataBUDGET_ID: TFloatField;
    dsDeductionDataDECL_GOODS: TStringField;
    dsDeductionDataDOC_REST: TFloatField;
    dsDeductionDataDECL_NAME: TStringField;
    dsDeductionDataDECL_INN: TStringField;
    dsDeductionDataDECL_KPP: TStringField;
    dsDeductionDataIS_ARCHIVE: TStringField;
    dsDeductionDataAGG_SUMMA: TFloatField;
    dsDeductionDataKEY_P: TFloatField;
    grdData: TcxGrid;
    grdDataDBTableView: TcxGridDBTableView;
    grdDataDBTableViewID: TcxGridDBColumn;
    grdDataDBTableViewTYPESYSNAME: TcxGridDBColumn;
    grdDataDBTableViewTYPENAME: TcxGridDBColumn;
    grdDataDBTableViewNAME: TcxGridDBColumn;
    grdDataDBTableViewDESCRIPT: TcxGridDBColumn;
    grdDataDBBandedTableView: TcxGridDBBandedTableView;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_MONTH: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBKCODE_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn;
    columnIS_ARCHIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_GOODS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_REST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    grdDataDBTableShortView: TcxGridDBTableView;
    grdDataDBTableShortViewColumn1: TcxGridDBColumn;
    grdDataDBTableShortViewColumn2: TcxGridDBColumn;
    grdDataDBTableShortViewColumn3: TcxGridDBColumn;
    grdDataLevel: TcxGridLevel;
    dsNoticeDataID: TFloatField;
    dsNoticeDataTYPENAME: TStringField;
    dsNoticeDataTYPESYSNAME: TStringField;
    dsNoticeDataOBJECT_TYPE_ID: TFloatField;
    dsNoticeDataNAME: TStringField;
    dsNoticeDataDESCRIPT: TStringField;
    dsNoticeDataDOC_DATE: TDateTimeField;
    dsNoticeDataDOC_NUMBER: TStringField;
    dsNoticeDataKBK_CODE_S: TStringField;
    dsNoticeDataKBK_CODE_T: TStringField;
    dsNoticeDataCURRENCY_CODE: TStringField;
    dsNoticeDataSUMMA: TFloatField;
    dsNoticeDataDIRECTION: TStringField;
    dsNoticeDataEXT_SOURCE: TStringField;
    dsNoticeDataEXT_TYPESYSNAME: TStringField;
    dsNoticeDataEXT_ID: TFloatField;
    grdNoticeDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdNoticeDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn;
    grdNoticeDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn;
    cxNoticeGridPopupMenu: TcxGridPopupMenu;
    cxGridPopupMenu: TcxGridPopupMenu;
    grdNoticeDataDBBandedTableViewDoc_number: TcxGridDBBandedColumn;
    grdNoticeDataDBBandedTableViewDoc_date: TcxGridDBBandedColumn;
    dxBarPrint: TdxBarButton;
    xlrNoticeKindPay: TxlReport;
    dsBody: TfdcQuery;
    dsHeader: TfdcQuery;
    cxGroupBoxPaymentOldKBK: TcxGroupBox;
    grdDataPaymentOldKBK: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBBandedTableViewOldKbk: TcxGridDBBandedTableView;
    cxGridDBBanded_ID: TcxGridDBBandedColumn;
    cxGridDBBanded_TYPESYSNAME: TcxGridDBBandedColumn;
    cxGridDBBanded_TYPENAME: TcxGridDBBandedColumn;
    cxGridDBBanded_NAME: TcxGridDBBandedColumn;
    cxGridDBBanded_DESCRIPT: TcxGridDBBandedColumn;
    cxGridDBBanded_PAYMENT_CODE: TcxGridDBBandedColumn;
    cxGridDBBanded_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBanded_CURR_CODE: TcxGridDBBandedColumn;
    cxGridDBBanded_DOC_NAME: TcxGridDBBandedColumn;
    cxGridDBBanded_PAYER_INN: TcxGridDBBandedColumn;
    cxGridDBBanded_PAYMENT_DATE: TcxGridDBBandedColumn;
    cxGridDBBanded_PAYMENT_MONTH: TcxGridDBBandedColumn;
    cxGridDBBanded_ACC_DATE: TcxGridDBBandedColumn;
    cxGridDBBanded_KBKCODE_SOURCE: TcxGridDBBandedColumn;
    cxGridDBBanded_KBKCODE: TcxGridDBBandedColumn;
    cxGridDBBanded_OPERATION_DATE: TcxGridDBBandedColumn;
    cxGridDBBanded_IS_ARCHIVE: TcxGridDBBandedColumn;
    cxGridDBBanded_DECL_GOODS: TcxGridDBBandedColumn;
    cxGridDBBanded_DOC_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBanded_PAYER_NAME: TcxGridDBBandedColumn;
    cxGridDBBanded_DOC_REST: TcxGridDBBandedColumn;
    cxGridDBBanded_DECL_NAME: TcxGridDBBandedColumn;
    cxGridDBBanded_DECL_INN: TcxGridDBBandedColumn;
    cxGridDBBanded_DECL_KPP: TcxGridDBBandedColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevelOldKbk: TcxGridLevel;
    actChangeKBK: TAction;
    dsDeductionDataOldKBK: TfdcQuery;
    srcDeductionDataOldKBK: TDataSource;
    dsDataSENDER_SOFT_CODE_ID: TFloatField;
    dsDataSENDER_SOFT_NAME: TStringField;
    dsDataSENDER_SOFT_CODE: TStringField;
    dsDataRECEIVER_SOFT_CODE_ID: TFloatField;
    dsDataRECEIVER_SOFT_NAME: TStringField;
    dsDataRECEIVER_SOFT_CODE: TStringField;
    dsDataIS_RECIEVED: TStringField;
    dsDataRECIEVE_DATE: TDateTimeField;
    dsDataSTATE_SYSNAME: TStringField;
    sqlRemove_deduct_from_reestr: TsqlOp;
    dsDeductionDataOldKBKID: TFloatField;
    dsDeductionDataOldKBKNAME: TStringField;
    dsDeductionDataOldKBKSHORTNAME: TStringField;
    dsDeductionDataOldKBKOBJECT_TYPE_ID: TFloatField;
    dsDeductionDataOldKBKSTATE_ID: TFloatField;
    dsDeductionDataOldKBKACCESSLEVEL: TFloatField;
    dsDeductionDataOldKBKSYSNAME: TStringField;
    dsDeductionDataOldKBKDESCRIPT: TStringField;
    dsDeductionDataOldKBKOWNER_OBJECT_ID: TFloatField;
    dsDeductionDataOldKBKTYPENAME: TStringField;
    dsDeductionDataOldKBKTYPESYSNAME: TStringField;
    dsDeductionDataOldKBKOBJECTKINDLIST: TStringField;
    dsDeductionDataOldKBKPAYMENT_ID: TFloatField;
    dsDeductionDataOldKBKPAY_TYPE_ID: TFloatField;
    dsDeductionDataOldKBKSUMMA: TFloatField;
    dsDeductionDataOldKBKDECL_ID: TFloatField;
    dsDeductionDataOldKBKPAYER_ID: TFloatField;
    dsDeductionDataOldKBKDOC_NAME: TStringField;
    dsDeductionDataOldKBKDOC_NO: TStringField;
    dsDeductionDataOldKBKDOC_DATE: TDateTimeField;
    dsDeductionDataOldKBKDOC_SUMMA: TFloatField;
    dsDeductionDataOldKBKPAYER_INN: TStringField;
    dsDeductionDataOldKBKPAYER_NAME: TStringField;
    dsDeductionDataOldKBKPAYMENT_CODE: TStringField;
    dsDeductionDataOldKBKPAYMENT_NAME: TStringField;
    dsDeductionDataOldKBKCURR_CODE: TStringField;
    dsDeductionDataOldKBKCURR_NAME: TStringField;
    dsDeductionDataOldKBKPAYMENT_DATE: TDateTimeField;
    dsDeductionDataOldKBKPAYMENT_MONTH: TDateTimeField;
    dsDeductionDataOldKBKCHARGE_CURR_ID: TFloatField;
    dsDeductionDataOldKBKCHARGE_SUMMA: TFloatField;
    dsDeductionDataOldKBKACC_DATE: TDateTimeField;
    dsDeductionDataOldKBKKBKCODE: TStringField;
    dsDeductionDataOldKBKKBKCODE_SOURCE: TStringField;
    dsDeductionDataOldKBKOPERATION_DATE: TDateTimeField;
    dsDeductionDataOldKBKIS_ACTIVE: TStringField;
    dsDeductionDataOldKBKBUDGET_ID: TFloatField;
    dsDeductionDataOldKBKDECL_GOODS: TStringField;
    dsDeductionDataOldKBKDOC_REST: TFloatField;
    dsDeductionDataOldKBKDECL_NAME: TStringField;
    dsDeductionDataOldKBKDECL_INN: TStringField;
    dsDeductionDataOldKBKDECL_KPP: TStringField;
    dsDeductionDataOldKBKIS_ARCHIVE: TStringField;
    dsDeductionDataOldKBKAGG_SUMMA: TFloatField;
    dsDeductionDataOldKBKKEY_P: TFloatField;
    dsDeductionDataOldKBKOLD_KBK_SIGN: TFloatField;
    sqlChangeKBKinDeduction: TsqlOp;
    dxBarSubItem1: TdxBarSubItem;
    dxBarDockControloldkbk: TdxBarDockControl;
    dxBarSubItemExcludeDeduct_oldkbk: TdxBarSubItem;
    actExcludeDeduct_old_kbk: TAction;
    dxBarButtonExcludeDeduct_OldKBK: TdxBarButton;
    tabReestrs: TcxTabSheet;
    tabEnvelops: TcxTabSheet;
    dsDeductionDataDIRECTION: TStringField;
    dsDeductionDataOldKBKDIRECTION: TStringField;
    grdDataDBBandedTableViewDIRECTION: TcxGridDBBandedColumn;
    cxGridDBBandedDIRECTION: TcxGridDBBandedColumn;
    lcGeneralItem4: TdxLayoutItem;
    cxDBIsTS: TcxDBCheckBox;
    dsNoticeDataIS_TS: TStringField;
    dsDataIS_TS: TStringField;
    dsDeductionDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    grdNoticeDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure tabPaymentsShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actSaveToFileExecute(Sender: TObject);
    procedure actSaveToFileUpdate(Sender: TObject);
    procedure tcNoticeChange(Sender: TObject);
    procedure tabNoticeShow(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure grdNoticeDataDBBandedTableViewTYPENAMECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdNoticeDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dxBarPrintClick(Sender: TObject);
    procedure actChangeKBKExecute(Sender: TObject);
    procedure cxGridDBBanded_KBKCODEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dsDeductionDataOldKBKAfterOpen(DataSet: TDataSet);
    procedure dsDeductionDataOldKBKAfterClose(DataSet: TDataSet);
    procedure actExcludeDeduct_old_kbkExecute(Sender: TObject);
    procedure tabReestrsShow(Sender: TObject);
    procedure tabEnvelopsShow(Sender: TObject);
  private
    { Private declarations }
    FPaymentsForm: TForm;
    FReestrsForm: TForm;
    fEnvelopsForm: TForm;
    FOwnPack: boolean; // True - создан, False - получен от другого тамож.органа

    procedure DoKBKSearchFinished(const ADragObject: TfdcDragObject);
  public
    { Public declarations }
  end;

var
  ReestrSpecifyKindPayForm: TReestrSpecifyKindPayForm;

implementation

uses
  MainDm
 ,fdcCustomDataFrm
 ,fdcMessages
 ,cxExport
 ,cxExportGrid4Link
 ,fdcUtils
 ,fdcCustomCardFrm
 ,fdcCustomDBDataFrm
 ,fdcCustomObjectFrm
 ,Math
 ,StrUtils
 ,IniFiles;

{$R *.dfm}

procedure TReestrSpecifyKindPayForm.tabPaymentsShow(Sender: TObject);
begin
  dsDeductionData.Close;
  dsDeductionDataOldKBK.Close;
  if dsData.Active then
    begin
      dsDeductionData.ParamByName('pid').AsFloat := dsData.ParamByName('id').AsFloat;
      dsDeductionData.Open;
      //-- только для реестра в состоянии "Формируется"
      if (dsDataSTATE_SYSNAME.AsString = 'State.PackSpecifyKindPay.Formed') then
        begin
          dsDeductionDataOldKBK.ParamByName('pid').AsFloat := dsData.ParamByName('id').AsFloat;
          dsDeductionDataOldKBK.Open;
        end;
    end;
end;

procedure TReestrSpecifyKindPayForm.dsDataAfterOpen(DataSet: TDataSet);
var
  par : TfdcParam;
begin
  inherited;
  FOwnPack :=  DataSet.FieldByName( 'EXT_SOURCE' ).IsNull or
              (DataSet.FieldByName( 'EXT_SOURCE' ).AsString = MainData.GetCustomsCode);
  //--
  dsSumByKBK.Close;
  dsSumByKBK.ParamByName('pid').AsFloat := dsData.ParamByName('id').AsFloat;
  dsSumByKBK.Open;
  //--
end;

procedure TReestrSpecifyKindPayForm.actSaveToFileExecute(Sender: TObject);
var
  ExportFormat: string;
  grd : TcxGrid;
begin
  inherited;

  if not dlgExportData.Execute then Exit;

  if tabGeneral.Visible then
    grd := grdSumByKBK
  else if tabPayments.Visible then
    grd := grdData
  else if tabNotice.Visible then
    grd := grdNoticeData
  else
    grd := nil;

  if not Assigned( grd ) then
    Exit;

  { get file extension }
  ExportFormat := ExtractFileExt(dlgExportData.FileName);

  { remove first dot }
  ExportFormat := AnsiUpperCase(Copy(ExportFormat, 2, Length(ExportFormat)));

  { export data using selected format }
  if ExportFormat = 'HTML' then
    ExportGrid4ToHTML(dlgExportData.FileName, grd)
  else
  if ExportFormat = 'XML' then
    ExportGrid4ToXML(dlgExportData.FileName, grd)
  else
  if ExportFormat = 'XLS' then
    ExportGrid4ToExcel(dlgExportData.FileName, grd)
  else
  if ExportFormat = 'TXT' then
    ExportGrid4ToText(dlgExportData.FileName, grd)
  else begin
    ShowMessage(Format('Формат %s не поддерживается', [ExportFormat]));
    Exit;
  end;

  { try to show saved file }
  if MessageDlg(
    'Сохранение завершено. Открыть созданный файл?',
    'Результат сохранен в файл ' + dlgExportData.FileName + '. ' +
    'Если Вы хотите просмотреть созданный файл нажмите "Да", иначе нажмите "Нет".',
    '', mtInformation, [mbYes, mbNo], 0) = mrYes then
    ShellOpen(dlgExportData.FileName);
end;

procedure TReestrSpecifyKindPayForm.actSaveToFileUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (   (tabGeneral.Visible and (grdSumByKBKDBTableView.DataController.RowCount > 0))
     or (tabPayments.Visible and (grdDataDBBandedTableView.DataController.RowCount > 0))
     or (tabNotice.Visible and (grdNoticeDataDBBandedTableView.DataController.RowCount > 0))
    );
end;

procedure TReestrSpecifyKindPayForm.tcNoticeChange(Sender: TObject);
begin
  dsNoticeData.Close;
  if dsData.Active then
    begin
      dsNoticeData.Close;
      case TcxTabControl(Sender).TabIndex of
        0: dsNoticeData.ParamByName('pdirection').AsString := 'ИМ';
        1: dsNoticeData.ParamByName('pdirection').AsString := 'ЭК';
        2: dsNoticeData.ParamByName('pdirection').AsString := '';
      end;
      dsNoticeData.Open;
    end;
end;

procedure TReestrSpecifyKindPayForm.tabNoticeShow(Sender: TObject);
begin
  dsNoticeData.ParamByName('pid').AsFloat := dsData.ParamByName('id').AsFloat;
  tcNotice.OnChange(tcNotice);
end;

procedure TReestrSpecifyKindPayForm.actRefreshExecute(Sender: TObject);
begin
  inherited;
  if dsData.Active then
    begin
    case pcMain.ActivePageIndex of
      0: if dsSumByKBK.Active then
           begin
             dsSumByKBK.ReQuery;
           end;
      1: begin
           if dsDeductionData.Active then dsDeductionData.ReQuery;
           if dsDeductionDataOldKBK.Active then dsDeductionDataOldKBK.Refresh;
         end;
      2: if dsNoticeData.Active then dsNoticeData.ReQuery;
    end;
  end;
end;

procedure TReestrSpecifyKindPayForm.grdNoticeDataDBBandedTableViewTYPENAMECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ObjectType: TfdcObjectType;
  ObjectTypeSysName: string;
begin
  inherited;
  ADone := False;
  if Assigned(ObjectServices) then
    begin
      ObjectTypeSysName := VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[
      grdDataDBBandedTableViewTYPESYSNAME.Index]);
      ObjectType := ObjectServices.GetObjectTypeFactory.Find(ObjectTypeSysName);
      if Assigned(ObjectType) then
        begin
          ADone := ObjectType.DrawGridCell(ACanvas.Canvas, AViewInfo.Bounds);
        end;
    end;
end;

procedure TReestrSpecifyKindPayForm.grdNoticeDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var  ObjectTypeSysName: string;
begin
  inherited;
  ObjectTypeSysName := VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[grdDataDBBandedTableViewTYPESYSNAME.Index]);
  if (not(AViewInfo.Selected) and (AnsiRightStr(ObjectTypeSysName,4) = 'Summ')) then
    begin
      //-- закрашиваем жёлтым цветом строки уведомлений/подтверждений суммарных по подчинённым ТО
      ACanvas.Brush.Color := clYellow;
    end;
end;

procedure TReestrSpecifyKindPayForm.FormShow(Sender: TObject);
var
  SumItem: TcxGridDBBandedTableSummaryItem;
  i: integer;
begin
  inherited;

  for i:= 0 to grdNoticeDataDBBandedTableView.ColumnCount-1 do
    if grdNoticeDataDBBandedTableView.Columns[i].PropertiesClass = TcxCalcEditProperties then
      with grdNoticeDataDBBandedTableView.DataController.Summary do
      begin
        BeginUpdate;
        try
          SumItem:= FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem;
          SumItem.Column:= grdNoticeDataDBBandedTableView.Columns[i];
          SumItem.Kind:= skSum;
          SumItem.Format:= '.0,0';
        finally
          EndUpdate;
        end;
      end;
  //--
  BarManager.Bars[1].DockControl := dxBarDockControloldkbk;
  BarManager.Bars[1].DockedDockControl := dxBarDockControloldkbk;
  //--
end;


procedure TReestrSpecifyKindPayForm.dxBarPrintClick(Sender: TObject);
  //--
  var lv_Formats   : TFormatSettings;
  //--
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
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, lv_Formats);
  lv_Formats.ShortDateFormat := 'DD.MM.YYYY';
  lv_Formats.DateSeparator := '.';
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
  // --- prepare template
  xlrNoticeKindPay.XLSTemplate :=ExtractFilePath(Application.ExeName) + 'Report\ReestrSpecifyKindPay.xls';
  LoadReportQueryEx(xlrNoticeKindPay.XLSTemplate);
  // --- open Query`s
  dsHeader.ParamByName( 'begin_date' ).AsDate      := dsDataDOC_DATE.AsDateTime;
  dsHeader.ParamByName( 'reestr_type' ).AsString   := dsDataTYPESYSNAME.AsString;
  dsHeader.ParamByName( 'reestr_number' ).AsString := dsDataDOC_NUMBER.AsString;
  dsHeader.ParamByName( 'custom_code' ).AsString   := StringReplace( dsDataEXT_SOURCE.AsString, 'KNP', '000', [rfReplaceAll] ); 
  dsHeader.Open;

  dsBody.ParamByName( 'reestr_id' ).AsInteger := dsDataID.AsInteger;
  dsBody.Open;
  // --- generate report
  try
    xlrNoticeKindPay.Report(True);
  except on e:exception do
    begin
      raise;
    end;
  end;
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
end;

procedure TReestrSpecifyKindPayForm.DoKBKSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  sqlChangeKBKinDeduction.ParamValues['preestrid']:= dsDataID.AsFloat;
  sqlChangeKBKinDeduction.ParamValues['pdeductionid']:= dsDeductionDataOldKBKID.AsFloat;
  sqlChangeKBKinDeduction.ParamValues['pkbkid']:= ADragObject.Objects.Items[0].id;
  sqlChangeKBKinDeduction.Exec;
  //-- обновление данных на форма
  dsDeductionData.ReQuery;
  dsDeductionDataOldKBK.ReQuery;
  //--
end;

procedure TReestrSpecifyKindPayForm.actChangeKBKExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TKBKDictGridForm', 'KBKDict', 0, Params, Self, False, DoKBKSearchFinished);
end;

procedure TReestrSpecifyKindPayForm.cxGridDBBanded_KBKCODEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  actChangeKBK.Execute;
end;


procedure TReestrSpecifyKindPayForm.dsDeductionDataOldKBKAfterOpen(
  DataSet: TDataSet);
begin
  //-- определить видимость панели со списаниями в которых "КБК на" не действует на текущий момент
  cxGroupBoxPaymentOldKBK.Visible := not(DataSet.Eof);
end;

procedure TReestrSpecifyKindPayForm.dsDeductionDataOldKBKAfterClose(
  DataSet: TDataSet);
begin
  //-- определить видимость панели со списаниями в которых "КБК на" не действует на текущий момент
  cxGroupBoxPaymentOldKBK.Visible := false;
end;

procedure TReestrSpecifyKindPayForm.actExcludeDeduct_old_kbkExecute(
  Sender: TObject);
  var li: integer;
      lcol_index: integer;
begin
  if (grdDataPaymentOldKBK.Showing) then
    begin
      lcol_index := cxGridDBBandedTableViewOldKbk.DataController.GetItemByFieldName('ID').Index;
      for li:= 0 to cxGridDBBandedTableViewOldKbk.DataController.GetSelectedCount-1 do
        begin
          sqlRemove_deduct_from_reestr.ParamValues['preestrid']:= dsDataID.AsFloat;
          sqlRemove_deduct_from_reestr.ParamValues['pdeductionid']:= cxGridDBBandedTableViewOldKbk.DataController.Values[cxGridDBBandedTableViewOldKbk.DataController.GetSelectedRowIndex(li),lcol_index];
          //--
          sqlRemove_deduct_from_reestr.Exec;
          //-- обновление данных на форме
          dsDeductionData.ReQuery;
          dsDeductionDataOldKBK.ReQuery;
          //--
        end;
    end;
end;

procedure TReestrSpecifyKindPayForm.tabReestrsShow(Sender: TObject);
begin
  if not(Assigned( Params.FindParam( 'reestr_id' ))) then
    begin
      Params.CreateParam( ftFloat, 'reestr_id', ptInput );
    end;
  Params.ParamByName( 'reestr_id' ).AsFloat := dsDataID.AsFloat;
  if not Assigned(FReestrsForm) then
    FReestrsForm := ObjectServices.ShowForm('TReestrSpecifyKindPayGridByReestrForm', params, tabReestrs);
end;

procedure TReestrSpecifyKindPayForm.tabEnvelopsShow(Sender: TObject);
begin
  if not Assigned( fEnvelopsForm ) then
    begin
      fEnvelopsForm := ShowForm( 'TDocPackTransferGridForm', Params, tabEnvelops );

      (fEnvelopsForm as TfdcCustomDBDataForm).RefreshData;
    end;
end;

initialization
  RegisterClass(TReestrSpecifyKindPayForm);

end.
