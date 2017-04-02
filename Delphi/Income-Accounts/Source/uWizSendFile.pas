unit uWizSendFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomWizardFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxImage,
  ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxRadioGroup, CryptoWrap, cxMemo,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPSTextLnk, dxPScxEditorLnks,fdcUtils, Oracle, fdcMessages,StrUtils,
  QueryList, BaseWizardFrm, cxCheckBox, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, OracleData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfdcSendFileMode = ( sfmSingle, sfmMultiple );

  TwizSendFile = class(TBaseWizardForm)
    edtFileName: TcxButtonEdit;
    lciFileName: TdxLayoutItem;
    dlgOpen: TOpenDialog;
    tabProcess: TcxTabSheet;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    dxLayoutControl3Item1: TdxLayoutItem;
    cxLabel3: TcxLabel;
    lcgEncryptParams: TdxLayoutGroup;
    dxLayoutControl2Item1: TdxLayoutItem;
    cxImage1: TcxImage;
    lcgWarning: TdxLayoutGroup;
    dxLayoutControl2Item3: TdxLayoutItem;
    cxLabel4: TcxLabel;
    rbNonEncrypt: TcxRadioButton;
    lciNonEncrypt: TdxLayoutItem;
    rbEncrypt: TcxRadioButton;
    lciEncrypt: TdxLayoutItem;
    edtContainerPassowrd: TcxTextEdit;
    lciContainerPassword: TdxLayoutItem;
    memReport: TcxMemo;
    lciMemReport: TdxLayoutItem;
    btnReportSave: TcxButton;
    lciBtnReportSave: TdxLayoutItem;
    lcgButtons: TdxLayoutGroup;
    btnReportPrint: TcxButton;
    lciBtnReportPrint: TdxLayoutItem;
    dlgSave: TSaveDialog;
    prtReport: TdxComponentPrinter;
    prtReportLnk: TcxMemoReportLink;
    aExecute: TAction;
    pkgDocPackTransfer: TOraclePackage;
    aEncrypt: TAction;
    qlSQL: TQueryList;
    sqlGetParentCustom: TsqlOp;
    qryGetPackAsXML: TOracleQuery;
    sqlGetUserInfo: TsqlOp;
    dlgSaveAs: TSaveDialog;
    cxCheckBoxLZH: TcxCheckBox;
    dxLayoutControl2Item4: TdxLayoutItem;
    sqlGetSysInfo: TsqlOp;
    sqlGetSanction_Off_Crypt: TsqlOp;
    sqlGetSanctionSelectPath: TsqlOp;
    lcgEnvelopeSingle: TdxLayoutGroup;
    lcgEnvelopeMultiple: TdxLayoutGroup;
    grdEnvelopeDBTableView1: TcxGridDBTableView;
    grdEnvelopeLevel1: TcxGridLevel;
    grdEnvelope: TcxGrid;
    dxLayoutControl2Item5: TdxLayoutItem;
    dsetEnvelops: TOracleDataSet;
    dsEnvelops: TDataSource;
    dsetEnvelopsUPLOAD_PATH: TStringField;
    dsetEnvelopsID: TFloatField;
    dsetEnvelopsNAME: TStringField;
    dsetEnvelopsSHORTNAME: TStringField;
    dsetEnvelopsOBJECT_TYPE_ID: TFloatField;
    dsetEnvelopsSTATE_ID: TFloatField;
    dsetEnvelopsACCESSLEVEL: TFloatField;
    dsetEnvelopsSYSNAME: TStringField;
    dsetEnvelopsDESCRIPT: TStringField;
    dsetEnvelopsOWNER_OBJECT_ID: TFloatField;
    dsetEnvelopsTYPENAME: TStringField;
    dsetEnvelopsTYPESYSNAME: TStringField;
    dsetEnvelopsOBJECTKINDLIST: TStringField;
    dsetEnvelopsDOC_DATE: TDateTimeField;
    dsetEnvelopsDOC_NUMBER: TStringField;
    dsetEnvelopsIS_ACTIVE: TStringField;
    dsetEnvelopsACTIVATION_DATE: TDateTimeField;
    dsetEnvelopsSENDER_SOFT_CODE_ID: TFloatField;
    dsetEnvelopsSENDER_SOFT_NAME: TStringField;
    dsetEnvelopsSENDER_SOFT_CODE: TStringField;
    dsetEnvelopsRECEIVER_SOFT_CODE_ID: TFloatField;
    dsetEnvelopsRECEIVER_SOFT_NAME: TStringField;
    dsetEnvelopsRECEIVER_SOFT_CODE: TStringField;
    dsetEnvelopsIS_RECIEVED: TStringField;
    dsetEnvelopsRECIEVE_DATE: TDateTimeField;
    dsetEnvelopsCUSTOMS_OUT_ID: TFloatField;
    dsetEnvelopsCUSTOMS_IN_ID: TFloatField;
    dsetEnvelopsSEND_DATE: TDateTimeField;
    dsetEnvelopsINCOME_DATE: TDateTimeField;
    dsetEnvelopsGUID: TStringField;
    dsetEnvelopsPRIORITY: TFloatField;
    dsetEnvelopsSOFT_KIND: TStringField;
    dsetEnvelopsSOFT_VERSION: TStringField;
    dsetEnvelopsCUSTOMS_OUT_NAME: TStringField;
    dsetEnvelopsCUSTOMS_IN_NAME: TStringField;
    dsetEnvelopsCUSTOMS_OUT_CODE: TStringField;
    dsetEnvelopsCUSTOMS_IN_CODE: TStringField;
    dsetEnvelopsDOC_COUNT: TFloatField;
    dsetEnvelopsFILE_NAME: TStringField;
    dsetEnvelopsLOAD_DATE: TDateTimeField;
    dsetEnvelopsCHECKED: TStringField;
    grdEnvelopeDBTableView1UPLOAD_PATH: TcxGridDBColumn;
    grdEnvelopeDBTableView1ID: TcxGridDBColumn;
    grdEnvelopeDBTableView1DOC_DATE: TcxGridDBColumn;
    grdEnvelopeDBTableView1DOC_NUMBER: TcxGridDBColumn;
    grdEnvelopeDBTableView1RECEIVER_SOFT_NAME: TcxGridDBColumn;
    grdEnvelopeDBTableView1CUSTOMS_IN_NAME: TcxGridDBColumn;
    grdEnvelopeDBTableView1CUSTOMS_IN_CODE: TcxGridDBColumn;
    grdEnvelopeDBTableView1DOC_COUNT: TcxGridDBColumn;
    grdEnvelopeDBTableView1FILE_NAME: TcxGridDBColumn;
    grdEnvelopeDBTableView1CHECKED: TcxGridDBColumn;
    dsetEnvelopsCUSTOMS_IN_NAME_O: TStringField;
    dsetEnvelopsCUSTOMS_OUT_NAME_O: TStringField;
    dsetEnvelopsSYSCRYPTO: TStringField;
    dsetEnvelopsTTT: TStringField;
    dsetEnvelopsXML_FILE_NAME: TStringField;
    sqlGetCertRecepient: TsqlOp;
    dsetCertRecepient: TOracleDataSet;
    procedure edtFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rbEncryptClick(Sender: TObject);
    procedure rbNonEncryptClick(Sender: TObject);
    procedure btnReportSaveClick(Sender: TObject);
    procedure btnReportPrintClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aExecuteExecute(Sender: TObject);
    procedure aEncryptExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure tabProcessShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure dsetEnvelopsApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
  private
    { Private declarations }
    fCryptEngine    : CCryptoWrap;
    fPackerEnabled  : Boolean;
    fCryptEnable    : Boolean;
    fPackageID      : Integer;
    fCryptContainer : string;
    fCryptSubject   : string;
    fCryptSign      : Boolean;
    fSysCrypt       : string;
    fSysCryptEnable         : boolean;
    fCryptContainerEnable   : boolean;
    fUserFullName           : string;
    {fCryptSignEnable        : Boolean;
    fCryptSubjectEnable     : boolean;}
    //procedure SetControlEnable;

    fSendFileMode : TfdcSendFileMode;
    procedure CheckCryptEngine;
    procedure SetSendFileMode( AValue : TfdcSendFileMode );
  public
    { Public declarations }
    constructor Create( AOwner : TComponent; APackageID : Integer );
  published
    procedure tabGeneralNextExecute(Sender: TObject);
  end;


