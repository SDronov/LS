unit CorrectionPoBackGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionPoGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
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
  TCorrectionPoBackGridForm = class(TCorrectionPoGridForm)
    dsDataREASON_BACK: TStringField;
    grdDataDBBandedTableViewREASON_BACK: TcxGridDBBandedColumn;
    dsDataSUBJECT_ID: TFloatField;
    dsDataSUBJECT_NAME: TStringField;
    dsDataSUBJECT_INN: TStringField;
    dsDataSUBJECT_KPP: TStringField;
    grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_ID: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectionPoBackGridForm: TCorrectionPoBackGridForm;

implementation

{$R *.dfm}
initialization
  RegisterClass(TCorrectionPoBackGridForm);

end.
