unit CertRecepientGridFrm;

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
  dxStatusBar, cxCheckBox;

type
  TCertRecepientGridForm = class(TObjectGridForm)
    lcicustoms_code: TdxLayoutItem;
    editcustoms_code: TcxTextEdit;
    grdDataDBBandedTableViewCUSTOM_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSOFTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCERT_SUBJECT: TcxGridDBBandedColumn;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataSOFT_ID: TFloatField;
    dsDataCERT_SUBJECT: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataSOFTNAME: TStringField;
    dsDataSOFTCODE: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CertRecepientGridForm: TCertRecepientGridForm;

implementation

uses fdcCustomDBDataFrm, MainDm;

{$R *.dfm}


procedure TCertRecepientGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('customs_code_8', Trim(editcustoms_code.Text));
end;

initialization
  RegisterClass(TCertRecepientGridForm);

end.
