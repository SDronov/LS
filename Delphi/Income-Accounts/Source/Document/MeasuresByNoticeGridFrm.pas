unit MeasuresByNoticeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridByOwnerFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCheckBox;

type
  TMeasuresByNoticeGridForm = class(TObjectGridByOwnerForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataMEASURES_TYPE: TStringField;
    dsDataPAYMENTS_DETAILS: TStringField;
    dsDataCUSTOMSDOC: TStringField;
    dsDataCHIEFCUSTOMS: TStringField;
    dsDataCHIEFOTP: TStringField;
    dsDataEXECUTOR: TStringField;
    dsDataCONCLUSIONDATE: TDateTimeField;
    dsDataOK: TIntegerField;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMEASURES_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCONCLUSIONDATE: TcxGridDBBandedColumn;
    dsDataMEASURES_INFO: TStringField;
    grdDataDBBandedTableViewMeasuaresInfo: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MeasuresByNoticeGridForm: TMeasuresByNoticeGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TMeasuresByNoticeGridForm);
end.
