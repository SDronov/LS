{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: ObjectGridFrm.pas $
  $Revision: 11367 $
  $Author: anaumenkov $
  $Date: 2010-10-15 22:03:43 +0400 (РџС‚, 15 РѕРєС‚ 2010) $
}
unit ObjectGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, FDCQuery, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxMemo,
  cxGridCustomView, cxGrid, dxLayoutControl, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxTextEdit, cxCurrencyEdit, cxCalendar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  fdcParamsHolder, cxGridBandedTableView, cxGridDBBandedTableView,
  cxRadioGroup, Menus;

type
  TObjectGridForm = class(TfdcCustomObjectGridForm)
    dsDataOBJECTKINDLIST: TStringField;
    btnSearchClear: TcxButton;
    lciSearchClearBtn: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClearClick(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshData; override;
  end;

var
  ObjectGridForm: TObjectGridForm;

implementation

uses MainDm, cxCalc, MainFrm;

{$R *.dfm}

procedure TObjectGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetSession(MainData.Session);
  MainForm.UpdateFormToDocSearchOnOpen(Self);
end;

procedure TObjectGridForm.btnSearchClearClick(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount-1 do
    if ( (Self.Components[i] is TcxTextEdit) or
         (Self.Components[i] is TcxDateEdit) or
         (Self.Components[i] is TcxCurrencyEdit) or
         (Self.Components[i] is TcxMaskEdit) or
         (Self.Components[i] is TcxMemo)
       ) and
       TcxTextEdit(Self.Components[i]).Enabled and
       (TcxTextEdit(Self.Components[i]).Parent = TcxButton(Sender).Parent) then
      TcxTextEdit(Self.Components[i]).Clear;
end;

procedure TObjectGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  if (Params.FindParam('ACC_OPER_DATE') <> nil) then
  begin
     SetSubsParam('viewmode', 0);
  end;
  inherited;
end;

procedure TObjectGridForm.FormShow(Sender: TObject);
var
  SumItem: TcxGridDBBandedTableSummaryItem;
  i: integer;
begin
  inherited;

  for i:= 0 to grdDataDBBandedTableView.ColumnCount-1 do
    if grdDataDBBandedTableView.Columns[i].PropertiesClass = TcxCalcEditProperties then
//      or (grdDataDBBandedTableView.Columns[i].DataBinding.ValueTypeClass = TcxCurrencyValueType)
//      or (grdDataDBBandedTableView.Columns[i].DataBinding.ValueTypeClass = TcxIntegerValueType)
//      or (grdDataDBBandedTableView.Columns[i].DataBinding.ValueTypeClass = TcxLargeIntValueType) then
      with grdDataDBBandedTableView.DataController.Summary do
        begin
        BeginUpdate;
        try
          SumItem:= FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem;
          SumItem.Column:= grdDataDBBandedTableView.Columns[i];
          SumItem.Kind:= skSum;
          SumItem.Format:= '.0,0';
          finally
          EndUpdate;
          end;
        end;
end;

procedure TObjectGridForm.RefreshData;
  var
    i : Integer;
begin
  inherited;

  // Автовыравнивание для колонок с суммами
  for i := 0 to grdDataDBBandedTableView.ItemCount - 1 do
    if    ( grdDataDBBandedTableView.Items[i].PropertiesClassName = 'TcxCurrencyEditProperties' )
       or ( grdDataDBBandedTableView.Items[i].PropertiesClassName = 'TcxCalcEditProperties'     ) then
      begin
        //(grdDataDBBandedTableView.Items[i] as TcxGridDBBandedColumn).Width := 100;
        grdDataDBBandedTableView.Items[i].ApplyBestFit;
      end;
end;

initialization
  RegisterClass(TObjectGridForm);

end.
