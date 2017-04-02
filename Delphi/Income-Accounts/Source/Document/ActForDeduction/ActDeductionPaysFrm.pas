unit ActDeductionPaysFrm;

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
  TActDeductionPaysForm = class(TActDeductionForm)
    procedure dsDetailPaysBeforeOpen(DataSet: TDataSet);
  private
  protected
    function GetDocsFormClassName : string; override;
  public
    { Public declarations }
  end;

implementation

uses fdcCustomCardFrm;

{$R *.dfm}

{ TActDeductionPaysForm }

function TActDeductionPaysForm.GetDocsFormClassName: string;
begin
  Result := 'TActDeductionDocsPaysGrigForm';
end;

procedure TActDeductionPaysForm.dsDetailPaysBeforeOpen(DataSet: TDataSet);
begin
  dsDetailPays.ParamByName('ACT_ID').AsInteger := dsDataID.AsInteger;
end;

initialization
  RegisterClass(TActDeductionPaysForm);
end.
