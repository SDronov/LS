unit RegDocumentGridFrm;

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
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TRegDocumentGridForm = class(TObjectGridForm)
    dsDataDOCDATE: TDateTimeField;
    dsDataSTOPDATE: TDateTimeField;
    dsDataDOCNUMBER: TStringField;
    dsDataDOCSERIAL: TStringField;
    dsDataGRANTEE: TStringField;
    dsDataOWNER_NAME: TStringField;
    grdDataDBBandedTableViewOWNERNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOCSERIAL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOCNUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOCDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewGRANTEE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTOPDATE: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegDocumentGridForm: TRegDocumentGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TRegDocumentGridForm);

end.
