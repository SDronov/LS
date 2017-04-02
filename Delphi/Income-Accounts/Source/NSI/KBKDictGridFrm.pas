{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12862 $
  $Author: anaumenkov $
  $Date: 2011-03-24 02:19:40 +0400 (Чт, 24 мар 2011) $
}

unit KBKDictGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
    NSIDictGridFrm, dxBarExtItems, cxCheckBox;

type
  TKBKDictGridForm = class(TNSIDictGridForm)
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtCode: TcxTextEdit;
    grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn;
    dsDataIS_PREPAYMENTKBK: TStringField;
    dsDataIS_FOR_REPORT: TStringField;
    grdDataDBBandedTableViewIS_FOR_REPORT: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;

implementation

uses
  fdcCustomGridFrm, MainDm;

{$R *.dfm}

procedure TKBKDictGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('CODE', Trim(edtCode.Text));
end;

procedure TKBKDictGridForm.actAddExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

procedure TKBKDictGridForm.actDeleteExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

initialization
  RegisterClass(TKBKDictGridForm);

end.
