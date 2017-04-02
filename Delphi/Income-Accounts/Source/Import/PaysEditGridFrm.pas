unit PaysEditGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, DB, OracleData, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, QueryList, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxDBLookupComboBox, cxMemo;

type
  TPaysEditGridForm = class(TfdcCustomGridForm)
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1DAT_DOC: TDateTimeField;
    OracleDataSet1NUM_DOC: TStringField;
    OracleDataSet1INN_K: TStringField;
    OracleDataSet1KPP_K: TStringField;
    OracleDataSet1NAME_K: TStringField;
    OracleDataSet1T_PL: TStringField;
    OracleDataSet1INFO: TStringField;
    grdDataDBBandedTableViewDAT_DOC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNUM_DOC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewT_PL: TcxGridDBBandedColumn;
    OracleDataSet1SUM_DOC: TFloatField;
    OracleDataSet1KODV: TStringField;
    grdDataDBBandedTableViewSUM_DOC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKODV: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINFO2: TcxGridDBBandedColumn;
    QueryList1: TQueryList;
    sqlUpd: TsqlOp;
    OracleDataSet1NREF: TStringField;
    procedure FormShow(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure OracleDataSet1ApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OracleDataSet1AfterOpen(DataSet: TDataSet);
    procedure grdDataLayoutChanged(Sender: TcxCustomGrid;
      AGridView: TcxCustomGridView);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaysEditGridForm: TPaysEditGridForm;

implementation

uses MainDm, DictDm;

{$R *.dfm}

procedure TPaysEditGridForm.FormShow(Sender: TObject);
begin
  inherited;
  DictData.dsPayTypes.Open;
  OracleDataSet1.Open;
end;

procedure TPaysEditGridForm.actRefreshUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := True;
end;

procedure TPaysEditGridForm.actRefreshExecute(Sender: TObject);
begin
  OracleDataSet1.Refresh;
  OracleDataSet1AfterOpen(OracleDataSet1);
end;

procedure TPaysEditGridForm.OracleDataSet1ApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  inherited;
  if Action = 'U' then
  begin
    sqlUpd.Exec;
    Applied := True;
  end;
end;

procedure TPaysEditGridForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OracleDataSet1.CheckBrowseMode;
  inherited;

end;

procedure TPaysEditGridForm.OracleDataSet1AfterOpen(DataSet: TDataSet);
begin
  inherited;
  grdDataDBBandedTableView.ApplyBestFit(nil);
end;

procedure TPaysEditGridForm.grdDataLayoutChanged(Sender: TcxCustomGrid;
  AGridView: TcxCustomGridView);
begin
  inherited;
  if OracleDataSet1.Active then
     lblRecordCount.Caption := 'Всего :' + IntToStr(OracleDataSet1.RecordCount);
end;

initialization
    RegisterClass(TPaysEditGridForm);

end.
