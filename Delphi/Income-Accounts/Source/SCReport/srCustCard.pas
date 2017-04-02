unit srCustCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainDm, fdcCustomGridFrm, dxBar, dxBarExtItems,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomPopupMenu, cxGridPopupMenu, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridDBTableView, cxGrid,
  StdCtrls, dxLayoutControl, cxButtons, ExtCtrls, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, srReport,
  cxGraphics, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxCurrencyEdit;

type
  TsrCustCardGridForm = class(TsrReportGridForm)
    grdDataDBBandedTableViewITEM_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_TEXT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYED_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCARDNUM: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TsrCustCardGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('dat1').Value := edtFrom.Date;
  dsData.ParamByName('dat2').Value := edtTo.Date;
end;

initialization
   RegisterClass(TsrCustCardGridForm);

end.
