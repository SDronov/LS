unit uWizGetMailFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomWizardFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxImage,
  ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxRadioGroup, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, Oracle, dxPSCore, dxPSTextLnk,
  dxPScxEditorLnks,CryptoWrap, cxMemo, QueryList, fdcUtils, ztvregister,
  ztvBase, ztvUnLha, ztvZipTV, cxGroupBox;

type
  TfWizGetMailFile = class(TfdcCustomWizardForm)
    lciedtFileName: TdxLayoutItem;
    edtFileName: TcxButtonEdit;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    dxLayoutControl2Group1: TdxLayoutGroup;
    dxLayoutControl2Item3: TdxLayoutItem;
    rbNonEncrypt: TcxRadioButton;
    dxLayoutControl2Item4: TdxLayoutItem;
    rbDecrypt: TcxRadioButton;
    lciContainerPassword: TdxLayoutItem;
    edtContainerPassowrd: TcxTextEdit;
    cxTabSheet1: TcxTabSheet;
    dxLayoutControl3: TdxLayoutControl;
    cxLabel3: TcxLabel;
    memReport: TcxMemo;
    btnReportSave: TcxButton;
    btnReportPrint: TcxButton;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    lciMemReport: TdxLayoutItem;
    lcgButtons: TdxLayoutGroup;
    lciBtnReportPrint: TdxLayoutItem;
    lciBtnReportSave: TdxLayoutItem;
    prtReport: TdxComponentPrinter;
    prtReportLnk: TcxMemoReportLink;
    dxLayoutControl2Item6: TdxLayoutItem;
    cxLabel4: TcxLabel;
    dxLayoutControl2Item7: TdxLayoutItem;
    cxImage1: TcxImage;
    lcgWarning: TdxLayoutGroup;
    aExecute: TAction;
    oqGetMail: TOracleQuery;
    aDecrypt: TAction;
    qlSQL: TQueryList;
    sqlGetCustomInfo: TsqlOp;
    sqlGetUserInfo: TsqlOp;
    ZipTVselectfile: TZipTV;
    lcglcgImpParams: TdxLayoutGroup;
    rgImpParams: TcxRadioGroup;
    lciImpParams: TdxLayoutItem;
    qryListPathImp: TOracleQuery;
    sqlGetArchiveDirectory: TsqlOp;
    procedure edtFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnReportPrintClick(Sender: TObject);
    procedure btnReportSaveClick(Sender: TObject);
    procedure rbDecryptClick(Sender: TObject);
    procedure rbNonEncryptClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aExecuteExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure aDecryptExecute(Sender: TObject);
    procedure rgImpParamsPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    fCryptEngine    : CCryptoWrap;
    fPackerEnabled  : Boolean;
    fCryptoProEnable: Boolean;
    fVerbaEnable    : Boolean;
    fCryptContainer : string;
    fCustomName     : string;
    fCustomCode     : string;
    fCryptSign      : Boolean;
    //fSysCrypt       : string;
    fCryptContainerEnable   : boolean;
    {fCryptSignEnable        : Boolean;
    fCryptSubjectEnable     : boolean;
    fSysCryptEnable         : boolean;}
    fArchiveDirectory : string;
    procedure CheckCryptEngine;
    procedure SaveToArchive(filename : AnsiString);
  public
    { Public declarations }
    constructor Create( AOwner : TComponent); override;
    property pArchiveDirectory : string read fArchiveDirectory;
  end;

implementation

uses MainDm, fdcMessages, StrUtils;

{$R *.dfm}


procedure TfWizGetMailFile.SaveToArchive(filename : AnsiString);
  var l_filename_s : AnsiString;
      l_target_filename : AnsiString;
      l_arch_dir : AnsiString;
