unit DeclTempAdmGoodsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DeclGoodsGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCalc;

type
  TDeclTempAdmGoodsGridForm = class(TDeclGoodsGridForm)
    dsDataCHARGE_ID: TFloatField;
    actHistory: TAction;
    dxBarButton2: TdxBarButton;
    dsDataDECL_GOODS_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataSUMMA_PR: TFloatField;
    grdDataDBBandedTableViewSUMMA_PR: TcxGridDBBandedColumn;
    dsDataDATE_BEGIN: TDateTimeField;
    dsDataDATE_END: TDateTimeField;
    grdDataDBBandedTableViewDATE_BEGIN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_END: TcxGridDBBandedColumn;
    procedure actOpenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure actHistoryExecute(Sender: TObject);
    procedure actHistoryUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses GoodsChargeCorrectFrm, fdcCustomGridFrm;

{$R *.dfm}

procedure TDeclTempAdmGoodsGridForm.actOpenExecute(Sender: TObject);
begin
  {if CorrectGoodsCharge(dsDataCHARGE_ID.Value) then begin
    RefreshData;
    RefreshWaiters;
  end;}
end;

procedure TDeclTempAdmGoodsGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  grdDataDBBandedTableView.OptionsSelection.MultiSelect := False;
  ParamByName('ID').SourceField := dsDataDECL_GOODS_ID;
  ParamByName('CURRENCY_ID').SourceField := dsDataCURRENCY_ID;
end;

procedure TDeclTempAdmGoodsGridForm.actOpenUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices) and
    (ActiveGridTableView.Controller.SelectedRecordCount > 0)
    and not dsDataCHARGE_ID.IsNull
    and (grdDataDBBandedTableView.Controller.SelectedRows[0].Level <> 0);
end;

procedure TDeclTempAdmGoodsGridForm.actHistoryExecute(Sender: TObject);
begin
  inherited;
  ObjectServices.ShowForm('TGoodsChargeHistForm', Params, nil);
end;

procedure TDeclTempAdmGoodsGridForm.actHistoryUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices) and
    (ActiveGridTableView.Controller.SelectedRecordCount > 0)
    and not dsDataCHARGE_ID.IsNull
    and (grdDataDBBandedTableView.Controller.SelectedRows[0].Level <> 0);
end;

initialization
  RegisterClass(TDeclTempAdmGoodsGridForm);

end.
