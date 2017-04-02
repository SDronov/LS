unit NSIDeclarantELSGridFrm;

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

  TNSIDeclarantELSGridForm = class(TObjectGridForm)
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtBeginDate: TcxDateEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtEndDate: TcxDateEdit;
    colgrdDataDBBandedTableViewDATE_BEGIN: TcxGridDBBandedColumn;
    actImport: TAction;
    btnImport: TdxBarButton;
    dsDatainn: TStringField;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECLARANT_NAME: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewDATE_END: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn;
    dsDataDATE_BEGIN: TDateTimeField;
    dsDataDATE_END: TDateTimeField;
    dsDataNOTE: TStringField;
    dsDataDECLARANT_NAME: TStringField;
    edtcxTextEditINN: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    procedure actAddExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actImportExecute(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  NSIDeclarantELSGridForm: TNSIDeclarantELSGridForm;

implementation

{$R *.dfm}
uses IaccLoader, fdcUtils, LoaderWizardFrm;

procedure TNSIDeclarantELSGridForm.actAddExecute(Sender: TObject);
begin
  RegisterAsWaiterFor(ObjectServices.CreateObject('NSIDeclarantELS', False, Params));
end;

procedure TNSIDeclarantELSGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('DATE_BEGIN', IfElse(edtBeginDate.Text <> '', edtBeginDate.Date, Null));
  SetSearchParam('DATE_END', IfElse(edtEndDate.Text <> '', edtEndDate.Date, Null));
  SetSearchParam('INN', IfElse(edtcxTextEditINN.Text <> '', edtcxTextEditINN.Text, Null));
  SetSearchParam('Name', IfElse(edtName.Text <> '', edtName.Text, Null));
end;

procedure TNSIDeclarantELSGridForm.actImportExecute(Sender: TObject);
begin
  ExecuteLoader(TNSIDeclarantELSLoader, 'Участники ВЭД с ЕЛС');
end;

initialization
  RegisterClass(TNSIDeclarantELSGridForm);

end.
