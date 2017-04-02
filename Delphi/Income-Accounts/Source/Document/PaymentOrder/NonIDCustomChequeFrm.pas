unit NonIDCustomChequeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderNonIDFrm, cxGraphics, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxCheckBox, cxDBEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit,
  cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls;

type
  TNonIDCustomChequeForm = class(TPaymentOrderNonIDForm)
    dsDataPAYSYSNAME: TStringField;
    edtPaySysName: TcxDBMaskEdit;
    lciPaySysName: TdxLayoutItem;
    dsDataCARDNUM: TStringField;
    lcCardNum: TdxLayoutItem;
    edtCardNum: TcxDBMaskEdit;
    dsDataDT_NUM: TStringField;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NonIDCustomChequeForm: TNonIDCustomChequeForm;

implementation

{$R *.dfm}

initialization
  RegisterClass( TNonIDCustomChequeForm );
end.
