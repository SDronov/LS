unit CorrectionTpoCChargeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionTPOFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, QueryList;

type
  TCorrectionTPOCChargeForm = class(TCorrectionTPOForm)
  private
  public
  end;

implementation

{$R *.dfm}

uses
  fdcObjectServices;

initialization
  RegisterClass(TCorrectionTPOCChargeForm);


end.
