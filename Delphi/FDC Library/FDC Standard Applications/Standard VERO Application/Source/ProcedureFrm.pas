unit ProcedureFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ServerComponentFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls;

type
  TProcedureForm = class(TServerComponentForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProcedureForm: TProcedureForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TProcedureForm);

end.
