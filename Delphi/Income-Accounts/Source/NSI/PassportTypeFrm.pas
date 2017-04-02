unit PassportTypeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar,
  ImgList, cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels,
  ActnList, StdCtrls, dxLayoutControl, cxMaskEdit, cxButtonEdit, cxDBEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls;

type
  TPassportTypeForm = class(TDictForm)
    edtShortName: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
  private
  public
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TPassportTypeForm);


end.
