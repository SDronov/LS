unit BPLicenceGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData;

type
  TBPLicenceGridForm = class(TObjectGridForm)
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataSUBJ_NAME: TStringField;
    dsDataSUBJ_INN: TStringField;
    dsDataSUBJ_KPP: TStringField;
    dsDataFROM_DATE: TDateTimeField;
    dsDataTO_DATE: TDateTimeField;
    grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJ_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJ_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJ_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFROM_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTO_DATE: TcxGridDBBandedColumn;
    dsDataAGRMT_NO: TStringField;
    dsDataAGRMT_DATE: TDateTimeField;
    grdDataDBBandedTableViewAGRMT_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewAGRMT_DATE: TcxGridDBBandedColumn;
    dsDataLEVEL_MARK: TIntegerField;
    dsDataLEVEL_NAME: TStringField;
    grdDataDBBandedTableViewLEVEL: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BPLicenceGridForm: TBPLicenceGridForm;

implementation

{$R *.dfm}

initialization
   RegisterClass(TBPLicenceGridForm);

end.
