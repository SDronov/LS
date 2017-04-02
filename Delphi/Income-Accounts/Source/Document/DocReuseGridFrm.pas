unit DocReuseGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCalendar, cxCheckBox, cxCurrencyEdit, Oracle,
  cxDropDownEdit;

type
  TDocReuseGridForm = class(TObjectGridForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataCUSTOMS_NEW_ID: TFloatField;
    dsDataCUSTOMS_CODE_OLD: TStringField;
    dsDataCUSTOMS_CODE_NEW: TStringField;
    dsDataSUBJECT_NAME: TStringField;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_CODE_NEW: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    dsDataSUBJECT_ID: TFloatField;
    dsDataAMOUNT: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCURRENCY_CODE: TStringField;
    dsDataCURRENCY_NAME: TStringField;
    grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_NAME: TcxGridDBBandedColumn;
    actDoForm: TAction;
    pkgCommon: TOraclePackage;
    barBtnDoForm: TdxBarButton;
    grdDataDBBandedTableViewSIGNED_BY: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSIGNED_BY: TStringField;
    actRemoveFromPack: TAction;
    btnRemoveFromPack: TdxBarButton;
    grdDataDBBandedTableViewCUSTOMS_CODE_OLD: TcxGridDBBandedColumn;
    lcSearchCriteriaLabel3: TdxLayoutItem;
    Label3: TLabel;
    lcSearchCrtFromDateActiveted: TdxLayoutItem;
    edtFromDateActiveted: TcxDateEdit;
    lcSearchCrtToDateActiveted: TdxLayoutItem;
    edtToDateActiveted: TcxDateEdit;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGNED_BY_CHIEF_OTP: TStringField;
    dsDataREASON: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataSTATE_NAME: TStringField;
    dsDataSTATE_SYSNAME: TStringField;
    grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn;
    lciSearchINN: TdxLayoutItem;
    editINN: TcxTextEdit;
    lciSearchKPP: TdxLayoutItem;
    editKPP: TcxTextEdit;
    lciSearchNameSubject: TdxLayoutItem;
    editNameSubject: TcxTextEdit;
    lciSearchDoc_Number: TdxLayoutItem;
    editDoc_Number: TcxTextEdit;
    lciLableDoc: TdxLayoutItem;
    Label_Doc: TLabel;
    lciSearchFrom_Doc_date: TdxLayoutItem;
    editfrom_Doc_date: TcxDateEdit;
    lciSearchto_doc_date: TdxLayoutItem;
    editto_doc_date: TcxDateEdit;
    lciSearchFrom_Custom: TdxLayoutItem;
    editFrom_Custom: TcxTextEdit;
    lciSearchto_custom: TdxLayoutItem;
    editto_custom: TcxTextEdit;
    lciSearchStateName: TdxLayoutItem;
    editStateName: TcxTextEdit;
    dsDataCUSTOMS_SOURCE: TStringField;
    dsDataCUSTOMS_TARGET: TStringField;
    grdDataDBBandedTableViewCUSTOMS_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_TARGET: TcxGridDBBandedColumn;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure actDoFormExecute(Sender: TObject);
    procedure actRemoveFromPackUpdate(Sender: TObject);
    procedure actRemoveFromPackExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    fContent      : integer;
    { Private declarations }
    procedure doRemoveDoc; virtual;
    procedure RemoveDoc(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
  public
     // Отображаемые данные
     //0: список документов;
     //1: список документов, в реестре перезачетов;
     //2: список документов, в реестре подтвержд. перезачетов;
    property Content : integer read fContent;
  end;

var
  DocReuseGridForm: TDocReuseGridForm;

implementation

{$R *.dfm}

uses
  MainDM, fdcCustomDBDataFrm, fdcCustomObjectGridFrm, fdcMessages,
  fdcCustomDataFrm;

const
  colInputDoc         = clMedGray;
  colInputDocSelected = clBtnFace;

procedure TDocReuseGridForm.FormShow(Sender: TObject);
begin
  if Assigned( Params.FindParam( 'Content' ) ) then
    fContent := Params.ParamByName('Content').AsInteger;
  if not( fContent in [0, 1, 2]) then
    fContent := 0;

  if Pos( '/*pack_section*/', dsData.SQL.Text ) > 0 then
    if Assigned( Params.FindParam( 'pack_id' ) ) then
      begin
        if fContent = 1 then
          dsData.SQL.Text := StringReplace(
              dsData.SQL.Text,
              '/*pack_section*/',
              'AND EXISTS( SELECT 0 ' +
                            'FROM fdc_rel_pack_docs_lst r ' +
                           'WHERE r.object_id = ' + Params.ParamByName( 'pack_id' ).AsString +
                            ' AND r.rel_object_id = rc.id )',
              [rfReplaceAll] )
        else
          dsData.SQL.Text := StringReplace(
              dsData.SQL.Text,
              '/*pack_section*/',
              'AND EXISTS( SELECT 0 ' +
                            'FROM fdc_rel_pack_docs_lst r ' +
                                ',fdc_doc_reuse_customs_y_lst rcy ' +
                           'WHERE r.object_id = ' + Params.ParamByName( 'pack_id' ).AsString +
                            ' AND r.rel_object_id = rcy.id'+
                            ' AND rc.id = rcy.confirmed_doc_id )',
              [rfReplaceAll] )
        ;

      end;
  actAdd.Visible            := (fContent = 0);
  actDelete.Visible         := (fContent = 0);
  actDoForm.Visible         := (fContent = 1) or
                               ((fContent = 2) and( MainData.GetCustomsLevel = 1));
  actRemoveFromPack.Visible := actDoForm.Visible;
  inherited;
end;

procedure TDocReuseGridForm.actDoFormExecute(Sender: TObject);
begin
  if fContent = 1 then
    pkgCommon.PackageName := 'p_DocPack_Reuse'
  else
    pkgCommon.PackageName := 'p_DocPack_ReuseY';

  pkgCommon.CallProcedure( 'FormPackage', [ParamByName( 'pack_id' ).AsInteger] );

  pkgCommon.Session.Commit;

  RefreshData;
end;


procedure TDocReuseGridForm.actRemoveFromPackUpdate(Sender: TObject);
  var
    ParamReadOnly : TfdcParam;
begin
  ParamReadOnly := Params.FindParam('TabDocsReadOnly');
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
                                 Assigned(ObjectServices) and
                                 (ActiveGridTableView.Controller.SelectedRecordCount > 0)and
                                 (not Assigned(ParamReadOnly) or not ParamReadOnly.AsBoolean);
end;

procedure TDocReuseGridForm.actRemoveFromPackExecute(Sender: TObject);
begin
  with ActiveGridTableView.Controller,
       ActiveGridTableView.DataController do begin
    { показать предупреждение }
    if (
         (SelectedRecordCount > 1) and
         (WarningDlg(
           'Исключить выделенные объекты из реестра?',
           Format('Все выделенные объекты (%d из %d) будут удалены. ' +
             'Удаление выделенных объектов невозможно будет отменить. ' +
             'Удалить выделенные объекты?', [SelectedRecordCount, RecordCount])
          ) <> mrYes)
       ) or
       (
         (SelectedRecordCount = 1) and
         (WarningDlg(
            'Исключить объект из реестра?',
            dsDataTYPENAME.asString + ' ' + dsDataNAME.asString + ' будет удален. ' +
            'Удаление объекта невозможно будет отменить. ' +
            'Удалить объект?'
          ) <> mrYes)
       )
    then
      Exit;

    { удалить выделенные объекты и перечитать данные }
    //FDeleting := True;
    try
      Refresh;
      IterateRecords(RemoveDoc, True, SelectedRecordCount > 1);
    finally
      //FDeleting := False;
      RefreshData;
    end;

    { обновить ожидающие формы }
    RefreshWaiters;
  end;

end;

procedure TDocReuseGridForm.RemoveDoc(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  try
    ADescr := 'Исключение документов...';
    ShowProgress(ADescr);
    DoRemoveDoc;
  except
    on E: Exception do
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          if WarningDlg(
               'Ошибка удаления объекта',
               'При попытке удаления объекта ' +
               VarToStr(SelectedRecords[AIndex].Values[grdDataDBBandedTableViewNAME.Index]) + ' ' +
               'произошла ошибка. Если вы хотите продолжить удаление ' +
               'оставшихся объектов нажмите "Да", иначе нажмите "Нет".',
               E.Message) <> mrYes
          then
            ABreak := True;
        end else if ACount = 1 then
             Application.HandleException(Self)
        else
          MessageDlg(
            'Ошибка удаления объекта',
            'При попытке удаления объекта ' +
            VarToStr(SelectedRecords[AIndex].Values[grdDataDBBandedTableViewNAME.Index]) + ' ' +
            'произошла ошибка',
            E.Message, mtWarning, [mbOk], 0);
  end;
end;

procedure TDocReuseGridForm.doRemoveDoc;
begin
  if not dsDataID.IsNull then
    begin
      if fContent = 1 then
        pkgCommon.PackageName := 'p_DocPack_Reuse'
      else
        pkgCommon.PackageName := 'p_DocPack_ReuseY';

      pkgCommon.CallProcedure( 'RemoveDoc', [ParamByName( 'pack_id' ).AsInteger, dsDataID.AsFloat] );
      pkgCommon.Session.Commit;
    end;
end;

procedure TDocReuseGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  {
  // раскрасить входящие документы
  if VarToStr( AViewInfo.GridRecord.Values[grdDataDBBandedTableViewCUSTOMS_CODE_NEW.Index]) = MainData.GetCustomsCode then
  begin
      ACanvas.Canvas.Brush.Style := bsSolid;
      if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused then
        ACanvas.Canvas.Brush.Color := colInputDocSelected
      else
        ACanvas.Canvas.Brush.Color := colInputDoc;
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
  ADone := False;
  }
end;

procedure TDocReuseGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;

  if VarToStr(ARecord.Values[ grdDataDBBandedTableViewCUSTOMS_CODE_NEW.Index ]) = MainData.GetCustomsCode then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackAlienSelected
    else
      AStyle := MainData.stlDocPackAlien;
end;

procedure TDocReuseGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('FROM_DATE_ACTIVETED').Value := edtFromDateActiveted.EditValue;
  dsData.ParamByName('TO_DATE_ACTIVETED').Value := edtToDateActiveted.EditValue;
  dsData.ParamByName('FROM_DOC_DATE').Value := editfrom_Doc_date.EditValue;
  dsData.ParamByName('TO_DOC_DATE').Value := editto_Doc_date.EditValue;
  dsData.ParamByName('INN').Value := editInn.EditValue;
  dsData.ParamByName('KPP').Value := editKpp.EditValue;
  dsData.ParamByName('SUBJECT_NAME').Value := editNameSubject.EditValue;
  dsData.ParamByName('DOC_NUMBER').Value := editDOC_NUMBER.EditValue;
  dsData.ParamByName('CUSTOMS_CODE_OLD').Value := editfrom_custom.EditValue;
  dsData.ParamByName('CUSTOMS_CODE_NEW').Value := editto_custom.EditValue;
  dsData.ParamByName('STATE_NAME').Value := editStateName.EditValue;
end;

initialization
  RegisterClass( TDocReuseGridForm );

end.
