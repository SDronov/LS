unit DecPaybackAdvanceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionPayBackFrm, cxGraphics, OracleData, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxTextEdit, cxCheckBox, cxDBEdit, cxCurrencyEdit,
  fdcObjectLookupEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxMemo, cxPC, cxControls, QueryList, cxLabel, cxDBLabel;

type
  TDecPaybackAdvanceForm = class(TDecisionPayBackForm)
    procedure tabPaymentOrdersShow(Sender: TObject);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  DecPaybackAdvanceForm: TDecPaybackAdvanceForm;

implementation

{$R *.dfm}

uses
  fdcCustomObjectGridFrm
 ,FormUtils;

procedure TDecPaybackAdvanceForm.tabPaymentOrdersShow(Sender: TObject);
begin
  inherited;

  with fPaymentOrdersForm as TfdcCustomObjectGridForm do
    begin
      actAdd.Visible    := True;
      actDelete.Visible := True;
    end;
end;

procedure TDecPaybackAdvanceForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName( 'doc_code' ).AsString := 'ÂÀâ';
end;

procedure TDecPaybackAdvanceForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  lciSumma.Tag := 33;
  UpdateLayoutControl(IsNew, lcGeneral);

end;

initialization

  RegisterClass( TDecPaybackAdvanceForm );

end.
