unit DocRManagementGridFrm;

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
  dxStatusBar, cxCurrencyEdit, cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TDocRManagementGridForm = class(TObjectGridForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    colDocNumber: TcxGridDBBandedColumn;
    colDocDate: TcxGridDBBandedColumn;
    colDeclName: TcxGridDBBandedColumn;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtDeclName: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtKPP: TcxTextEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtNomer: TcxTextEdit;
    lcSearchCriteriaItem5: TdxLayoutItem;
    Label1: TLabel;
    lcSearchCriteriaItem6: TdxLayoutItem;
    edtFromDate: TcxDateEdit;
    lcSearchCriteriaItem7: TdxLayoutItem;
    edtToDate: TcxDateEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    Label2: TLabel;
    lcSearchCriteriaItem9: TdxLayoutItem;
    edtSumMin: TcxCurrencyEdit;
    lcSearchCriteriaItem10: TdxLayoutItem;
    edtSumMax: TcxCurrencyEdit;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TDocRManagementGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if edtSumMin.EditModified then
    edtSumMin.PostEditValue;
  if edtSumMax.EditModified then
    edtSumMax.PostEditValue;
  SetSearchParam('DECL_NAME', Trim(edtDeclName.Text));
  SetSearchParam('INN', Trim(edtINN.Text));
  SetSearchParam('KPP', Trim(edtKPP.Text));
  SetSearchParam('DOC_NO', Trim(edtNomer.Text));
  SetSearchParam('FROM_DATE', edtFromDate.EditValue);
  SetSearchParam('TO_DATE', edtToDate.EditValue);
  SetSearchParam('SUM_MIN', edtSumMin.EditValue);
  SetSearchParam('SUM_MAX', edtSumMax.EditValue);
end;

initialization
  RegisterClass(TDocRManagementGridForm);

end.
