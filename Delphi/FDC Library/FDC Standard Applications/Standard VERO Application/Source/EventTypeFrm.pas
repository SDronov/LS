unit EventTypeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectTypeFrm, cxLookAndFeelPainters, ExtDlgs, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxCheckBox, cxDBEdit, cxButtons, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls;

type
  TEventTypeForm = class(TObjectTypeForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventTypeForm: TEventTypeForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TEventTypeForm);

end.
