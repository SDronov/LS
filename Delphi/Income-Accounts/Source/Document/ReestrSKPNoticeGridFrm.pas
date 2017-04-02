unit ReestrSKPNoticeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxDropDownEdit, fdcObjectCore, StrUtils;

type
  TReestrSKPNoticeGridForm = class(TObjectGridForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataKBK_CODE_S: TStringField;
    dsDataKBK_CODE_T: TStringField;
    dsDataCURRENCY_CODE: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataDIRECTION: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK_CODE_S: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK_CODE_T: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDIRECTION: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn;
    cbDirection: TcxComboBox;
    lciDirection: TdxLayoutItem;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataKBK_SOURCE_ID: TFloatField;
    dsDataKBK_TARGET_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdDataDBBandedTableViewTYPESYSNAMECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReestrSKPNoticeGridForm: TReestrSKPNoticeGridForm;

implementation

uses fdcCustomGridFrm;

{$R *.dfm}

procedure TReestrSKPNoticeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
var Direct: string;
begin
  inherited;

  if cbDirection.ItemIndex = 0 then Direct := '';
  if cbDirection.ItemIndex = 1 then Direct := 'ИМ';
  if cbDirection.ItemIndex = 2 then Direct := 'ЭК';

  SetSearchParam('pdirection', Direct);
end;

procedure TReestrSKPNoticeGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ObjectTypeSysName: string;
begin
  inherited;
  ObjectTypeSysName := VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[grdDataDBBandedTableViewTYPESYSNAME.Index]);
  if (not(AViewInfo.Selected) and (AnsiRightStr(ObjectTypeSysName,4) = 'Summ')) then
    begin
      //-- закрашиваем жёлтым цветом строки уведомлений/подтверждений суммарных по подчинённым ТО
      ACanvas.Brush.Color := clYellow;
    end;
end;

procedure TReestrSKPNoticeGridForm.grdDataDBBandedTableViewTYPESYSNAMECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ObjectType: TfdcObjectType;
  ObjectTypeSysName: string;
begin
  inherited;
  ADone := False;
  if Assigned(ObjectServices) then
    begin
      ObjectTypeSysName := VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[
      grdDataDBBandedTableViewTYPESYSNAME.Index]);
      ObjectType := ObjectServices.GetObjectTypeFactory.Find(ObjectTypeSysName);
      if Assigned(ObjectType) then
        begin
          ADone := ObjectType.DrawGridCell(ACanvas.Canvas, AViewInfo.Bounds);
        end;
    end;
end;


procedure TReestrSKPNoticeGridForm.FormCreate(Sender: TObject);
begin
  inherited;

	SearchMode := true;
  //actSwitchSearchCriteria.Execute;
end;

initialization
   RegisterClass(TReestrSKPNoticeGridForm);


end.
