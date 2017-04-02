unit DecPaybackPeriodicFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionPayBackFrm, cxGraphics, OracleData, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxCurrencyEdit, cxDBEdit, cxTextEdit, cxCheckBox,
  fdcObjectLookupEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxMemo, cxPC, cxControls, fdcWord, QueryList;

type
  TDecPaybackPeriodicForm = class(TDecisionPayBackForm)
    qryDetailOD_NUM: TStringField;
    qryDetailOD_PT: TStringField;
    qryDetailOD_COR: TFloatField;
    qryPT_SUMS: TfdcQuery;
    qryPT_SUMSCODE: TStringField;
    qryPT_SUMSSUMMA: TFloatField;
    procedure dsDataAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure FillReportParams(AWord: TWordClass); override;
  public
    { Public declarations }
  end;

var
  DecPaybackPeriodicForm: TDecPaybackPeriodicForm;

implementation

{$R *.dfm}

procedure TDecPaybackPeriodicForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName( 'doc_code' ).AsString := 'ÂÈç';
end;

procedure TDecPaybackPeriodicForm.FillReportParams(AWord: TWordClass);
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    begin
      if not qryDetail.Active then
        qryDetail.Open;
      AWord.GetArrayFromDataSet( qryDetail, 'OD_NUM', 'D_OD_NUM', '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'OD_PT',  'D_OD_PT',  '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'OD_COR', 'D_OD_COR', '^p' );

      if not qryPT_SUMS.Active then
        qryPT_SUMS.Open;
      AWord.GetArrayFromDataSet( qryPT_SUMS, 'CODE',  'PT_CODE',  '^p' );
      AWord.GetArrayFromDataSet( qryPT_SUMS, 'SUMMA', 'PT_SUMMA', '^p' );
      qryPT_SUMS.Close;
    end;

  inherited;
end;

initialization

  RegisterClass( TDecPaybackPeriodicForm );

end.
