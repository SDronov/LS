unit BrokerContractFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxCheckBox, cxDropDownEdit, cxCalendar, fdcObjectCore, Oracle;

type
  TBrokerContractForm = class(TObjectForm)
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataBROKER_ID: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataCONTRACT_NO: TStringField;
    dsDataCONTRACT_DATE: TDateTimeField;
    dsDataBEGIN_DATE: TDateTimeField;
    dsDataEND_DATE: TDateTimeField;
    dsDataIS_AUTHORIZE: TStringField;
    dsDataBROKER_NAME: TStringField;
    dsDataBROKER_INN: TStringField;
    dsDataBROKER_KPP: TStringField;
    dsDataSUBJECT_TYPENAME: TStringField;
    dsDataSUBJECT_NAME: TStringField;
    dsDataSUBJECT_INN: TStringField;
    dsDataSUBJECT_KPP: TStringField;
    dsDataSUBJECT_DOC: TStringField;
    lcgBroker: TdxLayoutGroup;
    edtBrokerINN: TcxDBMaskEdit;
    lciBrokerINN: TdxLayoutItem;
    edtBrokerKPP: TcxDBMaskEdit;
    lciBrokerKPP: TdxLayoutItem;
    edtBrokerName: TfdcObjectLinkEdit;
    lciBrokerName: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    lcgSubject: TdxLayoutGroup;
    lciSubjectINN: TdxLayoutItem;
    edtSubjectINN: TcxDBMaskEdit;
    lciSubjectKPP: TdxLayoutItem;
    edtSubjectKPP: TcxDBMaskEdit;
    lciSubjectName: TdxLayoutItem;
    edtSubjectName: TfdcObjectLinkEdit;
    lcGeneralGroup2: TdxLayoutGroup;
    edtSubjectType: TcxDBTextEdit;
    lciSybjectType: TdxLayoutItem;
    lcgContract: TdxLayoutGroup;
    edtContractNo: TcxDBTextEdit;
    lciContractNo: TdxLayoutItem;
    edtContractDate: TcxDBDateEdit;
    lciContractDate: TdxLayoutItem;
    edtBeginDate: TcxDBDateEdit;
    lciBeginDate: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    edtEndDate: TcxDBDateEdit;
    lciEndDate: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    edtIsAuthorize: TcxDBCheckBox;
    lcGeneralItem1: TdxLayoutItem;
    edtSubjectDoc: TcxDBTextEdit;
    lciSubjectDoc: TdxLayoutItem;
    qryGetSubjectDoc: TOracleQuery;
    procedure edtBrokerNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtSubjectNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtBrokerINNKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrokerContractForm: TBrokerContractForm;

implementation

uses
  MainDM;

{$R *.dfm}

procedure TBrokerContractForm.edtBrokerNameBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;

  if AObject = nil then
    begin
      dsDataBROKER_INN.Clear;
      dsDataBROKER_KPP.Clear;
    end
  else
    begin
      dsData['BROKER_INN'] := AObject.FieldValues['INN'];
      dsData['BROKER_KPP'] := AObject.FieldValues['KPP'];
    end;
end;

procedure TBrokerContractForm.edtSubjectNameBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;

  if AObject = nil then
    begin
      dsDataSUBJECT_INN.Clear;
      dsDataSUBJECT_KPP.Clear;
    end
  else
    begin
      dsData['SUBJECT_INN'] := AObject.FieldValues['INN'];
      dsData['SUBJECT_KPP'] := AObject.FieldValues['KPP'];
      if AObject.FieldValues['TYPESYSNAME'] = 'Person' then
        begin
          dsData['SUBJECT_TYPENAME'] := 'тк';

          qryGetSubjectDoc.SetVariable( 'id', AObject.FieldValues['ID'] );
          qryGetSubjectDoc.Execute;
          dsData['SUBJECT_DOC'] := qryGetSubjectDoc.GetVariable( 'res' );
        end
      else
        begin
          dsData['SUBJECT_TYPENAME'] := 'чк';
          dsDataSUBJECT_DOC.Clear;
        end;
    end;
end;

procedure TBrokerContractForm.edtBrokerINNKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  Modify( Sender );
end;

initialization
  RegisterClass( TBrokerContractForm );

end.
