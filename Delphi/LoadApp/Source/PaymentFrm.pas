unit PaymentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomCardFrm, cxGraphics, OracleData, cxDropDownEdit,
  cxDBEdit, cxCurrencyEdit, cxCalendar, cxMemo, dxLayoutControl,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxLookAndFeels,
  dxLayoutLookAndFeels, ActnList, cxPC, cxControls, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, cxGridTableView,
  cxCheckBox, StdCtrls, Mask, DBCtrls;

type
  TPaymentForm = class(TfdcCustomCardForm)
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcGeneralItem1: TdxLayoutItem;
    cxDBMaskEdit3: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    cxDBTextEdit1: TcxDBButtonEdit;
    lcGeneralItem4: TdxLayoutItem;
    cxDBMemo1: TcxDBMemo;
    lcGeneralItem5: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcGeneralItem6: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem7: TdxLayoutItem;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    lcGeneralItem8: TdxLayoutItem;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    lcGeneralItem9: TdxLayoutItem;
    cxDBMaskEdit4: TcxDBMaskEdit;
    lcGeneralItem10: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGeneralGroup3: TdxLayoutGroup;
    dsMain: TOracleDataSet;
    dsMainNNN: TStringField;
    dsMainINN: TStringField;
    dsMainINN_NAME: TStringField;
    dsMainDOC_NO: TStringField;
    dsMainDOC_DATE: TDateTimeField;
    dsMainDOC_TYPE: TStringField;
    dsMainDOC_SUMMA: TFloatField;
    dsMainSUMMA: TFloatField;
    dsMainPAYER_ID: TFloatField;
    dsMainCURR_ID: TFloatField;
    dsMainINFO: TStringField;
    dsMainERR_TEXT: TStringField;
    dsMainID: TFloatField;
    dsMainKPP: TStringField;
    dsMainCURR_CODE: TStringField;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    lcGeneralItem12: TdxLayoutItem;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    dsMainLAST_DATE: TDateTimeField;
    dsMainREG_DATE: TDateTimeField;
    dsMainBANK_DATE: TDateTimeField;
    lcGeneralGroup5: TdxLayoutGroup;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBDateEdit3: TcxDBDateEdit;
    lcGeneralItem11: TdxLayoutItem;
    cxDBDateEdit4: TcxDBDateEdit;
    lcGeneralItem13: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    lcGeneralGroup6: TdxLayoutGroup;
    dsCurr: TOracleDataSet;
    cxDBDateEdit5: TcxDBDateEdit;
    lcGeneralItem14: TdxLayoutItem;
    lcGeneralGroup7: TdxLayoutGroup;
    dsMainLOAD_DATE: TDateTimeField;
    dsMainIS_UNKNOWN: TIntegerField;
    cxDBCheckBox1: TcxDBCheckBox;
    lcGeneralItem15: TdxLayoutItem;
    cxDBDateEdit6: TcxDBDateEdit;
    lcGeneralItem16: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcGeneralItem17: TdxLayoutItem;
    lcGeneralGroup8: TdxLayoutGroup;
    dsMainSOGLN: TStringField;
    dsMainSOGLD: TDateTimeField;
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure dsMainBeforeEdit(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsMainBeforeOpen(DataSet: TDataSet);
    procedure dsMainAfterOpen(DataSet: TDataSet);
    procedure cxDBTextEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxDBCurrencyEdit2PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
  protected
    function MakeCaption(AUseModifiedFlag: Boolean = True): String;
      override;
  procedure SubjectFound(AGridTableView: TcxGridTableView; AIndex,
    ACount: integer; var ADescr: string; var ABreak: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

  function Add: String;
  function Edit(NNN: String): boolean;

implementation

uses fdcUtils, fdcMessages, DataDM, cxGridDBTableView, SubejctGridFrm;

{$R *.dfm}

function Add: String;
var
  F: TPaymentForm;
begin
  F := TPaymentForm.Create(nil);
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

function Edit(NNN: String): Boolean;
var
  F: TPaymentForm;
begin
  F := TPaymentForm.Create(nil);
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

procedure TPaymentForm.actSaveExecute(Sender: TObject);
begin
//  inherited;
  dsMain.Post;
  ModalResult := mrOk;
end;

procedure TPaymentForm.actSaveUpdate(Sender: TObject);
begin
//  inherited;
  TAction(Sender).Enabled := dsMain.State in dsEditModes;
end;

function TPaymentForm.MakeCaption(AUseModifiedFlag: Boolean): String;
begin
  if dsMain.IsEmpty or (dsMain.State = DB.dsInsert) then
    Result := 'Новый платежный документ'
    else Result := Format('Платежный документ №%s от %s',
      [dsMainDOC_NO.Value, dsMainDOC_DATE.AsString]);
end;

procedure TPaymentForm.dsMainBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  Caption := '* ' + Caption;
end;

procedure TPaymentForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  CardName : string;
  mr: TModalResult;
begin
  { warn user about unsaved changes presence }
  if dsMain.State in dsEditModes then
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

procedure TPaymentForm.dsMainBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  OracleDataSet1.Open;
end;

procedure TPaymentForm.dsMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsMain.ReadOnly := not dsMainID.IsNull;
  
  if not dsMainPAYER_ID.IsNull then
  begin
    dsMainINN.ReadOnly := True;
    dsMainKPP.ReadOnly := True;
    dsMainINN_NAME.ReadOnly := True;
    cxDBMaskEdit1.Style.Color := clSilver; //clInactiveCaptionText;
    cxDBMaskEdit1.Style.Color := clSilver; //clInactiveCaptionText;
    cxDBMaskEdit3.Style.Color := clSilver; //clInactiveCaptionText;
    cxDBTextEdit1.Style.Color := clSilver; //clInactiveCaptionText;
  end;
end;

procedure TPaymentForm.SubjectFound(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
 dsMain.Edit;
 dsMainINN.AsVariant := TcxGridDBTableView(AGridTableView).DataController.DataSet['INN'];
 dsMainKPP.AsVariant := TcxGridDBTableView(AGridTableView).DataController.DataSet['KPP'];
 dsMainINN_NAME.AsVariant := TcxGridDBTableView(AGridTableView).DataController.DataSet['NAME'];
 dsMainPAYER_ID.AsVariant := TcxGridDBTableView(AGridTableView).DataController.DataSet['ID'];
end;

procedure TPaymentForm.cxDBTextEdit1PropertiesButtonClick(Sender: TObject;
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

procedure TPaymentForm.FormShow(Sender: TObject);
begin
  inherited;
  Caption := 'Подготовленные платежи в бюджет';
  dsMain.Open;
end;

procedure TPaymentForm.cxDBCurrencyEdit2PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if DisplayValue<=dsMainDOC_SUMMA.Value then
    else
    begin
    ErrorText:= 'Остаток не может превышать сумму документа';
    Error:= True;
    end;
end;

end.
