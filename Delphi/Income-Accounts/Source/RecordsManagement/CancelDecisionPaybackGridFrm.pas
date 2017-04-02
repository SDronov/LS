unit CancelDecisionPaybackGridFrm;

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
  dxStatusBar, cxCurrencyEdit, cxDropDownEdit, cxCalendar, Grids, DBGrids,
  cxCheckBox;

type
  TCancelDecisionPaybackGridForm = class(TDocRManagementGridForm)
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataDEC_PAY_ID: TFloatField;
    dsDataDECL_OKPO: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    dsDataDEC_DATE: TDateTimeField;
    dsDataDEC_NUMBER: TStringField;
    dsDataDEC_SUMMA: TFloatField;
    dsDataDEC_CURR_CODE: TStringField;
    dsDataDEC_CURR_NAME: TStringField;
    dsDataCURRENCY_ID: TFloatField;
    grdDataDBBandedTableViewDEC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEC_CURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEC_CURR_NAME: TcxGridDBBandedColumn;
    colDeclInn: TcxGridDBBandedColumn;
    colDeclKpp: TcxGridDBBandedColumn;
    dsDataEXT_SOURCE: TStringField;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    lciActiveDate: TdxLayoutItem;
    lblActiveDate: TLabel;
    lciActiveFrom: TdxLayoutItem;
    edtActiveFrom: TcxDateEdit;
    lciActiveTo: TdxLayoutItem;
    edtActiveTo: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CancelDecisionPaybackGridForm: TCancelDecisionPaybackGridForm;

implementation

uses MainDm;

{$R *.dfm}
procedure TCancelDecisionPaybackGridForm.FormShow(Sender: TObject);
begin
  inherited;
  actAdd.Visible := False;
  actAdd.Enabled := False;
 end;

procedure TCancelDecisionPaybackGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
   if ARecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ] <> maindata.GetCustomsCode then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackAlienSelected
    else
      AStyle := MainData.stlDocPackAlien
end;

procedure TCancelDecisionPaybackGridForm.dsDataBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('ACTIVE_FROM', edtActiveFrom.EditValue);
  SetSearchParam('ACTIVE_TO', edtActiveTo.EditValue);
end;

initialization
  RegisterClass(TCancelDecisionPaybackGridForm);

end.
