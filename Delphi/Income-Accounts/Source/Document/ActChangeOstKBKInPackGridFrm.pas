unit ActChangeOstKBKInPackGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActChangeOstKBKGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxCheckBox,
  cxCurrencyEdit, QueryList, OracleData, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit,
  cxLabel, dxStatusBar;

type
  TActChangeOstKBKInPackGridForm = class(TActChangeOstKBKGridForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
initialization
  RegisterClass(TActChangeOstKBKInPackGridForm);

end.