begin
  //-- сохранение в архив только при открытом курсоре по директориям загрузки
  if (not(qryListPathImp.Eof)) then
    begin
      //-- определение архивной директории для файлов
      l_arch_dir := Self.pArchiveDirectory + 'in\' + qryListPathImp.Field('year_month') + '\' + qryListPathImp.Field('custom_code') + '\';
      if (ForceDirectories(l_arch_dir)) then
        begin
          //-- файл с данными
          if (FileExists(filename)) then
            begin
              //-- сохранение файла в архиве
              l_target_filename := l_arch_dir + ExtractFileName(filename);
              if not(windows.CopyFile(PChar(filename), PChar(l_target_filename),false)) then
                begin
                  memReport.Lines.Add(DateTimeToStr( Now ) + '  Не удалось создать копии "' + l_target_filename + '" файла "' + filename + '" (исходный файл не удалён из директории загрузки)!');
                  exit;
                end;
            end;
          //-- сопроводительный файл
          l_filename_s := ExtractFilePath(filename) + AnsiLeftStr(ExtractFileName(filename),(length(ExtractFileName(filename)))-length(ExtractFileExt(filename))) + '.(s)';
          if (FileExists(l_filename_s)) then
            begin
              //-- сохранение файла в архиве
              l_target_filename := l_arch_dir + ExtractFileName(l_filename_s);
              if not(windows.CopyFile(PChar(l_filename_s), PChar(l_target_filename),false)) then
                begin
                  memReport.Lines.Add(DateTimeToStr( Now ) + '  Не удалось создать копии "' + l_target_filename + '" файла "' + l_filename_s + '" (исходный файл не удалён из директории загрузки, а также не удалён файл с данными "' + filename + '")!');
                  exit;
                end;
            end;
          //-- удаление файлов
          if (FileExists(filename)) then
          if not(windows.DeleteFile(PChar(filename))) then
            begin
              memReport.Lines.Add(DateTimeToStr( Now ) + '  Не удалось удалить файл "' + filename + '"!');
            end;
          if (FileExists(l_filename_s)) then
          if not(windows.DeleteFile(PChar(l_filename_s))) then
            begin
             memReport.Lines.Add(DateTimeToStr( Now ) + '  Не удалось удалить файл "' + l_filename_s + '"!');
            end;
        end
      else
        begin
          memReport.Lines.Add(DateTimeToStr( Now ) + '  Сохранение в архив не осуществлено. Не удалось создать директорию "' + l_arch_dir + '"!');
        end;
    end;
end;

procedure TfWizGetMailFile.edtFileNamePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if dlgOpen.Execute then
    edtFileName.Text := dlgOpen.FileName;
end;

procedure TfWizGetMailFile.btnReportPrintClick(Sender: TObject);
begin
  prtReport.CurrentLink.Print( True, nil );
end;

procedure TfWizGetMailFile.btnReportSaveClick(Sender: TObject);
begin
  if dlgSave.Execute then
    memReport.Lines.SaveToFile( dlgSave.FileName );
end;

procedure TfWizGetMailFile.rbDecryptClick(Sender: TObject);
begin
  lciContainerPassword.Enabled := True;
end;

procedure TfWizGetMailFile.rbNonEncryptClick(Sender: TObject);
begin
  lciContainerPassword.Enabled := False;
end;

procedure TfWizGetMailFile.FormDestroy(Sender: TObject);
begin
  inherited;
    fCryptEngine.Free;
end;

