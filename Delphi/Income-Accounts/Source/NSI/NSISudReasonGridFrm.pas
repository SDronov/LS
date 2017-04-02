unit NSISudReasonGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TNSISudReasonGridForm = class(TDictGridForm)
    dsDataSDATE: TDateTimeField;
    dsDataEDATE: TDateTimeField;
    grdDataDBBandedTableViewSDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NSISudReasonGridForm: TNSISudReasonGridForm;

implementation

{$R *.dfm}

initialization
   RegisterClass(TNSISudReasonGridForm);

end.
