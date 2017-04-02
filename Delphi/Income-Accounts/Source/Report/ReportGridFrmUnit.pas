unit ReportGridFrmUnit;

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
  dxStatusBar, cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TReportGridForm = class(TObjectGridForm)
    lciRepNumber: TdxLayoutItem;
    edtRepNumber: TcxTextEdit;
    lciRepDate: TdxLayoutItem;
    edtRepDate: TcxDateEdit;
    chkIsTs: TcxCheckBox;
    lciIsTs: TdxLayoutItem;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure btnSearchClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportGridForm: TReportGridForm;

implementation

{$R *.dfm}

procedure TReportGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('REPNUMBER', edtRepNumber.EditingValue);
  SetSearchParam('REPDATE', edtRepDate.EditingValue);
  SetSearchParam('ISTS', chkIsTs.EditingValue);
end;

procedure TReportGridForm.btnSearchClearClick(Sender: TObject);
begin
  inherited;
  chkIsTs.EditValue := '';
end;

procedure TReportGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  chkIsTs.EditValue := '';
end;

initialization
  RegisterClass(TReportGridForm);
end.
