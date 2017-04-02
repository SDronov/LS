unit PeriodicChargePaymentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWizardFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxImage,
  ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, FDCCustomDataset,
  fdcQuery;

type
  TPeriodicChargePaymentForm = class(TBaseWizardForm)
    tabMonthlyPayments: TcxTabSheet;
    dxLayoutControl5: TdxLayoutControl;
    cxLabel5: TcxLabel;
    grdPO: TcxGrid;
    grdPODBTableView1: TcxGridDBTableView;
    grdPOLevel1: TcxGridLevel;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutControl5Item3: TdxLayoutItem;
    dsRunningPayments: TfdcQuery;
    srcRunningPayments: TDataSource;
    dsRunningPaymentsMONTH: TStringField;
    dsRunningPaymentsSUMMA: TFloatField;
    grdPODBTableView1MONTH: TcxGridDBColumn;
    grdPODBTableView1SUMMA: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function PayPeriodic(DeclId: double): Boolean;


var
  PeriodicChargePaymentForm: TPeriodicChargePaymentForm;

implementation

{$R *.dfm}
function PayPeriodic(DeclId: double): Boolean;
var
  F: TPeriodicChargePaymentForm;
begin
  F := TPeriodicChargePaymentForm.Create(nil);
  try
{    F.dsData.Open;
    F.dsData.Insert;
    F.dsDataDECL_ID.Value  := DeclId;
    F.dsDataSUMMA.Value := 0;}
    F.Caption := 'Оплата периодических начислений по временному ввозу';
//    F.tabGeneral.TabVisible := False;
{    F.lciDelta.Visible := False;
    F.lciDeclNo.Visible := False;}
    F.dsRunningPayments.Open;
    F.tabGeneral.TabVisible := False;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

end.