implementation

{$R *.dfm}

uses
  MainDM
 ,fdcCustomTabDlgFrm
  {$ifdef _DEBUG_}
 ,uDebug
  {$endif}
 ;

procedure TwizSendFile.edtFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Выбор имени файла конверта...' );
  uDebug.WriteDebug( '    Формирование имени по умолчанию' );
  {$endif}
  //-- фомирование имени файла по умолчанию
  dlgSaveAs.FileName := '';
  try
    sqlGetSysInfo.Exec;
    dlgSaveAs.FileName := sqlGetSysInfo.ParamValues['psoftcustomscode'];
  except
    on e:Exception  do
      begin
        MainData.Session.Rollback;
        fdcMessages.MessageDlg('Ошибка формирования имени по умолчанию','',e.Message, mtError,[mbOK],0);
      end;
  end;
  if not dsetEnvelops.FieldByName( 'upload_path' ).IsNull then
    dlgSaveAs.FileName := dsetEnvelops.FieldByName( 'upload_path' ).AsString + '\' + dlgSaveAs.FileName;
  dlgSaveAs.FileName := dlgSaveAs.FileName+'_'+IntToStr(fPackageID)+'.xml';
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '    Открытие диалога для выбора пути' );
  {$endif}
  //-- выбор имени файла
  if dlgSaveAs.Execute then
    begin
      btnNext.Enabled := (length(ExtractFileName(dlgSaveAs.FileName)) >= 12);
      if not(btnNext.Enabled) then
        begin
          edtFileName.Text := '';
          fdcMessages.MessageDlg('Предупреждение.','Имя файла без расширения должно быть не менее 8-ми символов!','Имя файла без расширения должно быть не менее 8-ми символов!',mtWarning,[mbOk],0);
        end
      else
        begin
          edtFileName.Text := dlgSaveAs.FileName;
        end;
    end;
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Имя файла конверта выбрано: ' + dlgSaveAs.FileName );
  {$endif}
