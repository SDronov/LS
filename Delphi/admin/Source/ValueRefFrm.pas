unit ValueRefFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ValueFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls;

type
  TValueRefForm = class(TValueForm)
    edtRefObjectID: TfdcObjectLinkEdit;
    lciRefObjectID: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValueRefForm: TValueRefForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TValueRefForm);

end.
