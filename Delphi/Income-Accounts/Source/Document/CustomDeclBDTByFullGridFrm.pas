unit CustomDeclBDTByFullGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomDeclGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCurrencyEdit, cxCheckBox, QueryList, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit, cxLabel,
  dxStatusBar;

type
  TCustomDeclBDTByFullGridForm = class(TCustomDeclGridForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomDeclBDTByFullGridForm: TCustomDeclBDTByFullGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TCustomDeclBDTByFullGridForm);
end.
