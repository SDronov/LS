{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 13785 $
  $Author: rrykunov $
  $Date: 2011-10-05 21:54:46 +0400 (РЎСЂ, 05 РѕРєС‚ 2011) $
}

unit BrokerFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, QueryList;

type
  TBrokerForm = class(TSubjectForm)
    dsDataLICENSE_NO: TStringField;
    dsDataBEG_DATE: TDateTimeField;
    dsDataEND_DATE: TDateTimeField;
    dsDataBSKOLTOI: TFloatField;
    dsDataBSKOLTOII: TFloatField;
    tabContracts: TcxTabSheet;
    dsDataREESTR_NO: TStringField;
    dsDataBR_ID: TFloatField;
    lcMainItem1: TdxLayoutItem;
    edLicenseNo: TcxDBTextEdit;
    lcMainGroup1: TdxLayoutGroup;
    lcMainItem2: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    lcMainItem3: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcMainGroup2: TdxLayoutGroup;
    lcMainItem4: TdxLayoutItem;
    edtReestrNo: TcxDBTextEdit;
    lcMainGroup3: TdxLayoutGroup;
    lcMainItem5: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    lcMainItem6: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcMainGroup5: TdxLayoutGroup;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    QueryList1: TQueryList;
    sqlSetType: TsqlOp;
    aSetTypeDeclarant: TAction;
    aSetTypePerson: TAction;
    sqlGetType: TsqlOp;
    lcMainItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcMainGroup4: TdxLayoutGroup;
    dsDataBNPPLIC: TFloatField;
    dsDataBKTLIC: TStringField;
    dsDataST: TStringField;
    dsDataADROWN: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Modify(Sender: TObject);
    procedure tabContractsShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aSetTypeDeclarantExecute(Sender: TObject);
    procedure aSetTypePersonExecute(Sender: TObject);
    procedure aSetTypeDeclarantUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actNewUpdate(Sender: TObject);
  private
    fContractsForm : TForm;
  public
  end;

var
  BrokerForm: TBrokerForm;

implementation

uses
  MainDm, IaccUtils, BrokerContractGridFrm;

{$R *.dfm}

procedure TBrokerForm.FormCreate(Sender: TObject);
begin
  SetDefaultParamTypes([dsInsert.Params, dsUpdate.Params]);
  inherited;
  Modified := False;
  sqlGetType.ParamValues['result'] := '';
end;

procedure DelChar(var aText: string; C : Char);
begin
  while (pos(c, aText) <> 0) do delete(aText, pos(c, aText), 1);
end;

procedure DelSymbols(aText : TcxDBTextEdit);
var
  dd : string;
begin
  dd := aText.Text;
  delChar(dd, '+');
  delChar(dd, '-');
  delChar(dd, 'e');
  delChar(dd, 'E');
  delChar(dd, '.');
  delChar(dd, ',');
  aText.Text := dd;
end;

// почему-то для некоторых контролов невозможно поставить обработчик Modify из предка...
procedure TBrokerForm.Modify(Sender: TObject);
begin
  DelSymbols(cxDBTextEdit4);
  DelSymbols(cxDBTextEdit3);
  inherited;
  Modified := True;
end;

procedure TBrokerForm.tabContractsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(fContractsForm) then
  begin
    ParamsHolder.Params.ParamByName('ID').AsFloat := dsdata.FieldValues['subject_id'];
    fContractsForm := ShowForm('TBrokerContractGridForm', Params, tabContracts);
  end;
end;

procedure TBrokerForm.FormShow(Sender: TObject);
begin
  inherited;
       tabFilial.TabVisible := True;
end;

procedure TBrokerForm.aSetTypeDeclarantExecute(Sender: TObject);
begin
   if MessageDlg('Вы уверены, что хотите перевести субъекта в декларанты?', mtConfirmation,
      [mbYes, mbNo], 0) =  mrYes  then
   begin
     sqlSetType.ParamValues['pType'] := 'Declarant';
     sqlSetType.ParamValues['pSubId'] := dsData.Fields.FieldByName('subject_id').AsFloat;
     try
        sqlSetType.Exec;
        sqlGetType.ParamValues['result'] := 'Declarant';
     except
         sqlGetType.ParamValues['result'] := 'Subject';
     end;
     RefreshData;
   end;
end;

procedure TBrokerForm.aSetTypePersonExecute(Sender: TObject);
begin
   if MessageDlg('Вы уверены, что хотите перевести субъекта в физ. лица?', mtConfirmation,
      [mbYes, mbNo], 0) =  mrYes  then
   begin
     sqlSetType.ParamValues['pType'] := 'Person';
     sqlSetType.ParamValues['pSubId'] := dsData.Fields.FieldByName('subject_id').AsFloat;
     try
      sqlSetType.Exec;
      sqlGetType.ParamValues['result'] := 'Person';
     except
         sqlGetType.ParamValues['result'] := 'Subject';
     end;
     RefreshData;
   end;
end;

procedure TBrokerForm.aSetTypeDeclarantUpdate(Sender: TObject);
begin
  inherited;
     (sender as TAction).Enabled := (sqlGetType.ParamValues['result']= 'Subject');
end;

procedure TBrokerForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
     sqlGetType.Exec('pSubId',dsData.FieldValues['subject_id'])
end;

procedure TBrokerForm.actNewUpdate(Sender: TObject);
begin
  inherited;
   (Sender as TAction).Enabled := False;
end;

initialization
  RegisterClass(TBrokerForm);

end.
