unit ServerComponentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SysComponentFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls;

type
  TServerComponentForm = class(TSysComponentForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerComponentForm: TServerComponentForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TServerComponentForm);

end.
