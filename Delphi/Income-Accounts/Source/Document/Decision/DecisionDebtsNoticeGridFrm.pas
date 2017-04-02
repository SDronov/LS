unit DecisionDebtsNoticeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomObjectGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, NoticePayGridFrm, cxCheckBox, cxCurrencyEdit,
  cxDropDownEdit, cxCalendar, QueryList;

type
  TDecisionDebtsNoticeGridForm = class(TNoticePayGridForm)
    QueryList: TQueryList;
    qryGetMode: TsqlOp;
    dsPays: TfdcQuery;
    srcPays: TDataSource;
    dsPaysID: TFloatField;
    dsPaysDECL_ID: TFloatField;
    dsPaysPAYMENT_ID: TFloatField;
    dsPaysPO_NAME: TStringField;
    dsPaysPAY_TYPE_ID: TFloatField;
    dsPaysPAY_TYPE_CODE: TStringField;
    dsPaysCHARGE_CURR_ID: TFloatField;
    dsPaysCHARGE_CURR_CODE: TStringField;
    dsPaysCHARGE_SUMMA: TFloatField;
    dsPaysCHARGE_ID: TFloatField;
    dsPaysKBKCODE_ID: TFloatField;
    dsPaysKBKCODE: TStringField;
    dsPaysKBKCODE1_ID: TFloatField;
    dsPaysKBKCODE1: TStringField;
    dsPaysSUMMA: TFloatField;
    dsPaysNOTICE_ID: TFloatField;
    dsPaysDECISION_ID: TFloatField;
    grdDataLevelDetail: TcxGridLevel;
    grdDataDBBandedTableViewDetail: TcxGridDBBandedTableView;
    grdDataDBBandedTableViewDetailID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailDECL_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailPAYMENT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailPO_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailPAY_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCHARGE_CURR_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCHARGE_CURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCHARGE_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCHARGE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailKBKCODE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailKBKCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailKBKCODE1_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailKBKCODE1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailNOTICE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailDECISION_ID: TcxGridDBBandedColumn;
    dsPaysPAYMENT_DATE: TDateTimeField;
    dsPaysIS_ACTIVE: TStringField;
    dsPaysACTIVATION_DATE: TDateTimeField;
    dsPaysBUDGET_DATE: TDateTimeField;
    grdDataDBBandedTableViewDetailPAYMENT_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailBUDGET_DATE: TcxGridDBBandedColumn;
    qryRemoveReserve: TsqlOp;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actAutoFilterExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewDetailDblClick(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecisionDebtsNoticeGridForm: TDecisionDebtsNoticeGridForm;

implementation

uses
  MainDM
 ,fdcCustomDBDataFrm
 ,DecisionReserveWizardFrm, ObjectGridFrm, fdcCustomGridFrm;
  
{$R *.dfm}

procedure TDecisionDebtsNoticeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  dsData.ParamByName( 'mode_view' ).Value := qryGetMode.Exec( 'ID', dsData.ParamByName( 'DEC_ID' ).Value );
end;

procedure TDecisionDebtsNoticeGridForm.actAutoFilterExecute(
  Sender: TObject);
begin
  inherited;

  grdDataDBBandedTableViewDetail.OptionsCustomize.ColumnFiltering := not grdDataDBBandedTableViewDetail.OptionsCustomize.ColumnFiltering;
end;

procedure TDecisionDebtsNoticeGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  dsPays.ParamByName( 'dec_id' ).Value    := dsData.ParamByName( 'dec_id' ).Value;
  dsPays.ParamByName( 'mode_view' ).Value := dsData.ParamByName( 'mode_view' ).Value;

  if dsPays.Active then
    dsPays.Close;
  dsPays.Open;
end;

procedure TDecisionDebtsNoticeGridForm.grdDataDBBandedTableViewDetailDblClick(
  Sender: TObject);
begin
  inherited;

  ObjectServices.OpenObject( dsPays.FieldByName( 'payment_id' ).AsFloat, nil );
end;

procedure TDecisionDebtsNoticeGridForm.actAddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.ParamByName( 'mode_view' ).AsInteger = 1;
end;

procedure TDecisionDebtsNoticeGridForm.actDeleteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (dsData.ParamByName( 'mode_view' ).AsInteger = 1)
                             and dsPays.Active
                             and not dsPays.IsEmpty;
                             //and (grdDataDBBandedTableViewDetail.DataController.GetSelectedCount > 0);
end;

procedure TDecisionDebtsNoticeGridForm.actAddExecute(Sender: TObject);
begin
  ShowDecisionReserveWizard( dsData.ParamByName( 'dec_id' ).Value );
  RefreshData;
end;

procedure TDecisionDebtsNoticeGridForm.actDeleteExecute(Sender: TObject);
begin
  if MessageDlg( '¬ы действительно хотите удалить резерв?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
    begin
      qryRemoveReserve.Exec;
      QueryList.Session.Commit;

      RefreshData;
    end;
end;

initialization
  RegisterClass(TDecisionDebtsNoticeGridForm);

end.
