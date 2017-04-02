unit PaymentOrderBySubjectGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxProgressBar,
  cxSpinEdit, cxLabel, dxStatusBar, cxCurrencyEdit, Menus, QueryList,
  cxMemo, cxCalc, cxCheckBox;

type
  TPaymentOrderBySubjectGridForm = class(TPaymentOrderGridForm)
    procedure actOpenExecute(Sender: TObject);
    procedure SetInn(aInn: string);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TPaymentOrderBySubjectGridForm.actOpenExecute(Sender: TObject);
begin
  Params.ParamByName('pf_subject_Id').Value := dsDataSubject_Id.Value;
  ObjectServices.OpenObject(dsDataID.Value, Params);
end;

procedure TPaymentOrderBySubjectGridForm.SetInn(aInn: string);
begin
  edtInn.Text := aInn;
end;

initialization
   RegisterClass(TPaymentOrderBySubjectGridForm);

end.
