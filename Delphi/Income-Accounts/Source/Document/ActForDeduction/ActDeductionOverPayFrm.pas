unit ActDeductionOverPayFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActDeductionFrm, cxGraphics, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxMemo, cxTextEdit, cxPC, cxControls, OracleData,
  cxCurrencyEdit, xlcClasses, xlEngine, xlReport;

type
  TActDeductionOverPayForm = class(TActDeductionForm)
    procedure dsDetailOverPaysBeforeOpen(DataSet: TDataSet);
  private
  protected
    function GetDocsFormClassName : string; override;
  public
  end;


implementation

uses fdcCustomCardFrm;

{$R *.dfm}

{ TActDeductionOverPayForm }


function TActDeductionOverPayForm.GetDocsFormClassName: string;
begin
  Result := 'TActDeductionDocsOverPayGrigForm';
end;

procedure TActDeductionOverPayForm.dsDetailOverPaysBeforeOpen(
  DataSet: TDataSet);
begin
  dsDetailOverPays.ParamByName('FLAG').AsInteger := 1;
  dsDetailOverPays.ParamByName('ACT_ID').AsInteger := dsDataID.AsInteger;
end;

initialization
  RegisterClass(TActDeductionOverPayForm);
end.
