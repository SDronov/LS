unit AddReuseDeductionWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWizardFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxImage,
  ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  DB, OracleData, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxDBEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit;

type
  TAddReuseDeductionWizardForm = class(TBaseWizardForm)
    dsetPayments: TOracleDataSet;
    dsPayments: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl2Item1: TdxLayoutItem;
    dsetPaymentsID: TFloatField;
    dsetPaymentsDOC_TYPE_NAME: TStringField;
    dsetPaymentsDOC_NUMBER: TStringField;
    dsetPaymentsDOC_DATE: TDateTimeField;
    dsetPaymentsDOC_SUMMA: TFloatField;
    dsetPaymentsSUMMA: TFloatField;
    dsetPaymentsAVAILABLE_AMOUNT: TFloatField;
    cxGrid1DBTableView1DOC_TYPE_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1DOC_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1DOC_DATE: TcxGridDBColumn;
    cxGrid1DBTableView1DOC_SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1AVAILABLE_AMOUNT: TcxGridDBColumn;
    tabAmount: TcxTabSheet;
    dxLayoutControl3: TdxLayoutControl;
    cxLabel3: TcxLabel;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutControl3Item1: TdxLayoutItem;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutControl3Item2: TdxLayoutItem;
    dxLayoutControl3Group1: TdxLayoutGroup;
    cxDBDateEdit1: TcxDBDateEdit;
    dxLayoutControl3Item3: TdxLayoutItem;
    dsetPaymentsREUSE_AMOUNT: TFloatField;
    tabKBKs: TcxTabSheet;
    dsetKbks: TOracleDataSet;
    dsKbks: TDataSource;
    dsetKbksPAYMENT_ID: TFloatField;
    dsetKbksKBK_ID: TFloatField;
    dsetKbksKBK_NAME: TStringField;
    dsetKbksREST_MONEY: TFloatField;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2DBTableView1PAYMENT_ID: TcxGridDBColumn;
    cxGrid2DBTableView1KBK_ID: TcxGridDBColumn;
    cxGrid2DBTableView1KBK_NAME: TcxGridDBColumn;
    cxGrid2DBTableView1REST_MONEY: TcxGridDBColumn;
    dxLayoutControl3Group3: TdxLayoutGroup;
    cxRestAmountEdit: TcxDBCurrencyEdit;
    dxLayoutControl3Item7: TdxLayoutItem;
    edtReuseAmount: TcxCurrencyEdit;
    dxLayoutControl3Item8: TdxLayoutItem;
    cxGrid1DBTableView1IS_TS: TcxGridDBColumn;
    dsetPaymentsIS_TS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dsetPaymentsApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    fReuseID: Integer;
    fPaymentID: Integer;
    //fRestAmount: Variant;
    procedure SetReuseID(const Value: Integer);
    procedure SetPaymentID(const Value: Integer);
    function GetPaymentID: Integer;
    function GetKbkCodeID: Integer;
    function GetAmount: Double;
  public
    { Public declarations }
    property ReuseID   : Integer read fReuseID write SetReuseID;
    property PaymentID : Integer read GetPaymentID write SetPaymentID;
    property Amount    : Double  read GetAmount;
    property KbkCodeID : Integer read GetKbkCodeID;
  published
    procedure tabGeneralFinishUpdate(Sender: TObject);
    procedure tabGeneralNextUpdate(Sender: TObject);
    procedure tabGeneralNextExecute(Sender: TObject);
    procedure tabKBKsNextUpdate(Sender: TObject);
    procedure tabKBKsNextExecute(Sender: TObject);
    procedure tabAmountFinishUpdate(Sender: TObject);
    procedure tabAmountPrevExecute(Sender: TObject);
    procedure tabAmountNextUpdate(Sender: TObject);
  end;

var
  AddReuseDeductionWizardForm: TAddReuseDeductionWizardForm;

implementation

{$R *.dfm}

uses
  MainDM, fdcCustomWizardFrm, fdcCustomTabDlgFrm, fdcMessages,
  cxGridDBDataDefinitions, fdcCustomDlgFrm;

procedure TAddReuseDeductionWizardForm.FormCreate(Sender: TObject);
begin
  inherited;

  fReuseID := -1;
