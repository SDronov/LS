unit DecPaybackDepositFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionPayBackFrm, cxGraphics, OracleData, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxCurrencyEdit, cxDBEdit, cxTextEdit, cxCheckBox,
  fdcObjectLookupEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxMemo, cxPC, cxControls, fdcWord, QueryList, cxLabel,
  cxDBLabel;

type
  TDecPaybackDepositForm = class(TDecisionPayBackForm)
    qryDetailOD_NUM: TStringField;
    qryDetailOD_SUM: TFloatField;
    dsDataSUMMA_BASE: TFloatField;
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure actSaveUpdate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FillReportParams(AWord: TWordClass); override;
  public
    { Public declarations }
  end;

var
  DecPaybackDepositForm: TDecPaybackDepositForm;
  DetailSum: Double;

implementation

uses DecisionFrm, Math, fdcCustomCardFrm, fdcMessages;

{$R *.dfm}

procedure TDecPaybackDepositForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName( 'doc_code' ).AsString := 'ÂÄç';
end;

procedure TDecPaybackDepositForm.FillReportParams(AWord: TWordClass);
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    begin
      if not qryDetail.Active then
        qryDetail.Open;
      AWord.GetArrayFromDataSet( qryDetail, 'OD_NUM', 'D_OD_NUM', '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'OD_SUM', 'D_OD_SUM', '^p' );
    end;

  inherited;
end;

procedure TDecPaybackDepositForm.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := dsDataSUMMA.AsFloat > 0;
end;

initialization

  RegisterClass( TDecPaybackDepositForm );

end.
