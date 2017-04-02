unit DecisionQualifierFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar,
  ImgList, cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels,
  ActnList, StdCtrls, dxLayoutControl, cxMaskEdit, cxButtonEdit, cxDBEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls;

type
  TDecisionQualifierForm = class(TDictForm)
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

implementation

uses MainDm;

{$R *.dfm}

procedure TDecisionQualifierForm.actNewExecute(Sender: TObject);
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

procedure TDecisionQualifierForm.actDeleteExecute(Sender: TObject);
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

procedure TDecisionQualifierForm.actSaveExecute(Sender: TObject);
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

procedure TDecisionQualifierForm.FormShow(Sender: TObject);
begin
  inherited;
  dxLayoutGroup1.Enabled := MainData.AccessModifyNSI;
end;

initialization
  RegisterClass(TDecisionQualifierForm);

end.
 