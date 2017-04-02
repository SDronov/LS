unit DecOffsetObligationDeclTpoGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalendar, cxCheckBox, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit,
  cxLabel, dxStatusBar, QueryList, cxCurrencyEdit;

type
  TDecOffsetObligationDeclTpoGridForm = class(TDocumentGridForm)
    grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn;
    dsPays: TfdcQuery;
    grdDataLevelPay: TcxGridLevel;
    grdDataDBTableViewPay: TcxGridDBTableView;
    grdDataDBTableViewPayDECL_ID: TcxGridDBColumn;
    grdDataDBTableViewPayPAY_TYPE_CODE: TcxGridDBColumn;
    grdDataDBTableViewPayPAYABLE_SUMMA: TcxGridDBColumn;
    grdDataDBTableViewPayPAY_SUMMA: TcxGridDBColumn;
    srcPays: TDataSource;
    dsDataSUBJECT_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCUSTOM_MODE_ID: TFloatField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    dsDataMODIFY_DATE: TDateTimeField;
    dsDataDECL_TYPESYSNAME: TStringField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCUSTOM_MODE_CODE: TStringField;
    dsDataCUSTOM_MODE_NAME: TStringField;
    dsDataDECISION_CODE: TStringField;
    dsDataAGGREMENT_ID: TFloatField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsPaysDECL_ID: TFloatField;
    dsPaysPAY_TYPE_CODE: TStringField;
    dsPaysPAYABLE_SUMMA: TFloatField;
    dsPaysPAY_SUMMA: TFloatField;
    QueryList: TQueryList;
    qryDelReserve: TsqlOp;
    dsPaysDECL_NAME: TStringField;
    dsPaysDECL_DATE: TDateTimeField;
    procedure actAddExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataBeforeClose(DataSet: TDataSet);
    procedure actRefreshExecute(Sender: TObject);
    procedure dsPaysBeforeOpen(DataSet: TDataSet);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecOffsetObligationDeclTpoGridForm: TDecOffsetObligationDeclTpoGridForm;

implementation

uses DecOffsetObligationReserveWizardFrm;

{$R *.dfm}

procedure TDecOffsetObligationDeclTpoGridForm.actAddExecute(
  Sender: TObject);
begin
  if (ParamsHolder.Params.ParamByName('id') <> nil) then
    begin
      ShowDecOffsetObligationReserveWizard(ParamsHolder.Params.ParamByName('id').Value );
      RefreshData;
    end;
end;

procedure TDecOffsetObligationDeclTpoGridForm.dsDataAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not(dsPays.Active) then
    begin
      dsPays.Open;
    end
  else
    begin
      dsPays.ReQuery;
    end;
end;

procedure TDecOffsetObligationDeclTpoGridForm.dsDataBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  if (dsPays.Active) then
    begin
      dsPays.Close;
    end;
end;

procedure TDecOffsetObligationDeclTpoGridForm.actRefreshExecute(
  Sender: TObject);
begin
  inherited;
  if not(dsPays.Active) then
    begin
      dsPays.Open;
    end
  else
    begin
      dsPays.ReQuery;
    end;
end;

procedure TDecOffsetObligationDeclTpoGridForm.dsPaysBeforeOpen(
  DataSet: TDataSet);
  var lv_params: TParam;
begin
  inherited;
  lv_params := TFdcQuery(DataSet).Params.FindParam('ID');
  if (lv_params <> nil) then
    begin
      lv_params.Value := ParamsHolder.Params.ParamByName('ID').Value;
    end;
end;

procedure TDecOffsetObligationDeclTpoGridForm.actDeleteExecute(
  Sender: TObject);
begin
  if (dsData.Active) then
    begin
      if not(dsData.FieldByName( 'id' ).IsNull) then
        begin
          qryDelReserve.Exec( 'decision_id;decl_id', [ParamsHolder.Params.ParamByName('ID').Value,dsData.FieldByName( 'id' ).AsFloat]  );
          actRefresh.Execute;
        end;
    end;
end;

initialization
  RegisterClass(TDecOffsetObligationDeclTpoGridForm);

end.
