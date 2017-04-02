unit DecisionForGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManDecisionGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalc, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCurrencyEdit, cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TDecisionForGridForm = class(TRManDecisionGridForm)
    dsDataSIGNED_BY: TStringField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGNED_BY_CHIEF_UDF: TStringField;
    dsDataSUB_ID_DEST: TFloatField;
    dsDataSUB_NAME_DEST: TStringField;
    dsDataSUB_INN_DEST: TStringField;
    dsDataSUB_KPP_DEST: TStringField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataIS_ACTIVE: TStringField;
    dsDataREASON: TIntegerField;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUB_INN_DEST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUB_KPP_DEST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUB_NAME_DEST: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecisionForGridForm: TDecisionForGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass( TDecisionForGridForm );
end.
