unit JobListGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar,MainDm;

type
  TJobListGridForm = class(TObjectGridForm)
    dsDataJOB_ID: TFloatField;
    dsDataJOB_PARAMS: TBlobField;
    dsDataWHEN: TDateTimeField;
    dsDataJOB_SUBMIT_ID: TFloatField;
    dsDataSTATUS: TStringField;
    dsDataJOB_NAME: TStringField;
    grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewJOB_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewJOB_PARAMS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewWHEN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewJOB_SUBMIT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATUS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewJOB_NAME: TcxGridDBBandedColumn;
    dsDataDIR: TStringField;
    grdDataDBBandedTableViewDIR: TcxGridDBBandedColumn;
    dsDataINTERVAL: TFloatField;
    dsDataINTERVAL_UNITS: TStringField;
    grdDataDBBandedTableViewINTERVAL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINTERVAL_UNITS: TcxGridDBBandedColumn;
    dsDataINTERVAL_UNITSNAME: TStringField;
    dsDataWHEN_LAST: TDateTimeField;
    grdDataDBBandedTableViewWHEN_LAST: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JobListGridForm: TJobListGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TJobListGridForm);

end.
