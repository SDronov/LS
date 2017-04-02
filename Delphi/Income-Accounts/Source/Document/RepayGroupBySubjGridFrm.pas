unit RepayGroupBySubjGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus;

type
  TRepayGroupBySubjGridForm = class(TObjectGridForm)
    dsDataADDRESS: TStringField;
    dsDataFULL_NAME: TStringField;
    dsDataOKPO: TStringField;
    dsDataINN: TStringField;
    dsDataOGRN: TStringField;
    dsDataSOATO: TStringField;
    dsDataKPP: TStringField;
    dsDataPHONE: TStringField;
    dsDataFAX: TStringField;
    dsDataTELEX: TStringField;
    dsDataTELEGRAPH: TStringField;
    dsDataTELETYPE: TStringField;
    grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewADDRESS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSOATO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPHONE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFAX: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELEX: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELEGRAPH: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELETYPE: TcxGridDBBandedColumn;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtKPP: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtINN: TcxTextEdit;
    procedure actOpenExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RepayGroupBySubjGridForm: TRepayGroupBySubjGridForm;

implementation

uses fdcCustomObjectGridFrm,fdcObjectCore,ObjectFrm,fdcCustomMainFrm,
  fdcCustomGridFrm;

{$R *.dfm}

procedure TRepayGroupBySubjGridForm.actOpenExecute(Sender: TObject);
var
  AnObj: TfdcObject;
  AForm: TObjectForm;
begin
//  inherited;
  AForm := TObjectForm(ObjectServices.FindObject(dsDataID.Value + 0.11));
  if not assigned(AForm) then
  begin
    AnObj := ObjectServices.GetObjectFactory.GetObject(dsDataID.Value, True);

    AForm := TObjectForm(TFormClass(FindClass('TRepayGroupBySubjForm')).Create(Application));
    AForm.ObjectServices := ObjectServices;
    AForm.ID := AnObj.ID;
    RegisterAsWaiterFor(AForm);
    AnObj.ID := AnObj.ID + 0.11;
    TfdcCustomMainForm(Application.MainForm).ShowForm(AForm, Params, nil);
  end;
  AForm.BringToFront;
  if AForm.WindowState = wsMinimized then
        AForm.WindowState := wsNormal;
end;

procedure TRepayGroupBySubjGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('INN', edtINN.Text);
  SetSearchParam('KPP', edtKPP.Text);
end;

initialization
  RegisterClass(TRepayGroupBySubjGridForm);

end.
