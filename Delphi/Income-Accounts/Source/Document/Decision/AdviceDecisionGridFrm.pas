unit AdviceDecisionGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManDecisionGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalc, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxCurrencyEdit, cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TAdviceDecisionGridForm = class(TRManDecisionGridForm)
    dsDataSTATENAME: TStringField;
    colState: TcxGridDBBandedColumn;
    cmbDocType: TdxBarCombo;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure cmbDocTypeChange(Sender: TObject);
  private
  public
  end;


implementation

{$R *.dfm}
procedure TAdviceDecisionGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if TfdcQuery(DataSet).Params.FindParam('doc_type') <> nil then
    TfdcQuery(DataSet).Params.ParamByName('doc_type').AsInteger := cmbDocType.ItemIndex;
end;

procedure TAdviceDecisionGridForm.cmbDocTypeChange(Sender: TObject);
begin
  inherited;
  actRefresh.Execute;
end;

initialization
  RegisterClass(TAdviceDecisionGridForm);

end.
