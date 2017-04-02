unit CustomChequeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderCreditFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  OracleData, QueryList, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDBEdit, dxLayoutControl,
  cxGroupBox, cxCheckBox, cxButtons, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxCalendar, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls;

type
  TCustomChequeForm = class(TPaymentOrderCreditForm)
    dsDataPAYSYSNAME: TStringField;
    edtPaySysName: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    dsDataCARDNUM: TStringField;
    edtCardNum: TcxDBMaskEdit;
    lcGeneralItem4: TdxLayoutItem;
    dsDataTK_ID: TStringField;
    showDT_NUMBER: TcxDBTextEdit;
    lcGeneralItem5: TdxLayoutItem;
    dsDataDT_NUM: TStringField;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataTK_IDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    function isCheque: boolean;
  public
    { Public declarations }
  end;

var
  CustomChequeForm: TCustomChequeForm;

implementation

{$R *.dfm}

procedure TCustomChequeForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tabBankInfo.Enabled:= isCheque and (359702 = DataSet.FieldByName('STATE_ID').AsInteger)
end;

procedure TCustomChequeForm.dsDataTK_IDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
const
 cTxt = '”никальный референс банковской операции: ';
 cTxt2 = 'ID/%s/';
begin
  inherited;
  if isCheque and (dsDataNOTE.AsString = '')  then
    Text:=  Format(cTxt2, [dsDataTK_ID.AsString] )
  else
   Text:= dsDataNOTE.AsString;
end;

function TCustomChequeForm.isCheque: boolean;
begin
 result:= 0=AnsiCompareStr('CustomCheque', dsData.FieldByName('TYPESYSNAME').AsString );
end;

initialization
  RegisterClass( TCustomChequeForm );
end.
