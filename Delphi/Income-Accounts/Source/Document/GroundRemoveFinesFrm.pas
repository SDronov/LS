unit GroundRemoveFinesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls;

type
  TGroundRemoveFinesForm = class(TDocumentForm)
    dsDataDECL_ID: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GroundRemoveFinesForm: TGroundRemoveFinesForm;

implementation

{$R *.dfm}
initialization
  RegisterClass(TGroundRemoveFinesForm);

end.
