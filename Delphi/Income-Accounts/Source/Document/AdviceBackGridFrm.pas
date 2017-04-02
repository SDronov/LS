unit AdviceBackGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdviceGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, cxCalendar, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCurrencyEdit, cxDropDownEdit;

type
  TAdviceBackGridForm = class(TAdviceGridForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdviceBackGridForm: TAdviceBackGridForm;

implementation

{$R *.dfm}
initialization
  RegisterClass(TAdviceBackGridForm);

end.
