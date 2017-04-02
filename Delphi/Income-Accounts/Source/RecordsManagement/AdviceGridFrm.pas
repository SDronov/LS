unit AdviceGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocRManagementGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCheckBox, cxCalendar, cxCurrencyEdit, cxDropDownEdit;

type
  TAdviceGridForm = class(TDocRManagementGridForm)
    colCustomName: TcxGridDBBandedColumn;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataDECL_OKPO: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataCUSTOMS_CODE_8: TStringField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    barCBFilterState: TdxBarCombo;
    colSumma: TcxGridDBBandedColumn;
    dsDataSUMMA: TFloatField;
    grdDataDBBandedTableViewColumnINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumnKPP: TcxGridDBBandedColumn;
    lcSearchCrtActiveted_date: TdxLayoutItem;
    Label3: TLabel;
    lcSearchCrtFromDateActiveted: TdxLayoutItem;
    edtFromDateActiveted: TcxDateEdit;
    lcSearchCrtToDateActiveted: TdxLayoutItem;
    edtToDateActiveted: TcxDateEdit;
    dsDataSUMMA_AVAIL: TFloatField;
    dsDataSUMMA_REST: TFloatField;
    dsDataSUMMA_TS: TFloatField;
    dsDataSUMMA_TS_AVAIL: TFloatField;
    dsDataSUMMA_TS_REST: TFloatField;
    dsDataADVICE_STATE: TStringField;
    grdDataDBBandedTableViewSUMMA_AVAIL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA_REST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA_TS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA_TS_AVAIL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA_TS_REST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewADVICE_STATE: TcxGridDBBandedColumn;
    edtDocOsnCustomsCode: TcxTextEdit;
    lciDocOsnCustomsCode: TdxLayoutItem;
    lcgDocOsn: TdxLayoutGroup;
    edtDocOsnDate: TcxDateEdit;
    lciDocOsnDate: TdxLayoutItem;
    edtDocOsnNumber: TcxTextEdit;
    lciDocOsnNumber: TdxLayoutItem;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure barCBFilterStateChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses fdcCustomDBDataFrm, fdcCustomGridFrm;

{$R *.dfm}
procedure TAdviceGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('VM').Value := barCBFilterState.ItemIndex;
  dsData.ParamByName('FROM_DATE_ACTIVETED').Value := edtFromDateActiveted.EditValue;
  dsData.ParamByName('TO_DATE_ACTIVETED').Value := edtToDateActiveted.EditValue;

  if    ( edtDocOsnCustomsCode.Text <> '' )
     or ( edtDocOsnNumber.Text      <> '' )
     or ( not VarIsNull( edtDocOsnDate.EditValue ) ) then
    SetSubsParam( 'doc_osn', 1 )
  else
    SetSubsParam( 'doc_osn', null );

  SetSearchParam( 'doc_osn_customs_code', edtDocOsnCustomsCode.Text );
  SetSearchParam( 'doc_osn_date',         edtDocOsnDate.EditValue );
  SetSearchParam( 'doc_osn_number',       edtDocOsnNumber.Text );
end;

procedure TAdviceGridForm.barCBFilterStateChange(Sender: TObject);
begin
  RefreshData;
end;

procedure TAdviceGridForm.actDeleteExecute(Sender: TObject);
begin
  if dsData.FieldByName( 'TypeSysName' ).AsString = 'AdvicePayPeriodic' then
    MessageDlg( 'Для удаления Уведомления необходимо нажать кнопку "Вернуть" во временной декларации!', mtError, [mbOk], 0 )
  else
    inherited;
end;

initialization
  RegisterClass(TAdviceGridForm);

end.
