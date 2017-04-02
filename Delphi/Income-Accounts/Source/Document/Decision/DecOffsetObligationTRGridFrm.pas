unit DecOffsetObligationTRGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TRGridFrm, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxCurrencyEdit, cxDropDownEdit, cxCheckBox, cxCalendar, QueryList, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxSpinEdit, cxLabel, dxStatusBar;

type
  TDecOffsetObligationTRGridForm = class(TTRGridForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecOffsetObligationTRGridForm: TDecOffsetObligationTRGridForm;

implementation

{$R *.dfm}

procedure TDecOffsetObligationTRGridForm.FormShow(Sender: TObject);
begin
  inherited;
  //--
  cmbxCustCode.Visible := ivNever;
  cmbxViewMode.Visible := ivNever;
  //--
end;

initialization
  RegisterClass(TDecOffsetObligationTRGridForm);

end.
