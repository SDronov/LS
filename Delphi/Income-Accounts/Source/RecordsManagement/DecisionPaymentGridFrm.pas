unit DecisionPaymentGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalc, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, RManDecisionGridFrm,
  cxCheckBox, cxCalendar, cxCurrencyEdit, cxDropDownEdit;

type
  TDecisionPaymentGridForm = class(TRManDecisionGridForm)
    dsDataSIGNED_BY: TStringField;
    colSignedBy: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGNED_BY_CHIEF_UDF: TStringField;
    dsDataDECL_OKPO: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    columnIS_ACTIVE: TcxGridDBBandedColumn;
    columnACTIVATION_DATE: TcxGridDBBandedColumn;
    dsDataSTATE_NAME: TStringField;
    columnSTATE_NAME: TcxGridDBBandedColumn;
    dsDataATICLE: TStringField;
    grdDataDBBandedTableViewATICLE: TcxGridDBBandedColumn;
    dsDataDOC_OSN_CODE: TStringField;
    grdDataDBBandedTableViewDOC_OSN_CODE: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


initialization
  RegisterClass(TDecisionPaymentGridForm);

end.
