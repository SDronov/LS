unit BankCashDeskGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  QueryList, OracleData;

type
  TBankCashDeskGridForm = class(TObjectGridForm)
    ppmAddButton: TdxBarPopupMenu;
    actCreateBankCashDesk: TAction;
    actLinkCustomCashDesk: TAction;
    btnAddBankCashDesk: TdxBarButton;
    btnLinkCustomCashDesk: TdxBarButton;
    dsetCashDesk: TOracleDataSet;
    QueryList: TQueryList;
    sqlUpdOwner: TsqlOp;
    procedure actLinkCustomCashDeskExecute(Sender: TObject);
  private
    function EnableCustomDeskLink: boolean;
  public
    { Public declarations }
  end;

var
  BankCashDeskGridForm: TBankCashDeskGridForm;

implementation

uses MainDm, fdcCustomObjectGridFrm, fdcMessages, fdcCustomDataFrm,
  fdcCustomDBDataFrm;

{$R *.dfm}

function TBankCashDeskGridForm.EnableCustomDeskLink: boolean;
begin
  result := False;
  if dsetCashDesk.Active then
    dsetCashDesk.Refresh
  else
    dsetCashDesk.Open;
  if dsetCashDesk.IsEmpty then
    raise Exception.Create('Не найдена касса таможни! Обратитесь к разработчикам!')
  else
    if dsetCashDesk.FieldByName('BankForCash_id').IsNull then
      Result := True
    else
      Result := Assigned(Params.FindParam('bankcash_id'))
            and not ParamByName('bankcash_id').IsNull
            and (dsetCashDesk.FieldByName('BankForCash_id').AsInteger <> ParamByName('bankcash_id').AsInteger)
            and (ConfirmDlg( format('Внимание! Касса таможни инкасируется другим банком <%s>!', [dsetCashDesk.FieldValues['bank_name']]) ,
                               'Вы уверены, что необходимо назначить кассе текущий банк?') = mrYes );
end;

procedure TBankCashDeskGridForm.actLinkCustomCashDeskExecute(
  Sender: TObject);
begin
  if EnableCustomDeskLink then
    begin
      sqlUpdOwner.Exec('pID;pOwnerID', [dsetCashDesk.FieldByName('id').AsInteger, ParamByName('bankcash_id').AsInteger ]);
      RefreshData;
    end;  
end;

initialization
  RegisterClass(TBankCashDeskGridForm);

end.
