unit AdviceByDecisionGridFrm;

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
  cxLabel, dxStatusBar;

type
  TAdviceByDecisionGridForm = class(TDocumentGridForm)
    dsDataSUBJECT_ID: TFloatField;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataDECL_OKPO: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
    dsDataIS_TS: TStringField;
    dsDataPERSONAL_ACCOUNT_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataSUMMA_AVAIL: TFloatField;
    dsDataSUMMA_REST: TFloatField;
    dsDataSUMMA_TS: TFloatField;
    dsDataSUMMA_TS_AVAIL: TFloatField;
    dsDataSUMMA_TS_REST: TFloatField;
    dsDataADVICE_STATE: TStringField;
    grdDataDBBandedTableViewADVICE_STATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA_AVAIL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA_REST: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdviceByDecisionGridForm: TAdviceByDecisionGridForm;

implementation

{$R *.dfm}


initialization
   RegisterClass(TAdviceByDecisionGridForm);

end.
