unit StateGridBySchemeFrm;

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
  TStateGridBySchemeForm = class(TObjectGridForm)
    dsDataSTATE_SCHEME_ID: TFloatField;
    dsDataALLOWUPDATES: TIntegerField;
    dsDataALLOWDELETE: TIntegerField;
    dsDataACTIVE: TIntegerField;
    dsDataCOLOR: TFloatField;
    dsDataSTATE_SCHEMENAME: TStringField;
    dsDataSTATE_SCHEMESYSNAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StateGridBySchemeForm: TStateGridBySchemeForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TStateGridBySchemeForm);

end.
