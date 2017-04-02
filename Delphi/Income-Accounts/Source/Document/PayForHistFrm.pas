unit PayForHistFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar;

type
  TPayForHistForm = class(TfdcCustomGridForm)
    dsDatasumma: TFloatField;
    dsDatadoc_date: TDateTimeField;
    dsDatadoc_no: TStringField;
    dsDatadoc_name: TStringField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn;
  private
  public
  end;


implementation

uses MainDm;

{$R *.dfm}

initialization
    RegisterClass(TPayForHistForm);
end.
