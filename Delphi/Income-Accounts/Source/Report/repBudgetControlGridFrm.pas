unit repBudgetControlGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, dxBarExtItems, cxCheckBox, cxImageComboBox;

type
  TrepBudgetControlGridForm = class(TfdcCustomGridForm)
    dsDataCUSTOMS_NAME: TStringField;
    dsDataPACK_NAME: TStringField;
    dsDataIS_RECIVIED: TStringField;
    dsDataIS_PROCESSED: TStringField;
    dsDataIS_FORMED: TFloatField;
    dsDataIS_SENDED: TFloatField;
    dsDataCUSTOMS_CODE_8: TStringField;
    grdDataDBBandedTableViewCUSTOMS_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPACK_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_RECIVIED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_PROCESSED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_FORMED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_SENDED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_CODE_8: TcxGridDBBandedColumn;
    barEdtDate: TdxBarDateCombo;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  repBudgetControlGridForm: TrepBudgetControlGridForm;

implementation

{$R *.dfm}

uses
  MainDM;


procedure TrepBudgetControlGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  dsData.ParamByName( 'adate' ).AsDate := trunc( barEdtDate.Date );
end;

procedure TrepBudgetControlGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;

  if ARecord.Values[ grdDataDBBandedTableViewCUSTOMS_CODE_8.Index ] = MainData.GetCustomsCode then
    if VarIsNull( ARecord.Values[ grdDataDBBandedTableViewPACK_NAME.Index ] ) then
      AStyle := MainData.stlRepOwnGroupRecords
    else
      AStyle := MainData.stlRepOwnRecords
  else if VarIsNull( ARecord.Values[ grdDataDBBandedTableViewPACK_NAME.Index ] ) then
    AStyle := MainData.stlRepOtherGroupRecords;
end;

initialization
  RegisterClass( TrepBudgetControlGridForm );

end.
