unit ImportWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWizardFrm, cxLookAndFeelPainters, cxMemo, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxImage, ExtCtrls,
  dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  AppEvnts, Menus, ComCtrls, ShlObj, cxShellCommon,
  cxDropDownEdit, cxShellComboBox, cxGraphics, ztvregister,
  ztvBase, ztvUnRar, DB, OracleData, JvComponentBase, JvCreateProcess;

type
  TImportWizardForm = class(TBaseWizardForm)
    tabProcess: TcxTabSheet;
    tabResult: TcxTabSheet;
    dxLayoutControl4Group_Root: TdxLayoutGroup;
    dxLayoutControl4: TdxLayoutControl;
    dxLayoutControl4Item1: TdxLayoutItem;
    cxLabel6: TcxLabel;
    dxLayoutControl4Item2: TdxLayoutItem;
    cxMemo: TcxMemo;
    dxLayoutControl2Item3: TdxLayoutItem;
    Label1: TLabel;
    dxLayoutControl2Item1: TdxLayoutItem;
    edtDumpFileName: TcxButtonEdit;
    UnRar1: TUnRar;
    dxLayoutControl3: TdxLayoutControl;
    barPos: TcxProgressBar;
    btnStop: TcxButton;
    cxLabel5: TcxLabel;
    cxLogMemo: TcxMemo;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutControl3Item5: TdxLayoutItem;
    dxLayoutControl3Item6: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutControl3Item4: TdxLayoutItem;
    ExpStart: TJvCreateProcess;
    dlgImpSelect: TOpenDialog;
    dxLayoutControl2Item4: TdxLayoutItem;
    edtImpFileName: TcxButtonEdit;
    dlgDumpSelect: TOpenDialog;
    procedure btnStopClick(Sender: TObject);
    procedure edtDumpFileNameButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ExpStartRawRead(Sender: TObject; const S: String);
    procedure edtImpFileNameButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ExpStartTerminate(Sender: TObject; ExitCode: Cardinal);
  published
    procedure tabGeneralNextExecute(Sender: TObject);
  private
    procedure DoLoad;
    procedure OnFinishImport(AExitCode: Cardinal);
    procedure OnMessage(const S: string);
  public
  end;


implementation

uses fdcCustomTabDlgFrm, fdcMessages, DataDM, Oracle, FileCtrl, fdcUtils;

{$R *.dfm}

procedure TImportWizardForm.tabGeneralNextExecute(Sender: TObject);

  procedure CheckFileName;
  begin
    if not FileExists(edtImpFileName.Text) then
      raise
        Exception.CreateFmt('<<Утилита [%s] не найдена по указанному пути>>.<<Проверьте правильность выбора каталога>>', [edtImpFileName.Text]);
    if not FileExists(edtDumpFileName.Text) then
      raise
        Exception.CreateFmt('<<Файл данных [%s] не найден по указанному пути>>.<<Проверьте правильность выбора файла>>', [edtDumpFileName.Text]);

  end;
begin
  CheckFileName;
  dxLayoutControl1Item8.Visible := False;  // Спрячем кнопку Отмена
  DoLoad;
end;

procedure TImportWizardForm.DoLoad;
  var
    OldCur : TCursor;
