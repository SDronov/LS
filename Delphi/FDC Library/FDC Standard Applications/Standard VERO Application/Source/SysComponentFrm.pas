unit SysComponentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit;

type
  TSysComponentForm = class(TObjectForm)
    dsDataBASE_TYPE_ID: TFloatField;
    dsDataBASETYPENAME: TStringField;
    edtSysName: TcxDBTextEdit;
    lciSysName: TdxLayoutItem;
    edtObjectType: TfdcObjectLinkEdit;
    lciObjectType: TdxLayoutItem;
    tabTask: TcxTabSheet;
    procedure actSaveExecute(Sender: TObject);
    procedure tabTaskShow(Sender: TObject);
  private
    { Private declarations }
    FTaskGridForm: TForm;
  public
    { Public declarations }
  end;

var
  SysComponentForm: TSysComponentForm;

implementation

uses
  fdcMessages;

{$R *.dfm}

procedure TSysComponentForm.actSaveExecute(Sender: TObject);
begin
  if not IsNew then
    inherited
  else
    ShowMessage('Нельзя вручную создать системный компонент',
      'Создавать новые системные объекты ' +
      'можно только через механизм регистрации ' +
      'fdc_Service.Server_Component_Register');
end;

procedure TSysComponentForm.tabTaskShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FTaskGridForm) then
    FTaskGridForm := ObjectServices.ShowForm('TTaskGridBySysComponentForm', Params, tabTask);
end;

initialization
  RegisterClass(TSysComponentForm);
  
end.
