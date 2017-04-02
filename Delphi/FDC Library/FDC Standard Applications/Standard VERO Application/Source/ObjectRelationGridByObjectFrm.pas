unit ObjectRelationGridByObjectFrm;

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
  TObjectRelationGridByObjectForm = class(TObjectGridForm)
    dsDataREL_OBJECT_ID: TFloatField;
    dsDataROLE: TStringField;
    dsDataRELOBJNAME: TStringField;
    dsDataREL_OBJ_TYPE_ID: TFloatField;
    dsDataRELOBJTYPENAME: TStringField;
    dsDataRELOBJTYPESYSNAME: TStringField;
    dsDataISBACKWARD: TFloatField;
    grdDataDBBandedTableViewROLE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRELOBJNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRELOBJTYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRELOBJTYPESYSNAME: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObjectRelationGridByObjectForm: TObjectRelationGridByObjectForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TObjectRelationGridByObjectForm);

end.

