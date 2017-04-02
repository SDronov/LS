unit DocPackByPOGridFrm;

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
  dxStatusBar;

type
  TDocPackByPOGridForm = class(TObjectGridForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    dsDataDESTCUSTOMSCODE: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataSTATE_NAME: TStringField;
    grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn;
    dsDataDIRECTION: TStringField;
    grdDataDBBandedTableViewDirection: TcxGridDBBandedColumn;
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses MainDm, fdcCustomDBDataFrm;

{$R *.dfm}
procedure TDocPackByPOGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  var
    State: string;
begin
  inherited;
  if ARecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ] <> MainData.GetSoftCustomsCode then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackAlienSelected
    else
      AStyle := MainData.stlDocPackAlien
  else
    begin
      State := VarAsType(ARecord.Values[grdDataDBBandedTableViewSTATE_NAME.Index], varString);
      if State='Отправлен' then
        if ARecord.Selected then
          AStyle := MainData.stlDocPackSendedSelected
        else
          AStyle := MainData.stlDocPackSended
      else if State='Подтвержден' then
        if ARecord.Selected then
          AStyle := MainData.stlDocPackConfirmedSelected
        else
          AStyle := MainData.stlDocPackConfirmed;
    end;
end;

initialization
  RegisterClass(TDocPackByPOGridForm);
end.
