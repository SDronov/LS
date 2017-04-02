unit DecisionDebtsDepositCDeclGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManCDeclGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, QueryList, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxSpinEdit, cxLabel, dxStatusBar;

type
  TDecisionDebtsDepositCDeclGridForm = class(TRManCDeclGridForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecisionDebtsDepositCDeclGridForm: TDecisionDebtsDepositCDeclGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TDecisionDebtsDepositCDeclGridForm);


end.
