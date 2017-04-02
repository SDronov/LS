{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 16457 $
  $Author: adavletyarov $
  $Date: 2013-04-01 17:29:55 +0400 (РџРЅ, 01 Р°РїСЂ 2013) $
}
unit CustomDeclErrorGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, QueryList,
  Menus;

type
  TCustomDeclErrorGridForm = class(TObjectGridForm)
    QueryList1: TQueryList;
    actDebt: TAction;
    actExecute: TAction;
    sqlReparse: TsqlOp;
    btnExecute: TdxBarButton;
    actPay: TAction;
    btnPay: TdxBarButton;
    sqlStartPay: TsqlOp;
    dsRestList: TfdcQuery;
    sqlCheckPayments: TsqlOp;
    sqlReparseReg: TsqlOp;
    sqlReparseTempAdm: TsqlOp;
    sqlGetSubject: TsqlOp;
    sqlReparsePaymentTPO: TsqlOp;
    sqlReIdentGTD: TsqlOp;
    sqlReIdentTPO: TsqlOp;
    sqlActivateBuffer: TsqlOp;
    sqlAddForReparse: TsqlOp;
    sqlReparsePaymentsList: TsqlOp;
    procedure actOpenExecute(Sender: TObject);
    procedure actExecuteExecute(Sender: TObject);
    procedure actExecuteUpdate(Sender: TObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure actPayExecute(Sender: TObject);
    procedure actPayUpdate(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    FPayAllowed: boolean;
    procedure DoReExecute(AGridTableView: TcxGridTableView; AIndex,
               ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure SetToolBarButtonVisible;
  protected
  public
    FSubjectId: integer;
  end;

implementation

uses
  fdcCustomDataFrm
 ,fdcObjectServices
 ,MainDm
 ,fdcMessages
 ,fdcCustomObjectGridFrm
 ,fdcCustomDBDataFrm
 ,SelectPOWizardFrm
 ,DeclCorrectFrm;

{$R *.dfm}

{ TCustomDeclErrorGridForm }

procedure TCustomDeclErrorGridForm.actOpenExecute(Sender: TObject);
var
 form: TObjectGridForm;
begin
  if ( Pos('NoDeclarant', dsDataTYPESYSNAME.Value) > 0 ) or
     ( Pos('NoCarrierFoundError', dsDataTYPESYSNAME.Value) > 0 ) then
    GetObjectServices.OpenObject(dsDATAID.Value, Params)
  else if ( Pos('BadPayOrderErrorTPO', dsDataTYPESYSNAME.Value) > 0 ) and
          ( dsData['Name']='Нет п/п' ) then

  else if Pos('BadPayOrderErrorTPO', dsDataTYPESYSNAME.Value) > 0 then
    TObjectGridForm(GetObjectServices.SearchObject('TBadPayOrderErrorResolveForm', '', 0, Params, Self, False, nil)).RegisterWaiter(Self)
  else if ( Pos('TPO', Params.ParamByName('TYPESYSNAME').AsString) <> 0 ) and
          ( Pos('BadPayOrderError', dsDataTYPESYSNAME.Value) <> 0 ) then
    actPay.Execute
  else if Pos( 'WrongNumberOfMonthsError', dsDataTYPESYSNAME.Value) > 0 then
    begin
      if AddCharge( dsData.Params.ParamValues[ 'ID' ], FSubjectID ) then
        actExecute.Execute;
    end
  else
    begin
      form :=   TObjectGridForm(GetObjectServices.SearchObject('T' + dsDataTYPESYSNAME.Value + 'ResolveForm', '', //'PaymentOrder',
        0, Params, Self, False, nil));

      if  (Pos('BadPayOrderError', dsDataTYPESYSNAME.Value) > 0) then
        form.btnSwitchSearchCriteria.Enabled:=false;

      RegisterWaiter(Self);
    end;

  sqlActivateBuffer.Exec;
end;

procedure TCustomDeclErrorGridForm.actExecuteExecute(Sender: TObject);
begin
  inherited;
  try
    IterateRecords(DoReExecute, ActiveGridTableView.Controller.SelectedRowCount > 0, True);
    // Обработка собранного списка платежек из декларации
    sqlReparsePaymentsList.Exec;

    sqlActivateBuffer.Exec;
  finally
    RefreshData;
    RefreshWaiters;
  end;
end;

procedure TCustomDeclErrorGridForm.DoReExecute(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
begin
  if Pos('Нет документа контроля', dsDataNAME.Value) <> 0 then
    Self.ObjectServices.FreeObject(dsDataID.Value)
  else if dsDataTYPESYSNAME.Value='WrongNumberOfMonthsError' then
    sqlReparseTempAdm.Exec
  else if ( Pos('BadPayOrderErrorTPO', dsDataTYPESYSNAME.Value) <> 0 ) or
          (
            (
              ( Pos('TPO', Params.ParamByName('TYPESYSNAME').AsString) <> 0 ) or
              ( Pos('TR', Params.ParamByName('TYPESYSNAME').AsString) <> 0 ) or
              ( Pos('TrDuplicate', Params.ParamByName('TYPESYSNAME').AsString) <> 0 )
            ) and
            ( Pos('BadPayOrderError', dsDataTYPESYSNAME.Value) <> 0 )
          ) then
    sqlReparsePaymentTPO.Exec
  else if Pos('TPO', dsDataTYPESYSNAME.Value) <> 0 then
    sqlCheckPayments.Exec
  else if (Pos('NoDeclarant', dsDataTYPESYSNAME.Value) = 0)
       and (Pos('NoCarrierFoundError', dsDataTYPESYSNAME.Value) = 0)
       and (not dsDataSYSNAME.IsNull) then
   begin
     sqlReparse.Exec;
   end
  else if (Pos('Registry', dsDataTYPESYSNAME.Value) <> 0) and (AIndex = ACount-1) then
     sqlReparseReg.Exec
  else
  if (Pos('NoDeclarant', dsDataTYPESYSNAME.Value) <> 0)
       or (Pos('NoCarrierFoundError', dsDataTYPESYSNAME.Value) <> 0) then
      begin
        if (Pos('TPO', Params.ParamByName('TYPESYSNAME').AsString) <> 0) or
           (Pos('TR', Params.ParamByName('TYPESYSNAME').AsString) <> 0) or
           (Pos('TrDuplicate', Params.ParamByName('TYPESYSNAME').AsString) <> 0) then
          sqlReIdentTPO.Exec
        else
          sqlReIdentGTD.Exec;
      end;
end;

procedure TCustomDeclErrorGridForm.actExecuteUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not dsData.IsEmpty;
end;

procedure TCustomDeclErrorGridForm.actOpenUpdate(Sender: TObject);
begin
  if dsDataSYSNAME.IsNull
     or (Pos('не равняется', dsDataNAME.Value) > 0)
     or (Pos('Нет документа контроля', dsDataNAME.Value) > 0)
     or ((Pos('BadPayOrderErrorTPO', dsDataTYPESYSNAME.Value) > 0)  and (dsData['Name']='Нет п/п')) then
  begin
    TAction(Sender).Enabled := False;
    Exit;
  end;
  inherited;
end;

procedure TCustomDeclErrorGridForm.actPayExecute(Sender: TObject);
begin
  inherited;
  dsRestList.ParamByName('ID').Value := dsDataOWNER_OBJECT_ID.Value;
  dsRestList.Open;
  try
    try
      while not dsRestList.Eof do
        begin
          sqlStartPay['result'] := 0.0;
          if not ShowPaymentWizard(sqlStartPay.Exec, dsRestList['currency_id']
                    ,True, dsRestList['rate_date'], FSubjectId, True, dsRestList['kbkcode_id'], 1, dsRestList.ParamByName('ID').Value) then
            begin
              dsRestList.Session.Rollback;
              Exit;
            end;
          dsRestList.Next;
        end;

      sqlCheckPayments.Exec;

      sqlActivateBuffer.Exec;

      dsRestList.Session.Commit;

      RefreshData;
      RefreshWaiters;
    except
      dsRestList.Session.Rollback;
      raise;
    end;
  finally
    dsRestList.Close;
  end;
end;

procedure TCustomDeclErrorGridForm.actPayUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := FPayAllowed;
end;

procedure TCustomDeclErrorGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  FPayAllowed := False;
end;

procedure TCustomDeclErrorGridForm.FormShow(Sender: TObject);
begin
  FPayAllowed := False;

  inherited;

  FSubjectId:= sqlGetSubject.Exec('DECL_ID',[dsDataOWNER_OBJECT_ID.Value]);
  SetToolBarButtonVisible;
end;

procedure TCustomDeclErrorGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  FPayAllowed := False;

  inherited;

{  if FPayAllowed then
    FPayAllowed := not DataSet.Locate( 'TypeSysName', 'NoDeclarantFoundError', [] );}
  // fdcQuery ругается если не находит строчки... очень остроумно!!!!
  // придётся делать так:

  FPayAllowed := False;
  DataSet.DisableControls;
  try
    DataSet.First;
    while not DataSet.Eof do
      begin
        if Pos( 'Bad', dsData.FieldByName( 'TYPESYSNAME' ).AsString ) > 0 then
          begin
            FPayAllowed := True;
            break;
          end;
        DataSet.Next;
      end;

    if FPayAllowed then
      begin
        DataSet.First;
        while not DataSet.Eof do
          begin
            if DataSet.FieldByName( 'TypeSysName' ).AsString = 'NoDeclarantFoundError' then
              begin
                FPayAllowed := False;
                break;
              end;

            DataSet.Next;
          end;
      end;
  finally
    DataSet.First;
    DataSet.EnableControls;
  end;
end;

procedure TCustomDeclErrorGridForm.SetToolBarButtonVisible;
 var
   vParam : TfdcParam;
begin
  vParam := Params.FindParam('TYPESYSNAME');
  if Assigned(vParam) and
     (vParam.Value = 'DocPackGTDKNP') then
    begin
      btnExecute.Visible := ivNever;
      btnPay.Visible     := ivNever;
    end;
end;

initialization
     RegisterClass(TCustomDeclErrorGridForm);

end.
