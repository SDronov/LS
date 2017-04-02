unit StateTransitGridByStateFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StateTransitGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TStateTransitGridByStateForm = class(TStateTransitGridForm)
    dsDataDIRECTION: TStringField;
    grdDataDBBandedTableViewDIRECTION: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StateTransitGridByStateForm: TStateTransitGridByStateForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TStateTransitGridByStateForm);

end.
