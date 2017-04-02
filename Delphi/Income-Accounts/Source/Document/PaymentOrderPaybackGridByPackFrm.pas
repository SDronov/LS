unit PaymentOrderPaybackGridByPackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalendar, cxCheckBox, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit,
  cxLabel, dxStatusBar, QueryList, Oracle;

type
  TPayment_Order_PaybackGridByPackForm = class(TDocumentGridForm)
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataNAME_P: TStringField;
    dsDataINN_P: TStringField;
    dsDataKPP_P: TStringField;
    dsDataBIK_P: TStringField;
    dsDataACCOUNT_P: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataNREF: TStringField;
    dsDataRECIPIENT_ID: TFloatField;
    dsDataNAME_K: TStringField;
    dsDataINN_K: TStringField;
    dsDataKPP_K: TStringField;
    dsDataBIC_K: TStringField;
    dsDataACCOUNT_K: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataNOTE: TStringField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataNLS: TStringField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBK: TStringField;
    dsDataDEC_PAY_ID: TFloatField;
    dsDataSEQ_PAYMENT: TStringField;
    dsDataKIND_PAYMENT: TStringField;
    dsDataIS_TS: TStringField;
    dsDataKBK_OLD: TStringField;
    dsDataDESTCUSTOMSCODE_OLD: TStringField;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn;
    pkgDocPackReturns: TOraclePackage;
    QueryList1: TQueryList;
    sqlCheckDocToReestr: TsqlOp;
    sqlGetDocPackExtSource: TsqlOp;
    sqlGetIsTS: TsqlOp;
    actFormPack: TAction;
    barBtnFormPack: TdxBarButton;
    actWork: TAction;
    dxBarButton3: TdxBarButton;
    qlPOG: TQueryList;
    sqlSetStatusWork: TsqlOp;
    sqlGetDebts: TsqlOp;
    actOpenDecision: TAction;
    barOpenDecision: TdxBarButton;
    procedure actDeleteExecute(Sender: TObject);
    procedure actFormPackExecute(Sender: TObject);
    procedure actFormPackUpdate(Sender: TObject);
    procedure actWorkExecute(Sender: TObject);
    procedure actOpenDecisionUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actOpenDecisionExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
  private
    { Private declarations }
    fDocPackExtSource : string;
  public
    { Public declarations }
  end;

var
  Payment_Order_PaybackGridByPackForm: TPayment_Order_PaybackGridByPackForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TPayment_Order_PaybackGridByPackForm.actDeleteExecute(
  Sender: TObject);
  var
    i : integer;
    s : string;
