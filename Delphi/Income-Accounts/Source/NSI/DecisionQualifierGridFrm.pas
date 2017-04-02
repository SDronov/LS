unit DecisionQualifierGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TDecisionQualifierGridForm = class(TDictGridForm)
    dxBarButton1: TdxBarButton;
    actImport: TAction;
    edtCode: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    procedure actImportExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

uses
  IaccLoader, LoaderWizardFrm, MainDm;


procedure TDecisionQualifierGridForm.actImportExecute(Sender: TObject);
begin
  inherited;
  ExecuteLoader(TDecisionQualifierLoader, '–ешени€, принимаемые таможенными органами');
end;

procedure TDecisionQualifierGridForm.actSearchExecute(Sender: TObject);
begin
  inherited;
  SetSearchParam('CODE', Trim(edtCode.Text));
end;

procedure TDecisionQualifierGridForm.actAddExecute(Sender: TObject);
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

procedure TDecisionQualifierGridForm.actDeleteExecute(Sender: TObject);
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
  RegisterClass(TDecisionQualifierGridForm);

end.
 