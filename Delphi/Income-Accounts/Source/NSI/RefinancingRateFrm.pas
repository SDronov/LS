unit RefinancingRateFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TNSIRefinancingRateForm = class(TObjectForm)
    dsDataRATE_DATE: TDateTimeField;
    lcGeneralItem1: TdxLayoutItem;
    edtRateDate: TcxDBDateEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtRefinancingRate: TcxDBMaskEdit;
    dsDataREFINANCING_RATE: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NSIRefinancingRateForm: TNSIRefinancingRateForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TNSIRefinancingRateForm);

end.
