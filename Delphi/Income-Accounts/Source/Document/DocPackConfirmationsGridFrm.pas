unit DocPackConfirmationsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxDropDownEdit, cxCalendar,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit,
  cxSpinEdit, cxLabel, dxStatusBar;

type
  TDocPackConfirmationsGridForm = class(TDocPackGridForm)
    dsDataDESTCUSTOMSCODE: TStringField;
    grdDataDBBandedTableViewDEST_CUSTOMS_CODE: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocPackConfirmationsGridForm: TDocPackConfirmationsGridForm;

implementation

{$R *.dfm}

initialization
   RegisterClass(TDocPackConfirmationsGridForm);

end.