begin
  if grdDataDBBandedTableView.Controller.SelectedRowCount = 1 then
    s := 'Исключить документ ' + dsData.FieldByName( 'doc_number' ).AsString + ' от ' + FormatDateTime( 'DD.MM.YYYY', dsData.FieldByName( 'DOC_DATE' ).AsDateTime ) + ' из реестра?'
  else
    s := 'Исключить выбранные(' + IntToStr(grdDataDBBandedTableView.Controller.SelectedRowCount) + 'шт.) документы из реестра?';
  if MessageDlg( s,
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
    begin
      with  grdDataDBBandedTableView.Controller do
      if SelectedRowCount > 0 then
        for i := 0 to SelectedRecordCount-1 do
        begin
          pkgDocPackReturns.CallProcedure( 'RemoveDoc', [ ParamByName( 'pack_id' ).AsInteger, SelectedRecords[i].Values[grdDataDBBandedTableViewID.Index] ] );
        end;
      RefreshData;
    end;
end;

procedure TPayment_Order_PaybackGridByPackForm.actFormPackExecute(
  Sender: TObject);
  var
    NoY :Integer;
    NoW :Integer;
begin
  sqlGetIsTS.Exec('id',[ParamByName( 'pack_id' ).AsInteger]);
  sqlCheckDocToReestr.Exec('Is_TS',[sqlGetIsTS.ParamValues['result']]);
  NoY := sqlCheckDocToReestr.ParamValues['pNoY'];
  NoW := sqlCheckDocToReestr.ParamValues['pNoW'];
  If    ( NoY + NoW = 0 )
     or (MessageDlg('Не включенных - '+IntToStr(NoY)+' Не обработанные - ' +IntToStr(NoW)+'. Продолжить?', mtInformation,
                    [mbYes, mbNo],0) = mrYes) then
    begin
      pkgDocPackReturns.CallProcedure( 'FormPackage', [ParamByName( 'pack_id' ).AsInteger] );
      RefreshData;
    end;
end;

procedure TPayment_Order_PaybackGridByPackForm.actFormPackUpdate(
  Sender: TObject);
begin
  TAction(Sender).Visible := not dsData.ParamByName( 'pack_id' ).IsNull
                         and ( fDocPackExtSource = MainData.GetSoftCustomsCode );

  TAction(Sender).Enabled := TAction(Sender).Visible;
end;

procedure TPayment_Order_PaybackGridByPackForm.actWorkExecute(
  Sender: TObject);
var i : integer;
    j : integer;
begin
{ sqlSetStatusWork.Exec;
 i := sqlSetStatusWork.ParamValues['result'];
 MessageDlg('Обработано  '+IntToStr(i)+' заявок на возврат.', mtInformation,[mbYes],0);}

  if grdDataDBBandedTableView.Controller.SelectedRowCount = 1 then
  begin
    if MessageDlg( 'Обработать документ '+dsData.FieldByName( 'doc_no' ).AsString + ' от ' + FormatDateTime( 'DD.MM.YYYY', dsData.FieldByName( 'DOC_DATE' ).AsDateTime ) +'?',
                    mtConfirmation,
                    [mbYes, mbNo],
                    0 ) = mrYes then
    begin
      with  grdDataDBBandedTableView.Controller do
      sqlSetStatusWork.Exec('pId',dsData.FieldByName( 'ID' ).AsInteger);
      dsData.Session.Commit;
      RefreshData;
    end;
  end
  else
  begin
     j:= 0;
    if MessageDlg('Обработать выбранные документы ('+IntToStr(grdDataDBBandedTableView.Controller.SelectedRowCount)+'шт.)?',
                  mtConfirmation,
                  [mbYes, mbNo],
                  0 ) = mrYes then
    begin
      with  grdDataDBBandedTableView.Controller do
      if SelectedRowCount > 0 then
        		for i := 0 to SelectedRecordCount-1 do
        		begin
               try
          		   sqlSetStatusWork.Exec('pId',SelectedRecords[i].Values[grdDataDBBandedTableViewID.Index]);
          		   dsData.Session.Commit;
      			except
        				dsData.Session.Rollback;
        				j := j + 1;
               end;
        		end;
            if j > 0 Then
               MessageDlg('Не обработано заявок на возврат ('+IntToStr(j)+'шт.).', mtInformation,[mbYes],0);
            RefreshData;
      end;
  end;
end;

procedure TPayment_Order_PaybackGridByPackForm.actOpenDecisionUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and ( grdDataDBBandedTableView.Controller.SelectedRowCount > 0 );
end;

procedure TPayment_Order_PaybackGridByPackForm.dsDataAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if dsData.ParamByName( 'pack_id' ).IsNull then
    fDocPackExtSource := ''
  else
    fDocPackExtSource := sqlGetDocPackExtSource.Exec( 'id', dsData.ParamByName( 'pack_id' ).AsFloat );
end;

procedure TPayment_Order_PaybackGridByPackForm.actOpenDecisionExecute(
  Sender: TObject);
begin
  if not (    dsData.Active
          and not dsData.IsEmpty
          and ( grdDataDBBandedTableView.Controller.SelectedRowCount > 0 ) ) then
    Exit;

  ObjectServices.OpenObject( dsDataDEC_PAY_ID.AsFloat, nil );
end;

procedure TPayment_Order_PaybackGridByPackForm.actDeleteUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := not dsData.ParamByName( 'pack_id' ).IsNull
                         and dsData.Active
                         and not dsData.IsEmpty;
  TAction(Sender).Visible := not dsData.ParamByName( 'pack_id' ).IsNull
                         and ( fDocPackExtSource = MainData.GetSoftCustomsCode );
end;

initialization
  RegisterClass(TPayment_Order_PaybackGridByPackForm);

end.
