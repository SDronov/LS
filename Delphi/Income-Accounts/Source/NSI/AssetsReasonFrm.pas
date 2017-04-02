unit AssetsReasonFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls;

type
  TAssetsReasonForm = class(TNSIDictForm)
    edtCode2: TcxDBTextEdit;
    lcGeneralItem7: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
  public
  end;

implementation

uses MainDm;

{$R *.dfm}

procedure TAssetsReasonForm.FormCreate(Sender: TObject);
begin
  inherited;
  Self.ReadOnly := True;
end;

procedure TAssetsReasonForm.actNewExecute(Sender: TObject);
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

procedure TAssetsReasonForm.actDeleteExecute(Sender: TObject);
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

procedure TAssetsReasonForm.actSaveExecute(Sender: TObject);
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

initialization
  RegisterClass(TAssetsReasonForm);

end.
 