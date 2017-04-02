unit DebtBySubjFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, SubjIntf, cxCurrencyEdit;

type
  TDebtBySubjForm = class(TObjectForm, ISubjectHolder)
    dsDataADDRESS: TStringField;
    dsDataOKPO: TStringField;
    dsDataINN: TStringField;
    dsDataOGRN: TStringField;
    dsDataSOATO: TStringField;
    dsDataKPP: TStringField;
    dsDataPHONE: TStringField;
    dsDataFAX: TStringField;
    dsDataTELEX: TStringField;
    dsDataTELEGRAPH: TStringField;
    dsDataTELETYPE: TStringField;
    edtINN: TcxDBMaskEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtKPP: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    lcGeneralItem3: TdxLayoutItem;
    grdSumByKBK: TcxGrid;
    grdSumByKBKDBTableView: TcxGridDBTableView;
    grdSumByKBKLevel: TcxGridLevel;
    tabDeclDebt: TcxTabSheet;
    dsSumm: TfdcQuery;
    srcSumm: TDataSource;
    dsSummCURRENCY_ID: TFloatField;
    dsSummCUR_CODE: TStringField;
    dsSummSUMMA: TFloatField;
    grdSumByKBKDBTableViewCURRENCY_ID: TcxGridDBColumn;
    grdSumByKBKDBTableViewCUR_CODE: TcxGridDBColumn;
    grdSumByKBKDBTableViewSUMMA: TcxGridDBColumn;
    lcReuseSum: TdxLayoutGroup;
    edtDebtSum: TcxDBCurrencyEdit;
    lcGeneralItem4: TdxLayoutItem;
    edtLockSum: TcxDBCurrencyEdit;
    lcGeneralItem5: TdxLayoutItem;
    edtAvailSum: TcxDBCurrencyEdit;
    lcGeneralItem6: TdxLayoutItem;
    dsDataDEBTSUM: TFloatField;
    dsDataLOCKSUM: TFloatField;
    dsDataAVAILSUM: TFloatField;
    procedure tabDeclDebtShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    FDeclDebtForm: TForm;
  protected
    function MakeCaption(AUseModifiedFlag: Boolean = True): String;
      override;
    { Private declarations }
  public
    procedure RefreshData; override;
    function GetSubjectINN: String;
    function GetSubjectId: Double;
    function GetSubjectKPP: String;
    function GetSubjectName: String;
    { Public declarations }
  end;

var
  DebtBySubjForm: TDebtBySubjForm;

implementation

uses MainDm, fdcCustomObjectFrm, fdcCustomDataFrm, ObjectGridFrm,
  fdcObjectCore, fdcCustomCardFrm;

{$R *.dfm}

function TDebtBySubjForm.MakeCaption(AUseModifiedFlag: Boolean): String;
begin
  if Assigned(EditObject) then
     Result := EditObject.ObjName + '(' + 'должник' + ')';
end;

procedure TDebtBySubjForm.tabDeclDebtShow(Sender: TObject);
var
  AForm: TObjectGridForm;
begin
  inherited;
  if FDeclDebtForm = nil then
  begin
    AForm := TObjectGridForm(ObjectServices.ShowForm('TDeclDebtGridForm', Params, tabDeclDebt));
    AForm.RegisterWaiter(Self);
    FDeclDebtForm := AForm;
  end;
end;

procedure TDebtBySubjForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsSumm.Close;
  dsSumm.Open;
  tabGeneral.Caption := 'Задолженность';
end;

procedure TDebtBySubjForm.RefreshData;
begin
  with ParamByName('ID') do
    Value := Trunc(Value);
  inherited;
  with ParamByName('ID') do
    Value := Value + 0.1;
end;

function TDebtBySubjForm.GetSubjectId: Double;
begin
  Result := dsDataID.Value;
end;

function TDebtBySubjForm.GetSubjectINN: String;
begin
  Result := dsDataINN.Value;
end;

function TDebtBySubjForm.GetSubjectKPP: String;
begin
  Result := dsDataKPP.Value;
end;

function TDebtBySubjForm.GetSubjectName: String;
begin
  Result := dsDataNAME.Value;
end;

initialization
   RegisterClass(TDebtBySubjForm);

end.
