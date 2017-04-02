unit EventGridByObjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EventGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, cxRadioGroup,
  cxDropDownEdit, cxCalendar, Menus;

type
  TEventGridByObjectForm = class(TEventGridForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventGridByObjectForm: TEventGridByObjectForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TEventGridByObjectForm);

end.
