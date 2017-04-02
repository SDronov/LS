unit DeclChargeGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, DeclChargeFrm,
  Menus, QueryList, cxCalc, cxCheckBox;

type
  TDeclChargeGridForm = class(TObjectGridForm)
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDECL_ID: TFloatField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    dsDataCHARGE_REST: TFloatField;
    grdDataDBBandedTableViewCHARGE_REST: TcxGridDBBandedColumn;
    actHistory: TAction;
    btnChargeHistory: TdxBarButton;
    dsDataKBKCODE_CODE: TStringField;
    grdDataDBBandedTableViewKBKCODE_CODE: TcxGridDBBandedColumn;
    dsDataCHARGE_MONTH: TDateTimeField;
    colChargeMonth: TcxGridDBBandedColumn;
    qryGetErrorCount: TfdcQuery;
    qryDeclGetDedSum: TfdcQuery;
    btnDeclChargeCancel: TdxBarButton;
    actDeleteCharge: TAction;
    qryDeclChargeCancel: TfdcQuery;
    dsDataKBKCODE_ID: TFloatField;
    qryDeclGetDedSumSUMM: TFloatField;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    qlCharges: TQueryList;
    qryIsDocChargeActive: TsqlOp;
    actSalvageChargeReturn: TAction;
    dxBarButton1: TdxBarButton;
    dsDataIS_SALVAGE: TStringField;
    sqlRegInOutherSystem: TsqlOp;
    procedure actDeleteExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actHistoryUpdate(Sender: TObject);
    procedure actHistoryExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure C(Sender: TObject);
    procedure srcDataDataChange(Sender: TObject; Field: TField);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actAddUpdate(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actSalvageChargeReturnExecute(Sender: TObject);
  private
    fAddEnable : boolean;
    fSubjectID : integer;
  protected
    procedure HandleRefresh; override;
    procedure CheckErrors( AMessage : string );
  public
    AllowCorrectCharge : boolean;
    AllowAddCharge : boolean;
  end;

implementation

uses
  ObjectFrm, fdcCustomGridFrm, fdcUtils, MainDm, DeclCorrectFrm,
  fdcCustomDBDataFrm, fdcCustomObjectGridFrm, fdcMessages,
  fdcCustomDataFrm;

{$R *.dfm}

procedure TDeclChargeGridForm.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  if RemoveCharge(dsDataID.Value, dsDataDECL_ID.Value, fSubjectID) then
  begin
     RefreshData;
     RefreshWaiters;
  end;
end;

procedure TDeclChargeGridForm.actAddExecute(Sender: TObject);
begin
  if AddCharge(dsData.Params.ParamValues['DECL_ID'], fSubjectID) then
  begin
     RefreshData;
     RefreshWaiters;
  end;
end;

procedure TDeclChargeGridForm.actOpenExecute(Sender: TObject);
begin
  CheckErrors( 'Нельзя корректировать начисления, пока есть неразрешённые ошибки по документу!' );

  if ChangeCharge(dsDataID.Value, dsDataDECL_ID.Value, fSubjectID) then
  begin
     RefreshData;
     RefreshWaiters;
  end;
end;

procedure TDeclChargeGridForm.HandleRefresh;
begin
  inherited;
end;


procedure TDeclChargeGridForm.actHistoryUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := grdDataDBBandedTableView.Controller.SelectedRowCount = 1;
end;

procedure TDeclChargeGridForm.actHistoryExecute(Sender: TObject);
begin
  inherited;
  ObjectServices.ShowForm('TDeclChargeHistForm', Params, nil);
end;

procedure TDeclChargeGridForm.actDeleteUpdate(Sender: TObject);
begin
  if (dsDataSUMMA.Value = 0) then
    TAction(Sender).Enabled := False
  else
    TAction(Sender).Enabled := AllowAddCharge;
end;

procedure TDeclChargeGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  colChargeMonth.Visible := (UpperCase(Owner.ClassName) = 'TCUSTOMDECLTEMPADMFORM');
  AllowCorrectCharge := True;
  AllowAddCharge := True;
end;

procedure TDeclChargeGridForm.CheckErrors( AMessage : string );
begin
  try
    qryGetErrorCount.ParamByName( 'DECL_ID' ).AsFloat := dsData.ParamByName( 'DECL_ID' ).AsFloat;
    qryGetErrorCount.Open;

    if qryGetErrorCount.FieldByName( 'c' ).AsInteger > 0 then
      raise Exception.Create( AMessage );
  finally
    if qryGetErrorCount.Active then
      qryGetErrorCount.Close;
  end;
end;

procedure TDeclChargeGridForm.actOpenUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := AllowCorrectCharge;
end;

procedure TDeclChargeGridForm.C(Sender: TObject);
begin
  inherited;

  if WarningDlg(
       'Отмена начисления. Продолжить?',
       'Выполнить отмену начисления для ' + dsDataNAME.asString + '? '#10 +
       'Отмена данной операции будет невозможна!',
       'Отмена данной операции будет невозможна!') <> mrYes
  then Exit;

  qryDeclChargeCancel.ParamByName('ID').AsFloat := dsDataID.AsFloat;
  qryDeclChargeCancel.ParamByName('DECL_ID').AsFloat := dsDataDECL_ID.AsFloat;
  qryDeclChargeCancel.ParamByName('PAY_TYPE_ID').AsFloat := dsDataPAY_TYPE_ID.AsFloat;
  qryDeclChargeCancel.ParamByName('SUMMA').AsFloat := dsDataSUMMA.AsFloat;
  qryDeclChargeCancel.ParamByName('CURRENCY_ID').AsFloat := dsDataCURRENCY_ID.AsFloat;
  qryDeclChargeCancel.ParamByName('KBKCODE_ID').AsFloat := dsDataKBKCODE_ID.AsFloat;
  qryDeclChargeCancel.ParamByName('CHARGE_MONTH').AsDateTime := dsDataCHARGE_MONTH.AsDateTime;
  qryDeclChargeCancel.ParamByName('TYPESYSNAME').AsString := dsDataTYPESYSNAME.AsString;
	qryDeclChargeCancel.ExecSQL;

  RefreshData();
end;

procedure TDeclChargeGridForm.srcDataDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

	if qryDeclGetDedSum.Active then qryDeclGetDedSum.Close;
  qryDeclGetDedSum.Open;

  actDeleteCharge.Enabled := (qryDeclGetDedSumSUMM.AsFloat = 0)
                              and
                             (dsData.RecordCount > 0)
                              and
                             (   MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'CustomDecl')
                              //or MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO')
                              );

  actSalvageChargeReturn.Enabled := False;
                              { -- функционал отключен
                              (dsData.RecordCount > 0)
                              and (qryDeclGetDedSumSUMM.AsFloat > 0)
                              and MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO')
                              and ( dsDataIS_SALVAGE.AsString = 'Y' );
                              }

  actSalvageChargeReturn.Visible := False;
                              { -- функционал отключен
                              MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO' );
                              }