end;

procedure TAddReuseDeductionWizardForm.SetReuseID(const Value: Integer);
begin
  fReuseID := Value;

  if fReuseID <> -1 then
    begin
      dsetPayments.SetVariable( 'doc_id', fReuseID );
      if not dsetPayments.Active then
        dsetPayments.Open;
    end;
end;

procedure TAddReuseDeductionWizardForm.SetPaymentID(const Value: Integer);
begin
  fPaymentID := Value;

  if fPaymentID <> -1 then
    begin
      dsetKbks.SetVariable( 'doc_id', fReuseID );
      dsetKbks.SetVariable( 'payment_id', fPaymentID );
      if dsetKbks.Active then dsetKbks.Close;
      dsetKbks.Open;
    end;
end;


procedure TAddReuseDeductionWizardForm.dsetPaymentsApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  inherited;

  Applied := True;
end;

procedure TAddReuseDeductionWizardForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if not actNext.Enabled then Exit;

  actNext.Execute;
end;



// General
procedure TAddReuseDeductionWizardForm.tabGeneralFinishUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := False;  // ???
end;

procedure TAddReuseDeductionWizardForm.tabGeneralNextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsetPayments.Active
                             and not dsetPayments.IsEmpty;
end;

procedure TAddReuseDeductionWizardForm.tabGeneralNextExecute(Sender: TObject);
begin
  PaymentID := dsetPaymentsID.AsInteger;

  PageControl.ActivePage := tabKBKs;
end;


// KBKs
procedure TAddReuseDeductionWizardForm.tabKBKsNextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsetKbks.Active
                             and not dsetKbks.IsEmpty
                             and (cxGrid2DBTableView1.Controller.SelectedRecordCount > 0);
end;

procedure TAddReuseDeductionWizardForm.tabKBKsNextExecute(Sender: TObject);
begin
  //dsetKbks.Edit;
  //edtReuseAmount.Value := dsetKbks.FieldByName( 'REST_MONEY' ).AsFloat;
  PageControl.ActivePage := tabAmount;
end;

// Amount
procedure TAddReuseDeductionWizardForm.tabAmountNextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := False;
end;

procedure TAddReuseDeductionWizardForm.tabAmountPrevExecute(Sender: TObject);
begin
  //if dsetKbks.State = dsEdit then dsetKbks.Cancel;
  PageControl.ActivePage := tabKBKs;
end;

procedure TAddReuseDeductionWizardForm.tabAmountFinishUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsetPayments.Active
                             and not dsetPayments.IsEmpty
                             and dsetKbks.Active
                             and not dsetKbks.IsEmpty
                             and (edtReuseAmount.EditingValue <= dsetKbks.FieldByName( 'REST_MONEY' ).AsFloat)
                             //and (edtReuseAmount.EditingValue dsetPayments.FieldByName( 'REUSE_AMOUNT' ).AsFloat <= dsetPayments.FieldByName( 'AVAILABLE_AMOUNT' ).AsFloat)
                             and (edtReuseAmount.EditingValue > 0);
                             //and (dsetPayments.FieldByName( 'REUSE_AMOUNT' ).AsFloat >= 0);
end;


function TAddReuseDeductionWizardForm.GetPaymentID: Integer;
begin
  if not dsetPayments.Active
     or dsetPayments.IsEmpty then
    Exit;

  dsetPayments.CheckBrowseMode;
  Result := dsetPayments.FieldByName( 'ID' ).AsInteger;
end;

function TAddReuseDeductionWizardForm.GetAmount: Double;
begin
  if not dsetKbks.Active
     or dsetKbks.IsEmpty then
    Exit;

  dsetKbks.CheckBrowseMode;
  Result := edtReuseAmount.Value; //dsetKbks.FieldByName('REST_MONEY').AsFloat;
end;

function TAddReuseDeductionWizardForm.GetKbkCodeID: Integer;
begin
  if not dsetKbks.Active
     or dsetKbks.IsEmpty then
    Exit;

  dsetKbks.CheckBrowseMode;
  Result := dsetKbks.FieldByName('KBK_ID').AsInteger;
end;


end.
