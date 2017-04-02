{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 15468 $
  $Author: adavletyarov $
  $Date: 2012-09-25 15:45:23 +0400 (Р’С‚, 25 СЃРµРЅ 2012) $
}


unit COLoader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomWizardFrm, cxLookAndFeelPainters, ComCtrls,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxImage, ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons,
  cxControls, Oracle, cxProgressBar, DB, FDCCustomDataset, fdcQuery,
  cxTextEdit, cxMemo, ShlObj, cxShellCommon, cxMaskEdit, cxDropDownEdit,
  cxShellComboBox, cxShellTreeView, QueryList, cxButtonEdit, cxRadioGroup,
    BaseWizardFrm, cxDBEdit, fdcObjectLinkEdit, fdcObjectCore, Menus,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPSTextLnk, dxPScxEditorLnks, Log4D;

type
  TCOLoaderForm = class(TBaseWizardForm)
    tabInfo: TcxTabSheet;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    barCustomDecl: TcxProgressBar;
    dxLayoutControl3Item1: TdxLayoutItem;
    dxLayoutControl3Group1: TdxLayoutGroup;
    lblTotal: TcxLabel;
    dxLayoutControl3Item3: TdxLayoutItem;
    lblDone: TcxLabel;
    dxLayoutControl3Item4: TdxLayoutItem;
    lblDubl: TcxLabel;
    dxLayoutControl3Item5: TdxLayoutItem;
    lblGood: TcxLabel;
    dxLayoutControl3Item6: TdxLayoutItem;
    lblBadINN: TcxLabel;
    dxLayoutControl3Item7: TdxLayoutItem;
    lblErrors: TcxLabel;
    dxLayoutControl3Item8: TdxLayoutItem;
    dxLayoutControl3Item2: TdxLayoutItem;
    cxLabel3: TcxLabel;
    dxLayoutControl3Item9: TdxLayoutItem;
    lblNoPayOrder: TcxLabel;
    tabReport: TcxTabSheet;
    lcReportGroup_Root: TdxLayoutGroup;
    lcReport: TdxLayoutControl;
    lcReportItem1: TdxLayoutItem;
    cxLabel4: TcxLabel;
    edtReport: TcxMemo;
    lcReportItem2: TdxLayoutItem;
    tabLoad: TcxTabSheet;
    dxLayoutControl4: TdxLayoutControl;
    barLoad: TcxProgressBar;
    cxLabel11: TcxLabel;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    edtLoadReport: TcxMemo;
    dxLayoutControl4Item1: TdxLayoutItem;
    dsNewDecl: TfdcQuery;
    QueryList1: TQueryList;
    sqlLoadDecl: TsqlOp;
    sqlBeginLoad: TsqlOp;
    sqlEndLoad: TsqlOp;
    edtFileName: TcxButtonEdit;
    lciFile: TdxLayoutItem;
    dlgOpenFile: TOpenDialog;
    lciDetail: TdxLayoutItem;
    barDetail: TcxProgressBar;
    sqlLoadPO: TsqlOp;
    cxButtonEdit1: TcxButtonEdit;
    dxLayoutControl2Item1: TdxLayoutItem;
    QueryList2: TQueryList;
    sqlPreLoad: TsqlOp;
    dxLayoutControl2Item3: TdxLayoutItem;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    dxComponentPrinter1: TdxComponentPrinter;
    plReportLink: TcxMemoReportLink;
    actSave: TAction;
    actPrint: TAction;
    lcReportItem3: TdxLayoutItem;
    cxButton2: TcxButton;
    lcReportItem4: TdxLayoutItem;
    cxButton1: TcxButton;
    lcReportGroup1: TdxLayoutGroup;
    procedure tabInfoShow(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure tabReportShow(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actSaveExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPrevUpdate(Sender: TObject);
//    procedure cmbxPathEnter(Sender: TObject);
  published
    procedure tabGeneralNextExecute(Sender: TObject);
    procedure tabReportPrevExecute(Sender: TObject);
  private
    { Private declarations }
    FCashDeskId: Variant;
    FFileId: double;
    FFileFormatCode: string;
    procedure ClearLabel;
    procedure OnSearchFinished(const ADragObject: TfdcDragObject);
    procedure AddProcessInfo(Progress: double);
    procedure AddLog(const HeaderText, MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False); overload;
    procedure AddLog(const MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False); overload;
    function ParseError(const Error: String): String; overload;
  public
  end;


function  ImportCO(Session: TOracleSession): Boolean;

implementation

uses
  fdcCustomDlgFrm, fdcCustomTabDlgFrm, fdcUtils, Registry, fdcCustomFrm,
  IaccLoader, fdcExceptions, fdcCustomObjectGridFrm,fdcObjectServices,
  MainDm;

{$R *.dfm}

function GetAppRegistryValue(const Name: string; const Default: string = ''): String;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKeyReadOnly(TfdcCustomForm(Application.MainForm).AppRegistryKey) then
      Result := Reg.ReadString(Name);
  finally
    Reg.Free;
  end;
  if Result = '' then
     Result := Default;
end;

procedure SetAppRegistryValue(const Name: String; const Value: Variant);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(TfdcCustomForm(Application.MainForm).AppRegistryKey, True) then
    begin
      case VarType(Value) of
       varString: Reg.WriteString(Name, Value);
       varInteger: Reg.WriteInteger(Name, Value);
       varBoolean: Reg.WriteBool(Name, Value);
      end;
    end;
  finally
    Reg.Free;
  end;
end;

function  ImportCO(Session: TOracleSession): Boolean;
var
  F: TCOLoaderForm;
begin
  // лог загрузки
  TLogPropertyConfigurator.Configure(ExtractFilePath(ParamStr(0)) + 'iaccdocload.log4d');

  F := TCOLoaderForm.Create(nil);
  try
//    F.dsLoadDecl.Session := Session;
    F.dsNewDecl.Session := Session;
    F.QueryList1.Session := Session;
    F.QueryList2.Session := Session;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

{ TDeclLoaderForm }

procedure IncLabel(ALabel: TcxLabel; const IncVal: Integer = 1);
begin
  ALabel.Caption := IntToStr(StrToIntDef(ALabel.Caption, 0) + IncVal);
end;

procedure TCOLoaderForm.tabInfoShow(Sender: TObject);
begin
  inherited;
  ClearLabel;
end;

procedure TCOLoaderForm.ClearLabel;
begin
  lblTotal.Caption := '0';
  lblDone.Caption := '0';
  lblDubl.Caption := '0';
  lblGood.Caption := '0';
  lblBadINN.Caption := '0';
  lblErrors.Caption := '0';
  lblNoPayOrder.Caption := '0';
  barCustomDecl.Position := 0.0;
end;

procedure TCOLoaderForm.actOkUpdate(Sender: TObject);
begin
  inherited;

end;
//  TAction(Sender).Enabled := not tabInfo.Showing and  DirectoryExists(cmbxPath.Text);

procedure TCOLoaderForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth +  Panel1.Width;
  edtFileName.Text := GetAppRegistryValue('LastСOFile', '');
  //if fdcUtils.ReadRegistryValue(AppRegistryKey, 'LastPOChoice', rvBoolean) = False then
  //begin
  //  btnArchive.Checked := True;
  //  lciFile.Enabled := True;
  //  lciDirectory.Enabled := False;
  //end;
end;

procedure TCOLoaderForm.actCancelUpdate(Sender: TObject);
begin
  inherited;
//  TAction(Sender).Caption := IfElse(tabInfo.Showing, 'Закрыть', 'Отмена');
end;

procedure TCOLoaderForm.AddProcessInfo(Progress: double);
begin
  barLoad.Position := barLoad.Position + Progress;
  UpdateWindow(Handle);
  Application.HandleMessage;
end;

function CheckFiles(const DirName: string; const FileNames: array of string): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(FileNames) to High(FileNames) do
  begin
    if not FileExists(DirName + '\' + FileNames[I]) then
       Result := Result + ',' + FileNames[I];
  end;
  Result := Copy(Result, 2, MaxInt);
end;

procedure TCOLoaderForm.tabGeneralNextExecute(Sender: TObject);
const
  issfhd_file = 'CASHDOCS.DBF';
var
  Importer: TUniImporter;
  LoadSessionId: double;
  StartTime: TDateTime;

  procedure LoadDBF(FileFormat: String; const DBFName: String);
   var
     vSectionName: string;
  begin
    AddLog(Format('  Файл %s...', [ExtractFileName(DBFName)]), Log4D.Debug);
    AddProcessInfo(100/(3*8));
    //Importer.LoadFile(DBFName, Format('%s\%s', [DirName, DBFName]));
    if UpperCase(ExtractFileName(DBFName)) = issfhd_file then
      vSectionName := issfhd_file
    else
      vSectionName := FileFormat;
    Importer.LoadFile(vSectionName, DBFName);
  end;

begin
  // Установка разрешения на обновления мат. представления
  MainData.pkgCommon.PackageName := 'p_Params';
  MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['N'] );
  dxLayoutControl1Group8.Enabled := False;
  try
    try
      AddLog(' ', Log4d.Info, False);
      AddLog('--------------------------------------------------------------------', Log4d.Info, False);
      AddLog('Загрузка кассовых ордеров', Log4d.Info, False);
      AddLog('Версия приложения: ', fdcUtils.GetAppVersion, Log4d.Debug, False);


      if edtFileName.Text = '' then
        GlobalExceptionHandler(nil, 'Не выбран файл платежей',
          Format('Выберите файл платежей по кассовым ордерам', [edtFileName.Text]),
          'COLoader', 'TCOLoaderForm', 'tabGeneralNextExecute');

      if not FileExists(edtFileName.Text) then
        GlobalExceptionHandler(nil, 'Выбран неверный файл платежей по кассовым ордерам',
          Format('Файл %s не существует', [edtFileName.Text]),
          'COLoader', 'TCOLoaderForm', 'tabGeneralNextExecute');

      if VarIsEmpty(FCashDeskId) then
        GlobalExceptionHandler(nil, 'Не выбрана касса',
          'Не выбрана касса, из которой поступил файл, содержащий информацию о кассовых ордерах',
          'COLoader', 'TCOLoaderForm', 'tabGeneralNextExecute');

      edtLoadReport.Lines.Clear;
      PageControl.SelectNextPage(True, False);

      StartTime := Now;

      LoadSessionId := sqlBeginLoad.Exec;

      sqlPreLoad.Exec('CashDeskId',FCashDeskId);
      FFileId := sqlPreLoad.ParamValues['COFileId'];
      FFileFormatCode := sqlPreLoad.ParamValues['FileFormatCode'];

      try
        AddLog('Загрузка БД кассовых ордеров:', Log4D.Debug);
        AddProcessInfo(0);
        Importer := TUniImporter.Create;
        try
          LoadDBF(FFileFormatCode,edtFileName.Text);
          AddLog('  ', Format('  Файл %s: %d строк загружено',
            [ExtractFileName(edtFileName.Text), Importer.Total - Importer.Skipped]),
            Log4d.Debug, True, True, False); 
        finally
          Importer.Free;
        end;

        AddLog('', Log4d.Debug, True, False);
        AddLog('Обработка загруженных кассовых ордеров:', Log4d.Debug);
        AddProcessInfo(0);
        sqlLoadPO.Exec('COFileId;CashDeskId',[FFileId,FCashDeskId]);
        AddLog(sqlLoadPO['report'], Log4d.Info);

        sqlEndLoad.Exec('ploadlog', LoadSessionId);
        QueryList1.Session.Commit; // Rollback;
        AddLog(Format('Время загрузки %s', [TimeToStr(Now - StartTime)]), Log4d.Info);
        SetAppRegistryValue('LastCОFile', edtFileName.Text);
        //    SetAppRegistryValue('LastСOChoice', btnDirectory.Checked);
      except
        QueryList1.Session.Rollback;
        PageControl.ActivePage := tabGeneral;
        raise;
      end;
    except
      on E: EfdcException do begin
        AddLog('Загрузка п/п прервана. ', E.UserMessage + '. ' + E.UserHint, Log4d.Error);
        raise;
      end;
      on E: Exception do begin
        AddLog('Загрузка п/п прервана. ', ParseError(E.Message), Log4d.Error);
        raise;
      end;
  end;
  finally
    dxLayoutControl1Group8.Enabled := True;
    actNext.Enabled := True;
    actPrev.Enabled := True;
    actOk.Enabled := True;
    // Установка разрешения на обновления мат. представления
    MainData.pkgCommon.PackageName := 'p_Params';
    MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['Y'] );
  end;
  PageControl.SelectNextPage(True);
end;

procedure TCOLoaderForm.tabReportShow(Sender: TObject);
begin
  inherited;

  edtReport.Lines.Assign(edtLoadReport.Lines);

(*
  edtReport.Lines.Insert(0, 'Ошибки:');
  edtReport.Lines.Insert(0,'Прочие ошибки: ' + lblErrors.Caption);
  edtReport.Lines.Insert(0,'Нет плат. поручений: ' + lblNoPayOrder.Caption);
  edtReport.Lines.Insert(0,'Неверен код ИНН: ' + lblBadINN.Caption);
  edtReport.Lines.Insert(0,'Хороших: ' + lblGood.Caption);
  edtReport.Lines.Insert(0,'Повторяющихся: ' + lblDubl.Caption);
  edtReport.Lines.Insert(0,'Всего записей: ' + lblTotal.Caption);
*)
end;

//procedure TCCLoaderForm.cmbxPathEnter(Sender: TObject);
//begin
//  inherited;
//  with cmbxPath.Properties do
//  begin
//    PopupMinWidth := cmbxPath.Width;
//    if DropDownWidth < PopupMinWidth then
//       DropDownWidth := PopupMinWidth;
//  end;
//end;

procedure TCOLoaderForm.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var  
  F: TfdcCustomObjectGridForm;
  FC: TFormClass;
begin
  inherited;
  FC := TFormClass(FindClass('TCashDeskGridForm'));
  F := FC.Create(cxButtonEdit1) as TfdcCustomObjectGridForm;
  F.SearchMode := True;
  F.SearchMultiple := False;
  F.SearchComponent := cxButtonEdit1;
  F.SearchTypeSysName := 'CashDesk';
  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;
  F.ShowModal;
end;

procedure TCOLoaderForm.OnSearchFinished(
  const ADragObject: TfdcDragObject);
begin
   FCashDeskId := ADragObject.SingleObject.ID;
   cxButtonEdit1.Text := ADragObject.SingleObject.ObjName;
end;

procedure TCOLoaderForm.edtFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if dlgOpenFile.Execute then
     edtFileName.Text := dlgOpenFile.FileName;
end;

procedure TCOLoaderForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
      edtReport.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TCOLoaderForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.CurrentLink.Print(True, nil);
end;

procedure TCOLoaderForm.tabReportPrevExecute(Sender: TObject);
begin
  PageControl.ActivePage := tabGeneral;
end;

procedure TCOLoaderForm.AddLog(const HeaderText, MessText: String;
  LogLevel: TLogLevel; AddToScreen, AddToLog, ChangeLastLine: Boolean);
var
  SL : TStringList;
  i  : Integer;
begin
  if AddToLog then begin
    SL := TStringList.Create;
    SL.Text := HeaderText + MessText;
    for i := 0 to SL.Count - 1 do
      TLogLogger.GetRootLogger.Log(LogLevel, SL[i]);
    SL.Free;
  end;
  if AddToScreen then
    if ChangeLastLine then
      edtLoadReport.Lines[edtLoadReport.Lines.Count - 1] := MessText
    else
      edtLoadReport.Lines.Add(MessText);
end;

procedure TCOLoaderForm.AddLog(const MessText: String; LogLevel: TLogLevel;
  AddToScreen, AddToLog, ChangeLastLine: Boolean);
var
  SL : TStringList;
  i  : Integer;
begin
  if AddToLog then begin
    SL := TStringList.Create;
    SL.Text := MessText;
    for i := 0 to SL.Count - 1 do
      TLogLogger.GetRootLogger.Log(LogLevel, SL[i]);
    SL.Free;
  end;
  if AddToScreen then
    if ChangeLastLine then
      edtLoadReport.Lines[edtLoadReport.Lines.Count - 1] := MessText
    else
      edtLoadReport.Lines.Add(MessText);
end;

function TCOLoaderForm.ParseError(const Error: String): String;
var
  UserMessage, UserHint: String;
  E : Exception;
begin
  E := Exception.Create(Error);
  fdcExceptions.ParseError(E, UserMessage, UserHint);
  if Error = UserHint then UserHint := '';
  E.Free;
  Result := UserMessage + '. ' + UserHint;
end;

procedure TCOLoaderForm.actPrevUpdate(Sender: TObject);
begin
  if PageControl.ActivePage = tabReport then
    actPrev.Enabled := False
  else
    inherited;
end;

initialization
    RegisterClass(TCOLoaderForm);

end.
