unit qVEDAccountsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomReportGridFrm, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, xlcClasses,
  xlEngine, xlReport, OracleData, fdcParamsHolder, dxBar, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, fdcObjectServices, fdcObjectCore,
  cxGridDBTableView, cxGrid, dxStatusBar, cxTextEdit, Menus,
  cxLookAndFeelPainters, dxBarExtItems, StdCtrls, cxButtons, cxNavigator,
  cxDBNavigator;

type
  TqVEDAccountsGridForm = class(TqCustomReportGridForm)
    dsetDataACCOUNT: TStringField;
    dsetDataINN: TStringField;
    dsetDataNAME: TStringField;
    dsetDataBIK: TStringField;
    dsetDataBANK: TStringField;
    ColumnACCOUNT: TcxGridDBBandedColumn;
    ColumnINN: TcxGridDBBandedColumn;
    ColumnNAME: TcxGridDBBandedColumn;
    ColumnBIK: TcxGridDBBandedColumn;
    ColumnBANK: TcxGridDBBandedColumn;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    cxTextEditName: TcxTextEdit;
    dxBarStatic2: TdxBarStatic;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    cxTextEditINN: TcxTextEdit;
    dxBarStatic3: TdxBarStatic;
    cxTextEditKPP: TcxTextEdit;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    dxBarControlContainerItem4: TdxBarControlContainerItem;
    cxButtonSelectVED: TcxButton;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic4: TdxBarStatic;
    procedure OnSearchSrcSubjFinished(const ADragObject: TfdcDragObject);    
    procedure actSelectVEDExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qVEDAccountsGridForm: TqVEDAccountsGridForm;

implementation

{$R *.dfm}


uses DeclarantGridFrm;


procedure TqVEDAccountsGridForm.actSelectVEDExecute(Sender: TObject);
var
  D: TDeclarantGridForm;
begin
  D := TDeclarantGridForm.Create(cxButtonSelectVED);
  try
    D.SearchMode := True;
    D.SearchTypeSysName := 'Declarant';
    D.SearchMultiple := False;
    D.SearchComponent := cxButtonSelectVED;
    D.ObjectServices := GetObjectServices;
    D.OnSearchFinished := OnSearchSrcSubjFinished;
    D.acImport.Visible := False;    
    D.actImportSbjDbf.Visible := False;
    D.actImportAccount.Visible := False;
    D.actOpen.Visible := False;
    D.actAdd.Visible := False;
    D.actDelete.Visible := False;
    D.btnSwitchSearchCriteria.Visible := ivNever;
    D.edtMaxRecordCount.Value := 7000;
    if dsetData.GetVariable('ID') <> null then
       D.SelectedObjectID := dsetData.GetVariable('ID');
    D.ShowModal;
  finally
    D.Free;
  end;
  grdData.SetFocus;
end;

procedure TqVEDAccountsGridForm.OnSearchSrcSubjFinished(
  const ADragObject: TfdcDragObject);
begin
  if ADragObject.Objects.Count > 0 then
  begin
    with ADragObject.Objects[0] do
    begin
      dsetData.SetVariable('ID', FieldValues['ID']);
      cxTextEditName.Text := VarToStr(FieldValues['NAME']);
      cxTextEditName.Hint := VarToStr(FieldValues['NAME']);
      cxTextEditINN.Text := VarToStr(FieldValues['INN']);
      cxTextEditKPP.Text := VarToStr(FieldValues['KPP']);
    end;
    RefreshData;
  end;  
end;

procedure TqVEDAccountsGridForm.actExcelExecute(Sender: TObject);
begin
  excelExport.ParamByName['Name'].Value := cxTextEditName.Text;
  excelExport.ParamByName['INN'].Value := cxTextEditINN.Text;
  excelExport.ParamByName['KPP'].Value := cxTextEditKPP.Text;    
  inherited;
end;

procedure TqVEDAccountsGridForm.actRefreshUpdate(Sender: TObject);
begin
  inherited;
  actRefresh.Enabled := dsetData.GetVariable('ID') > 0;
end;

initialization
  RegisterClass (TqVEDAccountsGridForm);

end.

