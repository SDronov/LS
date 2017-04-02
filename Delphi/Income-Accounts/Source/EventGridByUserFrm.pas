unit EventGridByUserFrm;

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
  dxLayoutControl, StdCtrls, cxRadioGroup, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar;

type
  TEventGridByUserForm = class(TEventGridForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventGridByUserForm: TEventGridByUserForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TEventGridByUserForm);
  
end.
