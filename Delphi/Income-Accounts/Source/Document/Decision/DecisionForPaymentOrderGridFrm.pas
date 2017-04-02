unit DecisionForPaymentOrderGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManPaymentOrderGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalc, cxCheckBox, cxCalendar,
  QueryList, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxMemo, cxCurrencyEdit,
  cxDropDownEdit, cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxProgressBar,
  cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, OracleData,ObjectFrm;

type
  TDecisionForPaymentOrderGridForm = class(TRManPaymentOrderGridForm)
    odsGetSumBlock: TOracleDataSet;
    QueryList1: TQueryList;
    sqlUnLockSumPO: TsqlOp;
    sqlCreateRel: TsqlOp;
    procedure actAddExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FParentForm : TObjectForm;
  public
    { Public declarations }
  end;

var
  DecisionForPaymentOrderGridForm: TDecisionForPaymentOrderGridForm;

implementation

uses USelectPOWizartBlock, MainDm, fdcMessages;

{$R *.dfm}
procedure TDecisionForPaymentOrderGridForm.actAddExecute(Sender: TObject);
begin
  if  FSelectPOWizartBlock = nil  then
      FSelectPOWizartBlock:=TFSelectPOWizartBlock.Create(Application.Owner);
  FSelectPOWizartBlock.pDocId  := Params.ParamValues['ID'];
  FSelectPOWizartBlock.pDocSum := odsGetSumBlock.FieldByName('summa').AsFloat;
  FSelectPOWizartBlock.pDocSub := Params.ParamValues['SUBJECT_ID'];
  try
  IF  FSelectPOWizartBlock.ShowModal = mrOk then
    begin
      MainData.Session.Commit;
      odsGetSumBlock.Refresh;
      RefreshData;
      RefreshWaiters;
    end else
      MainData.Session.Rollback;
  except
    MainData.Session.Rollback;
    raise;
  end;
end;

procedure TDecisionForPaymentOrderGridForm.FormShow(Sender: TObject);
var tmp : Integer;
begin
  inherited;
  tmp := Params.ParamValues['Form'];
  FParentForm := TObjectForm(tmp);
  odsGetSumBlock.SetVariable('Id',Params.ParamValues['ID']);
  odsGetSumBlock.Open;

end;

procedure TDecisionForPaymentOrderGridForm.actDeleteExecute(
  Sender: TObject);
begin
  if WarningDlg('”даление заблокированных средств с платежных документов',
                '«аблокированные средства на платежном документе будут разблокированы. ѕродолжить?') = mrYes then begin
    try
      sqlUnLockSumPO.Exec('pId;DECISION_ID', [dsData.FieldByName('ID').AsInteger,Params.ParamValues['ID']]);
      MainData.Session.Commit;
      odsGetSumBlock.Refresh;
      RefreshData;
      RefreshWaiters;
    except
      MainData.Session.Rollback;
      raise;
    end;
  end;
end;

initialization
  RegisterClass(TDecisionForPaymentOrderGridForm);

end.