procedure TfWizGetMailFile.CheckCryptEngine;
begin
  fPackerEnabled := fCryptEngine.IsPackerLoaded;
  if not fPackerEnabled then
     cxLabel4.Caption:=cxLabel4.Caption+chr(10)+chr(13)+'Ошибка при загрузки библиотеки упаковщика (packer.dll).';
  fCryptoProEnable   := fCryptEngine.IsCryptoProLoaded;
  if not fCryptoProEnable then
     cxLabel4.Caption:=cxLabel4.Caption+chr(10)+chr(13)+'Ошибка при загрузки библиотеки "КриптоПро" (CryptoPro.dll).';
  fVerbaEnable   := fCryptEngine.IsVerbaLoaded;
  if not fVerbaEnable then
     cxLabel4.Caption:=cxLabel4.Caption+chr(10)+chr(13)+'Ошибка при загрузки библиотеки "Верба" (verba.dll).';

  fCryptContainerEnable := fCryptContainer <> '<не указан>';
  if not fCryptContainerEnable then
        cxLabel4.Caption:=cxLabel4.Caption+'Ошибка параметра "Шифрование. КриптоПро. Ключевой контейнер".'+chr(10)+chr(13);


  lcgWarning.Visible := not fPackerEnabled
                     or not fVerbaEnable
                     or not fCryptContainerEnable
                     or not fCryptoProEnable;
end;

constructor TfWizGetMailFile.Create(AOwner: TComponent);
begin
  inherited Create( AOwner );

  sqlGetUserInfo.Exec;
