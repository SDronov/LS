unit RezulttoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls;

type
  TRezulttoForm = class(TNSIDictForm)
  private
  protected
    function IsReadOnly: Boolean; override;
  public
  end;


implementation

{$R *.dfm}

{ TRezulttoForm }

function TRezulttoForm.IsReadOnly: Boolean;
begin
  Result := False;
end;

initialization
  RegisterClass(TRezulttoForm);


end.
 