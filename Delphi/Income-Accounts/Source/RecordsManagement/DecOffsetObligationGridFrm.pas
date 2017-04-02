unit DecOffsetObligationGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TRDecisionGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, cxCalc, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxCurrencyEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TDecOffsetObligationGridForm = class(TTRDecisionGridForm)
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataAPP_NUMBER_INCOME: TStringField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSIGNED_BY: TStringField;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGNED_BY_CHIEF_UDF: TStringField;
    dsDataPERSONAL_ACCOUNT_ID: TFloatField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataDOC_CODE: TStringField;
    dsDataDOC_OSN_CODE: TStringField;
    dsDataSUD_REASON_ID: TFloatField;
    dsDataDEBTS_SUMMA: TFloatField;
    dsDataDOC_NUMBER_FULL: TStringField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataVALUTA: TStringField;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVALUTA: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecOffsetObligationGridForm: TDecOffsetObligationGridForm;

implementation

{$R *.dfm}

procedure TDecOffsetObligationGridForm.actAddExecute(Sender: TObject);
begin
//  inherited;
  RegisterAsWaiterFor(ObjectServices.CreateObject('DecOffsetObligation', False, Params));
end;

procedure TDecOffsetObligationGridForm.FormActivate(Sender: TObject);
begin
  inherited;
  cmbDocType.Visible := ivNever;
end;

initialization
  RegisterClass(TDecOffsetObligationGridForm);

end.
