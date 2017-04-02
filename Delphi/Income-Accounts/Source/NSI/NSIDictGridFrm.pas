unit NSIDictGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, DB, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxGraphics, dxBarExtItems, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData;

type
  TNSIDictGridForm = class(TDictGridForm)
    dsDataSDATE: TDateTimeField;
    dsDataEDATE: TDateTimeField;
    grdDataDBBandedTableViewSDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn;
    biDate: TdxBarDateCombo;
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure biDateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ReadOnly : Boolean;
  end;

var
  NSIDictGridForm: TNSIDictGridForm;

implementation

uses fdcCustomDBDataFrm;

{$R *.dfm}

procedure TNSIDictGridForm.grdDataDBBandedTableViewCustomDrawCell(
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
    SDate := AViewInfo.GridRecord.Values[grdDataDBBandedTableViewSDATE.Index];
    EDate := AViewInfo.GridRecord.Values[grdDataDBBandedTableViewEDATE.Index];
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

procedure TNSIDictGridForm.dsDataBeforeOpen(DataSet: TDataSet);
var
  vDate: Variant;
begin
  inherited;
  vDate := Null;
  if biDate.Text <> '' then vDate := biDate.Date;
  dsData.ParamByName('dat').Value := vDate;
end;

procedure TNSIDictGridForm.biDateChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TNSIDictGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  ReadOnly := false;
end;

procedure TNSIDictGridForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  //inherited;
  if ReadOnly = true then
    actAdd.Visible:=false;
end;

initialization
    RegisterClass(TNSIDictGridForm);

end.
