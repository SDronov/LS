unit StateTransitGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TStateTransitGridForm = class(TObjectGridForm)
    dsDataSTATE_SCHEME_ID: TFloatField;
    dsDataSRC_STATE_ID: TFloatField;
    dsDataDST_STATE_ID: TFloatField;
    dsDataBEFORE_PROCEDURE_ID: TFloatField;
    dsDataAFTER_PROCEDURE_ID: TFloatField;
    dsDataSTATE_SCHEMENAME: TStringField;
    dsDataSTATE_SCHEMESYSNAME: TStringField;
    dsDataSRC_STATENAME: TStringField;
    dsDataSRC_STATESYSNAME: TStringField;
    dsDataDST_STATENAME: TStringField;
    dsDataDST_STATESYSNAME: TStringField;
    dsDataBEFORE_PROCEDURENAME: TStringField;
    dsDataBEFORE_PROCEDURESYSNAME: TStringField;
    dsDataAFTER_PROCEDURENAME: TStringField;
    dsDataAFTER_PROCEDURESYSNAME: TStringField;
    grdDataDBBandedTableViewSRCSTATENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDSTSTATENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBEFOREPROCEDURENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewAFTERPROCEDURENAME: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StateTransitGridForm: TStateTransitGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TStateTransitGridForm);

end.
