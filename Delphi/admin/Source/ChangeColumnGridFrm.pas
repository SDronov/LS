unit ChangeColumnGridFrm;

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
  TChangeColumnGridForm = class(TfdcCustomGridForm)
    colCol_Name: TcxGridDBBandedColumn;
    colChar_New: TcxGridDBBandedColumn;
    colChar_Old: TcxGridDBBandedColumn;
    actOpen: TAction;
  private
  public
  end;

implementation

{$R *.dfm}

uses
  MainDM;


Initialization
  RegisterClass(TChangeColumnGridForm);

end.
