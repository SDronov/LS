unit TPOBaseGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CDeclBaseGridFrm, cxDropDownEdit, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  ImgList, cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels,
  ActnList, cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl,
  cxMaskEdit, cxCalendar, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar,
  cxSpinEdit, cxLabel, dxStatusBar, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxCalc, QueryList;

type
  TTPOBaseGridForm = class(TCDeclBaseGridForm)
    edtDocType: TcxMaskEdit;
    lcSearchCriteriaItem10: TdxLayoutItem;
    dsDataNUM_MPO: TStringField;
    dsDataSUM_RUB: TFloatField;
    grdDataDBBandedTableViewOBJKINDLABEL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNUM_MPO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewORDER_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_RUB: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn;
    dsDataREGIM: TStringField;
    grdDataDBBandedTableViewREGIM: TcxGridDBBandedColumn;
    dsDataMETH_MOVE: TStringField;
    dsDataDOC_TYPE: TStringField;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TPOBaseGridForm: TTPOBaseGridForm;

implementation

uses fdcCustomGridFrm, MainDm;

{$R *.dfm}

procedure TTPOBaseGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('DOC_TYPE', edtDocType.EditingValue);
end;

end.
