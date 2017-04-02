unit TypeCorrectionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls;

type
  TTypeCorrectionForm = class(TNSIDictForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeCorrectionForm: TTypeCorrectionForm;

implementation

{$R *.dfm}
initialization
    RegisterClass(TTypeCorrectionForm);

end.