end;

procedure TwizSendFile.rbEncryptClick(Sender: TObject);
begin
  lciContainerPassword.Enabled := True;
  cxCheckBoxLZH.Enabled := False;
  cxCheckBoxLZH.Checked := True;
end;

procedure TwizSendFile.rbNonEncryptClick(Sender: TObject);
begin
  lciContainerPassword.Enabled := False;
  cxCheckBoxLZH.Enabled := True;
end;

{procedure TwizSendFile.SetControlEnable;
begin

end;}

procedure TwizSendFile.btnReportSaveClick(Sender: TObject);
begin
  if dlgSave.Execute then
    memReport.Lines.SaveToFile( dlgSave.FileName );
end;

procedure TwizSendFile.btnReportPrintClick(Sender: TObject);
begin
  prtReport.CurrentLink.Print( True, nil );
end;

procedure TwizSendFile.FormDestroy(Sender: TObject);
begin
  inherited;

  fCryptEngine.Free;
end;

procedure TwizSendFile.CheckCryptEngine;
begin
  fPackerEnabled := fCryptEngine.IsPackerLoaded;
  if not fPackerEnabled then
     cxLabel4.Caption:=cxLabel4.Caption+chr(10)+chr(13)+'Ошибка при загрузки библиотеки упаковщика (packer.dll).';
  //if UpperCase(fSysCrypt) = 'КРИПТОПРО' then
   begin
      fCryptEnable   := fCryptEngine.IsCryptoProLoaded;
      if not fCryptEnable then
        cxLabel4.Caption:=cxLabel4.Caption+chr(10)+chr(13)+'Ошибка при загрузки библиотеки "КриптоПро" (CryptoPro.dll).';
   end;
  //else
   begin
      fCryptEnable   := fCryptEngine.IsVerbaLoaded;
  		if not fCryptEnable then
        cxLabel4.Caption:=cxLabel4.Caption+chr(10)+chr(13)+'Ошибка при загрузки библиотеки "Верба" (verba.dll).';
   end;

  fCryptContainerEnable := fCryptContainer <> '<не указан>';
  if not fCryptContainerEnable then
        cxLabel4.Caption:=cxLabel4.Caption+chr(10)+chr(13)+'Ошибка параметра "Шифрование. КриптоПро. Ключевой контейнер".';

  fSysCryptEnable := fSysCrypt <> '<не указан>';
  if not fSysCryptEnable then
        cxLabel4.Caption:=cxLabel4.Caption+chr(10)+chr(13)+'Ошибка параметра "Система шифрования (КриптоПро/Верба)"';

  lcgWarning.Visible := not fPackerEnabled
                     or not fCryptEnable
                     or not fCryptContainerEnable
                     or not fSysCryptEnable;
end;

