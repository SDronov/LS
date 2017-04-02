unit CorrectionCDGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionDocGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalendar, cxCheckBox, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit,
  cxLabel, dxStatusBar;

type
  TCorrectionCDGridForm = class(TCorrectionDocGridForm)
    colDescript: TcxGridDBBandedColumn;
    dsDataREASON_CORRECT: TStringField;
    colReasonCorrect: TcxGridDBBandedColumn;
    procedure actDeleteUpdate(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TCorrectionCDGridForm.actDeleteUpdate(Sender: TObject);
begin
  ;
end;

initialization
  RegisterClass(TCorrectionCDGridForm);

end.
 