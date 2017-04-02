unit SelectRByPayerFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, DB, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl,
  cxButtons, ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar;

type
  TSelectRByPayerForm = class(TfdcCustomGridForm)
    dsDataSUMMA: TFloatField;
    dsDataDOC_NAME: TStringField;
    dsDataPO_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    grdDataDBBandedTableViewDOC_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    dsDataID: TFloatField;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectRByPayerForm: TSelectRByPayerForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TSelectRByPayerForm.FormShow(Sender: TObject);
begin
  inherited;
  pnlSearchCriteria.Visible := False;
  splSearchCriteria.Visible := False;
end;

initialization
   RegisterClass(TSelectRByPayerForm);

end.