//  fCryptContainer := MainData.GetSystemValue( 'Crypto.CryptoPro.Container', rvString );
  fCryptContainer := sqlGetUserInfo.ParamValues['pcryptcontainer'];
  fCustomName     := MainData.GetSystemValue( 'CustomsName', rvString );
  fCustomCode     := MainData.GetSystemValue( 'CustomsCode', rvString );
  fCryptSign      := MainData.GetSystemValue( 'Crypto.CryptoPro.Sign', rvString ) = 'Да';

  memReport.Lines.Clear;

  fCryptEngine := CCryptoWrap.Create;
  fCryptEngine.Init( memReport.Lines );

  CheckCryptEngine;
  //-- установка архивной директории
  sqlGetArchiveDirectory.Exec;
  fArchiveDirectory := sqlGetArchiveDirectory.ParamValues['parchive_directory'];
  if (fArchiveDirectory <> '') then
    begin
      if (fArchiveDirectory[length(fArchiveDirectory)] <> '\') then
        begin
          fArchiveDirectory := fArchiveDirectory + '\';
        end;
    end;
  //--
end;

procedure TfWizGetMailFile.aExecuteExecute(Sender: TObject);
  //--
  procedure load_file(pfilename : AnsiString);
    var
      vCLOB : TLOBLocator;
      vLog  : TLOBLocator;
  begin
    {--- start code by Boroda ---}
    memReport.Lines.Add(DateTimeToStr( Now ) + '  Обработка файла: '+pfilename);
    if not FileExists(pfilename) then
      raise Exception.CreateFmt('Файл <%s> не найден!', [pfilename]);
     vCLOB := TLOBLocator.CreateTemporary(oqGetMail.Session, otCLOB, True);
     vLog  := TLOBLocator.CreateTemporary(oqGetMail.Session, otCLOB, True);
     with oqGetMail do
       Try
         vCLOB.LoadFromFile(pfilename);
         if vCLOB.IsNull then
           raise Exception.CreateFmt('Файл <%s> не содержит данных!', [pfilename]);
         SetComplexVariable('xmldoc', vCLOB);
         SetComplexVariable('log',    vLog);
         Execute;
         memReport.Lines.Add(vLog.AsString);
         memReport.Lines.Add(DateTimeToStr( Now ) + '  Конверт принят.');
       finally
         vCLOB.Free;
         vLog.Free;
       end;
     {--- end code by Boroda ---}
  end;
  //--
  var
   FileName : string;
   Str      : string;
  { F        : TextFile;
   M        :string;}
   vFilesList : TStringList;
   vi         : Integer;
begin
  try
  if edtFileName.Text<>'' then
   begin
     if (UpperCase(ExtractFileExt(edtFileName.Text)) = '.LZH') then
       begin
         ZipTVselectfile.ArchiveFile := edtFileName.Text;
         //-- распаковка при необходимости
         if (rbNonEncrypt.Checked) then
           begin
             fCryptEngine.UnpackData(PChar(ExtractFileDir(edtFileName.Text)),PChar(ExtractFileName(edtFileName.Text)),PChar(ExtractFileDir(edtFileName.Text)));
           end;

         //vFilesList := TStringList.Create;
         //-- Патокин В. 26.01.15
         vFilesList := fCryptEngine.GetArchiveFiles(edtFileName.Text);
         try
           {
           // получение списка файлов архива
           ZipTVselectfile.FilesInArchive(vFilesList);
           // повтор при необходимости
           if (vFilesList.Count = 0) then
             begin
               ZipTVselectfile.FilesInArchive(vFilesList);
             end;
           // повтор с задержкой при необходимости
           if (vFilesList.Count = 0) then
             begin
               Delay(1000);
               ZipTVselectfile.FilesInArchive(vFilesList);
             end;
           }
           if (vFilesList.Count = 0) then
             begin
               memReport.Lines.Add(DateTimeToStr( Now ) + '  Архив <'+edtFileName.Text+'> - не содержит ни одного файла с расширением "xml"!');
               raise Exception.Create('  Архив <'+edtFileName.Text+'> - не содержит ни одного файла с расширением "xml"!');
             end;
           for vi := 0 to vFilesList.Count-1 do
             begin
               FileName := ExtractFilePath(edtFileName.Text)+ExtractFileName(vFilesList.Strings[vi]);
               load_file(FileName);
               //-- удаление загруженного файла (только для автоматической загрузки)
               if (rgImpParams.ItemIndex = 1) then
                 begin
                   if not(windows.DeleteFile(PChar(FileName))) then
                     begin
                       memReport.Lines.Add(DateTimeToStr( Now ) + '  Не удалось удалить файл "' + filename + '"!');
                     end;
                 end;
             end;
           vFilesList.Free;
           //-- сохранение загруженного файла в архиве (только для автоматической загрузки)
           if (rgImpParams.ItemIndex = 1) then
             begin
               SaveToArchive(edtFileName.Text);
             end;
         except
           on e: Exception do
             begin
               vFilesList.Free;
               raise Exception.Create('Ошибка загрузки: '+ e.Message);
             end;
         end;
       end
     else
       begin
         FileName := ChangeFileExt(edtFileName.Text, '.xml');
         load_file(FileName);
         //-- сохранение загруженного файла в архивеа (только для автоматической загрузки)
         if (rgImpParams.ItemIndex = 1) then
           begin
             SaveToArchive(FileName);
           end;
      end;
   end
   else
       begin
		   str:=DateTimeToStr( Now ) + '  ' +'Не указано имя файла. Конверт не принят.';
		   memReport.Lines.Add(str);
         exit;
       end;
 except
   on E: Exception do
          begin
		       e.Message:=DateTimeToStr( Now ) + ' Конверт не принят.' + e.Message;
		       memReport.Lines.Add(E.Message);
          end;
   end;
end;

procedure get_filename(ppath: AnsiString; var pstringlist: TStringList);
  var Path,Ext:string;
      F:TSearchRec;
      Attr:integer;
begin
   pstringlist.Clear;
   Path:=ppath;
   if path[length(path)]<>'\' then
     begin
       path:=path+'\';
     end;
   Ext:='*.*';
   Attr:=faAnyFile;
   if (FindFirst(Path+Ext,Attr,F)=0) then
     begin
      repeat
       if (f.Attr<>16)and(f.Attr<>17)and(f.Attr<>22) then
         begin
           ext := UpperCase(ExtractFileExt(f.Name));
           if (ext = '.XML')or(ext = '.LZH') then
             begin
               pstringlist.Add(path+f.Name);
             end;
         end;
      until (FindNext(f)<>0);
     end;
end;

procedure TfWizGetMailFile.actNextExecute(Sender: TObject);
  var lpath: AnsiString;
      li: Integer;
      llistfile: TStringList;
begin
  //-- проверка определения архивной директории
  if (Self.pArchiveDirectory = '') then
    begin
      fdcMessages.MessageDlg('Предупреждение Загрузка конвертов','заполните системный параметр "Архивная директория".','В системе не определена "Архивная директория"!', mtWarning,[mbOK],0);
      exit;
    end;
  //--
  //-- проверка наличия архивной директории
  if not(DirectoryExists(Self.pArchiveDirectory)) then
    begin
      fdcMessages.MessageDlg('Предупреждение Загрузка конвертов','проверте правильность заполнения системного параметра "Архивная директория".','Не найдена "Архивная директория" - "' + Self.pArchiveDirectory + '"!', mtWarning,[mbOK],0);
      exit;
    end;
  //--
  //-- проверка указания имени файла
  if (edtFileName.Text = '')and(edtFileName.Visible) then
    begin
      fdcMessages.MessageDlg('Предупреждение Загрузка конверта','заполните поле "Имя файла".','Не заполнено поле "Имя файла"!', mtWarning,[mbOK],0);
      edtFileName.SetFocus;
      exit;
    end;
  //--
  //-- проверка необходимости ввода пароля
  if (rbDecrypt.Checked)and(edtContainerPassowrd.Text = '') then
    begin
      fdcMessages.MessageDlg('Предупреждение Загрузка конверта','заполните поле "Пароль для ключевого контейнера".','Не заполнено поле "Пароль для ключевого контейнера"!', mtWarning,[mbOK],0);
      edtContainerPassowrd.SetFocus;
      exit;
    end;
  //--
  if (rgImpParams.ItemIndex = 0) then
    begin
      //--
      if rbDecrypt.Checked then
        begin
           if aDecrypt.Execute() then
                   aExecute.Execute();
        end
      else
           aExecute.Execute();
      //--
    end
  else
    begin
      qryListPathImp.Execute;
      if (qryListPathImp.Eof) then
        begin
          fdcMessages.MessageDlg('Загрузка конвертов','Директории загрузки не заданы!','Директории загрузки не заданы!', mtWarning,[mbOK],0);
        end;
      while not(qryListPathImp.Eof) do
        begin
          memReport.Lines.Add('============================');
          memReport.Lines.Add(DateTimeToStr( Now ) + ' Загрузка конвертов из ' + qryListPathImp.Field('custom_name') + ':');
          //-- получение директории загрузки
          lpath := qryListPathImp.Field('path');
          memReport.Lines.Add(DateTimeToStr( Now ) + ' Директория загрузки конвертов: ' + lpath);
          memReport.Lines.Add('----------------------------');
          if (lpath <> '') then
            begin
              //-- проверка наличия директории загрузки
              if (DirectoryExists(lpath)) then
                begin
                  llistfile:= TStringList.Create;
                  try
                    //-- считывание имён файлов из директории загрузки
                    get_filename(lpath, llistfile);
                    //-- проверка наличия файлов для загрузки
                    if (llistfile.Count = 0) then
                      begin
                        memReport.Lines.Add(DateTimeToStr( Now ) + ' Файлы для загрузки в директории "'+lpath+'" - отсутствуют!');
                      end;
                    //--
                    for li := 0 to llistfile.Count-1 do
                      begin
                        if (li > 0) then
                          begin
                            memReport.Lines.Add('----------------------------');
                          end;
                        edtFileName.Text := llistfile.Strings[li];
                        memReport.Lines.Add(DateTimeToStr( Now ) + ' Загрузка файла: ' + edtFileName.Text);
                        //--
                        if rbDecrypt.Checked then
                          begin
                             if aDecrypt.Execute() then
                                     aExecute.Execute();
                          end
                        else
                           aExecute.Execute();
                        //--
                      end;
                    llistfile.Free;
                  except
                    on e:Exception do
                      begin
                        memReport.Lines.Add(DateTimeToStr( Now ) + ' Ошибка при загрузке конвертов');
                        memReport.Lines.Add(DateTimeToStr( Now ) + ' ' + e.Message);
                        llistfile.Free;
                      end;
                  end;
                end
              else
                begin
                  memReport.Lines.Add(DateTimeToStr( Now ) + ' Ошибка при загрузке конвертов');
                  memReport.Lines.Add(DateTimeToStr( Now ) + ' Не существует путь - ' + lpath);
                end;
            end
          else
            begin
              memReport.Lines.Add(DateTimeToStr( Now ) + ' Ошибка при загрузке конвертов');
              memReport.Lines.Add(DateTimeToStr( Now ) + ' Не указан путь для загрузки конвертов из ' + qryListPathImp.Field('custom_name') + '!');
            end;
          qryListPathImp.Next;
          //--
        end; //-- while
      memReport.Lines.Add('============================');
    end;
  inherited;
end;

procedure TfWizGetMailFile.aDecryptExecute(Sender: TObject);
  var
    lv_FileName : string;
    Str         : string;
    F           : TextFile;
    pCustomCode : string;
begin
    lv_FileName := ExtractFileName(edtFileName.Text);

    AssignFile(F, copy(edtFileName.Text,1,length(edtFileName.Text)-3)+'(s)');
    Reset(F);
    while not eof(F) do
    	begin
      	Readln(F,str);
      	if str[1]='>' then pCustomCode:=copy(str,3,length(str)-1);
  	 end;
  	 CloseFile(F);
    sqlGetCustomInfo.ParamValues['pCode']:=pCustomCode;
    sqlGetCustomInfo.Exec;
    fCryptEngine.SetParam('DecryptDir', ExtractFileDir(edtFileName.Text));
    fCryptEngine.SetParam('EncryptDir', ExtractFileDir(edtFileName.Text));
    fCryptEngine.SetParam('DataDir', ExtractFileDir(edtFileName.Text));
    fCryptEngine.SetParam('PackFileMask', lv_FileName);


    fCryptEngine.SetParam('CustomsCode', fCustomCode);
    fCryptEngine.SetParam('CustomsName', fCustomName);
    fCryptEngine.SetParam('Performer', sqlGetCustomInfo.ParamValues['pUser']);
    fCryptEngine.SetParam('TypeInfo', 'Конверт');
    fCryptEngine.SetParam('Currency', '810');
    fCryptEngine.SetParam('ReceiverName', sqlGetCustomInfo.ParamValues['pName']);

    fCryptEngine.SetParam('ContainerName', fCryptContainer);
    fCryptEngine.SetParam('Password', edtContainerPassowrd.Text);
    fCryptEngine.SetParam('CertSubject', sqlGetCustomInfo.ParamValues['pCertSubject']);

    if fCryptSign then
      fCryptEngine.SetParam( 'SignMessage', 'True' )
    else
      fCryptEngine.SetParam( 'SignMessage', 'False' );

    lv_FileName := Copy( lv_FileName, 1, Length( lv_FileName ) - 4 );

    if  sqlGetCustomInfo.ParamValues['pSysCrypto'] <>''  then
      if UpperCase(sqlGetCustomInfo.ParamValues['pSysCrypto']) = 'КРИПТОПРО' then
		    fCryptEngine.Imp(lv_FileName,
		                     True,
		                     cmCryptoPro)
      else
		    fCryptEngine.Imp(lv_FileName,
		                     True)
    else
	   memReport.Lines.Add(DateTimeToStr( Now ) +' Ошибка .Не указана система шифрования отправителя.');
end;

procedure TfWizGetMailFile.rgImpParamsPropertiesChange(Sender: TObject);
begin
  inherited;
  lciedtFileName.Visible :=(TcxRadioGroup(Sender).ItemIndex = 0);
  dxLayoutItem1.Visible := lciedtFileName.Visible;
  dxLayoutControl2Item2.Visible := lciedtFileName.Visible;
end;

end.
