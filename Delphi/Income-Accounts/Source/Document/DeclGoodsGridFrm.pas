{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 3340 $
  $Author: sbalezin $
  $Date: 2007-09-26 19:05:11 +0400 (Ср, 26 сен 2007) $
}
unit DeclGoodsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  cxCalc;

type
  TDeclGoodsGridForm = class(TObjectGridForm)
    dsDataNO: TIntegerField;
    dsDataGOODS_ID: TFloatField;
    dsDataGOODS_CODE: TStringField;
    dsDataGOODS_NAME: TStringField;
    dsDataG36: TStringField;
    dsDataG37: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataPAY_TYPE_NAME: TStringField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataPAY_MODE_ID: TFloatField;
    dsDataPAY_MODE_NAME: TStringField;
    dsDataPAY_MODE_CODE: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_CODE: TStringField;
    grdDataDBBandedTableViewNO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewGOODS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewGOODS_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewG36: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewG37: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_MODE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_MODE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn;
    dsDataGPNAME: TStringField;
    actExpand: TAction;
    actCollapse: TAction;
    btnCollapse: TdxBarButton;
    btnExpand: TdxBarButton;
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actExpandExecute(Sender: TObject);
    procedure actCollapseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeclGoodsGridForm: TDeclGoodsGridForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TDeclGoodsGridForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
  inherited;
;
end;

procedure TDeclGoodsGridForm.FormShow(Sender: TObject);
begin
  inherited;
  TcxGridTableView(grdData.ActiveView).ViewData.Expand(True);
end;

procedure TDeclGoodsGridForm.actExpandExecute(Sender: TObject);
begin
  inherited;
  TcxGridTableView(grdData.ActiveView).ViewData.Expand(True);
end;

procedure TDeclGoodsGridForm.actCollapseExecute(Sender: TObject);
begin
  inherited;
  TcxGridTableView(grdData.ActiveView).ViewData.Collapse(True);
end;

initialization
   RegisterClass(TDeclGoodsGridForm);

end.
