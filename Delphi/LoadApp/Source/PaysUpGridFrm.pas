unit PaysUpGridFrm;

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
  dxStatusBar, ztvregister, ztvBase, ztvZip, VKDBFDataSet, TransferDm, InLoader;

type
  TPaysUpGridForm = class(TfdcCustomGridForm)
    actRestPaysUpload: TAction;
    Zip: TZip;
    dsDataID: TFloatField;
    dsDataNAME: TStringField;
    dsDataSHORTNAME: TStringField;
    dsDataOBJECT_TYPE_ID: TFloatField;
    dsDataSTATE_ID: TFloatField;
    dsDataACCESSLEVEL: TFloatField;
    dsDataSYSNAME: TStringField;
    dsDataDESCRIPT: TStringField;
    dsDataOWNER_OBJECT_ID: TFloatField;
    dsDataTYPENAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    dsDataOBJECTKINDLIST: TStringField;
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataNAME_P: TStringField;
    dsDataINN_P: TStringField;
    dsDataKPP_P: TStringField;
    dsDataBIK_P: TStringField;
    dsDataACCOUNT_P: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataNREF: TStringField;
    dsDataRECIPIENT_ID: TFloatField;
    dsDataNAME_K: TStringField;
    dsDataINN_K: TStringField;
    dsDataKPP_K: TStringField;
    dsDataBIC_K: TStringField;
    dsDataACCOUNT_K: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataNOTE: TStringField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataNLS: TStringField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataVAL_PAYMENT_REASON: TStringField;
    dsDataVAL_DOC_NUMBER: TStringField;
    dsDataVAL_DOC_DATE: TDateTimeField;
    dsDataVAL_PAYMENT_TYPE: TStringField;
    dsDataIN_REG: TStringField;
    dsDataDESTCUSTOMSCODE: TStringField;
    dsDataKBK: TStringField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_KPP: TStringField;
    dsDataPO_NAME: TStringField;
    dsDataPO_INN: TStringField;
    dsDataPO_KPP: TStringField;
    dsDataREST_SUMMA: TFloatField;
    dsDataLOCKED_SUMMA: TFloatField;
    dsDataCOMING_DATE: TDateTimeField;
    dsDataASSURE_DATE: TDateTimeField;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIK_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCOUNT_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNREF: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRECIPIENT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIC_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCOUNT_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNLS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBKCODE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_PAYMENT_REASON: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_DOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_DOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_PAYMENT_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIN_REG: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLOCKED_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCOMING_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn;
    btnUploadPays: TdxBarButton;
    dsDataOVERPAY_SUMMA: TFloatField;
    grdDataDBBandedTableViewOverPay: TcxGridDBBandedColumn;
    actRestPaysLoad: TAction;
    btnRestPaysLoad: TdxBarButton;
    dlgOpenFile: TOpenDialog;
    procedure actRestPaysUploadExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRestPaysLoadExecute(Sender: TObject);
    procedure actRestPaysUploadUpdate(Sender: TObject);
    procedure actRestPaysLoadUpdate(Sender: TObject);
  private
    { Private declarations }
    dmTransfer: TdmTransfer;
    procedure Del(vFileName: string);
  public
    { Public declarations }
  end;

var
  PaysUpGridForm: TPaysUpGridForm;

implementation

{$R *.dfm}
uses DataDM, fdcUtils, IaccUtils, fdcMessages, fdcCustomDBDataFrm,
  DLWizardFrm, ztvConsts;

procedure TPaysUpGridForm.actRestPaysUploadExecute(Sender: TObject);

  procedure SetFileName(DataSet: TVKDBFNTX; aPath: string);
  begin
    DataSet.DBFFileName := aPath + '\'+DataSet.Name + '.dbf';
    DataSet.CreateNow := True;
    DataSet.BufferSize :=  1024 * 4;
    DataSet.Open;
  end;
var
  aPath: string;
  aParams: TStringList;
begin
  inherited;

  if SelectDirectoryEx('Выберите каталог для сохранения','',aPath, 0) then
  begin
    aPath:= IncludeTrailingPathDelimiter(aPath);
    dmTransfer.dirname := aPath;
    Application.HandleMessage;


    Zip.TempDir:= aPath;
    Zip.FileSpec.Clear;
    Zip.RecurseDirs := False;
    Zip.ConfirmOverwrites := False;
    Zip.StoredDirNames := sdRelative;
    Zip.DefaultExt := '.zip';

    Zip.ArchiveFile := aPath + MainData.GetCustomsCode +
                       FormatDateTime('_YYMMDD_(', now) +
                       StringReplace( MainData.GetSystemValue('CustomsName', rvString), ' ', '_', [rfReplaceAll])+
                       ').zip';

    dmTransfer.RetrieveDecl('PLAT3.Dbf', aParams);

    Zip.FileSpec.Add(aPath +'PLAT3.Dbf');

    Zip.Compress();

    Del(aPath +'PLAT3.Dbf');
    InfoDlg('Выгрузка данных успешно завершена!', Format('Файл данных [%s] сохранен.', [ExtractFileName(Zip.ArchiveFile)]));
  end;
end;

procedure TPaysUpGridForm.Del(vFileName: string);
begin
     if FileExists(vFileName) then
       DeleteFile(PCHAR(vFileName));
end;

procedure TPaysUpGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  dmTransfer:= TdmTransfer.Create(nil);
end;

procedure TPaysUpGridForm.FormDestroy(Sender: TObject);
begin
  inherited;
  dmTransfer.Free;
end;

procedure TPaysUpGridForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Action = caFree then
    PaysUpGridForm := nil;

end;

procedure TPaysUpGridForm.actRestPaysLoadExecute(Sender: TObject);

begin
  inherited;
  with TDLLoaderForm.Create(nil) do
  try
    LoadMode := lmRestCustomsPays;
    if ShowModal = mrOk then
      RefreshData;
  finally
    Free;
  end;
end;

procedure TPaysUpGridForm.actRestPaysUploadUpdate(Sender: TObject);
begin
  inherited;
  actRestPaysUpload.Enabled := not dsData.IsEmpty;
end;

procedure TPaysUpGridForm.actRestPaysLoadUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Visible := (MainData.GetCustomsLevel in [cCustomLevel_FTS, cCustomLevel_RTU]);
end;

end.
