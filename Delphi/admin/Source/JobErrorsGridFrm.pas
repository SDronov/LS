unit JobErrorsGridFrm;

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
  dxStatusBar,MainDm;

type
  TJobErrorsGridForm = class(TfdcCustomGridForm)
    dsDataID: TFloatField;
    dsDataJOBEXEC_ID: TFloatField;
    dsDataERROR_TEXT: TStringField;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewJOBEXEC_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewERROR_TEXT: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JobErrorsGridForm: TJobErrorsGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TJobErrorsGridForm);

end.
