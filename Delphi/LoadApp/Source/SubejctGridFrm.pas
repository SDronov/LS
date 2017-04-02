unit SubejctGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, Menus;

type
  TSubjectGridForm = class(TfdcCustomGridForm)
    dsDataID: TFloatField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataNAME: TStringField;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    edtNAME: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtKPP: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubjectGridForm: TSubjectGridForm;

implementation

uses DataDM;

{$R *.dfm}

procedure TSubjectGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('NAME', Trim(edtNAME.Text));
  SetSearchParam('INN', Trim(edtINN.Text));
  SetSearchParam('KPP', Trim(edtKPP.Text));
end;

end.
