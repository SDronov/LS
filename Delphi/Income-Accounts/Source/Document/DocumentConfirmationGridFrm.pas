unit DocumentConfirmationGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalendar, cxCheckBox, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit,
  cxLabel, dxStatusBar;

type
  TDocumentConfirmationGridForm = class(TDocumentGridForm)
    dsDataCONFIRM_DOC_TYPE: TStringField;
    dsDataCONFIRM_DOC_NUMBER: TStringField;
    dsDataCONFIRM_DOC_DATE: TDateTimeField;
    grdDataDBBandedTableViewCONFIRM_DOC_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCONFIRM_DOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCONFIRM_DOC_DATE: TcxGridDBBandedColumn;
    dsDataCONFIRMED_DOC_ID: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocumentConfirmationGridForm: TDocumentConfirmationGridForm;

implementation

{$R *.dfm}
initialization
  RegisterClass( TDocumentConfirmationGridForm );
end.