end;

procedure TDeclChargeGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  actDeleteCharge.Enabled := (qryDeclGetDedSumSUMM.AsFloat = 0)
                              and
                             (dsData.RecordCount > 0)
                              and
                             (   MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'CustomDecl')
                              //or MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO')
                              );
  // только корректировка
  AllowCorrectCharge := not (    MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'SubjectFee')
                             and ( qryIsDocChargeActive.Exec( 'decl_id', [dsData.ParamByName( 'decl_id' ).Value] ) = 1 )
                             and ( sqlRegInOutherSystem.Exec( 'decl_id', [dsData.ParamByName( 'decl_id' ).Value] ) = 'Y' )
                            )
                        and not MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO')
                        and not MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TR')
                        and not MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TrDuplicate');

  // добавление/удаление
  AllowAddCharge := not (    MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'SubjectFee')
                             and ( qryIsDocChargeActive.Exec( 'decl_id', [dsData.ParamByName( 'decl_id' ).Value] ) = 1 )
                            )
                        and not MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO')
                        and not MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TR')
                        and not MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TrDuplicate');

  actSalvageChargeReturn.Enabled := False;
                              { -- функционал отключен
                                  (dsData.RecordCount > 0)
                              and ( qryDeclGetDedSumSUMM.AsFloat > 0 )
                              and MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO' )
                              and ( dsDataIS_SALVAGE.AsString = 'Y' );
                              }

  actSalvageChargeReturn.Visible := False;
                              { -- функционал отключен
                                MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO' );
                              }

  fAddEnable := not MainData.ObjectIs(dsDataDECL_ID.AsFloat, 'TPO')
            and AllowAddCharge;
end;

procedure TDeclChargeGridForm.actAddUpdate(Sender: TObject);
begin
  inherited;
  actAdd.Enabled := fAddEnable;
end;

procedure TDeclChargeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  fSubjectID := Params.ParamValues['SUBJECT_ID'];
end;

procedure TDeclChargeGridForm.actSalvageChargeReturnExecute(
  Sender: TObject);
begin
  CheckErrors( 'Нельзя корректировать начисления, пока есть неразрешённые ошибки по документу!' );

{  if ReturnSalvage(dsDataID.Value, dsDataDECL_ID.Value, fSubjectID) then
  begin
     //MainData.RegisterEvent('RET','00019',dsDataDECL_ID.AsString);
     RefreshData;
     RefreshWaiters;
  end;}


end;

initialization
   RegisterClass(TDeclChargeGridForm);

end.
