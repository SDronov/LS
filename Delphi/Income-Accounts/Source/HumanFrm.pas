unit HumanFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PersonFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxSpinEdit, cxDBEdit, cxMaskEdit, cxCalendar, cxMemo, cxTextEdit, cxPC,
  cxControls;

type
  THumanForm = class(TPersonForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HumanForm: THumanForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(THumanForm);

end.
