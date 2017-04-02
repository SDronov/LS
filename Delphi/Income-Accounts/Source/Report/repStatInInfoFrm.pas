unit repStatInInfoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDBDataFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, cxGridBandedTableView,
  cxGridDBBandedTableView, ExtCtrls, dxBarExtItems;

type
  TrepStatInInfoGridForm = class(TfdcCustomDBDataForm)
    cxGridDataLevel1: TcxGridLevel;
    cxGridData: TcxGrid;
    cxGridDataDBBandedTableView: TcxGridDBBandedTableView;
    cxGridDataDBBandedTableViewCUSTOMS_CODE_8: TcxGridDBBandedColumn;
    cxGridDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    cxGridDataDBBandedTableViewNoticeSpecifyKindPay: TcxGridDBBandedColumn;
    cxGridDataDBBandedTableViewConfirmSpecifyKindPay: TcxGridDBBandedColumn;
    cxGridDataDBBandedTableViewNoticeSpecifyKindPayCorr: TcxGridDBBandedColumn;
    cxGridDataDBBandedTableViewPackReturns: TcxGridDBBandedColumn;
    cxGridDataDBBandedTableViewPackConfirmations: TcxGridDBBandedColumn;
    tmrRefresh: TTimer;
    barDateCB: TdxBarDateCombo;
    procedure actRefreshExecute(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure cxGridDataDBBandedTableViewNoticeSpecifyKindPayGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  repStatInInfoGridForm: TrepStatInInfoGridForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TrepStatInInfoGridForm.actRefreshExecute(Sender: TObject);
begin
  tmrRefresh.Enabled := not tmrRefresh.Enabled;
  (Sender as TAction).Checked := tmrRefresh.Enabled;
end;

procedure TrepStatInInfoGridForm.tmrRefreshTimer(Sender: TObject);
begin
  RefreshData;
end;

procedure TrepStatInInfoGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  barDateCB.Date := trunc( now );
end;

procedure TrepStatInInfoGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  dsData.ParamByName( 'adate' ).AsDate := barDateCB.Date;
end;

procedure TrepStatInInfoGridForm.cxGridDataDBBandedTableViewNoticeSpecifyKindPayGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;

  if AText = '0' then
    AText := '';
end;

initialization
  RegisterClass(TrepStatInInfoGridForm);

end.
