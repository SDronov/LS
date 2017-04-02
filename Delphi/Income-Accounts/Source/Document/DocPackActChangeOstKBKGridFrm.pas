unit DocPackActChangeOstKBKGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxDropDownEdit, cxCalendar,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit,
  cxSpinEdit, cxLabel, dxStatusBar;

type
  TDocPackActChangeOstKBKGridForm = class(TDocPackGridForm)
    dsDataCUSTOMS_NAME: TStringField;
    dsDataCLAIMED_DOC_COUNT: TFloatField;
    dsDataDATE_FORM: TDateTimeField;
    dsDataDATE_SEND: TDateTimeField;
    dsDataDESTINATION: TStringField;
    dsDataDESTINATION_NAME: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    grdDataDBBandedTableViewCUSTOMS_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCLAIMED_DOC_COUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_FORM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_SEND: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTINATION: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTINATION_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn;
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MainDm;

{$R *.dfm}

procedure TDocPackActChangeOstKBKGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;

  if ARecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ] <> MainData.GetSoftCustomsCode then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackAlienSelected
    else
      AStyle := MainData.stlDocPackAlien

  else if ARecord.Values[ grdDataDBBandedTableViewSTATE_NAME.Index ] = 'Отправлен' then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackSendedSelected
    else
      AStyle := MainData.stlDocPackSended
    ;
end;

procedure TDocPackActChangeOstKBKGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  actAdd.Visible := (MainData.GetCustomsLevel <> 0);
end;

procedure TDocPackActChangeOstKBKGridForm.actAddExecute(Sender: TObject);
var
  l_Result: Integer;
begin
//  inherited;
  MainData.pkgCommon.PackageName := 'p_DocPack_Act_ChangeOstKBK';
  l_Result := MainData.pkgCommon.CallIntegerFunction('CreatePackage', []);
  MainData.pkgCommon.Session.Commit;
  actRefresh.Execute;
end;

initialization
  RegisterClass( TDocPackActChangeOstKBKGridForm );

end.
