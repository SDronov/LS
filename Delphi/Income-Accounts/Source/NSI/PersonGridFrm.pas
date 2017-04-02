unit PersonGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  cxCheckBox, SubjectGridFrm, QueryList;

type
  TPersonGridForm = class(TSubjectGridForm)
    dsDataLAST_NAME: TStringField;
    dsDataFIRST_NAME: TStringField;
    dsDataMIDDLE_NAME: TStringField;
    dsDataDOC_TYPE: TStringField;
    dsDataDOC_NO: TStringField;
    dsDataSER_NO: TStringField;
    dsDataCOUNTRY_CODE: TStringField;
    dsDataISSUED_BY: TStringField;
    dsDataISSUED_DATE: TDateTimeField;
    grdDataDBBandedTableViewLastName: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFirstName: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMiddleName: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCountryCode: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDoc_Type: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSer_No: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDoc_No: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIssued_By: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIsSued_Date: TcxGridDBBandedColumn;
    dsDataPRIVATE_OWNER: TStringField;
    grdDataDBBandedTableViewPRIVATE_OWNER: TcxGridDBBandedColumn;
    cbPrivateOwner: TcxCheckBox;
    lciPrivateOwner: TdxLayoutItem;
    edtFirstName: TcxTextEdit;
    lciFirstName: TdxLayoutItem;
    edtMiddleName: TcxTextEdit;
    lciMiddleName: TdxLayoutItem;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actSearchOkUpdate(Sender: TObject);
    procedure actSwitchSearchCriteriaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  PersonGridForm: TPersonGridForm;

implementation

uses fdcCustomDBDataFrm;

{$R *.dfm}

procedure TPersonGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('FIRST_NAME', Trim(edtFirstName.Text));
  SetSearchParam('MIDDLE_NAME', Trim(edtMiddleName.Text));
  SetSearchParam('INN', Trim(edtINN.Text));
  SetSearchParam('PRIVATE_OWNER', cbPrivateOwner.EditValue);
end;

procedure TPersonGridForm.actSearchOkUpdate(Sender: TObject);
begin
  inherited;
//  TAction(Sender).Enabled := (Sender as TAction).Visible and
//                             not dsData.IsEmpty;
end;

procedure TPersonGridForm.actSwitchSearchCriteriaExecute(Sender: TObject);
begin
  inherited;
  if Self.SearchActive then
    cbPrivateOwner.EditValue := null;
end;

procedure TPersonGridForm.FormShow(Sender: TObject);
begin
  inherited;
   FTypeSysName := 'Person';
end;

initialization
  RegisterClass(TPersonGridForm);


end.