constructor TwizSendFile.Create(AOwner: TComponent; APackageID: Integer);
begin
  inherited Create( AOwner );

  fPackageID := APackageID;

  if fPackageID = -1 then
    SetSendFileMode( sfmMultiple )
  else
    SetSendFileMode( sfmSingle );

  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Получение информации о пользователе.' );
  {$endif}

  sqlGetUserInfo.Exec;
  fCryptContainer := sqlGetUserInfo.ParamValues['pcryptcontainer'];
  fCryptSubject   := sqlGetUserInfo.ParamValues['pcert_subject'];
  fUserFullName   := sqlGetUserInfo.ParamValues['pname'];

  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Получение информации о подписывании.' );
  {$endif}

  fCryptSign := MainData.GetSystemValue( 'Crypto.CryptoPro.Sign', rvString ) = 'Да';

  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Получение информации о таможне-получателе.' );
  {$endif}

  //sqlGetParentCustom.ParamValues['pId']:= fPackageID;
  //sqlGetParentCustom.Exec;
  //fSysCrypt       := sqlGetParentCustom.ParamValues['psyscrypto'];
  memReport.Lines.Clear;

  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Создание крипто-машины.' );
  {$endif}
  fCryptEngine := CCryptoWrap.Create;
  fCryptEngine.Init( memReport.Lines );

  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Проверка наличия крипто-систем...' );
  {$endif}

  CheckCryptEngine;

  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Проверка наличия крипто-систем... завершена' );
  {$endif}
end;

procedure TwizSendFile.aExecuteExecute(Sender: TObject);
var
  str  :string;
  //F: TextFile;
  vCLOB : TLOBLocator;
  vLog  : TLOBLocator;
  vFilePath : string;
  vFileName : string;
begin
    try
      {$ifdef _DEBUG_}
      uDebug.WriteDebug( '    Перевод конверта в статус "Отправлен"' );
      {$endif}
      pkgDocPackTransfer.CallProcedure('Send',[ dsetEnvelops.FieldByName( 'id' ).Value ]);
      pkgDocPackTransfer.Session.Commit;
    except
      on E: Exception do
       begin
       pkgDocPackTransfer.Session.Rollback;
       E.Message:=DateTimeToStr( Now ) + '  ' +'Статус конверта должен быть - "Сформирован".'+E.Message;
       memReport.Lines.Add(E.Message);
       exit;
       end;
    end;
    begin
      try
        if fSendFileMode = sfmSingle then
          vFilePath := ExtractFilePath( edtFileName.text )
        else
          vFilePath := dsetEnvelops.FieldByName( 'upload_path' ).AsString;
       if vFilePath <> '' then
       begin
         if vFilePath[ Length(vFilePath) ] <> '\' then
           vFilePath := vFilePath + '\';
         {AssignFile(F, edtFileName.text);
       	Rewrite(F);}

          {$ifdef _DEBUG_}
          uDebug.WriteDebug( '    Формирование XML-представления конверта' );
          {$endif}

          vFileName := '';
          try
            sqlGetSysInfo.Exec;
            vFileName := sqlGetSysInfo.ParamValues['psoftcustomscode'];
          except
            on e:Exception  do
              begin
                MainData.Session.Rollback;
                fdcMessages.MessageDlg('Ошибка формирования имени по умолчанию','',e.Message, mtError,[mbOK],0);
              end;
          end;
          vFileName := vFileName+'_'+ dsetEnvelops.FieldByName( 'id' ).AsString +'.xml';

         // by Boroda. Заменил алгоритм сохранения в файл строки на поток, т.к. CLOB надо передавать потоками

         if FileExists( vFilePath + vFileName )then
           DeleteFile( vFilePath + vFileName );

         if not SysUtils.DirectoryExists( vFilePath ) then
           SysUtils.ForceDirectories( vFilePath );

         dsetEnvelops.Edit;
         dsetEnvelops.FieldByName( 'xml_file_name' ).AsString := vFilePath + vFileName;
         dsetEnvelops.Post;

         vCLOB := TLOBLocator.Create(qryGetPackAsXML.Session, otCLOB);
         vLog  := TLOBLocator.Create(qryGetPackAsXML.Session, otCLOB);
         Try
           qryGetPackAsXML.SetVariable('vPackId', dsetEnvelops.FieldByName( 'id' ).AsInteger);
           qryGetPackAsXML.SetComplexVariable('vXML', vCLOB);
           qryGetPackAsXML.SetComplexVariable('vLog', vLog );
           qryGetPackAsXML.Execute;
           if vCLOB.IsNull then
             memReport.Lines.Add('Невозможно создать файл, т.к. не удалось получить XML-представление объекта! ')
           else
             begin
               Try
                {$ifdef _DEBUG_}
                uDebug.WriteDebug( '    Запись XML-представления конверта в файл' );
                {$endif}
                 vCLOB.SaveToFile(vFilePath + vFileName);
                 memReport.Lines.Add( vLog.AsString );
                 memReport.Lines.Add(DateTimeToStr( Now ) + '  ' +'Файл создан.');
               except
                 on E: Exception do
                   memReport.Lines.Add(format('Не удалось сохранить файл из-за ошибки: <%s>!', [E.Message]));
               end;

             end;
         finally
           vCLOB.Free;
           vLog.Free;
         end;
	    	{str:=pkgDocPackTransfer.CallStringFunction( 'Srlz', [fPackageID] );
	    	Writeln(F, str);
	    	CloseFile(F);
		   str:=DateTimeToStr( Now ) + '  ' +'Файл создан.';
		   memReport.Lines.Add(str);}
       end
       else
       begin
		   str:=DateTimeToStr( Now ) + '  ' +'Не указано имя файла. Конверт не создан.';
		   memReport.Lines.Add(str);
         exit;
       end;
       except
          on E: Exception do
          begin
		       e.Message:=DateTimeToStr( Now ) + '  ' + e.Message;
		       memReport.Lines.Add(E.Message);
          end;
       end;
    end;
    {$ifdef _DEBUG_}
    uDebug.WriteDebug( '    XML-представления конверта записано в файл' );
    {$endif}
