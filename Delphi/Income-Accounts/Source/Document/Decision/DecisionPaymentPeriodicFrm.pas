unit DecisionPaymentPeriodicFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionPaymentFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxMemo, cxTextEdit, cxPC, cxControls, cxCurrencyEdit,
  cxGraphics, OracleData, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, QueryList;

type
  TDecisionPaymentPeriodicForm = class(TDecisionPaymentForm)
    dsDataADVICE_ID: TFloatField;
  private
  public
  end;

implementation

{$R *.dfm}
initialization
  RegisterClass( TDecisionPaymentPeriodicForm );

end.
