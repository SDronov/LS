unit ActCorrectOperBalansTranFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxGraphics, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit, cxCalendar, Oracle,
  OracleData, cxCheckBox;

type
  TActCorrectOperBalansTranForm = class(TObjectForm)
    lcgDocument: TdxLayoutGroup;
    lcgTrans: TdxLayoutGroup;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataACT_ID: TFloatField;
    dsDataDOC_ID: TFloatField;
    dsDataKBK_ID: TFloatField;
    dsDataPAYMENT_TYPE_ID: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataACCOUNT_ID: TFloatField;
    dsDataIS_DEBIT: TStringField;
    dsDataOPERATION_SUM: TFloatField;
    dsDataIS_TS: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataACCOUNT_CODE: TStringField;
    dsDataKBK_CODE: TStringField;
    dsDataSUBJECT_NAME: TStringField;
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_TYPESYSNAME: TStringField;
    dsDataDOC_TYPENAME: TStringField;
    dsDataDOC_SUBJECT: TStringField;
    dsDataDOC_SUMM: TFloatField;
    lcieditSubject: TdxLayoutItem;
    edtSubject: TfdcObjectLinkEdit;
    editAccount: TcxDBLookupComboBox;
    lcieditAccount: TdxLayoutItem;
    dsAccount: TfdcQuery;
    srcAccount: TDataSource;
    dsAccountID: TFloatField;
    dsAccountCODE: TStringField;
    dsAccountTO_LEVEL_SIGN: TStringField;
    lcieditKBK: TdxLayoutItem;
    editKBK: TcxDBLookupComboBox;
    dsKBK: TfdcQuery;
    srcKBK: TDataSource;
    dsKBKID: TFloatField;
    dsKBKKBK: TStringField;
    dsKBKTYPEPAYMENT: TStringField;
    lcieditSumma: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    lciedtActivationDate: TdxLayoutItem;
    edtActivationDate: TcxDBDateEdit;
    dsKBKSDATE: TDateTimeField;
    dsKBKEDATE: TDateTimeField;
    editDoc_typename: TcxDBTextEdit;
    lciDoc_typename: TdxLayoutItem;
    lcieditDocNumber: TdxLayoutItem;
    editDocNumber: TfdcObjectLinkEdit;
    lcieditDocDate: TdxLayoutItem;
    editDocDate: TcxDBTextEdit;
    lcieditDocSubject: TdxLayoutItem;
    editDocSubject: TcxDBTextEdit;
    lcieditDocSumma: TdxLayoutItem;
    editDocSumma: TcxDBTextEdit;
    dsDocument: TfdcQuery;
    dsDocumentID: TFloatField;
    dsDocumentNAME: TStringField;
    dsDocumentTYPESYSNAME: TStringField;
    dsDocumentTYPENAME: TStringField;
    dsDocumentDOC_NUMBER: TStringField;
    dsDocumentDOC_DATE: TDateTimeField;
    editIsts: TcxDBCheckBox;
    lcieditIsts: TdxLayoutItem;
    editIsdebit: TcxDBComboBox;
    lcieditIsdebit: TdxLayoutItem;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataBeforeClose(DataSet: TDataSet);
    procedure dsAccountBeforeOpen(DataSet: TDataSet);
    procedure dsKBKBeforeOpen(DataSet: TDataSet);
    procedure editDocNumberAfterAcceptObject(Sender: TObject);
    procedure dsInsertBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure setdocdata(pdocid: Double);
  public
    { Public declarations }
  end;

var
  ActCorrectOperBalansTranForm: TActCorrectOperBalansTranForm;

implementation

uses fdcCustomDataFrm, fdcCustomCardFrm, fdcCustomDBDataFrm,
  fdcCustomObjectFrm;

{$R *.dfm}

