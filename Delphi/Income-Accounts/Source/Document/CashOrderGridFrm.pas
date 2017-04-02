unit CashOrderGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxCurrencyEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,fdcObjectCore,
  QueryList, Menus, cxMemo, cxCalc, cxCheckBox;

type
  TCashOrderGridForm = class(TPaymentOrderGridForm)
    QueryList1: TQueryList;
    sqlRelAdd: TsqlOp;
    sqlRelDel: TsqlOp;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    procedure OnSearchFinished(const ADragObject: TfdcDragObject);
    procedure RemoveRelation(
        AGridTableView: TcxGridTableView; AIndex, ACount: integer;
        var ADescr: string; var ABreak: boolean);
  public
    { Public declarations }
  end;

var
  CashOrderGridForm: TCashOrderGridForm;

implementation

{$R *.dfm}
uses fdcObjectServices, MainDm, ObjectFrm, fdcMessages;

procedure TCashOrderGridForm.actAddExecute(Sender: TObject);
begin
//  inherited;
  self.ObjectServices.SearchObject('TCashOrderByBankGridForm', 'CashOrder', 0, Params, nil, True,OnSearchFinished  );
end;

procedure TCashOrderGridForm.OnSearchFinished(
  const ADragObject: TfdcDragObject);
var
I: Integer;
CashOrderId: double;
DocSumma:double;
begin
 for I := 0 to ADragObject.Objects.Count -  1 do
 begin
  CashOrderId := ADragObject.Objects[I].ID;
  sqlRelAdd.Exec('OBJ_ID;REL_OBJ_ID',[Params.ParamValues['AGGRPAY_ID'],CashOrderId]);
 end;
 QueryList1.Session.Commit;
 Self.RefreshData;
end;

procedure TCashOrderGridForm.actDeleteExecute(Sender: TObject);
begin
  if (WarningDlg('Удаление квитанции', 'Удалить выбранные квитанции?') = mrYes) then
  try
    IterateRecords(RemoveRelation, True, True);
  finally
    RefreshData;
  end;
end;

procedure TCashOrderGridForm.RemoveRelation(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
 ObjId: double;
 RelObjId: double;
begin
  ObjId := Params.ParamValues['AGGRPAY_ID'];
  RelObjId := dsDataID.Value;
  sqlRelDel.Exec('OBJ_ID;REL_OBJ_ID',[ObjId,RelObjId]);
  QueryList1.Session.Commit;
end;


initialization
  RegisterClass(TCashOrderGridForm);
end.
