{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 15717 $
  $Author: sbakum $
  $Date: 2012-11-20 11:11:29 +0400 (Р’С‚, 20 РЅРѕСЏ 2012) $
}

unit CustomsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  QueryList, dxBarExtItems;

type
  TCustomsGridForm = class(TSubjectGridForm)
    dsDataCUSTOMS_CODE: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
    dsDataDT_START: TDateTimeField;
    grdDataDBBandedTableViewCUSTOMS_CODE_8: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDT_START: TcxGridDBBandedColumn;
    acImport: TAction;
    dxBarButton1: TdxBarButton;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtCode: TcxTextEdit;
    dsDataTTT: TStringField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    dsDataDT_END: TDateTimeField;
    grdDataDBBandedTableViewDT_END: TcxGridDBBandedColumn;
    biDate: TdxBarDateCombo;
    dsDataCERT_SUBJECT: TStringField;
    dsDataSYSCRYPTO: TStringField;
    dsDataPARENT_ID: TFloatField;
    dsDataTZONE: TIntegerField;
    grdDataDBBandedTableViewTZONE: TcxGridDBBandedColumn;
    procedure acImportExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure biDateChange(Sender: TObject);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
  public
  end;

var
  CustomsGridForm: TCustomsGridForm;

implementation

uses
  IaccLoader, LoaderWizardFrm, MainDm, fdcCustomGridFrm;

{$R *.dfm}

procedure TCustomsGridForm.acImportExecute(Sender: TObject);
begin
  ExecuteLoader(TCustomsLoader, 'Справочник таможен');
end;

procedure TCustomsGridForm.dsDataBeforeOpen(DataSet: TDataSet);
var
  vDate: Variant;
begin
  ParamsHolder.Params[0].AsInteger := -1;

  inherited;

  vDate := Null;
  if biDate.Text <> '' then vDate := biDate.Date;
  dsData.ParamByName('dat').Value := vDate;

  SetSearchParam('CODE', Trim(edtCODE.Text));
  SetSubsParam('CUSTOMS_WORKED', Params.ParamByName( 'CUSTOMS_WORKED' ).Value);
end;

procedure TCustomsGridForm.actAddExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

procedure TCustomsGridForm.actDeleteExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

procedure TCustomsGridForm.biDateChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TCustomsGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  SavedNullStrictConvert: boolean;
  SDate, EDate: TDateTime;
begin
  inherited;
  if biDate.Text = '' then
  begin
    SavedNullStrictConvert := NullStrictConvert;
    NullStrictConvert := False;
    try
      SDate := AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDT_START.Index];
      EDate := AViewInfo.GridRecord.Values[grdDataDBBandedTableViewDT_END.Index];
    finally
      NullStrictConvert := SavedNullStrictConvert;
    end;

    if not ((SDate <= Date) and ((EDate >= Date) or (EDate = 0))) then
    begin
      ACanvas.Canvas.Font.Color := clGrayText;
    end;
  end;
  ADone := False;
end;

initialization
  RegisterClass(TCustomsGridForm);

end.
