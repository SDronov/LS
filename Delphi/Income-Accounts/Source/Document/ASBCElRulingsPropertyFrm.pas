unit ASBCElRulingsPropertyFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ASBCElRulingsFrm, cxGraphics, OracleData, QueryList, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxCurrencyEdit, cxDBEdit, cxCheckBox, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxDropDownEdit,
  cxLabel, cxCalendar, cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, cxMemo,
  cxTextEdit, cxPC, cxControls;

type
  TASBCElRulingsPropertyForm = class(TASBCElRulingsForm)
    cxDBComboBox3: TcxDBComboBox;
    lcGeneralItem17: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ASBCElRulingsPropertyForm: TASBCElRulingsPropertyForm;

implementation

{$R *.dfm}
initialization
 RegisterClass(TASBCElRulingsPropertyForm);

end.
