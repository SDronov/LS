unit DecisionDebtsPaysNoticeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionDebtsNoticeGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxCurrencyEdit,
  cxCalendar, QueryList, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxDropDownEdit, cxTextEdit,
  StdCtrls, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar;

type
  TDecisionDebtsPaysNoticeGridForm = class(TDecisionDebtsNoticeGridForm)
    qryGenerateReserve: TsqlOp;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecisionDebtsPaysNoticeGridForm: TDecisionDebtsPaysNoticeGridForm;

implementation

uses fdcCustomDBDataFrm;

{$R *.dfm}

procedure TDecisionDebtsPaysNoticeGridForm.actAddExecute(Sender: TObject);
begin
  inherited;

  qryGenerateReserve.Exec( 'decision_id', [ dsData.ParamByName( 'dec_id' ).Value ] );
end;

procedure TDecisionDebtsPaysNoticeGridForm.actDeleteExecute(
  Sender: TObject);
begin
  inherited;

  qryGenerateReserve.Exec( 'decision_id', [ dsData.ParamByName( 'dec_id' ).Value ] );
end;

initialization
  RegisterClass( TDecisionDebtsPaysNoticeGridForm );

end.
