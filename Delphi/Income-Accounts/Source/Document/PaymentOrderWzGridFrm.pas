unit PaymentOrderWzGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCurrencyEdit, cxCalc, cxCheckBox, cxCalendar, QueryList,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxLayoutControl, cxMemo, cxDropDownEdit, cxTextEdit, StdCtrls, cxButtons,
  ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TPaymentOrderWzGridForm = class(TPaymentOrderGridForm)
    dsPayerList: TfdcQuery;
    dsDataTR_ID: TFloatField;
    dsDataNTR: TStringField;
    grdDataDBBandedTableViewTR_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNTR: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fPayerID: Double;
  public
    { Public declarations }
    property PayerID : Double read fPayerID write fPayerID;
  end;

var
  PaymentOrderWzGridForm: TPaymentOrderWzGridForm;

const
  clGold = TColor($0047D5FE);
  clGoldDark = TColor($0001BDF3);

implementation

uses fdcCustomDBDataFrm, fdcCustomDataFrm;

{$R *.dfm}
procedure TPaymentOrderWzGridForm.dsDataBeforeOpen(DataSet: TDataSet);
  var
    s : string;
begin
  // на МОТ умирает одним запросом, поэтому сначала вытаскиваем список payer_id а потом платёжки
  dsPayerList.ParamByName( 'payer_id' ).AsFloat := fPayerID;
  if (ParamsHolder.Params.FindParam('declid') <> nil) then
    begin
      dsPayerList.ParamByName( 'declid' ).AsString :=  ParamsHolder.Params.ParamByName('declid').AsString;
    end;

  // установить список плательщиков
  dsPayerList.Open;
  dsPayerList.First;
  s := '0';
  while not dsPayerList.Eof do
    begin
      s := s + ',' + dsPayerList.FieldByName( 'id' ).AsString;
      dsPayerList.Next;
    end;
  dsPayerList.Close;
  s := Copy( s, 3, Length( s ) - 2 );
  dsData.SQL.Text := StringReplace( dsData.SQL.Text, '/*$payer_list$*/', s, [rfReplaceAll] );

  inherited;

  //if dsData.ParamByName( 'INN_E' ).IsNull then
  //  dsData.ParamByName( 'INN_E' ).AsString := '-';
  //if dsData.ParamByName( 'KPP_E' ).IsNull then
  //  dsData.ParamByName( 'KPP_E' ).AsString := '-';

  // Пустые параметры
  dsData.ParamByName( 'NA' ).AsInteger        := 0;
  dsData.ParamByName( 'CURRENCY_ID' ).AsFloat := 0;
  dsData.ParamByName( 'AVAIL_SUMMA' ).AsFloat := 0;
  dsData.ParamByName( 'REST_SUMMA' ).AsFloat  := 0;
end;

procedure TPaymentOrderWzGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewNTR.Index], varString) <> '' then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused then
      ACanvas.Canvas.Brush.Color := clGoldDark
    else
      ACanvas.Canvas.Brush.Color := clGold;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

end;

procedure TPaymentOrderWzGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  edtName.Text := '';
  edtINN.Text := '';
  edtKPP.Text := '';
end;

initialization
  RegisterClass(TPaymentOrderWzGridForm);

end.
