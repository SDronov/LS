unit RefinancingRateGridFrm;

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
  dxStatusBar, cxDropDownEdit, cxCalendar;

type
  TNSIRefinancingRateGridForm = class(TObjectGridForm)
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtBeginDate: TcxDateEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtEndDate: TcxDateEdit;
    dsDataRATE_DATE: TDateTimeField;
    grdDataDBBandedTableViewRATE_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREFINANCING_RATE: TcxGridDBBandedColumn;
    dsDataREFINANCING_RATE: TFloatField;
    actImport: TAction;
    btnImport: TdxBarButton;
    procedure actAddExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actImportExecute(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  NSIRefinancingRateGridForm: TNSIRefinancingRateGridForm;

implementation

{$R *.dfm}
uses IaccLoader, fdcUtils, LoaderWizardFrm;

procedure TNSIRefinancingRateGridForm.actAddExecute(Sender: TObject);
begin
  RegisterAsWaiterFor(ObjectServices.CreateObject('NSIRefinancingRate', False, Params));
end;

procedure TNSIRefinancingRateGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('BeginDate', IfElse(edtBeginDate.Text <> '', edtBeginDate.Date, Null));
  SetSearchParam('EndDate', IfElse(edtEndDate.Text <> '', edtEndDate.Date, Null));
end;

procedure TNSIRefinancingRateGridForm.actImportExecute(Sender: TObject);
begin
  ExecuteLoader(TKeyRateLoader, 'Справочник ставок ЦБ');
end;

initialization
  RegisterClass(TNSIRefinancingRateGridForm);

end.
