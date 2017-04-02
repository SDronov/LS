unit EventsGridFrm;

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
  dxStatusBar, cxDropDownEdit, cxCalendar, cxRadioGroup;

type
  TEventsGridForm = class(TfdcCustomGridForm)
    dsDataUSER_ID: TFloatField;
    dsDataEVT_CODE: TStringField;
    dsDataTYPE_CODE: TStringField;
    dsDataCODE: TStringField;
    dsDataEVT_MOMENT: TDateTimeField;
    dsDataEVT_DESCRIPTION: TStringField;
    dsDataNAME: TStringField;
    dsDataLOGIN: TStringField;
    dsDataLASTNAME: TStringField;
    dsDataFIRSTNAME: TStringField;
    dsDataMIDDLENAME: TStringField;
    dsDataHOST_NAME: TStringField;
    dsDataIP_ADDRESS: TStringField;
    dsDataOS_USER: TStringField;
    dsDataMODULE: TStringField;
    dsDataUSER_NAME: TStringField;
    grdDataDBBandedTableViewEVT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEVT_MOMENT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEVT_DESCRIPTION: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLOGIN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLASTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFIRSTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMIDDLENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewHOST_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIP_ADDRESS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOS_USER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMODULE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewUSER_NAME: TcxGridDBBandedColumn;
    edtSrchEvtName: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtSrchLogin: TcxTextEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtSrchOSUser: TcxTextEdit;
    lcSearchCriteriaItem5: TdxLayoutItem;
    lcSearchCriteriaItem6: TdxLayoutItem;
    lblSearchMoment: TLabel;
    lcSearchCriteriaItem7: TdxLayoutItem;
    btnAllTime: TcxRadioButton;
    lcSearchCriteriaItem8: TdxLayoutItem;
    btnLastDay: TcxRadioButton;
    lcSearchCriteriaItem9: TdxLayoutItem;
    btnLastWeek: TcxRadioButton;
    lcSearchCriteriaItem10: TdxLayoutItem;
    btnPeriod: TcxRadioButton;
    lciSrchDateFrom: TdxLayoutItem;
    edtSrchDateFrom: TcxDateEdit;
    lciSrchDateTo: TdxLayoutItem;
    edtSrchDateTo: TcxDateEdit;
    edtSrchEvtCode: TcxMaskEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtSrchIP: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    procedure edtSrchDateFromEnter(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edtSrchEvtCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventsGridForm: TEventsGridForm;

implementation

uses
  MainDm, MainFrm;

{$R *.dfm}

procedure TEventsGridForm.edtSrchDateFromEnter(Sender: TObject);
begin
  inherited;
  btnPeriod.Checked := True;
end;

procedure TEventsGridForm.dsDataBeforeOpen(DataSet: TDataSet);
  var
    DateFrom, DateTo: Variant;
begin
  inherited;

  SetSearchParam( 'type_code',  Trim( Copy( edtSrchEvtCode.Text, 1, 3 ) ) );
  SetSearchParam( 'code',       Trim( Copy( edtSrchEvtCode.Text, 5, 5 ) ) );
  SetSearchParam( 'name',       Trim( edtSrchEvtName.Text ) );
  SetSearchParam( 'ip_address', Trim( edtSrchIP.Text      ) );
  SetSearchParam( 'login',      Trim( edtSrchLogin.Text   ) );
  SetSearchParam( 'os_user',    Trim( edtSrchOSUser.Text  ) );

  { all time }
  if btnAllTime.Checked then
    begin
      DateTo   := Null;
      DateFrom := Null;
    end
  else

  { last day }
  if btnLastDay.Checked then
    begin
      DateTo   := Now;
      DateFrom := DateTo - 1;
    end
  else

  { last week }
  if btnLastDay.Checked then
    begin
      DateTo   := Now;
      DateFrom := DateTo - 7;
    end

  { period }
  else
    begin
      DateTo   := edtSrchDateTo  .EditValue;
      DateFrom := edtSrchDateFrom.EditValue;
    end;

  SetSearchParam( 'date_to',   DateTo   );
  SetSearchParam( 'date_from', DateFrom );
end;

procedure TEventsGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetSession(MainData.Session);
  if MainForm.actLogSearchOnOpen.Checked then begin
    NoRecordOnShow := True;
    actSwitchSearchCriteria.Execute;
  end;
end;

procedure TEventsGridForm.edtSrchEvtCodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := False;
end;

initialization

  RegisterClass( TEventsGridForm );

end.
