unit DecisionPaybackOutbackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionPayBackFrm, cxGraphics, OracleData, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxCurrencyEdit, cxDBEdit, cxTextEdit, cxCheckBox,
  fdcObjectLookupEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxMemo, cxPC, cxControls, QueryList, cxLabel, cxDBLabel;

type
  TDecisionPaybackOutbackForm = class(TDecisionPayBackForm)
    procedure dsDataAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecisionPaybackOutbackForm: TDecisionPaybackOutbackForm;

implementation

{$R *.dfm}

procedure TDecisionPaybackOutbackForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName( 'doc_code' ).AsString := 'ÂÀâ';
end;

initialization

  RegisterClass( TDecisionPaybackOutbackForm );

end.
