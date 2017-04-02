unit CorrectionDocGridFrm;

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
  TCorrectionDocGridForm = class(TDocumentGridForm)
    dsDataDOC_ID: TFloatField;
    grdDataDBBandedTableViewDOC_SOURCE_NAME: TcxGridDBBandedColumn;
    dsDataDOC_SOURCE_NAME: TStringField;
  private
  public
  end;

implementation

{$R *.dfm}
initialization
  RegisterClass(TCorrectionDocGridForm);

end.
