unit SubjectFindGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, dxBarExtDBItems, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, QueryList, fdcObjectCore;

type
  TSubjectFindGridForm = class(TSubjectGridForm)
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarListItem1: TdxBarListItem;
    dxBarLookupCombo1: TdxBarLookupCombo;
    dxBarCombo1: TdxBarCombo;
    edtBIC: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtCorrAcc: TcxTextEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    dsDataBIC: TStringField;
    dsDataCORR_ACCOUNT: TStringField;
    grdDataDBBandedTableViewBIC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCORR_ACCOUNT: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actSearchOkUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actSearchOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubjectFindGridForm: TSubjectFindGridForm;

implementation

{$R *.dfm}

uses
  MainFrm
 ,ObjectTypeTreeDlgFrm;

procedure TSubjectFindGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  ParamsHolder.Params[0].AsFloat := 0;
  inherited;
  dsData.ParamByName('ObjectNames').AsString := SearchTypeSysName;
  SetSearchParam('BIC', Trim(edtBIC.Text));
  SetSearchParam('CORR_ACC', Trim(edtCorrAcc.Text));
end;

procedure TSubjectFindGridForm.actSearchOkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    (Sender as TAction).Visible
     and (grdDataDBBandedTableView.Controller.SelectedRowCount = 1);
end;

procedure TSubjectFindGridForm.actAddExecute(Sender: TObject);
begin
  FTypeSysName := ExecObjectTypeDlg( MainForm.ObjectTypeFactory.Find( 'Subject' ), MainForm.ObjectServices, 'Выберите тип субъекта' ).SysName;

  inherited;
end;

procedure TSubjectFindGridForm.actSearchOkExecute(Sender: TObject);
  var lDragObject: TfdcDragObject;
begin
  lDragObject := GetDragObject(Self);
  if Assigned(lDragObject) then
    begin
      if Assigned(lDragObject.Objects[0]) then
        begin
          TfdcObject(lDragObject.Objects[0]).Read(dsData);
        end;
    end;
  inherited;
end;

initialization
    RegisterClass(TSubjectFindGridForm);

end.