end;

procedure TwizSendFile.aEncryptExecute(Sender: TObject);
  var
    lv_FileName : string;
    lv_tmpstr: AnsiString;
    lv_count: Integer;
begin
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '    Начало шифрования конверта' );
  {$endif}
  try
    lv_FileName := ExtractFileName( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString );
    if (lv_FileName <> '') then
      begin
        {$ifdef _DEBUG_}
        uDebug.WriteDebug( '      Установка параметров крипто-системы' );
        {$endif}
        fCryptEngine.SetParam('DecryptDir',   ExtractFileDir( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString ) );
        fCryptEngine.SetParam('EncryptDir',   ExtractFileDir( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString ) );
        fCryptEngine.SetParam('DataDir',      ExtractFileDir( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString ) );
        fCryptEngine.SetParam('PackFileMask', lv_FileName);
        //sqlGetParentCustom.ParamValues['pId']:= fPackageID;
        //sqlGetParentCustom.Exec;
        fCryptEngine.SetParam('CustomsCode', dsetEnvelops.FieldByName( 'CUSTOMS_OUT_CODE' ).AsString);
        fCryptEngine.SetParam('CustomsName', dsetEnvelops.FieldByName( 'CUSTOMS_OUT_NAME_O' ).AsString);
        fCryptEngine.SetParam('Performer',   fUserFullName);
        fCryptEngine.SetParam('TypeInfo',    'Конверт');
        fCryptEngine.SetParam('Currency',    '643');
        fCryptEngine.SetParam('ReceiverName', dsetEnvelops.FieldByName( 'CUSTOMS_IN_NAME_O' ).AsString);

        fCryptEngine.SetParam('ContainerName',     fCryptContainer);
        fCryptEngine.SetParam('Password',          edtContainerPassowrd.Text);
        fCryptEngine.SetParam('SignerCertSubject', fCryptSubject);

        //-- получение списка атрибутов для поиска сертификатов получателей
        dsetCertRecepient.SetVariable('pcustoms_id',dsetEnvelopsCUSTOMS_IN_ID.AsVariant);
        dsetCertRecepient.SetVariable('psoft_id',dsetEnvelopsRECEIVER_SOFT_CODE_ID.AsVariant);
        dsetCertRecepient.Open;
        lv_count := 0;
        lv_tmpstr := '';
        while not(dsetCertRecepient.Eof) do
          begin
            lv_tmpstr := lv_tmpstr + dsetCertRecepient.FieldByName( 'cert_subject' ).AsString + #0;
            lv_count := lv_count + 1;
            dsetCertRecepient.Next;
          end;
        dsetCertRecepient.Close;
        fCryptEngine.SetParam('CountCertRecepient', inttostr(lv_count));
        fCryptEngine.SetParam('CertSubject', lv_tmpstr);
        //--
        if fCryptSign then
          fCryptEngine.SetParam( 'SignMessage', 'True' )
        else
          fCryptEngine.SetParam( 'SignMessage', 'False' );

        {$ifdef _DEBUG_}
        uDebug.WriteDebug( '      Запуск упаковки и шифрования...' );
        {$endif}
        lv_FileName := trim( dsetEnvelops.FieldByName( 'file_name' ).AsString );
        if lv_FileName = '' then
          lv_FileName := trim( dsetEnvelops.FieldByName( 'ttt' ).AsString );
        if dsetEnvelops.FieldByName( 'syscrypto' ).AsString <>''  then
          begin
            if dsetEnvelops.FieldByName( 'syscrypto' ).AsString = 'КРИПТОПРО' then
                fCryptEngine.Exp(lv_FileName,
                                 dsetEnvelops.FieldByName( 'customs_in_code' ).AsString,
                                 True,
                                 cmCryptoPro
                                 )
            else
                fCryptEngine.Exp(lv_FileName,
                                 dsetEnvelops.FieldByName( 'customs_in_code' ).AsString,
                                 True
                                 );
            dsetEnvelops.Edit;
            dsetEnvelops.FieldByName( 'file_name' ).AsString := ExtractFileName( lv_FileName );
            dsetEnvelops.Post;
          end
        else
          memReport.Lines.Add(DateTimeToStr( Now ) +' Ошибка. Не указана система шифрования получателя.');
        {$ifdef _DEBUG_}
        uDebug.WriteDebug( '      Конверт запакован и зашифрован.' );
        {$endif}
      end
    else
      begin
        memReport.Lines.Add(' Ошибка. Не указано имя файла.');
      end;
  finally
    DeleteFile( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString );
  end;
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '    Конец шифрования конверта' );
  {$endif}
