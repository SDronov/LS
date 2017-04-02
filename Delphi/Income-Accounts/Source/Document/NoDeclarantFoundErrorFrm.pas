unit NoDeclarantFoundErrorFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, fdcObjectCore, ExtCtrls, cxButtons, Menus,
  cxLookAndFeelPainters;

const
   CM_DO_DESTROY = CM_BASE + 1000;

type
  TNoDeclarantFoundErrorForm = class(TObjectForm)
    edtINN: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtKPP: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtDeclName: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    dsDataG147: TStringField;
    dsDataG141: TStringField;
    dsDataG142: TStringField;
    dsDataSUBJ_ID: TFloatField;
    dsDataSUBJ_NAME: TStringField;
    Panel1: TPanel;
    lcGeneralItem5: TdxLayoutItem;
    cxButton1: TcxButton;
    lcGeneralItem4: TdxLayoutItem;
    procedure dsUpdateBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SearchFinished(const ADragObject: TfdcDragObject);
    procedure DoDelete(var Messsage: TMessage); message CM_DO_DESTROY;
  public
    { Public declarations }
  end;

var
  NoDeclarantFoundErrorForm: TNoDeclarantFoundErrorForm;

implementation

uses MainDm, fdcCustomObjectFrm, ObjectGridFrm, IaccUtils,
  fdcCustomDataFrm;

{$R *.dfm}

procedure TNoDeclarantFoundErrorForm.DoDelete(var Messsage: TMessage);
begin
//  ObjectServices.FreeObject(dsDataID.Value);
  Close;
end;

procedure TNoDeclarantFoundErrorForm.dsUpdateBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsUpdate.ParamByName('DECL_ID').Value := Params.ParamValues['DECL_ID'];
end;

procedure TNoDeclarantFoundErrorForm.FormShow(Sender: TObject);
var
  F: TObjectGridForm;
begin
  inherited;
  BarManager.Bars[0].Visible := False;
  F := ObjectServices.ShowForm('TSubjectFindGridForm', Params, Panel1) as TObjectGridForm;
  F.SearchTypeSysName := 'Declarant;Person;Subject';
  F.OnSearchFinished := SearchFinished;
  F.SearchMode := True;
  F.RefreshData;
end;

procedure TNoDeclarantFoundErrorForm.SearchFinished(
  const ADragObject: TfdcDragObject);
begin
  if ADragObject <> nil then
    dsDataSUBJ_ID.Value := ADragObject.SingleObject.ID;
  dsUpdate.ExecSQL;
  RefreshWaiters;
  PostMessage(Handle, CM_DO_DESTROY, 0, 0);
end;

procedure TNoDeclarantFoundErrorForm.cxButton1Click(Sender: TObject);
var
  DataSet: TDataSet;
begin
  inherited;
  DataSet := CreateSubject(dsDataG142.Value, dsDataG141.Value, dsDataG147.Value);
  try
    if DataSet <> nil then
    begin
      dsDataSUBJ_ID.Value := DataSet['ID'];
      SearchFinished(nil);
    end;
  finally
    DataSet.Free;
  end;

end;

procedure TNoDeclarantFoundErrorForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('DeclCol').AsString := MainData.GetDeclColumnForParse;
end;

initialization
   RegisterClass(TNoDeclarantFoundErrorForm);

end.
