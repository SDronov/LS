unit DocPackActChangeOstKBKFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxMemo, cxTextEdit, cxPC, cxControls;

type
  TDocPackActChangeOstKBKForm = class(TDocPackForm)
  private
    { Private declarations }
  protected
    function GetDocsFormClassName : string; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
function TDocPackActChangeOstKBKForm.GetDocsFormClassName: string;
begin
  Result := 'TActChangeOstKBKInPackGridForm';
end;


initialization
  RegisterClass( TDocPackActChangeOstKBKForm );

end.
