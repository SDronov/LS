unit ValueRefFileFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ValueRefFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxTextEdit, cxMemo, cxPC,
  cxControls, cxCheckBox;

type
  TValueRefFileForm = class(TValueRefForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValueRefFileForm: TValueRefFileForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TValueRefFileForm);

end.
