unit CertRecepientFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxCheckBox;

type
  TCertRecepientForm = class(TObjectForm)
    lciCustoms: TdxLayoutItem;
    editCustoms: TfdcObjectLinkEdit;
    lcisoft: TdxLayoutItem;
    editSoft: TfdcObjectLinkEdit;
    lciCertSubject: TdxLayoutItem;
    editCertSubject: TcxDBTextEdit;
    editis_active: TcxDBCheckBox;
    lciis_active: TdxLayoutItem;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataSOFT_ID: TFloatField;
    dsDataCERT_SUBJECT: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataSOFTNAME: TStringField;
    dsDataSOFTCODE: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CertRecepientForm: TCertRecepientForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TCertRecepientForm);

end.
