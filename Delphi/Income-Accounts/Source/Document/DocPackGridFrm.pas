unit DocPackGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCheckBox, cxDropDownEdit, cxCalendar;

type
  TDocPackGridForm = class(TObjectGridForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    dsDataSTATE_NAME: TStringField;
    grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn;
    lcSearchCriteriaItem1: TdxLayoutItem;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtFromDate: TcxDateEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtToDate: TcxDateEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    Label1: TLabel;
    lcSearchCriteriaItem5: TdxLayoutItem;
    edtNomer: TcxTextEdit;
    dsDataSENDER_SOFT_CODE_ID: TFloatField;
    dsDataSENDER_SOFT_NAME: TStringField;
    dsDataSENDER_SOFT_CODE: TStringField;
    dsDataRECEIVER_SOFT_CODE_ID: TFloatField;
    dsDataRECEIVER_SOFT_NAME: TStringField;
    dsDataRECEIVER_SOFT_CODE: TStringField;
    dsDataIS_RECIEVED: TStringField;
    dsDataRECIEVE_DATE: TDateTimeField;
    grdDataDBBandedTableViewIS_RECIEVED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRECIEVE_DATE: TcxGridDBBandedColumn;
    dxbcTO: TdxBarCombo;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dxbcTOChange(Sender: TObject);
  private
    { Private declarations }
  protected
    RestoredCustoms : string;
  public
    { Public declarations }
    procedure LoadLayout; override;
    procedure SaveLayout; override;
  end;

var
  DocPackGridForm: TDocPackGridForm;

implementation

uses
  MainDM
 ,fdcUtils, fdcCustomDBDataFrm;

{$R *.dfm}

const
  cRegKey_Customs = 'CurrentCustoms';

procedure TDocPackGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('DOC_NO', Trim(edtNomer.Text));
  SetSearchParam('FROM_DATE', edtFromDate.EditValue);
  SetSearchParam('TO_DATE', edtToDate.EditValue);

  dsData.ParamByName('customs_code').Value := MainData.GetChildCustomsCodeByName( dxbcTO.Text );
end;

procedure TDocPackGridForm.LoadLayout;
begin
  inherited;

  RestoredCustoms := ReadRegistryValue( FormLayoutRegistryKey, cRegKey_Customs, rvString );
end;

procedure TDocPackGridForm.SaveLayout;
begin
  inherited;

  WriteRegistryValue(FormLayoutRegistryKey, cRegKey_Customs, dxbcTO.Text);
end;

procedure TDocPackGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  MainData.GetChildCustomsNames( dxbcTO.Items );

  if dxbcTO.Items.IndexOf( RestoredCustoms ) >= 0 then
    dxbcTO.Text := RestoredCustoms;
end;

procedure TDocPackGridForm.dxbcTOChange(Sender: TObject);
  var
    i : Integer;
begin
  inherited;
  RefreshData;

  // Автовыравнивание для колонок с суммами
  for i := 0 to grdDataDBBandedTableView.ItemCount - 1 do
    if grdDataDBBandedTableView.Items[i].PropertiesClassName = 'TcxCurrencyEditProperties' then
      grdDataDBBandedTableView.Items[i].ApplyBestFit;
end;

end.
