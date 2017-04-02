unit UFKPaySplitFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxTextEdit, cxCurrencyEdit, OracleData,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxDBEdit, fdcOracleSession;

type
  TUFKPaySplitForm = class(TfdcCustomSimpleDlgForm)
    edtAmount: TcxCurrencyEdit;
    liAmount: TdxLayoutItem;
    edtRest: TcxCurrencyEdit;
    liRetSum: TdxLayoutItem;
    liGrid: TdxLayoutItem;
    grdData: TcxGrid;
    grdDataDBTableView: TcxGridDBTableView;
    grdDataDBBandedTableView: TcxGridDBBandedTableView;
    grdDataLevel: TcxGridLevel;
    dsetSumByCust: TOracleDataSet;
    dsetSumByCustCUSTOMSCODE: TStringField;
    dsetSumByCustNAME: TStringField;
    dsetSumByCustFULL_NAME: TStringField;
    dsetSumByCustRESTCUSTOMSUMMA: TFloatField;
    dsetSumByCustRESTUFKSUMMA: TFloatField;
    dsetSumByCustEDITSUMMA: TFloatField;
    dsSumByCustoms: TDataSource;
    grdDataDBBandedTableViewCUSTOMSCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRESTCUSTOMSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRESTUFKSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEDITSUMMA: TcxGridDBBandedColumn;
    cxGridPopupMenu: TcxGridPopupMenu;
    procedure dsetSumByCustApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure FormShow(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure grdDataDBBandedTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
  private
    FUFKPaymentId: Integer;
    FUFKPaySum: Double;

    function GetEditSum: Double;
    procedure UpdateEditRestValue;
    procedure SetUFKPaySum(const Value: Double);
    function  GetUFKPaySum: Double;
  public
    property UFKPaymentId: Integer read FUFKPaymentId write FUFKPaymentId;
    property UFKPaySum: Double read GetUFKPaySum write SetUFKPaySum;
  end;

var
  UFKPaySplitForm: TUFKPaySplitForm;

implementation

uses DataDM, fdcMessages;

{$R *.dfm}


function TUFKPaySplitForm.GetEditSum: Double;
var
  vSum : variant;
  vItem: TcxGridDBBandedTableSummaryItem;

  function GetSumFooterItem(AFooter: TcxDataFooterSummaryItems): TcxGridDBBandedTableSummaryItem;
    var
      i : integer;
  begin
    Result := nil;
    for i := 0 to AFooter.Count - 1 do
      if (AFooter[i].Kind = skSum) and
         (AFooter[i].Position = spFooter) and
         ( (TcxGridDBBandedTableSummaryItem(AFooter[i]).FieldName = dsetSumByCustEDITSUMMA.FieldName )or
           (TcxGridDBBandedTableSummaryItem(AFooter[i]).Column = grdDataDBBandedTableViewEDITSUMMA)
         )  then
        begin
          Result := TcxGridDBBandedTableSummaryItem(AFooter[i]);
          Break;
        end;
    if not Assigned(Result) then
      begin
         Result := AFooter.Add as TcxGridDBBandedTableSummaryItem;
         Result.Kind := skSum;
         Result.Column := grdDataDBBandedTableViewEDITSUMMA;
         Result.Position := spFooter;
      end;
  end;
begin
  with grdDataDBBandedTableView.DataController.Summary do
    begin
      vItem := GetSumFooterItem( FooterSummaryItems );
      CalculateFooterSummary;
      vSum := FooterSummaryValues[vItem.Index];
    end;
  if VarIsNull(vSum) or
     VarIsEmpty(vSum) or
    (vSum = 0)then
    Result := 0.0
  else
    Result := vSum;
end;


procedure TUFKPaySplitForm.SetUFKPaySum(const Value: Double);
begin
  edtAmount.Value := Value;
  (grdDataDBBandedTableViewEDITSUMMA.Properties as TcxCurrencyEditProperties).MaxValue := Value;
  UpdateEditRestValue;
end;

function TUFKPaySplitForm.GetUFKPaySum: Double;
begin
  Result := edtAmount.Value;
end;

procedure TUFKPaySplitForm.dsetSumByCustApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
  Applied := True;
end;

procedure TUFKPaySplitForm.FormShow(Sender: TObject);
begin
  inherited;
  if dsetSumByCust.Active then
    dsetSumByCust.Refresh
  else
    dsetSumByCust.Open;
end;

procedure TUFKPaySplitForm.actOkUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not dsetSumByCust.IsEmpty and (edtRest.Value < 0.01);
end;

procedure TUFKPaySplitForm.UpdateEditRestValue;
var
  Sum1, Sum2: Double;
begin
  Sum1 := edtAmount.Value;
  Sum2 := GetEditSum;
  edtRest.Value := Sum1 - Sum2;
end;

procedure TUFKPaySplitForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := (ModalResult <> mrOk) or
              (ConfirmDlg('Распределить ПП на указанные суммы?', 'Внимание! Изменения невозможно будет отменить.' ) = mrYes);
end;

procedure TUFKPaySplitForm.grdDataDBBandedTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  UpdateEditRestValue;
end;

end.
