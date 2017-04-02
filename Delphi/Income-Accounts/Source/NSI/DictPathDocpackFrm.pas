unit DictPathDocpackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictFrm, FileCtrl, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar,
  ImgList, cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels,
  ActnList, StdCtrls, dxLayoutControl, cxMaskEdit, cxButtonEdit, cxDBEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, cxCheckBox;

type
  TDictPathDocpackForm = class(TDictForm)
    editCustoms: TfdcObjectLinkEdit;
    lciCustoms: TdxLayoutItem;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataSOFT_ID: TFloatField;
    dsDataSOFTNAME: TStringField;
    dsDataSOFTCODE: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
    editSoft: TfdcObjectLinkEdit;
    lciSoft: TdxLayoutItem;
    editPathOut: TcxDBButtonEdit;
    lciPathOut: TdxLayoutItem;
    editPathIn: TcxDBButtonEdit;
    lciPathIn: TdxLayoutItem;
    procedure editPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure editPathInPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DictPathDocpackForm: TDictPathDocpackForm;

implementation

uses fdcCustomCardFrm;

{$R *.dfm}

procedure TDictPathDocpackForm.editPathPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var ldir: AnsiString;
begin
  inherited;
  ldir := editPathOut.DataBinding.Field.AsString;
  if SelectDirectory('Исходящие','',ldir) then
    begin
      editPathOut.DataBinding.Field.AsString := ldir;
    end;
end;

procedure TDictPathDocpackForm.FormShow(Sender: TObject);
  var li: Integer;
begin
  inherited;
  for li := 1 to pcMain.TabCount-1 do
    begin
      pcMain.Tabs.Tabs[li].Visible := false;
    end;
end;

procedure TDictPathDocpackForm.editPathInPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var ldir: AnsiString;
begin
  inherited;
  ldir := editPathIn.DataBinding.Field.AsString;
  if SelectDirectory('Входящие','',ldir) then
    begin
      editPathIn.DataBinding.Field.AsString := ldir;
    end;
end;

initialization
  RegisterClass(TDictPathDocpackForm);

end.
