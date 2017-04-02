unit AdviceKnpFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdviceFrm, OracleData, QueryList, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxDBEdit, cxButtonEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCurrencyEdit, cxMemo, cxTextEdit, cxPC, cxControls,
  cxCheckBox;

type
  TAdviceKnpForm = class(TAdviceForm)
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function GetTemplateReportName : String; override;
  end;

var
  AdviceKnpForm: TAdviceKnpForm;

implementation

{$R *.dfm}


function TAdviceKnpForm.GetTemplateReportName: String;
begin
  Result := 'сбеднлкемхе ймо н бнгбпюре демефмшу япедярб.doc';
end;

procedure TAdviceKnpForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
   if assigned (dsDataSUMMA_DEBT.DataSet) then
     dsDataSUMMA_DEBT.DataSet:= nil;
end;

initialization
  RegisterClass(TAdviceKnpForm);

end.
