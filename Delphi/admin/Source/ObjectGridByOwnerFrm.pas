unit ObjectGridByOwnerFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGrid,
  cxGridCustomView, dxLayoutControl, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxGridBandedTableView, cxGridDBBandedTableView, Menus;

type
  TObjectGridByOwnerForm = class(TObjectGridForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObjectGridByOwnerForm: TObjectGridByOwnerForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TObjectGridByOwnerForm);

end.
