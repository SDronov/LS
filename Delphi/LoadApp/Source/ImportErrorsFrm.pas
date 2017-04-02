unit ImportErrorsFrm;

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
  dxStatusBar, cxMemo, cxDBEdit;

type
  TImportErrorsForm = class(TfdcCustomGridForm)
    Splitter1: TSplitter;
    memError: TcxDBMemo;
    grdDataDBBandedTableViewIMPERRMSG: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    viewGTD: TcxGridDBBandedTableView;
    viewPays: TcxGridDBBandedTableView;
    viewTR: TcxGridDBBandedTableView;
    viewAdvice: TcxGridDBBandedTableView;
    cbView: TdxBarCombo;
    dsPays: TfdcQuery;
    dsGTD: TfdcQuery;
    dsTR: TfdcQuery;
    dsAdvice: TfdcQuery;
    srcPays: TDataSource;
    srcGTD: TDataSource;
    scrTR: TDataSource;
    srcAdvice: TDataSource;
    viewGTDG011: TcxGridDBBandedColumn;
    viewGTDOKPO: TcxGridDBBandedColumn;
    viewGTDINN: TcxGridDBBandedColumn;
    viewGTDG12: TcxGridDBBandedColumn;
    viewGTDG444A: TcxGridDBBandedColumn;
    viewGTDG444B: TcxGridDBBandedColumn;
    viewGTDG447A: TcxGridDBBandedColumn;
    viewGTDG447B: TcxGridDBBandedColumn;
    viewGTDK115: TcxGridDBBandedColumn;
    viewGTDG40: TcxGridDBBandedColumn;
    viewGTDG221: TcxGridDBBandedColumn;
    viewGTDACT_NO: TcxGridDBBandedColumn;
    viewGTDGD1: TcxGridDBBandedColumn;
    viewGTDEXPORT_DATE: TcxGridDBBandedColumn;
    viewGTDG0131_CODE: TcxGridDBBandedColumn;
    viewGTDCHARGE_MONTH: TcxGridDBBandedColumn;
    viewGTDLOAD_FROM_DK: TcxGridDBBandedColumn;
    viewGTDTAX_EXEMPTION: TcxGridDBBandedColumn;
    viewGTDPAYED_MONTHS: TcxGridDBBandedColumn;
    viewGTDNEXT_PAY_MONTH: TcxGridDBBandedColumn;
    viewGTDSUBJECT_NAME: TcxGridDBBandedColumn;
    viewGTDSUBJECT_INN: TcxGridDBBandedColumn;
    viewGTDSUBJECT_KPP: TcxGridDBBandedColumn;
    viewGTDCURRENCY_CODE: TcxGridDBBandedColumn;
    viewGTDCUSTOM_MODE_CODE: TcxGridDBBandedColumn;
    viewGTDCUSTOMS_CODE: TcxGridDBBandedColumn;
    viewGTDREG_DATE: TcxGridDBBandedColumn;
    viewGTDDECL_NO: TcxGridDBBandedColumn;
    viewGTDMODIFY_DATE: TcxGridDBBandedColumn;
    viewGTDDECISION_CODE: TcxGridDBBandedColumn;
    viewGTDDOC_DATE: TcxGridDBBandedColumn;
    viewGTDDOC_NUMBER: TcxGridDBBandedColumn;
    viewGTDIMPERRMSG: TcxGridDBBandedColumn;
    viewTRID: TcxGridDBBandedColumn;
    viewTRNUM_MPO: TcxGridDBBandedColumn;
    viewTRREGIM: TcxGridDBBandedColumn;
    viewTRMETH_MOVE: TcxGridDBBandedColumn;
    viewTRORDER_TYPE: TcxGridDBBandedColumn;
    viewTRSUM_RUB: TcxGridDBBandedColumn;
    viewTRCARRIER_ID: TcxGridDBBandedColumn;
    viewTRCARRIER_NAME: TcxGridDBBandedColumn;
    viewTRCARRIER_INN: TcxGridDBBandedColumn;
    viewTRCARRIER_KPP: TcxGridDBBandedColumn;
    viewTRSUBJECT_ID: TcxGridDBBandedColumn;
    viewTRSUBJECT_NAME: TcxGridDBBandedColumn;
    viewTRSUBJECT_INN: TcxGridDBBandedColumn;
    viewTRSUBJECT_KPP: TcxGridDBBandedColumn;
    viewTRCURRENCY_CODE: TcxGridDBBandedColumn;
    viewTRCUSTOM_MODE_CODE: TcxGridDBBandedColumn;
    viewTRCUSTOMS_CODE: TcxGridDBBandedColumn;
    viewTRREG_DATE: TcxGridDBBandedColumn;
    viewTRDECL_NO: TcxGridDBBandedColumn;
    viewTRMODIFY_DATE: TcxGridDBBandedColumn;
    viewTRDECISION_CODE: TcxGridDBBandedColumn;
    viewTRDOC_DATE: TcxGridDBBandedColumn;
    viewTRDOC_NUMBER: TcxGridDBBandedColumn;
    viewTRDESCRIPT: TcxGridDBBandedColumn;
    viewTRIS_ACTIVE: TcxGridDBBandedColumn;
    viewTRACTIVATION_DATE: TcxGridDBBandedColumn;
    viewTRSTATE_NAME: TcxGridDBBandedColumn;
    viewTREXT_SOURCE: TcxGridDBBandedColumn;
    viewTREXT_TYPESYSNAME: TcxGridDBBandedColumn;
    viewTREXT_ID: TcxGridDBBandedColumn;
    viewTRNEW_ID: TcxGridDBBandedColumn;
    viewTRIMPERRMSG: TcxGridDBBandedColumn;
    viewTRSTEP: TcxGridDBBandedColumn;
    viewPaysID: TcxGridDBBandedColumn;
    viewPaysTYPESYSNAME: TcxGridDBBandedColumn;
    viewPaysDOC_NUMBER: TcxGridDBBandedColumn;
    viewPaysDOC_DATE: TcxGridDBBandedColumn;
    viewPaysDOC_NO2: TcxGridDBBandedColumn;
    viewPaysDOC_DATE2: TcxGridDBBandedColumn;
    viewPaysDOC_SUMMA: TcxGridDBBandedColumn;
    viewPaysSUMMA: TcxGridDBBandedColumn;
    viewPaysEXEC_DATE: TcxGridDBBandedColumn;
    viewPaysPAY_TYPE_CODE: TcxGridDBBandedColumn;
    viewPaysCURR_CODE: TcxGridDBBandedColumn;
    viewPaysINCOME_DATE: TcxGridDBBandedColumn;
    viewPaysNREF: TcxGridDBBandedColumn;
    viewPaysCOMING_DATE: TcxGridDBBandedColumn;
    viewPaysASSURE_DATE: TcxGridDBBandedColumn;
    viewPaysPAYER_ID: TcxGridDBBandedColumn;
    viewPaysPAYER_NAME: TcxGridDBBandedColumn;
    viewPaysPAYER_INN: TcxGridDBBandedColumn;
    viewPaysPAYER_KPP: TcxGridDBBandedColumn;
    viewPaysNOTE: TcxGridDBBandedColumn;
    viewPaysDESCRIPT: TcxGridDBBandedColumn;
    viewPaysDESCRIPT2: TcxGridDBBandedColumn;
    viewPaysBIC_K: TcxGridDBBandedColumn;
    viewPaysEXT_SOURCE: TcxGridDBBandedColumn;
    viewPaysEXT_TYPESYSNAME: TcxGridDBBandedColumn;
    viewPaysEXT_ID: TcxGridDBBandedColumn;
    viewPaysCARDNUM: TcxGridDBBandedColumn;
    viewPaysCASHDESK_ID: TcxGridDBBandedColumn;
    viewPaysCASHDESK_NAME: TcxGridDBBandedColumn;
    viewPaysSTEP: TcxGridDBBandedColumn;
    viewPaysNEW_ID: TcxGridDBBandedColumn;
    viewPaysIMPERRMSG: TcxGridDBBandedColumn;
    viewPaysLAST_USE: TcxGridDBBandedColumn;
    viewAdviceID: TcxGridDBBandedColumn;
    viewAdviceDESCRIPT: TcxGridDBBandedColumn;
    viewAdviceDOC_NUMBER: TcxGridDBBandedColumn;
    viewAdviceDOC_DATE: TcxGridDBBandedColumn;
    viewAdviceCUSTOMS_CODE_8: TcxGridDBBandedColumn;
    viewAdviceSUBJECT_ID: TcxGridDBBandedColumn;
    viewAdviceEXT_SOURCE: TcxGridDBBandedColumn;
    viewAdviceEXT_TYPESYSNAME: TcxGridDBBandedColumn;
    viewAdviceEXT_ID: TcxGridDBBandedColumn;
    viewAdviceNEW_ID: TcxGridDBBandedColumn;
    viewAdviceIMPERRMSG: TcxGridDBBandedColumn;
    procedure cbViewChange(Sender: TObject);
    procedure dsTRBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
  end;

