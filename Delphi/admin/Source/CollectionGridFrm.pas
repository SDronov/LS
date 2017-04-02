unit CollectionGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxImageComboBox, cxCheckBox;

type
  TCollectionGridForm = class(TObjectGridForm)
    dsDataCOLDATE: TDateTimeField;
    dsDataUSER_ID: TFloatField;
    dsDataDEFCOLLECTION: TIntegerField;
    dsDataCUR_USER_DEFCOLLECTION: TFloatField;
    dsDataUSERNAME: TStringField;
    dsDataLOGIN: TStringField;
    dsDataSTATENAME: TStringField;
    grdDataDBBandedTableViewUSERNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCOLDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEFCOLLECTION: TcxGridDBBandedColumn;
    imglDefCollection: TImageList;
    chbxUserOwn: TcxCheckBox;
    lciUserOwn: TdxLayoutItem;
    grdDataDBBandedTableViewLOGIN: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CollectionGridForm: TCollectionGridForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TCollectionGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  SetSearchParam('UserOwn', chbxUserOwn.EditValue);
end;

procedure TCollectionGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  chbxUserOwn.EditValue := 1;
end;

initialization
  RegisterClass(TCollectionGridForm);

end.
