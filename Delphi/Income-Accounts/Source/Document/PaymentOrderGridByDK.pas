unit PaymentOrderGridByDK;

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
  cxGridCustomView, cxGrid, dxLayoutControl, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxProgressBar,
  cxSpinEdit, cxLabel, dxStatusBar, cxCheckBox, cxCurrencyEdit, cxDBEdit,
  QueryList, Menus, cxMemo, cxCalc;


resourcestring
  sFixPPQuestion = 'Связать остальные списания?';
  sFixPPHint = 'Найдены другие списания с первоначального плат. документа,'
              + ' если вы хотите перевести их на выбранное платежное поручение,'
              + ' то выберите <Да>' ;
  sDebtHint = 'На платежном поручении осталось меньше средств, чем платеж,'
              +' если вы хотите перевести остаток списания в задолженность, то выберите <Да>.';
  sTrHint = 'На платежном поручении осталось меньше средств, чем платеж';

  sDebtQuestion = 'Перевести отстаток в задолженность?';
  sTrQuestion = 'Выберите другое платежное поручение!';
type
  TBadPayOrderErrorResolveForm = class(TPaymentOrderGridForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    lcGeneral: TdxLayoutControl;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBMaskEdit1: TcxDBCurrencyEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBMaskEdit2: TcxDBCurrencyEdit;
    dxLayoutGroup1: TdxLayoutGroup;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGeneralGroup3: TdxLayoutGroup;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralItem4: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    lcGeneralItem5: TdxLayoutItem;
    lcGeneralItem6: TdxLayoutItem;
    lcGeneralItem8: TdxLayoutItem;
    dsDKPP: TfdcQuery;
    srcDKPP: TDataSource;
    QueryList1: TQueryList;
    sqlResolve: TsqlOp;
    dsAllPP: TfdcQuery;
    sqlGetTypeSysName: TsqlOp;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actSearchOkUpdate(Sender: TObject);
    procedure dsDKPPBeforeOpen(DataSet: TDataSet);
    procedure actSearchOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormHide(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSearchCancelUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
  private
    { Private declarations }
    FQueryCount: Integer;
  public
    { Public declarations }
  end;

var
  BadPayOrderErrorResolveForm: TBadPayOrderErrorResolveForm;

implementation

uses fdcCustomGridFrm, MainDm, fdcMessages, Oracle, Math, fdcCustomDataFrm;

{$R *.dfm}

procedure TBadPayOrderErrorResolveForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if FQueryCount = 0 then
      SetSubsParam('USE_DK_PP', 1)
  else
      SetSubsParam('USE_DK_PP', 0);
  Inc(FQueryCount);
end;

procedure TBadPayOrderErrorResolveForm.FormShow(Sender: TObject);
begin
  inherited;
  Self.SearchTypeSysName := 'PaymentOrder';

//  splSearchCriteria.Visible := False;
//  pnlSearchCriteria.Visible := False;
  if edtINN.Text = '' then
  begin
    dsDKPP.Active := True;
    edtINN.Text := VarToStr(dsDKPP['INN']);
    edtKPP.Text := VarToStr(dsDKPP['KPP']);
    edtNomer.Text := VarToStr(dsDKPP['K92']);
    if not VarIsNull(dsDKPP['K93']) then  edtFromDate.Date := dsDKPP['K93'];
    edtCurrency.Text := VarToStr(dsDKPP['K_VAL']);
    edtToDate.Date := edtFromDate.Date;
    edtSumMin.Text := VarToStr(dsDKPP['K95']);
    edtSumMax.Text := edtSumMin.Text;
  end;
end;

procedure TBadPayOrderErrorResolveForm.actSearchOkUpdate(Sender: TObject);
begin
  if dsDataPAYER_ID.IsNull or (dsDataREST_SUMMA.Value <= 0.0) then TAction(Sender).Enabled := False
  else
    inherited;
end;

procedure TBadPayOrderErrorResolveForm.dsDKPPBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsDKPP.ParamByName('ID').Value := Params.ParamValues['ID'];
end;

procedure TBadPayOrderErrorResolveForm.actSearchOkExecute(Sender: TObject);
var
  DebtSumma: currency;
  PaySumma: currency;
  RestSumma: currency;
  Query: TOracleQuery;
  isMultiCharge : Boolean;
begin
  isMultiCharge := False;
  PaySumma  := dsDKPP['SUMMA'];
  DebtSumma := 0;
  RestSumma := dsDataREST_SUMMA.Value;

  sqlGetTypeSysName.Exec('DECL_ID',Params.ParamValues['DECL_ID']);

  if RestSumma < PaySumma then begin
    if ((sqlGetTypeSysName.ParamValues['RESULT']<>'TR')and(sqlGetTypeSysName.ParamValues['RESULT']<>'TrDuplicate')) Then
       begin
         if ConfirmDlg(sDebtQuestion, sDebtHint,  '') <> mrYes then
            Exit;
       end     
    else
       begin
         InfoDlg(sTrQuestion,sTrHint,'');
         Exit;
       end;
    DebtSumma := PaySumma - RestSumma;
    PaySumma  := dsDataREST_SUMMA.Value;
  end;
  RestSumma := RestSumma - PaySumma;

  if RestSumma > 0 then begin
    dsAllPP.Open;
    if not dsAllPP.Eof then
      case fdcMessages.MessageDlg(sFixPPQuestion, sFixPPHint, '', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
        mrYes    : isMultiCharge := True;
        mrCancel : Exit;
      end;
  end;

  try
    sqlResolve.Exec('DECL_ID;ID;PAYMENT_ID;SUM',
                    [Params.ParamValues['DECL_ID'], dsDKPP['DK_PP_ID'], dsDataID.Value, PaySumma]);
    if isMultiCharge then begin
//      Query := sqlGetAllPP.StealQuery;
      try
//        Query.First;
        while (not dsAllPP.Eof) and (RestSumma > 0) do begin
          PaySumma := dsAllPP.FieldByName('K94').AsCurrency;
          if RestSumma >= PaySumma then
            sqlResolve.Exec('DECL_ID;ID;PAYMENT_ID;SUM',
                            [dsAllPP.FieldByName('DECL_ID').AsFloat, dsAllPP.FieldByName('PP_ID').AsFloat, dsDataID.Value, PaySumma]);
          RestSumma := RestSumma - PaySumma;
          dsAllPP.Next;
        end;    // while
      finally
//        Query.Free;
      end;
    end;
  except
    sqlResolve.QueryList.Session.Rollback;
    raise;
  end;

  RefreshWaiters;
  inherited;
end;

procedure TBadPayOrderErrorResolveForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
;
end;

procedure TBadPayOrderErrorResolveForm.FormHide(Sender: TObject);
begin
  inherited;
;
end;

procedure TBadPayOrderErrorResolveForm.FormDestroy(Sender: TObject);
begin
  inherited;
;
end;

procedure TBadPayOrderErrorResolveForm.actSearchCancelUpdate(
  Sender: TObject);
begin
  //inherited;
  TAction(Sender).Visible := False;
end;

procedure TBadPayOrderErrorResolveForm.FormCreate(Sender: TObject);
begin
  inherited;
  edtName.Text := '';
  edtKPP.Text := '';
  edtINN.Text := '';
end;

procedure TBadPayOrderErrorResolveForm.actOpenExecute(Sender: TObject);
begin
  Params.ParamByName('pf_subject_Id').Value := dsDataSubject_Id.Value;
  ObjectServices.OpenObject(dsDataID.Value, Params);
end;

initialization
   RegisterClass(TBadPayOrderErrorResolveForm);

end.
