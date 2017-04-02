unit ASBCElRulingsCriminalCaseFrm;

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
  TASBCElRulingsCriminalCaseForm = class(TASBCElRulingsForm)
    cxDBTextEdit3: TcxDBTextEdit;
    lcGeneralItem17: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    lcGeneralItem18: TdxLayoutItem;
    lcgeneralGroupInvestigator: TdxLayoutGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ASBCElRulingsCriminalCaseForm: TASBCElRulingsCriminalCaseForm;

implementation

{$R *.dfm}
initialization
 RegisterClass(TASBCElRulingsCriminalCaseForm);

end.
