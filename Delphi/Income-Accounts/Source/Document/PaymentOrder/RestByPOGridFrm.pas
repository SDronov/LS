unit RestByPOGridFrm;

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
  dxStatusBar, cxCurrencyEdit, cxCheckBox, QueryList;

type
  TRestByPOGridForm = class(TfdcCustomGridForm)
    dsDataKBK: TStringField;
    dsDataKBK_ID: TFloatField;
    dsDataREST_SUM: TFloatField;
    dsDataLOCK_SUM: TFloatField;
    dsDataAVAIL_SUM: TFloatField;
    grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREST_SUM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLOCK_SUM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewAVAIL_SUM: TcxGridDBBandedColumn;
    dsDataPREPAYMENTORREUSE: TFloatField;
    grdDataDBBandedTableViewPREPAYMENTORREUSE: TcxGridDBBandedColumn;
    actLock: TAction;
    btnLock: TdxBarButton;
    QueryList1: TQueryList;
    sqlLock: TsqlOp;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure actLockUpdate(Sender: TObject);
    procedure actLockExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RestByPOGridForm: TRestByPOGridForm;

implementation

{$R *.dfm}
uses SelectLockFrm, fdcCustomDataFrm;

procedure TRestByPOGridForm.actLockUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ( dsDataAVAIL_SUM.AsCurrency >= 0.01 );
end;

procedure TRestByPOGridForm.actLockExecute(Sender: TObject);
var
  P: TfdcParams;
begin
  P := SelectLock(dsDataAVAIL_SUM.AsCurrency);
  try
    if P <> nil then
      try
        sqlLock.Exec('CUSTOMS_CODE;REG_DATE;DECL_NO;SUBJECT_ID;ID;SUMMA;NOTE;KBK'
          ,[P.ParamValues['CUSTOMS_CODE']
          ,P.ParamValues['REG_DATE']
          ,P.ParamValues['DECL_NO']
          ,P.ParamValues['SUBJECT_ID']
          ,Params.ParamValues['ID']
          ,P.ParamValues['SUMMA']
          ,P.ParamValues['NOTE']
          ,dsDataKBK_ID.AsInteger]);
        RefreshData;
        RefreshWaiters;
      except
        raise;
      end;
  finally
    P.Free;
  end;
end;

initialization
   RegisterClass(TRestByPOGridForm);
end.
