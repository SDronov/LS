unit DecisionDebtsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManDecisionGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalc, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxCurrencyEdit, cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TDecisionDebtsGridForm = class(TRManDecisionGridForm)
    dsDataSTATENAME: TStringField;
    colStateName: TcxGridDBBandedColumn;
    dsDataSUM_RUB: TFloatField;
    dsDataVALUTA: TStringField;
    colValuta: TcxGridDBBandedColumn;
    colSumRub: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    dsDataIS_EXTERNAL: TStringField;
    procedure actAddExecute(Sender: TObject);
  private
  public
  end;


implementation

{$R *.dfm}
procedure TDecisionDebtsGridForm.actAddExecute(Sender: TObject);
  const
    DecDebtsPaysSysName = 'DecisionDebtsPays';
begin
//  inherited;
  RegisterAsWaiterFor(ObjectServices.CreateObject(DecDebtsPaysSysName, False, Params));
end;

initialization
  RegisterClass(TDecisionDebtsGridForm);

end.
