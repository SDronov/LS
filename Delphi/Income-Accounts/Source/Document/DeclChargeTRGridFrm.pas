unit DeclChargeTRGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DeclChargeGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalc, cxCheckBox, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxSplitter, JvExExtCtrls, JvNetscapeSplitter, QueryList;

type
  TDeclChargeTRGridForm = class(TDeclChargeGridForm)
    pnlDetailData: TPanel;
    grdDetailData: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    grdDetailDataDBBandedTableView: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn12: TcxGridDBBandedColumn;
    cxGridDBBandedColumn13: TcxGridDBBandedColumn;
    cxGridDBBandedColumn14: TcxGridDBBandedColumn;
    grdDetailDataLevel: TcxGridLevel;
    dsDetailData: TfdcQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField5: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField11: TFloatField;
    StringField13: TStringField;
    srcDetailData: TDataSource;
    dsDetailDataKBKCODE_CODE_IN: TStringField;
    dsDetailDataPAYMENT_CODE_IN: TStringField;
    cxGridDBBandedColumn15: TcxGridDBBandedColumn;
    cxGridDBBandedColumn16: TcxGridDBBandedColumn;
    DetailGridPopupMenu: TcxGridPopupMenu;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    dsDetailDataCHARGE_REST: TFloatField;
    cxGridDBBandedColumn17: TcxGridDBBandedColumn;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeclChargeTRGridForm: TDeclChargeTRGridForm;

implementation

{$R *.dfm}

procedure TDeclChargeTRGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
     dsDetailData.ParamByName('DECL_ID').AsInteger := dsData.ParamByName('DECL_ID').AsInteger;
     if dsDetailData.Active then  dsDetailData.Close;
     dsDetailData.Open;
end;

procedure TDeclChargeTRGridForm.dsDataAfterRefresh(DataSet: TDataSet);
begin
  inherited;
     dsDetailData.Refresh;
end;

initialization
   RegisterClass(TDeclChargeTRGridForm);
end.
