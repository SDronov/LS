unit LegDeclFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomCardFrm, cxGraphics, OracleData, cxDropDownEdit,
  cxDBEdit, cxCurrencyEdit, cxCalendar, cxMemo, dxLayoutControl,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxLookAndFeels,
  dxLayoutLookAndFeels, ActnList, cxPC, cxControls, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox, cxSpinEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Menus, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxButtonEdit;

type
  TLegDeclForm = class(TfdcCustomCardForm)
    dsMain: TOracleDataSet;
    dsGoods: TOracleDataSet;
    DataSource1: TDataSource;
    cxTabSheet1: TcxTabSheet;
    dsMainNNN: TStringField;
    dsMainDECL_NO: TStringField;
    dsMainINN: TStringField;
    dsMainSUBJECT_ID: TFloatField;
    dsMainG011: TStringField;
    dsMainG012: TStringField;
    dsMainG12: TFloatField;
    dsMainG221: TStringField;
    dsMainG444A: TStringField;
    dsMainG444B: TDateTimeField;
    dsMainG447A: TStringField;
    dsMainG447B: TDateTimeField;
    dsMainK115: TStringField;
    dsMainG40: TStringField;
    dsMainGD1: TDateTimeField;
    dsMainCURR_ID: TFloatField;
    dsMainCUST_MODE: TFloatField;
    dsMainERR_TEXT: TStringField;
    dsMainNCLOSE: TFloatField;
    dsMainSROK: TDateTimeField;
    dsMainDOZA_P: TFloatField;
    dsMainDOZA_A: TFloatField;
    dsMainDOZA_N: TFloatField;
    dsMainKODVAL: TStringField;
    dsMainCURR2_ID: TFloatField;
    dsMainFORPLAT: TIntegerField;
    dsMainTOSV: TIntegerField;
    dsMainID: TFloatField;
    dsMainCUR_CODE: TStringField;
    dsMainCUR_CODE31: TStringField;
    dsMainKPP: TStringField;
    dsMainDECL_NAME: TStringField;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBComboBox1: TcxDBComboBox;
    lcGeneralItem3: TdxLayoutItem;
    cxDBMaskEdit3: TcxDBMaskEdit;
    lcGeneralItem4: TdxLayoutItem;
    cxDBMaskEdit4: TcxDBMaskEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBMaskEdit5: TcxDBMaskEdit;
    lcGeneralItem6: TdxLayoutItem;
    cxDBTextEdit1: TcxDBButtonEdit;
    lcGeneralItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcGeneralItem8: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem9: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcGeneralItem10: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem11: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGeneralGroup3: TdxLayoutGroup;
    cxDBTextEdit4: TcxDBTextEdit;
    lcGeneralItem12: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    cxDBDateEdit3: TcxDBDateEdit;
    lcGeneralItem13: TdxLayoutItem;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxTabSheet3: TcxTabSheet;
    cxDBDateEdit4: TcxDBDateEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxDBSpinEdit1: TcxDBMaskEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxDBCheckBox1: TcxDBCheckBox;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Group2: TdxLayoutGroup;
    lcGeneralGroup5: TdxLayoutGroup;
    srcGoods: TDataSource;
    dsGoodsGTD_NNN: TStringField;
    dsGoodsPAY_TYPE_ID: TFloatField;
    dsGoodsPAY_MODE_ID: TFloatField;
    dsGoodsSUMMA: TFloatField;
    dsGoodsCURR_ID: TFloatField;
    dsGoodsGOODS_ID: TFloatField;
    dsGoodsGOODS_CODE: TStringField;
    dsGoodsPAY_TYPE_CODE: TStringField;
    dsGoodsPAY_MODE_CODE: TStringField;
    dsGoodsCURR_CODE: TStringField;
    dsGoodsNO: TIntegerField;
    actAdd: TAction;
    actDel: TAction;
    dxBarDockControl1: TdxBarDockControl;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dsPays: TOracleDataSet;
    srcPays: TDataSource;
    grdPays: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dsPaysGTD_NNN: TStringField;
    dsPaysPAY_TYPE_ID: TFloatField;
    dsPaysCURR_ID: TFloatField;
    dsPaysSUMMA: TFloatField;
    dsPaysPLAT_NNN: TStringField;
    dsPaysCURR_CODE: TStringField;
    dsPaysPAY_TYPE_CODE: TStringField;
    cxGridDBTableView1PAY_TYPE_CODE: TcxGridDBColumn;
    cxGridDBTableView1SUMMA: TcxGridDBColumn;
    cxGridDBTableView1CURR_CODE: TcxGridDBColumn;
    cxGridDBTableView1PLAT_NNN: TcxGridDBColumn;
    dsPPList: TOracleDataSet;
    srcPPList: TDataSource;
    cxDBMaskEdit6: TcxDBMaskEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxGridPopupMenu1: TcxGridPopupMenu;
    cxGridPopupMenu2: TcxGridPopupMenu;
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure dsMainBeforeEdit(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsMainBeforeOpen(DataSet: TDataSet);
    procedure actAddUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDelUpdate(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsMainAfterInsert(DataSet: TDataSet);
    procedure dsMainAfterOpen(DataSet: TDataSet);
    procedure cxDBTextEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
  procedure SubjectFound(AGridTableView: TcxGridTableView; AIndex,
    ACount: integer; var ADescr: string; var ABreak: boolean);
  protected
    function MakeCaption(AUseModifiedFlag: Boolean = True): String;
      override;
    { Private declarations }
  public
    { Public declarations }
  end;

  function Add: String;
  function Edit(NNN: String): boolean;

implementation

uses fdcUtils, fdcMessages, DataDM, SubejctGridFrm;

{$R *.dfm}

function Add: String;
var
  F: TDeclForm;
begin
  F := TDeclForm.Create(nil);
  try
    Result := '';
    F.dsMain.SetVariable('NNN', NULL);
    F.dsMain.Open;
    if F.ShowModal = mrOk then
        Result := F.dsMainNNN.Value;
  finally
    F.Free;
  end;
end;

function Edit(NNN: String): boolean;
var
  F: TDeclForm;
begin
  F := TDeclForm.Create(nil);
  try
    F.dsMain.SetVariable('NNN', NNN);
    F.dsMain.Open;
    Result := false;
    if F.ShowModal = mrOk then
        Result := true;
  finally
    F.Free;
  end;
end;

procedure TLegDeclForm.actSaveExecute(Sender: TObject);
begin
//  inherited;
  dsMain.Session.ApplyUpdates([dsMain, dsGoods, dsPays], True);
  ModalResult := mrOk;
end;

function IsModified(DataSet: TOracleDataSet): boolean;
begin
  Result := (DataSet.State in dsEditModes) or DataSet.UpdatesPending;
end;

procedure TLegDeclForm.actSaveUpdate(Sender: TObject);
begin
//  inherited;
  TAction(Sender).Enabled := IsModified(dsMain) or IsModified(dsGoods) or IsModified(dsPays);
end;

function TLegDeclForm.MakeCaption(AUseModifiedFlag: Boolean): String;
begin
  if dsMain.IsEmpty or (dsMain.State = DB.dsInsert) then
    Result := 'Новая ДТ'
    else Result := Format('ДТ №%s',  [dsMainDECL_NO.Value]);
end;

procedure TLegDeclForm.dsMainBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  Caption := '* ' + Caption;
end;

procedure TLegDeclForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  CardName : string;
  mr: TModalResult;
begin
  { warn user about unsaved changes presence }
  if IsModified(dsMain) or IsModified(dsGoods) or IsModified(dsPays) then
  begin
    CardName := MakeCaption(False);
    mr := MessageDlg(
      'Сохранить изменения "' + CutRight(CardName) + '"?',
      'После закрытия окна все сделанные изменения "' +
      CardName + '" будут потеряны. ' +
      'Если Вы хотите сохранить изменения нажмите "Да", ' +
      'если изменения сохранять не надо нажмите "Нет", ' +
      'для отмены закрытия окна нажмите "Отмена".',
      '', mtWarning, [mbYes, mbNo, mbCancel], 0);
     CanClose := mr <> mrCancel;
     if mr = mrYes then
     try
       dsMain.Post;
     except
       Application.HandleException(Self);
       CanClose := False;
     end;

      if mr = mrNo then
         dsMain.Session.Rollback;
  end;
end;

procedure TLegDeclForm.dsMainBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsGoods.Open;
  dsPPList.Open;
  dsPays.Open;
end;

procedure TLegDeclForm.actAddUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Screen.ActiveControl is TcxGridSite;
end;

procedure TLegDeclForm.actAddExecute(Sender: TObject);
begin
  inherited;
{
  if dsMain.State = DB.dsInsert then
  begin
    dsMain.Post;
    dsMain.ApplyUpdates([aaInsert]);
    dsMain.RefreshRecord;
  end;
}
  TcxGridSite(Screen.ActiveControl).GridView.DataController.Append;
end;

procedure TLegDeclForm.actDelUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := (Screen.ActiveControl is TcxGridSite) and
     (TcxCustomGridTableController(TcxGridSite(Screen.ActiveControl).GridView.Controller).SelectedRecordCount > 0);
end;

procedure TLegDeclForm.actDelExecute(Sender: TObject);
begin
  inherited;
  TcxCustomGridTableController(TcxGridSite(Screen.ActiveControl).GridView.Controller).DeleteSelection;
end;

procedure TLegDeclForm.FormShow(Sender: TObject);
begin
   BarManager.Bars[0].Visible := False;
  inherited;
   BarManager.Bars[0].Visible := True;
//  BarManager.Bars[0].DockedDockControl := dxBarDockControl1;
end;

procedure TLegDeclForm.dsDataAfterOpen(DataSet: TDataSet);
begin
//  inherited;

end;

procedure TLegDeclForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
//  inherited;

end;

procedure TLegDeclForm.dsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if dsMainNNN.IsNull then
      dsMainNNN.Value := FloatToStr(Now);
end;

procedure TLegDeclForm.dsMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if not dsMainSUBJECT_ID.IsNull then
  begin
    dsMainINN.ReadOnly := True;
    dsMainKPP.ReadOnly := True;
    dsMainDECL_NAME.ReadOnly := True;
    cxDBMaskEdit4.Style.Color := clSilver; //clInactiveCaptionText;
    cxDBMaskEdit5.Style.Color := clSilver; //clInactiveCaptionText;
    cxDBTextEdit1.Style.Color := clSilver; //clInactiveCaptionText;
  end;
end;

procedure TLegDeclForm.cxDBTextEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  F: TSubjectGridForm;
begin
  inherited;
  F := TSubjectGridForm.Create(nil);
  try
    F.SearchMode := True;
    F.OnSearchFinished := SubjectFound;
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TLegDeclForm.SubjectFound(AGridTableView: TcxGridTableView; AIndex,
  ACount: integer; var ADescr: string; var ABreak: boolean);
begin
 dsMain.Edit;
 dsMainINN.AsVariant := TcxGridDBTableView(AGridTableView).DataController.DataSet['INN'];
 dsMainKPP.AsVariant := TcxGridDBTableView(AGridTableView).DataController.DataSet['KPP'];
 dsMainDECL_NAME.AsVariant := TcxGridDBTableView(AGridTableView).DataController.DataSet['NAME'];
 dsMainSUBJECT_ID.AsVariant := TcxGridDBTableView(AGridTableView).DataController.DataSet['ID'];
end;

end.
