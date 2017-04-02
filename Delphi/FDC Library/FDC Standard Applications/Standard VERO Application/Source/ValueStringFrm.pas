unit ValueStringFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ValueFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls, cxCheckBox;

type
  TValueStringForm = class(TValueForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValueStringForm: TValueStringForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TValueStringForm);

end.
