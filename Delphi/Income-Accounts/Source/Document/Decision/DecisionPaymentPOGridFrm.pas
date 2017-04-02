unit DecisionPaymentPOGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManPaymentOrderGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxCheckBox,
  cxCalendar, cxMemo, QueryList, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxDropDownEdit, cxTextEdit,
  StdCtrls, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar;

type
  TDecisionPaymentPOGridForm = class(TRManPaymentOrderGridForm)
    dsDataSUMMA_REUSED: TFloatField;
    grdDataDBBandedTableViewSUMMA_REUSED: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecisionPaymentPOGridForm: TDecisionPaymentPOGridForm;

implementation

{$R *.dfm}

uses
  MainDM;

initialization
  RegisterClass(TDecisionPaymentPOGridForm);

end.
