unit DictPathDocpackGridFrm;

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
  TDictPathDocpackGridForm = class(TObjectGridForm)
    lcicustoms_code: TdxLayoutItem;
    editcustoms_code: TcxTextEdit;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataCODE: TStringField;
    dsDataCODE2: TStringField;
    dsDataFULLCODE: TStringField;
    dsDataOWNERNAME: TStringField;
    dsDataOWNERSYSNAME: TStringField;
    dsDataOWNERTYPENAME: TStringField;
    dsDataOWNERTYPESYSNAME: TStringField;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataSOFT_ID: TFloatField;
    dsDataSOFTNAME: TStringField;
    dsDataSOFTCODE: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
    grdDataDBBandedTableViewCUSTOM_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSOFTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DictPathDocpackGridForm: TDictPathDocpackGridForm;

implementation

uses fdcCustomDBDataFrm;

{$R *.dfm}


procedure TDictPathDocpackGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('customs_code_8', Trim(editcustoms_code.Text));
end;

initialization
  RegisterClass(TDictPathDocpackGridForm);

end.
