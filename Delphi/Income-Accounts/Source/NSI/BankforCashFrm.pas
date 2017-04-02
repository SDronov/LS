unit BankforCashFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxButtonEdit, fdcObjectLinkEdit, dxmdaset, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit;

type
  TBankforCashForm = class(TObjectForm)
    dsDataBANK_NAME: TStringField;
    dsDataBIC: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataBANK_ID: TFloatField;
    dsDataPAYMENT_TO_ORDER_RATIO: TStringField;
    dsDataFILE_FORMAT_CODE: TStringField;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    dxMemData1: TdxMemData;
    dxMemData1CODE: TStringField;
    dxMemData1NAME: TStringField;
    fdcObjectLookupEdit1: TfdcObjectLookupEdit;
    lcGeneralItem4: TdxLayoutItem;
    DataSource1: TDataSource;
    cxTabSheet1: TcxTabSheet;
    procedure cxTabSheet1Show(Sender: TObject);
  private
    { Private declarations }
    fcashdesk: TForm;
  public
    { Public declarations }
  end;

var
  BankforCashForm: TBankforCashForm;

implementation

uses MainDm, FormUtils;

{$R *.dfm}

procedure TBankforCashForm.cxTabSheet1Show(Sender: TObject);
begin
  inherited;
  ShowTabForm(fcashdesk,'TBankCashDeskGridForm',params,TWinControl(sender),nil);
end;

initialization
  RegisterClass(TBankforCashForm);

end.
