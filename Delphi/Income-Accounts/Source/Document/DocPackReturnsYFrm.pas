unit DocPackReturnsYFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxCalendar, DocPackFrm, cxButtonEdit, fdcObjectLinkEdit,
  cxCurrencyEdit;

type
  TDocPackReturnsYForm = class(TDocPackForm)
    dsDataDATE_INCOMING: TDateTimeField;
    edtDateIncoming: TcxDBDateEdit;
    lcGeneralItem1: TdxLayoutItem;
    tabNDocs: TcxTabSheet;
    dsDataDESTINATION: TStringField;
    itemAdress: TdxLayoutItem;
    fdcCustomNameIN: TfdcObjectLinkEdit;
    lcGrpAdress: TdxLayoutGroup;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataCUSTOMS_NAME: TStringField;
    dsDataCLAIMED_DOC_COUNT: TIntegerField;
    dsDataCLAIMED_SPENDING: TFloatField;
    edtDocCount: TcxDBTextEdit;
    lciDocCount: TdxLayoutItem;
    edtDocSumma: TcxDBCurrencyEdit;
    lciDocSumma: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    procedure FormCreate(Sender: TObject);
    procedure tabDocsShow(Sender: TObject);
    procedure tabNDocsShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure fdcCustomNameINPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure fdcSrcAppNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    fDocsNForm : TForm;
  protected
    function GetDocsFormClassName : string; override;
  public
  end;

implementation

{$R *.dfm}

uses
  MainDM
 ,fdcCustomDBDataFrm
 ,fdcCustomObjectFrm
 ,FormUtils;

procedure TDocPackReturnsYForm.FormCreate(Sender: TObject);
begin
  inherited;

  fDocsNForm := nil;
end;

function TDocPackReturnsYForm.GetDocsFormClassName: string;
begin
  Result := 'TfReturnsYByPackGridForm';
end;

procedure TDocPackReturnsYForm.tabDocsShow(Sender: TObject);
begin
{  if not Assigned( Params.FindParam( 'read_only' ) ) then
    Params.CreateParam( ftString, 'read_only', ptInput ).AsString := 'Y';
}
  inherited;
end;

procedure TDocPackReturnsYForm.tabNDocsShow(Sender: TObject);
begin
  inherited;

  if not Assigned( fDocsNForm ) then
    fDocsNForm := ShowForm( 'TD08ByPackGridForm', Params, tabNDocs );
end;

procedure TDocPackReturnsYForm.dsDataAfterOpen(DataSet: TDataSet);
  var
    i : Integer;
begin
  inherited;
   for i:= 0 to btnStateTransit.ItemLinks.Count - 1 do
    if (btnStateTransit.ItemLinks[i].Item.Caption = 'Сформирован -> Отправлен')
    or (     (btnStateTransit.ItemLinks[i].Item.Caption = 'Получен -> Обработан')
         and (MainData.GetCustomsLevel = 2)) then
      begin
        btnStateTransit.ItemLinks[i].Item.Enabled := False;
        Break;
      end;
  if    IsNew
     or (dsState.FieldByName( 'SysName' ).AsString = 'State.PackReturnsY.Created') then
    begin
      itemAdress.Tag     := 0;
      itemDstAppName.Tag := 0;
      {fdcCustomNameIN.Properties.ReadOnly := False;
      fdcDstAppName.Properties.ReadOnly   := False;
      srcData.AutoEdit := True;}
    end
  else
    begin
      itemAdress.Tag     := 33;
      itemDstAppName.Tag := 33;
      {fdcCustomNameIN.Properties.ReadOnly := True;
      fdcDstAppName.Properties.ReadOnly   := True;
      srcData.AutoEdit := False;}
    end;
  UpdateLayoutControl(IsNew, lcGeneral);
end;

procedure TDocPackReturnsYForm.fdcCustomNameINPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if not (   IsNew
          or (dsState.FieldByName( 'SysName' ).AsString = 'State.PackReturnsY.Created')) then
    Abort;          
end;

procedure TDocPackReturnsYForm.fdcSrcAppNamePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  Abort;
end;

initialization
  RegisterClass( TDocPackReturnsYForm );

end.
