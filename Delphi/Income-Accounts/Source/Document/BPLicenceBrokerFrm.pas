unit BPLicenceBrokerFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, fdcObjectCore;

type
  TBPLicenceBrokerForm = class(TObjectForm)
    dsDataFULL_NAME: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataBROKER_ID: TFloatField;
    dsDataFROM_DATE: TDateTimeField;
    dsDataTO_DATE: TDateTimeField;
    lcgBroker: TdxLayoutGroup;
    lcgPeriod: TdxLayoutGroup;
    lciDeclName: TdxLayoutItem;
    edtDeclName: TfdcObjectLinkEdit;
    lciDeclINN: TdxLayoutItem;
    edtDeclINN: TcxDBMaskEdit;
    lciKPP: TdxLayoutItem;
    edtDeclKPP: TcxDBMaskEdit;
    lcGeneralGroup1: TdxLayoutGroup;
    lciFrom: TdxLayoutItem;
    edtBeginDate: TcxDBDateEdit;
    lciTo: TdxLayoutItem;
    edtEndDate: TcxDBDateEdit;
    dsDataBROK_NAME: TStringField;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure edtDeclNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetSupportedTypeSysName: string; override;
  public
    { Public declarations }
  end;

var
  BPLicenceBrokerForm: TBPLicenceBrokerForm;

implementation

uses fdcCustomCardFrm, fdcCustomDataFrm, fdcCustomDBDataFrm,
  fdcCustomObjectFrm;

{$R *.dfm}

{ TBPLicenceBrokerForm }

function TBPLicenceBrokerForm.GetSupportedTypeSysName: string;
begin
 //  Result := 'Broker';
  Result := 'Subject';
end;

procedure TBPLicenceBrokerForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsInsert.ParamByName('LICENCE_ID').AsInteger := dsData.ParamByName('LICENCE_ID').AsInteger;
  dsUpdate.ParamByName('LICENCE_ID').AsInteger := dsData.ParamByName('LICENCE_ID').AsInteger;
  edtDeclName.Properties.Buttons.Items[0].Visible := Self.IsNew;
end;

procedure TBPLicenceBrokerForm.edtDeclNameBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if not Self.IsNew then
  begin
    Accept := False;
    Exit;
  end;
  if AObject = nil then
  begin
     dsDataINN.Clear;
     dsDataKPP.Clear;
  end
  else
  begin
    dsData['INN'] := AObject.FieldValues['INN'];
    dsData['KPP'] := AObject.FieldValues['KPP'];
  end;
end;

procedure TBPLicenceBrokerForm.FormShow(Sender: TObject);
begin
  inherited;
{  if Self.IsNew then
    begin
      dsDataNAME.Clear;
      edtDeclName.Clear;
      edtDeclINN.Clear;
      edtDeclKPP.Clear;
    end;}
end;

initialization
   RegisterClass(TBPLicenceBrokerForm);
end.
