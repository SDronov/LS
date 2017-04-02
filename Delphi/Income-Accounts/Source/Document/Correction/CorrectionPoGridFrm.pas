unit CorrectionPoGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionDocGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
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
  TCorrectionPoGridForm = class(TCorrectionDocGridForm)
    dsDataREASON_CORRECT: TStringField;
    grdDataDBBandedTableViewREASON_CORRECT: TcxGridDBBandedColumn;
    colDescript: TcxGridDBBandedColumn;
  private
  public
  end;

implementation

{$R *.dfm}
initialization
  RegisterClass(TCorrectionPoGridForm);

end.
