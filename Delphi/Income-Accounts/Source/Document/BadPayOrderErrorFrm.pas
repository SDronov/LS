unit BadPayOrderErrorFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, cxButtonEdit, cxDBEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxTextEdit, cxPC, cxControls, fdcObjectCore, cxCurrencyEdit;

type
  TBadPayOrderErrorForm = class(TObjectForm)
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    cxDBTextEdit3: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem4: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    cxDBMaskEdit1: TcxDBCurrencyEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    lcGeneralItem6: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem7: TdxLayoutItem;
    cxDBMaskEdit2: TcxDBCurrencyEdit;
    lcGeneralItem8: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataK92: TStringField;
    dsDataK93: TDateTimeField;
    dsDataSUMMA: TFloatField;
    dsDataK95: TFloatField;
    dsDataK_VAL: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataPAYMENT_ID: TFloatField;
    dsDataDK_PP_ID: TFloatField;
    procedure actSaveExecute(Sender: TObject);
    procedure dsUpdateBeforeOpen(DataSet: TDataSet);
    procedure fdcObjectLinkEdit1BeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  BadPayOrderErrorForm: TBadPayOrderErrorForm;

implementation

uses MainDm, fdcCustomObjectFrm, fdcCustomCardFrm, fdcCustomDataFrm,
  DictDm;

{$R *.dfm}

procedure TBadPayOrderErrorForm.actSaveExecute(Sender: TObject);
begin
//  inherited;
  dsUpdate.ExecSQL;
  Modified := False;
  ObjectServices.FreeObject(dsDataID.Value);
end;

procedure TBadPayOrderErrorForm.dsUpdateBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsUpdate.ParamByName('DECL_ID').Value := Params.ParamValues['DECL_ID'];
end;

procedure TBadPayOrderErrorForm.fdcObjectLinkEdit1BeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject <> nil then
  begin
  if AObject.FieldValues['REST_SUMMA'] < dsDataSUMMA.Value then
     raise Exception.Create('Не хватает средств');
  end;
end;

initialization
    RegisterClass(TBadPayOrderErrorForm);

end.
