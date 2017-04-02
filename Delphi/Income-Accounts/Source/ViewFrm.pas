unit ViewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ServerComponentFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls;

type
  TViewForm = class(TServerComponentForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewForm: TViewForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TViewForm);

end.
