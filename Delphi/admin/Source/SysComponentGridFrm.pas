unit SysComponentGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls, cxLabel,
  cxProgressBar, cxMaskEdit, cxSpinEdit, dxStatusBar;

type
  TSysComponentGridForm = class(TObjectGridForm)
    grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn;
    edtSysName: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SysComponentGridForm: TSysComponentGridForm;

implementation

uses fdcCustomGridFrm;

{$R *.dfm}

procedure TSysComponentGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('SysName', Trim(edtSysName.Text));
end;

initialization
  RegisterClass(TSysComponentGridForm);
  
end.
