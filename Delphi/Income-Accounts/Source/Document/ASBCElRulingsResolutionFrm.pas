unit ASBCElRulingsResolutionFrm;

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
  TASBCElRulingsResolutionForm = class(TASBCElRulingsForm)
    cxDBMaskEdit5: TcxDBMaskEdit;
    lcGeneralItem17: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem18: TdxLayoutItem;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ASBCElRulingsResolutionForm: TASBCElRulingsResolutionForm;

implementation

{$R *.dfm}
initialization
 RegisterClass(TASBCElRulingsResolutionForm);

end.
