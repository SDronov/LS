unit PayForGridFrm;

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
  TPayForGridForm = class(TfdcCustomGridForm)
    dsDatasubject_name: TStringField;
    dsDatasubject_inn: TStringField;
    dsDatasubject_kpp: TStringField;
    dsDatasumma: TFloatField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn;
    actPayFor: TAction;
    actRetPayFor: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    QueryList1: TQueryList;
    sqlPayFor: TsqlOp;
    dsDatarest_summa: TFloatField;
    grdDataDBBandedTableViewColumn8: TcxGridDBBandedColumn;
    dsDatasubject_id: TIntegerField;
    actHistory: TAction;
    dxBarButton3: TdxBarButton;
    dsDatapayment_id: TIntegerField;
    sqlGetRest: TsqlOp;
    dsDataNAME: TStringField;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    sqlGetPO: TsqlOp;
    procedure FormShow(Sender: TObject);
    procedure actPayForExecute(Sender: TObject);
    procedure actRetPayForExecute(Sender: TObject);
    procedure actPayForUpdate(Sender: TObject);
    procedure actRetPayForUpdate(Sender: TObject);
    procedure actHistoryExecute(Sender: TObject);
    procedure actHistoryUpdate(Sender: TObject);
    procedure actSwitchSearchCriteriaUpdate(Sender: TObject);
  private
    { Private declarations }
    FDecisionForm : TForm;
  public
    { Public declarations }
  end;

var
  PayForGridForm: TPayForGridForm;

implementation

uses MainDM, SelectPayForFrm, DateUtils, ObjServices, DecisionForFrm;


{$R *.dfm}

procedure TPayForGridForm.FormShow(Sender: TObject);
begin
  inherited;
  pnlSearchCriteria.Visible := False;
  splSearchCriteria.Visible := False;
end;

procedure TPayForGridForm.actPayForExecute(Sender: TObject);
begin
  inherited;
  FDecisionForm := GetObjectServices.CreateObject( 'DecisionFor', False, nil );
  with FDecisionForm as TDecisionForForm do
    begin
      (FDecisionForm as TDecisionForForm).vPoID    :=self.Params.ParamValues['ID'];
      sqlGetPO.Exec('ID',[self.Params.ParamValues['ID']]);
      dsData.FieldByName( 'subject_id' ).AsVariant := sqlGetPo.ParamValues['DECL_ID'];
      dsData.FieldByName( 'decl_name' ).AsVariant  := sqlGetPo.ParamValues['DECL_NAME'];
      dsData.FieldByName( 'decl_inn' ).AsVariant   := sqlGetPo.ParamValues['DECL_INN'];
      dsData.FieldByName( 'decl_kpp' ).AsVariant   := sqlGetPo.ParamValues['DECL_KPP'];
      Modify(nil);
      lciDeclInn.Enabled   := False;
      lciDeclKPP.Enabled   := False;
      lciDeclName.Enabled  := False;
    end;
  RefreshData;
end;

procedure TPayForGridForm.actRetPayForExecute(Sender: TObject);
var
  P: TfdcParams;
begin
  inherited;
  P := SelectPayFor(dsData['subject_id'],dsData['subject_name'],dsData['rest_summa'],-dsData['rest_summa'],True);
  try
    if P <> nil then
      try
      sqlPayFor.Exec('ID;SUBJECT_ID;SUMMA;DOC_DATE;DOC_NO;DOC_NAME'
        ,[Params.ParamValues['ID']
        ,P.ParamValues['SUBJECT_ID']
        ,P.ParamValues['SUMMA']
        ,P.ParamValues['DOC_DATE']
        ,P.ParamValues['DOC_NO']
        ,P.ParamValues['DOC_NAME']]);

       RefreshData;
       except
         raise;
       end;
  finally
    P.Free;
  end;
end;

procedure TPayForGridForm.actPayForUpdate(Sender: TObject);
begin
  inherited;
  if Params.ParamValues['REST_SUMMA']>0 then
    TAction(Sender).Enabled:= True
    else
    TAction(Sender).Enabled:= False;
end;

procedure TPayForGridForm.actRetPayForUpdate(Sender: TObject);
begin
  inherited;
  if not dsData.EOF and (dsDatasumma.Value > 0) then
    TAction(Sender).Enabled:= True
    else
    TAction(Sender).Enabled:= False;
end;

procedure TPayForGridForm.actHistoryExecute(Sender: TObject);
begin
  inherited;
  GetObjectServices.ShowForm('TPayForHistForm', Params, nil);
end;

procedure TPayForGridForm.actHistoryUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := grdDataDBBandedTableView.Controller.SelectedRowCount = 1;
end;

procedure TPayForGridForm.actSwitchSearchCriteriaUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Visible:= False;
end;

initialization
   RegisterClass(TPayForGridForm);

end.