end;

procedure TwizSendFile.tabGeneralNextExecute(Sender: TObject);
  var
    vfile_len    : Longint;
    vLZHFileName : array[1..255] of Char;
    vFileName    : string;
    vStr         : string;

    i : Integer;
begin
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Начало формирование файлов' );
  {$endif}
  if not rbEncrypt.Checked then
    memReport.Lines.Clear;

  dsetEnvelops.First;
  while not dsetEnvelops.Eof do
    begin
      if memReport.Lines.Count > 0 then
        begin
          memReport.Lines.Add('');
          memReport.Lines.Add('=======================================================');
          memReport.Lines.Add('');
        end;

      if dsetEnvelops.FieldByName( 'checked' ).AsString = 'Y' then
        begin
          sqlGetParentCustom.ParamValues['pId']:= dsetEnvelops.FieldByName( 'ID' ).AsFloat;
          sqlGetParentCustom.Exec;
          fSysCrypt       := sqlGetParentCustom.ParamValues['psyscrypto'];

          if aExecute.Execute() then
            if rbEncrypt.Checked then
              begin
                aEncrypt.Execute();
              end
            else
              begin
                if (cxCheckBoxLZH.Checked) then
                  try
                    //--
                    vFileName := ExtractFileName( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString );
                    //--
                    memReport.Lines.Add(DateTimeToStr( Now ) +' Упаковка файла: ' + vFileName);
                    vStr := dsetEnvelops.FieldByName( 'file_name' ).AsString;
                    if vStr = '' then
                      vStr := Trim( dsetEnvelops.FieldByName( 'ttt' ).AsString );
                    for i := 1 to Length(vStr) do
                      vLZHFileName[i] := vStr[i];
                    vfile_len := fCryptEngine.PackData
                      (
                        PChar(ExtractFileDir( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString )),
                        @vLZHFileName,
                        PChar(ExtractFileDir( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString )),
                        PChar(ansistring(vFileName))
                       );
                    vStr := '';
                    i := 1;
                    while ( i < 256 )
                      and ( vLZHFileName[i] <> #0 ) do
                      begin
                        vStr := vStr + vLZHFileName[i];
                        inc( i );
                      end;
                    dsetEnvelops.Edit;
                    dsetEnvelops.FieldByName( 'file_name' ).AsString := vStr;
                    dsetEnvelops.Post;
                    memReport.Lines.Add(DateTimeToStr( Now ) + Format( ' Архив %s создан.', [vStr + '.lzh'] ) );
                    memReport.Lines.Add(DateTimeToStr( Now ) + ' Формирование сопроводительного файла...');
                    ChDir(ExtractFileDir(Application.ExeName));
                    //sqlGetParentCustom.ParamValues['pId']:= fPackageID;
                    //sqlGetParentCustom.Exec;
                    fCryptEngine.CreateTxt
                     (
                        PChar(ExtractFileDir( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString )),
                        @vLZHFileName,
                        PChar( dsetEnvelops.FieldByName( 'customs_out_name_o' ).AsString ),
                        PChar('Конверт'),
                        PChar( dsetEnvelops.FieldByName( 'customs_in_code' ).AsString ),
                        PChar( dsetEnvelops.FieldByName( 'customs_in_name_o' ).AsString ),
                        PChar( fUserFullName ),
                        PChar('643')
                     );
                    memReport.Lines.Add(DateTimeToStr( Now ) +' Файлы подготовлены для передачи.' );
                  finally
                    DeleteFile( dsetEnvelops.FieldByName( 'xml_file_name' ).AsString );
                  end;
              end;

        end;

      if not dsetEnvelops.FieldByName( 'file_name' ).IsNull then
      begin
        pkgDocPackTransfer.CallProcedure( 'SetFileName', [ dsetEnvelops.FieldByName( 'id' ).AsFloat, dsetEnvelops.FieldByName( 'file_name' ).AsString ] );
        pkgDocPackTransfer.Session.Commit;
      end;

      dsetEnvelops.Next;
    end;

  PageControl.ActivePage := tabProcess;
  {$ifdef _DEBUG_}
  uDebug.WriteDebug( '  Файлы сформированы' );
  {$endif}
end;

procedure TwizSendFile.actCancelUpdate(Sender: TObject);
begin
  //inherited;
  (Sender as TAction).Enabled := (PageControl.ActivePage = tabGeneral);
end;

procedure TwizSendFile.tabProcessShow(Sender: TObject);
begin
  inherited;
  {  Self.BorderIcons := BorderIcons - [biSystemMenu];}
  // Поставил Commit после вызова Send в aExecuteExecute, чтобы не закрывали окно системной кнопкой

end;

procedure TwizSendFile.FormShow(Sender: TObject);
begin
  inherited;
  rbNonEncrypt.Enabled := false;
  sqlGetSanction_Off_Crypt.ParamValues['pid']:= fPackageID;
  sqlGetSanction_Off_Crypt.Exec;
  rbNonEncrypt.Enabled := (sqlGetParentCustom.ParamValues['psanction_off_crypt']=1);
end;

procedure TwizSendFile.actNextExecute(Sender: TObject);
begin
  //-- проверка указания имени файла
  if     ( fSendFileMode = sfmSingle )
     and ( edtFileName.Text = '' ) then
    begin
      fdcMessages.MessageDlg('Предупреждение Выгрузка конверта','заполните поле "Имя файла".','Не заполнено поле "Имя файла"!', mtWarning,[mbOK],0);
      edtFileName.SetFocus;
      exit;
    end;
  //--
  //-- проверка необходимости ввода пароля
  if (rbEncrypt.Checked)and(edtContainerPassowrd.Text = '') then
    begin
      fdcMessages.MessageDlg('Предупреждение Выгрузка конверта','заполните поле "Пароль для ключевого контейнера".','Не заполнено поле "Пароль для ключевого контейнера"!', mtWarning,[mbOK],0);
      edtContainerPassowrd.SetFocus;
      exit;
    end;
  //--
  inherited;
end;

procedure TwizSendFile.dsetEnvelopsApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
  Applied := True;
end;

procedure TwizSendFile.SetSendFileMode(AValue: TfdcSendFileMode);
begin
  fSendFileMode := AValue;

  if dsetEnvelops.Active then
    dsetEnvelops.Close;

  case fSendFileMode of
    sfmSingle :
      begin
        lcgEnvelopeSingle.Visible   := True;
        lcgEnvelopeMultiple.Visible := False;

        dsetEnvelops.SetVariable( 'env_id', 'AND 0 = 1 OR t.id = ' + IntToStr( fPackageID ) );
      end;

    sfmMultiple :
      begin
        lcgEnvelopeSingle.Visible   := False;
        lcgEnvelopeMultiple.Visible := True;

        dsetEnvelops.SetVariable( 'env_id', '' );
      end;
  end;

  dsetEnvelops.Open;
end;

end.
