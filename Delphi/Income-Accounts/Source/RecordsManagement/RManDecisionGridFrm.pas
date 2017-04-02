unit RManDecisionGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, DocRManagementGridFrm, cxCurrencyEdit, cxCalc,
  cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TRManDecisionGridForm = class(TDocRManagementGridForm)
    colAppDate: TcxGridDBBandedColumn;
    colAppDateIncome: TcxGridDBBandedColumn;
    colSumma: TcxGridDBBandedColumn;
    dsDataAPP_NUMBER: TStringField;
    dsDataAPP_DATE: TDateTimeField;
    dsDataAPP_DATE_INCOME: TDateTimeField;
    dsDataREASON_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    lciActiveDate: TdxLayoutItem;
    lblActiveDate: TLabel;
    lciActiveFrom: TdxLayoutItem;
    edtActiveFrom: TcxDateEdit;
    lciActiveTo: TdxLayoutItem;
    edtActiveTo: TcxDateEdit;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
procedure TRManDecisionGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('ACTIVE_FROM', edtActiveFrom.EditValue);
  SetSearchParam('ACTIVE_TO', edtActiveTo.EditValue);
end;

initialization
  RegisterClass(TRManDecisionGridForm);

end.
