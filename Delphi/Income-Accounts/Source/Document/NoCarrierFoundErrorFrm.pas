unit NoCarrierFoundErrorFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, ExtCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, fdcObjectLinkEdit, fdcObjectCore;

const
   CM_DO_DESTROY = CM_BASE + 1001;

type
  TNoCarrierFoundErrorForm = class(TObjectForm)
    pnlGrid: TPanel;
    lcGeneralItem1: TdxLayoutItem;
    edtKPP: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtINN: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtCarrierName: TcxDBTextEdit;
    lcGeneralItem4: TdxLayoutItem;
    btnCreate: TcxButton;
    lcGeneralItem5: TdxLayoutItem;
    actCreate: TAction;
    dsDataSUBJ_NAME: TStringField;
    dsDataG141: TStringField;
    dsDataG147: TStringField;
    dsDataG142: TStringField;
    dsDataSUBJ_ID: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure actCreateExecute(Sender: TObject);
    procedure dsUpdateBeforeOpen(DataSet: TDataSet);
    procedure SearchFinished(const ADragObject: TfdcDragObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
  public
    procedure DoDelete(var Messsage: TMessage); message CM_DO_DESTROY;
  end;

implementation

{$R *.dfm}

uses
  MainDm, fdcCustomObjectFrm, ObjectGridFrm, fdcUtils, IaccUtils, fdcCustomDataFrm;


procedure TNoCarrierFoundErrorForm.DoDelete(var Messsage: TMessage);
begin
//  ObjectServices.FreeObject(dsDataID.Value);
  Close;
end;


procedure TNoCarrierFoundErrorForm.FormShow(Sender: TObject);
var
  F: TObjectGridForm;
begin
  inherited;
  BarManager.Bars[0].Visible := False;
  F := ObjectServices.ShowForm('TSubjectFindGridForm', Params, pnlGrid) as TObjectGridForm;
  F.SearchTypeSysName := 'Declarant;Person;Subject';
  F.OnSearchFinished := SearchFinished;
  F.SearchMode := True;
  F.RefreshData;
end;


procedure TNoCarrierFoundErrorForm.actCreateExecute(Sender: TObject);
var
  DataSet: TDataSet;
begin
  inherited;
  DataSet := CreateSubject(dsDataG142.Value, dsDataG141.Value, dsDataG147.Value);
  try
    if (DataSet <> nil) then
    begin
      dsDataSUBJ_ID.Value := DataSet['ID'];
      SearchFinished(nil);
    end;
  finally
    DataSet.Free;
  end;
end;

procedure TNoCarrierFoundErrorForm.SearchFinished(const ADragObject: TfdcDragObject);
begin
  if ADragObject <> nil then
    dsDataSUBJ_ID.Value := ADragObject.SingleObject.ID;
  dsUpdate.ExecSQL;
  RefreshWaiters;
  PostMessage(Handle, CM_DO_DESTROY, 0, 0);
end;


procedure TNoCarrierFoundErrorForm.dsUpdateBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsUpdate.ParamByName('DECL_ID').Value := Params.ParamValues['DECL_ID'];
end;

procedure TNoCarrierFoundErrorForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('DeclCol').AsString := MainData.GetDeclColumnForParse;
end;

initialization
   RegisterClass(TNoCarrierFoundErrorForm);

end.
 