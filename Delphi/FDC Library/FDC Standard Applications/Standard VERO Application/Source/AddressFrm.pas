unit AddressFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, cxMaskEdit, cxButtonEdit, cxDBEdit,
  fdcObjectLinkEdit, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxTextEdit, cxPC, cxControls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TAddressForm = class(TObjectForm)
    edtOwnerObjectID: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtAddress: TcxDBMemo;
    lcGeneralItem3: TdxLayoutItem;
    dsDataOWNERNAME: TStringField;
    dsDataCOUNTRY_DICT_ID: TFloatField;
    dsDataCOUNTRYCODE: TStringField;
    dsDataCOUNTRYNAME: TStringField;
    cmbxCountryDictID: TcxDBLookupComboBox;
    lcGeneralItem2: TdxLayoutItem;
    dsDictCnt: TfdcQuery;
    dsDictCntID: TFloatField;
    dsDictCntName: TStringField;
    dsDictCntOWNERNAME: TStringField;
    dsDictCntCODE: TStringField;
    dsDictCntCODE2: TStringField;
    srcDictCnt: TDataSource;
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddressForm: TAddressForm;

implementation

{$R *.dfm}

procedure TAddressForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if IsNew then
  begin
    dsDataOWNER_OBJECT_ID.AsFloat := ParamByName('OMasterID').AsFloat;
    dsDataOWNERNAME.AsString := ParamByName('OMasterName').AsString;
  end;
end;

initialization
  RegisterClass(TAddressForm);

end.

