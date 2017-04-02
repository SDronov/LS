unit ResFDeclGridFrm;

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
  dxStatusBar, QueryList;

type
  TResFDeclGridForm = class(TfdcCustomGridForm)
    dsDatacustoms_code: TStringField;
    dsDatareg_date: TDateTimeField;
    dsDatadecl_no: TStringField;
    dsDatasubject_id: TIntegerField;
    dsDatasubject_name: TStringField;
    dsDatasubject_inn: TStringField;
    dsDatasubject_kpp: TStringField;
    dsDatabdate: TDateTimeField;
    dsDatasumma: TFloatField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn5: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn6: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn7: TcxGridDBBandedColumn;
    actUnLock: TAction;
    dxBarButton2: TdxBarButton;
    QueryList1: TQueryList;
    sqlUnlock: TsqlOp;
    dsDataid: TIntegerField;
    dsDataNOTE: TStringField;
    colNote: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn8: TcxGridDBBandedColumn;
    dsDataedate: TDateTimeField;
    grdDataDBBandedTableViewColumn10: TcxGridDBBandedColumn;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBKCODE: TStringField;
    grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure actUnLockExecute(Sender: TObject);
    procedure actUnLockUpdate(Sender: TObject);
    procedure colNoteGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure actSwitchSearchCriteriaUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResFDeclGridForm: TResFDeclGridForm;

implementation

uses MainDM;

{$R *.dfm}

procedure TResFDeclGridForm.FormShow(Sender: TObject);
begin
  inherited;
  pnlSearchCriteria.Visible := False;
  splSearchCriteria.Visible := False;
end;

procedure TResFDeclGridForm.actUnLockExecute(Sender: TObject);
begin
  inherited;
  if not dsData.Eof
    and (MessageDlg('Разблокировать сумму?', mtConfirmation, [mbOK,mbCancel], 0)=mrOk) then
    begin
    sqlUnlock.Exec('ID',[dsData['ID']]);
    RefreshData;
    end;
end;

procedure TResFDeclGridForm.actUnLockUpdate(Sender: TObject);
begin
  inherited;
  if not dsData.EOF and dsDataedate.IsNull then
    TAction(Sender).Enabled:= True
    else
    TAction(Sender).Enabled:= False;
end;

procedure TResFDeclGridForm.colNoteGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  AText := WrapText(AText, 100);
end;

procedure TResFDeclGridForm.actSwitchSearchCriteriaUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Visible:= False;
end;

initialization
   RegisterClass(TResFDeclGridForm);

end.
