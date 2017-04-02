unit KBKDictFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls, cxCheckBox;

type
  TKBKDictForm = class(TNSIDictForm)
    edtPayType: TcxDBTextEdit;
    lcGeneralItem7: TdxLayoutItem;
    dsDataIS_PREPAYMENTKBK: TStringField;
    dsDataIS_FOR_REPORT: TStringField;
    chBIsForReport: TcxDBCheckBox;
    lciIsForReport: TdxLayoutItem;
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KBKDictForm: TKBKDictForm;

implementation

uses
  MainDm
 ,FormUtils
 ,fdcCustomObjectFrm;

{$R *.dfm}

procedure TKBKDictForm.actNewExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

procedure TKBKDictForm.actDeleteExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

procedure TKBKDictForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;

  actSave.Visible := True;
end;

procedure TKBKDictForm.FormShow(Sender: TObject);
begin
  inherited;

  lciIsForReport.Tag                 := 11;
  chBIsForReport.Properties.ReadOnly := False;

  UpdateLayoutControl( False, lcGeneral, False );
end;

initialization
    RegisterClass(TKBKDictForm);

end.
