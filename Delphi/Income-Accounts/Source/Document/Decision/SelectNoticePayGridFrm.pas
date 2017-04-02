unit SelectNoticePayGridFrm;

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
  dxStatusBar, cxCurrencyEdit, cxCheckBox;

type
  TSelectNoticePayGridForm = class(TObjectGridForm)
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCUR_CODE: TStringField;
    grdDataDBBandedTableViewSumma: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCurCode: TcxGridDBBandedColumn;
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dsDataIS_TS: TStringField;
    procedure actOpenUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectNoticePayGridForm: TSelectNoticePayGridForm;

implementation

uses fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TSelectNoticePayGridForm.actOpenUpdate(Sender: TObject);
begin
  inherited;
{  (Sender as TAction).Enabled := (Sender as TAction).Enabled and
  ( dsDataID.Value > 0);}

end;

initialization
  RegisterClass(TSelectNoticePayGridForm);
end.
