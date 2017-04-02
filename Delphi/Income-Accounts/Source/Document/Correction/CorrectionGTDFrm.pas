unit CorrectionGTDFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionCDFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, QueryList;

type
  TCorrectionGTDForm = class(TCorrectionCDForm)
    procedure actDeleteUpdate(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TCorrectionGTDForm.actDeleteUpdate(Sender: TObject);
begin
 ;
end;

end.
 