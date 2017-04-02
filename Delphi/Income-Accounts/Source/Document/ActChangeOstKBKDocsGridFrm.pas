unit ActChangeOstKBKDocsGridFrm;

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
  dxStatusBar, DocumentGridFrm, cxCalendar, cxCheckBox, cxDropDownEdit,
  cxCurrencyEdit;

type
  TActChangeOstKBKDocsGridForm = class(TDocumentGridForm)
    dsDataSUMMA_ALL: TFloatField;
    dsDataNAME_P: TStringField;
    dsDataINN_P: TStringField;
    dsDataKPP_P: TStringField;
    dsDataIS_TS: TStringField;
    dsDataSUMMA_DED: TFloatField;
    grdDataDBBandedTableViewSUMMA_ALL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA_DED: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass( TActChangeOstKBKDocsGridForm );

end.
