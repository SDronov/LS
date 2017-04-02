unit DocPackPaymentsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxDropDownEdit, cxCalendar, cxCurrencyEdit;

type
  TDocPackPaymentsGridForm = class(TDocPackGridForm)
    cbxFilter: TdxBarCombo;
    dsDataDESTCUSTOMSCODE: TStringField;
    dsDataDATE_OUT: TDateTimeField;
    dsDataCURRENCYCODE: TStringField;
    grdDataDBBandedTableViewDest: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDateOut: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCurrency: TcxGridDBBandedColumn;
    actCreatePacks: TAction;
    btnCreatePacks: TdxBarButton;
    dsDataEXT_SOURCE: TStringField;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    dsDataSUMMA: TFloatField;
    grdDataDBBandedTableViewSumma: TcxGridDBBandedColumn;
    lcSearchCriteriaItem6: TdxLayoutItem;
    Label2: TLabel;
    edtReceiveDateFrom: TcxDateEdit;
    lcSearchCriteriaItem7: TdxLayoutItem;
    edtReceiveDateTo: TcxDateEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    procedure cbxFilterChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCreatePacksExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocPackPaymentsGridForm: TDocPackPaymentsGridForm;

implementation

uses MainDm, fdcCustomDBDataFrm;

{$R *.dfm}

procedure TDocPackPaymentsGridForm.cbxFilterChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TDocPackPaymentsGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Только для уровня ФТС и РТУ
  actCreatePacks.Visible := (MainData.GetCustomsLevel <> 2);
  actDelete.Visible      := MainData.EnableForceDropObject;
end;

procedure TDocPackPaymentsGridForm.actCreatePacksExecute(Sender: TObject);
begin
  MainData.pkgCommon.PackageName := 'p_DocPack_Payments';
  MainData.pkgCommon.CallProcedure('Generate_OutDocPackPayments', []);
  MainData.pkgCommon.Session.Commit;
  actRefresh.Execute;
end;

procedure TDocPackPaymentsGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  var
    State: string;
begin
  inherited;

  if ARecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ] <> MainData.GetSoftCustomsCode then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackAlienSelected
    else
      AStyle := MainData.stlDocPackAlien
  else
    begin
      State := VarAsType(ARecord.Values[grdDataDBBandedTableViewSTATE_NAME.Index], varString);
      if State='Отправлен' then
        if ARecord.Selected then
          AStyle := MainData.stlDocPackSendedSelected
        else
          AStyle := MainData.stlDocPackSended
      else if State='Подтвержден' then
        if ARecord.Selected then
          AStyle := MainData.stlDocPackConfirmedSelected
        else
          AStyle := MainData.stlDocPackConfirmed;
    end;
end;

procedure TDocPackPaymentsGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  dsData.ParamByName('filter').AsInteger := cbxFilter.ItemIndex;
  inherited;
  SetSearchParam('RECEIVE_DATE_FROM', edtReceiveDateFrom.EditValue);
  SetSearchParam('RECEIVE_DATE_TO', edtReceiveDateTo.EditValue);
end;

initialization
   RegisterClass(TDocPackPaymentsGridForm);

end.
