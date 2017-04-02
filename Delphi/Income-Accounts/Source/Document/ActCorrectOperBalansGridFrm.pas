unit ActCorrectOperBalansGridFrm;

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
  TActCorrectOperBalansGridForm = class(TDocumentGridForm)
    dsDataIS_TS: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataBALANS_TYPE: TIntegerField;
    dsDataDATE_CREATED: TDateTimeField;
    dsDataSIGNED_BY: TStringField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataBALANS_TYPE_TEXT: TStringField;
    grdDataDBBandedTableViewBALANS_TYPE_TEXT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActCorrectOperBalansGridForm: TActCorrectOperBalansGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TActCorrectOperBalansGridForm);

end.
