unit AdviceBackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdviceFrm, QueryList, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxDBEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit, cxMemo, cxTextEdit, cxPC, cxControls, OracleData,
  cxCheckBox;

type
  TAdviceBackForm = class(TAdviceForm)
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdviceBackForm: TAdviceBackForm;

implementation

{$R *.dfm}
procedure TAdviceBackForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
   if assigned (dsDataSUMMA_DEBT.DataSet) then
     dsDataSUMMA_DEBT.DataSet:= nil;
end;

initialization
  RegisterClass(TAdviceBackForm);

end.
