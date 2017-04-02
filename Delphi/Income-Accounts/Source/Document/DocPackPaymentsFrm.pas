unit DocPackPaymentsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxCurrencyEdit, cxButtonEdit, fdcObjectLinkEdit;

type
  TDocPackPaymentsForm = class(TDocPackForm)
    dsDataCURRENCY_ID: TFloatField;
    dsDataDESTCUSTOMSID: TFloatField;
    dsDataDATE_IN: TDateTimeField;
    dsDataDATE_OUT: TDateTimeField;
    dsDataCURRENCY_CODE: TStringField;
    dsDataCURRENCY_NAME: TStringField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataCUSTOMS_NAME: TStringField;
    lcGeneralGroup1: TdxLayoutGroup;
    lcGeneralGroup2: TdxLayoutGroup;
    itemValCode: TdxLayoutItem;
    itemValName: TdxLayoutItem;
    edtValCode: TcxDBTextEdit;
    edtValName: TcxDBTextEdit;
    edtCustomsCode: TcxDBTextEdit;
    itemCustomsCode: TdxLayoutItem;
    edtCustomsName: TcxDBTextEdit;
    itemCustomsName: TdxLayoutItem;
    dsDataSUMMA: TFloatField;
    edtSum: TcxDBCurrencyEdit;
    lcGeneralItem1: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    dsDataEXT_SOURCE: TStringField;
    dsDataSTATE_NAME: TStringField;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tabDocsShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetDocsFormClassName : string; override;
  public
    { Public declarations }
  end;

var
  DocPackPaymentsForm: TDocPackPaymentsForm;

implementation

uses fdcCustomDataFrm, MainDM, fdcCustomObjectFrm, PayOrderInPackGridFrm,
  fdcCustomDBDataFrm, fdcCustomCardFrm;

{$R *.dfm}

{ TDocPackPaymentsForm }

function TDocPackPaymentsForm.GetDocsFormClassName: string;
begin
  Result := 'TPayOrderInPackGridForm'
end;

procedure TDocPackPaymentsForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  if DataSet.FieldByName( 'EXT_SOURCE' ).AsString <> MainData.GetSoftCustomsCode then
    lcGeneral.LookAndFeel.GroupOptions.Color := MainData.stlDocPackAlien.Color
  else if DataSet.FieldByName( 'STATE_NAME' ).AsString = 'Отправлен' then
    lcGeneral.LookAndFeel.GroupOptions.Color := MainData.stlDocPackSended.Color
  else if DataSet.FieldByName( 'STATE_NAME' ).AsString = 'Подтвержден' then
    lcGeneral.LookAndFeel.GroupOptions.Color := MainData.stlDocPackConfirmed.Color
    ;

  inherited;
end;

procedure TDocPackPaymentsForm.FormCreate(Sender: TObject);
begin
  inherited;
  actDelete.Visible := MainData.EnableForceDropObject;
end;

procedure TDocPackPaymentsForm.tabDocsShow(Sender: TObject);
  var
    PackEnableEdit : boolean;
begin

  PackEnableEdit := (MainData.GetCustomsLevel in [0, 1]) // только для уровня ФТС и РТУ
                and not dsData.IsEmpty
                 //{для исходящих реестров на уровень КНП эти коды равны } and (dsDataCUSTOMS_CODE.Value <> MainData.GetCustomsCode) // и только для исходящих реестров
                and (   (dsStateSYSNAME.Value = 'State.PackPayments.Created' )// если  реестр в статусах State.PackPayments.Created, State.PackPayments.Formed
                     or (dsStateSYSNAME.Value = 'State.PackPayments.Formed' )
                     );        
  ParamsHolder.Params.ParamByName('PackEnableEdit').Value := PackEnableEdit;

  inherited;
  if not PackEnableEdit then
    (tabDocsForm as TPayOrderInPackGridForm).HideSelGridPanel;
end;

initialization
  RegisterClass( TDocPackPaymentsForm );
end.
