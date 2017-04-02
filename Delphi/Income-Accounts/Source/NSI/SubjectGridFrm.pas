{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 15515 $
  $Author: adavletyarov $
  $Date: 2012-10-02 15:16:21 +0400 (Вт, 02 окт 2012) $
}
unit SubjectGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus, fdcObjectCore,
  QueryList;

type
  TSubjectGridForm = class(TObjectGridForm)
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtOKPO: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
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
    grdDataDBBandedTableViewADDRESS_: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn;
    QueryList: TQueryList;
    sqlUpdateParent: TsqlOp;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actSearchOkExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FTypeSysName  : string;
    FSearchCount	: Integer;
    procedure OnSearchFinished1(const ADragObject: TfdcDragObject);
  end;

var
  SubjectGridForm: TSubjectGridForm;

implementation

uses fdcCustomGridFrm, MainDm, fdcCustomObjectGridFrm, fdcObjectServices,
     SubjectFrm, PersonalAccountFindGridFrm;
{$R *.dfm}

procedure TSubjectGridForm.dsDataBeforeOpen(DataSet: TDataSet);
var
         P: TParam;
begin
  inherited;
  if   (ParamsHolder.Params.ParamByName( 'ID' ).Value = Unassigned)
    or (ParamsHolder.Params.ParamByName( 'ID' ).AsInteger <= 0) then
   begin
     P := dsData.Params.FindParam('ID');
     while P <> nil do
     begin
       P.Destroy;
       P := dsData.Params.FindParam('ID');
     end;
//     P := dsData.Params.FindParam('ID');
//     if P <> nil then P.Destroy;
   end
  else
   begin
     SetSubsParam('viewmode', 0);
     (DataSet as TfdcQuery).ParamByName('ID').AsFloat := ParamsHolder.Params.ParamByName( 'ID' ).Value;
   end;
  SetSearchParam('INN',  Trim(edtInn.Text));
  SetSearchParam('KPP',  Trim(edtOKPO.Text));
  SetSearchParam('NAME', Trim(edtName.Text));
end;

procedure TSubjectGridForm.FormCreate(Sender: TObject);
begin
  inherited;
{ if Self.ClassType = TSubjectGridForm then
  begin
    grdDataDBBandedTableViewADDRESS_.Visible := True ;
    grdDataDBBandedTableViewINN_.Visible := True;
    grdDataDBBandedTableViewKPP_.Visible := True;
    grdDataDBBandedTableViewADDRESS_.Hidden := False;
    grdDataDBBandedTableViewINN_.Hidden := False;
    grdDataDBBandedTableViewKPP_.Hidden := False;
  end;}
end;

procedure TSubjectGridForm.actSearchOkExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(OnSearchFinished) then
       ModalResult := mrOk; 
end;

procedure TSubjectGridForm.actAddExecute(Sender: TObject);
var F : TPersonalAccountFindGridForm;
begin
  FSearchCount := 0;
  F := TPersonalAccountFindGridForm.Create(Self);
  F.SearchMode := True;
  F.SearchMultiple := True;
  F.SearchTypeSysName := 'PersonalAccount';
  F.lv_TypeSysName := FTypeSysName;

  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchFinished1;

  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;

  F.ShowModal;

  F.Free;
  RefreshData;
end;

procedure TSubjectGridForm.OnSearchFinished1(const ADragObject: TfdcDragObject);
var
    lv_Form :TForm;
    i : Integer;
begin
     lv_Form := GetObjectServices.CreateObject( FTypeSysName, False, nil );
     with lv_Form as TSubjectForm do
       begin
           RegisterWaiter( Self );
           try
             for i := 0 to ADragObject.Objects.Count - 1 do
               sqlUpdateParent.exec('pId;pParentId',[ADragObject.Objects[i].Id,dsDataID.AsInteger]);
             FSearchCount := ADragObject.Objects.Count;
             sqlUpdateParent.QueryList.Session.Commit;
           except
             sqlUpdateParent.QueryList.Session.Rollback;
           end;
       end;
end;

initialization
   RegisterClass(TSubjectGridForm);

end.
