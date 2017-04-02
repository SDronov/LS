unit UpdateLogGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, MainDm, cxBlobEdit, cxMemo;

type
  TUpdateLogGridForm = class(TfdcCustomGridForm)
    dsDataID: TStringField;
    dsDataSTART_TIME: TDateTimeField;
    dsDataFINISH_TIME: TDateTimeField;
    dsDataUPDATE_TYPE: TFloatField;
    dsDataUPDATE_FILE: TStringField;
    dsDataVER_BEFORE: TStringField;
    dsDataVER_AFTER: TStringField;
    dsDataDESCRIPTION: TStringField;
    dsDataINVALID_LIST_BEFORE: TMemoField;
    dsDataINVALID_COUNT_BEFORE: TFloatField;
    dsDataINVALID_LIST_AFTER: TMemoField;
    dsDataINVALID_COUNT_AFTER: TFloatField;
    dsDataTYPE_NAME: TStringField;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTART_TIME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFINISH_TIME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewUPDATE_FILE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVER_BEFORE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVER_AFTER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESCRIPTION: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINVALID_LIST_BEFORE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINVALID_COUNT_BEFORE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINVALID_LIST_AFTER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINVALID_COUNT_AFTER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLOG_FILE: TcxGridDBBandedColumn;
    dsDataLOG_FILE: TMemoField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateLogGridForm: TUpdateLogGridForm;

implementation

//uses MainDm;

{$R *.dfm}

procedure TUpdateLogGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetSession(MainData.Session);
end;

initialization
  RegisterClass(TUpdateLogGridForm);

end.
