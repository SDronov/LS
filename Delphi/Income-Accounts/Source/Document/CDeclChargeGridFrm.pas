unit CDeclChargeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DeclChargeGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, QueryList, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCalc, cxCheckBox, cxCalendar, Grids, DBGrids, OracleData;

type
  TCDeclChargeGridForm = class(TDeclChargeGridForm)
    QueryList1: TQueryList;
    sqlCloseDeclWithAdvice: TsqlOp;
    actCloseDecl: TAction;
    btnCloseGTD: TdxBarButton;
    sqlReOpen: TsqlOp;
    actOpenDecl: TAction;
    btnReturnGTD: TdxBarButton;
    dsDataIS_ACTIVE: TStringField;
    dsDataIS_ARCHIVE: TStringField;
    columnIS_ACTIVE: TcxGridDBBandedColumn;
    columnIS_ARCHIVE: TcxGridDBBandedColumn;
    sqlSetArchive: TsqlOp;
    sqlSetDeArchive: TsqlOp;
    columnACTIVATION_DATE: TcxGridDBBandedColumn;
    dsDataACTIVATION_DATE: TDateTimeField;
    sqlCloseDecl: TsqlOp;
    sqlIsBigPayer: TsqlOp;
    dsAdvices: TOracleDataSet;
    procedure actCloseDeclExecute(Sender: TObject);
    procedure actOpenDeclExecute(Sender: TObject);
    procedure dsDataBeforePost(DataSet: TDataSet);
    procedure columnIS_ARCHIVEPropertiesEditValueChanged(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  fdcMessages
 ,fdcObjectServices, fdcCustomDBDataFrm;

{$R *.dfm}

procedure TCDeclChargeGridForm.actCloseDeclExecute(Sender: TObject);
  var
    lv_AdviceID   : Double;
    lv_IsBigPayer : Integer;
begin
  inherited;

  CheckErrors( 'Нельзя закрыть ДТ, пока есть неразрешённые ошибки по документу!' );

  lv_IsBigPayer := sqlIsBigPayer.Exec( 'decl_id', [ParamByName('DECL_ID').Value] );

  if lv_IsBigPayer = 1 then
    sqlCloseDecl.Exec('decl_id', ParamByName('DECL_ID').Value)
  else
    sqlCloseDeclWithAdvice.Exec('decl_id', ParamByName('DECL_ID').Value);
  RefreshData;
  RefreshWaiters;

  if     ( lv_IsBigPayer = 0 )
     and ( sqlCloseDeclWithAdvice.ParamValues[ 'advice_id' ] <> 0 ) then
    begin
      lv_AdviceID := sqlCloseDeclWithAdvice.ParamValues[ 'advice_id' ];
      GetObjectServices.OpenObject( lv_AdviceID, nil );
      dsAdvices.SetVariable( 'decl_id',   ParamByName('DECL_ID').Value );
      dsAdvices.SetVariable( 'advice_id', lv_AdviceID                  );
      dsAdvices.Open;
      while not dsAdvices.Eof do
        begin
          GetObjectServices.OpenObject( dsAdvices.FieldByName( 'advice_id' ).AsFloat, nil );
          dsAdvices.Next;
        end;
      dsAdvices.CloseAll;
    end;
end;

procedure TCDeclChargeGridForm.actOpenDeclExecute(Sender: TObject);
begin
  inherited;
  if ConfirmDlg('Подтвердите отмену закрытия ДТ', '') = mrYes then
  begin
    sqlReOpen.Exec('decl_id', ParamByName('DECL_ID').Value);
    RefreshData;
  end;
end;

procedure TCDeclChargeGridForm.dsDataBeforePost(DataSet: TDataSet);
begin
  inherited;
{
  if DataSet.FieldByName( 'is_archive' ).AsString = 'Y' then
    sqlSetArchive.Exec( 'id', DataSet.FieldByName( 'id' ).AsInteger )
  else
    sqlSetDeArchive.Exec( 'id', DataSet.FieldByName( 'id' ).AsInteger );
  dsData.Session.Commit;}
end;

procedure TCDeclChargeGridForm.columnIS_ARCHIVEPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;

  dsData.Post;
end;

procedure TCDeclChargeGridForm.actDeleteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := False;
  TAction(Sender).Visible := False;
end;

initialization
   RegisterClass(TCDeclChargeGridForm);

end.
