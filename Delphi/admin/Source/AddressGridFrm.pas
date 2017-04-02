unit AddressGridFrm;

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
  TAddressGridForm = class(TObjectGridForm)
    dsDataOWNERNAME: TStringField;
    dsDataCOUNTRY_DICT_ID: TFloatField;
    dsDataCOUNTRYCODE: TStringField;
    dsDataCOUNTRYNAME: TStringField;
    grdDataDBBandedTableViewOWNERNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCOUNTRYCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCOUNTRYNAME: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddressGridForm: TAddressGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TAddressGridForm);

end.
