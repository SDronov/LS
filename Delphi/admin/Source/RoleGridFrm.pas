unit RoleGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar;

type
  TRoleGridForm = class(TObjectGridForm)
    dsDataROLE_NAME: TStringField;
    grdDataDBBandedTableViewROLE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumnDesc: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RoleGridForm: TRoleGridForm;

implementation

uses fdcMessages, MainDm, fdcCustomGridFrm, fdcCustomObjectGridFrm;

{$R *.dfm}

initialization
  RegisterClass(TRoleGridForm);

end.