var
  ImportErrorsForm: TImportErrorsForm;

implementation

uses DataDM, fdcCustomDBDataFrm, fdcUtils;

{$R *.dfm}

{ TImportErrorsForm }

procedure TImportErrorsForm.RefreshData;
begin
  if (not (csDestroying in ComponentState)) and
    Assigned(dsData.Session) and
    dsData.Session.Connected then
   RefreshDataset(TcxGridDBBandedTableView(grdData.ActiveView).DataController.DataSource.DataSet, True);
end;

procedure TImportErrorsForm.cbViewChange(Sender: TObject);
begin
  case cbView.ItemIndex of
   0: grdDataLevel.GridView := grdDataDBBandedTableView;
   1: grdDataLevel.GridView := viewPays;
   2: grdDataLevel.GridView := viewGTD;
   3: grdDataLevel.GridView := viewTR;
   4: grdDataLevel.GridView := viewTR;
   5: grdDataLevel.GridView := viewAdvice;
  end;
  memError.DataBinding.DataSource := TcxGridDBBandedTableView(grdData.ActiveView).DataController.DataSource;
  memError.DataBinding.DataField := 'ImpErrMsg';
  RefreshData;
end;

procedure TImportErrorsForm.dsTRBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsTR.Params.ParamValues['Filter'] := cbView.ItemIndex;
end;

procedure TImportErrorsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Action = caFree then
    ImportErrorsForm := nil;
end;

end.
