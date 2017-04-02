unit DecisionPaybackGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManDecisionGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalc, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCurrencyEdit, cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TDecisionPaybackGridForm = class(TRManDecisionGridForm)
    dsDataCURRENCY_ID: TFloatField;
    dsDataDESTSUB_ID: TFloatField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSIGNED_BY: TStringField;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGNED_BY_CHIEF_UDF: TStringField;
    dsDataSTATE_NAME: TStringField;
    columnSTATE_NAME: TcxGridDBBandedColumn;
    dsDataKBKCODE: TStringField;
    colKBKCODE: TcxGridDBBandedColumn;
    dsDataEXT_SOURCE: TStringField;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    dsDataCUSTOMSFULLNAME: TStringField;
    grdDataDBBandedTableViewCUSTOMSFULLNAME: TcxGridDBBandedColumn;
    dsDataLAST_DAYS: TFloatField;
    grdDataDBBandedTableViewLAST_DAYS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    dsDataREASON_NAME: TStringField;
    grdDataDBBandedTableViewREASON_NAME: TcxGridDBBandedColumn;
    dsDataREASON_CODE: TStringField;
    grdDataDBBandedTableViewREASON_CODE: TcxGridDBBandedColumn;
    dsDataDOC_OSN_CODE: TStringField;
    grdDataDBBandedTableViewCODE_DOC_OSN: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    {procedure dsDataBeforeOpen(DataSet: TDataSet);    }
    procedure FormShow(Sender: TObject);
  private
  public
  end;


implementation

uses uSelTypeObject, MainDm;

{$R *.dfm}

procedure TDecisionPaybackGridForm.actAddExecute(Sender: TObject);
begin
{  RegisterAsWaiterFor(ObjectServices.CreateObject('DecPaybackAdvance', True, Params));}
  fSelTypeObject := TfSelTypeObject.Create(self);
  fSelTypeObject.TypeStr := '''DecPaybackAdvance'''+','+'''DecPaybackTimeOut''';
  try
  if  fSelTypeObject.ShowModal = mrOk then
     RegisterAsWaiterFor(ObjectServices.CreateObject(fSelTypeObject.TypeStr, True, Params));
  finally
     fSelTypeObject.Free;
  end;;
end;

procedure TDecisionPaybackGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
   if ARecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ] <> maindata.GetCustomsCode then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackAlienSelected
    else
      AStyle := MainData.stlDocPackAlien
end;

{procedure TDecisionPaybackGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
      showmessage(BoolToStr(InitialOpen));

inherited;
end;                 }

procedure TDecisionPaybackGridForm.FormShow(Sender: TObject);
begin
if (Self.Owner.Name = 'edtPrevDecision') then
  begin
    edtDeclName.Text := ParamsHolder.Params.ParamValues['DECL_NAME'];
    edtINN.Text      := VarToStr(ParamsHolder.Params.ParamValues['DECL_INN']);
    edtKPP.Text      := VarToStr(ParamsHolder.Params.ParamValues['DECL_KPP']);
    SetSearchParam('DECL_NAME', edtDeclName.Text);
    SetSearchParam('INN', edtINN.Text);
    SetSearchParam('KPP', edtKPP.Text);
    btnSwitchSearchCriteria.Enabled := false;
  end;
inherited;
end;

initialization
  RegisterClass(TDecisionPaybackGridForm);

end.
