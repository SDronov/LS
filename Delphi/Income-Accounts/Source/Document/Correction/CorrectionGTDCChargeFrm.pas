unit CorrectiongtdCChargeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectiongtdFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, QueryList;

type
  TCorrectiongtdCChargeForm = class(TCorrectionGTDForm)
  private
  public
  end;

implementation

{$R *.dfm}

uses
  fdcObjectServices;

initialization
  RegisterClass(TCorrectiongtdCChargeForm);


end.