procedure TActCorrectOperBalansTranForm.setdocdata(pdocid: Double);
begin
  dsDataDOC_ID.AsFloat := pdocid;
  if (Assigned(ParamsHolder.Params.FindParam('reldocid'))) then
    begin
      ParamsHolder.Params.ParamByName('reldocid').AsFloat := pdocid;
    end;
  dsDocument.Close;
  dsDocument.ParamByName('docid').Value := pdocid;
  dsDocument.Open;
  if (TDataSet(dsDocument).Eof) then
    begin
      dsDataDOC_NUMBER.AsString := '';
      dsDataDOC_DATE.AsString := '';
      dsDataDOC_TYPESYSNAME.AsString := '';
      dsDataDOC_TYPENAME.AsString := '';
      dsDataDOC_ID.AsString := '';
    end
  else
    begin
      dsDataDOC_NUMBER.Value := dsDocumentDOC_NUMBER.Value;
      dsDataDOC_DATE.Value := dsDocumentDOC_DATE.Value;
      dsDataDOC_TYPESYSNAME.Value := dsDocumentTYPESYSNAME.Value;
      dsDataDOC_TYPENAME.Value := dsDocumentTYPENAME.Value;
    end;
  dsDocument.Close;
end;

procedure TActCorrectOperBalansTranForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsAccount.Open;
  dsKBK.Open;
end;

procedure TActCorrectOperBalansTranForm.dsDataBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  if (dsAccount.Active) then
    begin
      dsAccount.Close;
    end;
  if (dsKBK.Active) then
    begin
      dsKBK.Close;
    end;
end;

procedure TActCorrectOperBalansTranForm.dsAccountBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfdcQuery(DataSet).ParamByName('accountid').AsFloat := dsDataACCOUNT_ID.AsFloat;
  TfdcQuery(DataSet).ParamByName('balanstype').AsInteger := ParamsHolder.Params.ParamByName('balans_type').AsInteger;
  case TfdcQuery(DataSet).ParamByName('balanstype').AsInteger of
    0: TfdcObjectLinkEditDataBinding(edtSubject.DataBinding).TypeSysName := 'Declarant;Person;Subject;Bank;Customs';
    else TfdcObjectLinkEditDataBinding(edtSubject.DataBinding).TypeSysName := 'Customs';
  end;
end;

procedure TActCorrectOperBalansTranForm.dsKBKBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//  TfdcQuery(DataSet).ParamByName('kbkid').AsFloat := dsDataKBK_ID.AsFloat;
end;

procedure TActCorrectOperBalansTranForm.editDocNumberAfterAcceptObject(
  Sender: TObject);
begin
  inherited;
  //--
  dsDataDOC_SUBJECT.AsString := '';
  dsDataDOC_SUMM.AsString := '';
  if (dsDataDOC_ID.IsNull) then
    begin
      dsDataDOC_NUMBER.AsString := '';
      dsDataDOC_DATE.AsString := '';
      dsDataDOC_TYPESYSNAME.AsString := '';
      dsDataDOC_TYPENAME.AsString := '';
    end
  else
    begin
      setdocdata(dsDataDOC_ID.AsFloat);
    end;
  //--
end;

procedure TActCorrectOperBalansTranForm.dsInsertBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if (dsDataACT_ID.IsNull) then
    begin
      dsDataACT_ID.Value := ParamsHolder.Params.ParamByName('act_id').Value;
    end;
end;

procedure TActCorrectOperBalansTranForm.FormShow(Sender: TObject);
begin
  inherited;
  if (GetIsNew) then
    begin
      if (Assigned(ParamsHolder.Params.FindParam('reldocid'))) then
         begin
           setdocdata(ParamsHolder.Params.ParamByName('reldocid').AsFloat);
         end;
    end;
end;

procedure TActCorrectOperBalansTranForm.FormCreate(Sender: TObject);
begin
  inherited;
  edtSumma.Properties.MaxValue := edtSumma.Properties.MinValue;
end;

initialization
  RegisterClass(TActCorrectOperBalansTranForm);

end.