begin
  EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
    MF_GRAYED);
  dxLayoutControl1Group8.Visible := False;
  OldCur := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    PageControl.ActivePage := tabProcess;
    OnMessage(Format('%s Старт импорта данных...',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
    try
      MainData.pkgCommon.PackageName := 'p_Import';
      MainData.pkgCommon.CallProcedure('TruncateBuffer', []);
    except
      on E:EOracleError do
      begin
        OnMessage(Format('%s В процессе очистки буферной области возникла критичекская ошибка: [%s]',
         [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now),
          E.Message ]));
        OnFinishImport(113); // прервать обработку;
        Exit;
      end;
    end;

    {ExpStart.CommandLine := format('"%s" %s file=''%s'' tables=(%s) log=''%s'' INDEXES=n CONSTRAINTS=n ignore=y',
        [edtImpFileName.Text,
         MainData.GetConnectionString,
         edtDumpFileName.Text,
         'exp%', //маска для таблиц
         ChangeFileExt(edtDumpFileName.Text, '_imp.log')
        ]);}

    ExpStart.CommandLine := format('"%s" %s file=''%s'' log=''%s'' INDEXES=n CONSTRAINTS=n ignore=y',
        [edtImpFileName.Text,
         MainData.GetConnectionString,
         edtDumpFileName.Text,
         ChangeFileExt(edtDumpFileName.Text, '_imp.log')
        ]);

    OnMessage(Format('%s Запуск утилиты импорта из командной строки [%s]',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now),
       ExpStart.CommandLine]));

    ExpStart.Run;
  finally
    Screen.Cursor := OldCur;
  end;
end;

procedure TImportWizardForm.OnFinishImport(AExitCode: Cardinal);
  var
    vLog: TFileName;
    vErrCnt: Integer;
begin
  if AExitCode <> 0 then // Ошибка
    begin
     OnMessage(Format('%s Процесс импорта данных не может быть завершен из-за ошибок',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
      if AExitCode <> 113 then // если ошибка не очистки буфера
      begin// очистим буфер
       MainData.pkgCommon.PackageName := 'p_Import';
       MainData.pkgCommon.CallProcedure('TruncateBuffer', []);
      end;
    end
  else
    begin
      OnMessage(Format('%s Старт переноса данных...',
        [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));

      MainData.pkgCommon.PackageName := 'p_Import';
      try
        MainData.pkgCommon.CallProcedure('DoImportData', []);
        vErrCnt := MainData.pkgCommon.CallIntegerFunction('GetErrorCount', []);
        if vErrCnt > 0 then
        begin
          OnMessage(Format('%s В ходе переноса данных возникли ошибки. Откат изменений... ',
                    [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));

          MainData.pkgCommon.CallProcedure('RollBackImportData', []);
        end;
        OnMessage(Format('%s Перенос данных завершен%s.',
          [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now),
           IfElse((vErrCnt > 0), ' с ошибками.', ' успешно')
           ]));
      except
        on E: Exception do
         begin
           OnMessage(Format('В ходе переноса данных произошла ошибка: [%s]', [E.Message]));
         end;
      end;
    end;
  try
    EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
      MF_ENABLED);
    dxLayoutControl1Group8.Visible := True;
    Screen.Cursor := crHourGlass;
    try
      cxMemo.Lines.Assign(cxLogMemo.Lines);
      cxMemo.Lines.Add('');
      //cxMemo.CaretPos := Point(1, cxMemo.Lines.Count);
    finally
      Screen.Cursor := crDefault;
    end;

    PageControl.ActivePage := tabResult;
  finally
    dxLayoutControl1Group8.Visible := True;
    //dxLayoutControl3Group1.Visible := True;
  end;
end;

procedure TImportWizardForm.OnMessage(const S: string);
begin
  cxLogMemo.Lines.Add(S)
end;

procedure TImportWizardForm.btnStopClick(Sender: TObject);
begin
  inherited;
  // Terminate;
end;

procedure TImportWizardForm.edtDumpFileNameButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Dir: string;
begin
  if dlgDumpSelect.Execute then
    edtDumpFileName.Text := dlgDumpSelect.FileName;
end;

procedure TImportWizardForm.ExpStartRawRead(Sender: TObject;
  const S: String);
begin
  OnMessage(S);
end;

procedure TImportWizardForm.edtImpFileNameButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if dlgImpSelect.Execute then
   edtImpFileName.Text := dlgImpSelect.FileName;
end;

procedure TImportWizardForm.ExpStartTerminate(Sender: TObject;
  ExitCode: Cardinal);
begin
  //OnMessage(Format('Утилита импорта завершила работу с кодом [%d]', [ExitCode]));
  OnFinishImport(ExitCode);
end;

end.

