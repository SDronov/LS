unit PersonalAccountFindGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PersonalAccountGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TPersonalAccountFindGridForm = class(TPersonalAccountGridForm)
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    lv_TypeSysName : string;
  end;

var
  PersonalAccountFindGridForm: TPersonalAccountFindGridForm;

implementation

{$R *.dfm}
procedure TPersonalAccountFindGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
    dsData.ParamByName('TYPESYSNAME').AsString := lv_TypeSysName;
end;

initialization
  RegisterClass(TPersonalAccountFindGridForm);
end.
