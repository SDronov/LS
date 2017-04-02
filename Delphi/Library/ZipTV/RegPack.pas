(* **************************************************************** *)
(* Component Registration Unit for the ZipTV Compression Components *)
(* **************************************************************** *)
Unit regpack;

Interface

{$I ZipTV.inc}
{$I compiler.inc}
{$R *.dcr}


Procedure Register;


Implementation

// include Designide.dcp in the project's "Requires" section
{.$ifndef VER170}	// Delphi 2005 seems to be missing some units used by DesignIntf
{$define USEDESIGNEDITORS}
{.$endif VER160}


Uses
{$ifdef USEDESIGNEDITORS}
{$ifdef DELPHI_6_UP}
   DesignIntf,
   DesignEditors,
   PropertyCategories,
{$else}
   Dsgnintf,
{$endif}
{$endif USEDESIGNEDITORS}

   Windows,
{$IFNDEF BCB}			//@@@ BR
   FileCtrl,
{$endif BCB}			//@@@ BR
   Classes,
   Dialogs,
   Forms,
   SysUtils,
{$ifdef INSTALL_ztvOPENDIALOG}
   FiltEdit,
{$endif}

{$ifdef AES_SUPPORT}
   ztvAes,
   ztvAesPrng,
   ztvAesHmac,
   ztvAesSha1,
   ztvAesFileenc,
   ztvAesPwd2key,
{$endif AES_SUPPORT}
   ztvRegister,
   ztvGbls,
   ztvConsts,
	Err_Msgs,

   // ---------------------
   // ZipTV Tool Components
   // ---------------------
   ztvArc2Arc,
   ztvFindFile,
   ztvMakeSfx,
   ztvRegArchive,
   ztvArchiveStream,
   ztvArchiveEditor,
   ztvArchiveSplitter,
   ztvZipEncrypt,
   ztvClipboard,
	{$ifdef INSTALL_ztvOPENDIALOG}
   ztvOpenDlg,
	{$endif}

   ztvTurboSearch,
   ztvUnSFX,
   ztvZipCheck,
   ztvZipKey,
   ztvZipRun,
   ztvZipSearch,
   ztvZipTV,
   ztvZipView,
   ztvFileScan,
   ztvZipSplitGlue,
   ztvBZip,
   ztvZip,
   ztvZipSplitter,
   ztvBlakHole,
   ztvJar,
   ztvGZip,
   ztvLHA,
   ztvMakeCab,
   ztvTar,
   ztvTarBz,
   ztvTarGz,

   ztvUnACE2,
   ztvUnARC,
   ztvUnARJ,
   ztvUnBH,
   ztvUnBZip,
   ztvUnCab,
   ztvUnCabTypes,
   ztvUnGZip,
   ztvUnJAR,
   ztvUnLHA,
   ztvUnRAR,
   ztvUnTAR,
   ztvUnZIP,
   ztvUnZOO,
   ztvUUDecode,
   ztvUUEncode
	{$ifdef INCLUDE_SQX}
   ,ztvSqx
	{$endif INCLUDE_SQX}
    ;


{$ifdef USEDESIGNEDITORS}
Type
   TAboutShow = Class(TStringProperty)
   Public
      Procedure Edit; Override;
      Function GetAttributes: TPropertyAttributes; Override;
   End;

   TPropEditSetArchive = Class(TStringProperty)
   Public
      Procedure Edit; Override;
      Function GetAttributes: TPropertyAttributes; Override;
   End;

   TPropEditWordList = Class(TStringProperty)	// for use with ZipKey
   Public
      Procedure Edit; Override;
      Function GetAttributes: TPropertyAttributes; Override;
   End;

   TShowDir = Class(TStringProperty)
   Public
      Procedure Edit; Override;
      Function GetAttributes: TPropertyAttributes; Override;
   End;
{$endif USEDESIGNEDITORS}

//------------------------------------------------------------

Procedure Register;
Begin
   (* ---------------------- *)
   (* Compressors / Encoders *)
   (* ---------------------- *)
   RegisterComponents('ZTV Compress', [TBZip, TBlakHole, TGZip, TLha, TJar,
   	TMakeCab, TTar, TTarBz, TTarGz, TZip, TUUEncode
		{$ifdef INCLUDE_SQX}
      ,TSqx
		{$endif INCLUDE_SQX}
      ]);

	{$ifdef USEDESIGNEDITORS}
   RegisterPropertyEditor(TypeInfo(String), TBlakHole, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TBlakHole, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TBZip, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TBZip, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TGZip, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TGZip, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TJar, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TJar, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TMakeCab, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TLha, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TLha, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TMakeCab, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TTar, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TTar, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TTarBz, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TTarBz, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TTarGz, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TTarGz, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUUEncode, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUUEncode, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TZip, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZip, 'ArchiveFile', TPropEditSetArchive);
	{$ifdef INCLUDE_SQX}
   RegisterPropertyEditor(TypeInfo(String), TSqx, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TSqx, 'ArchiveFile', TPropEditSetArchive);
	{$endif INCLUDE_SQX}
	{$endif USEDESIGNEDITORS}

   (* ------------------------ *)
   (* Decompressors / Decoders *)
   (* ------------------------ *)
   RegisterComponents('ZTV Decompress', [TArchiveStream, TUnACE, TUnARC,
   	TUnArj, TUnBh, TUnBZip, TUnCab, TUUDecode, TUnGZIP, TUnJar, TUnLha,
      TUnRar,
      TUnTar, TUnZip, TUnZoo
		{$ifdef INCLUDE_SQX}
      ,TUnSqx
		{$endif INCLUDE_SQX}
      ]);

	{$ifdef USEDESIGNEDITORS}
   RegisterPropertyEditor(TypeInfo(String), TArchiveStream,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnACE,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnACE,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnACE,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnARC,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnARC,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnARC,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnArj,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnArj,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnArj,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnBh,   'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnBh,   'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnBh,   'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnBZip, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnBZip, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnBZip, 'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnCab,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnCab,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnCab,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnGZIP, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnGZIP, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnGZIP, 'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnJar,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnJar,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnJar,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnLha,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnLha,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnLha,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnRar,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnRar,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnRar,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnTar,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnTar,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnTar,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnZip,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnZip,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnZip,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUnZoo,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnZoo,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnZoo,  'ExtractDir', TShowDir);
   RegisterPropertyEditor(TypeInfo(String), TUUDecode, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUUDecode, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUUDecode, 'ExtractDir', TShowDir);
	{$ifdef INCLUDE_SQX}
   RegisterPropertyEditor(TypeInfo(String), TUnSqx,  'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnSqx,  'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnSqx,  'ExtractDir', TShowDir);
	{$endif INCLUDE_SQX}
	{$endif USEDESIGNEDITORS}

   (* ----- *)
   (* Tools *)
   (* ----- *)
   RegisterComponents('ZTV Tools', [TArc2Arc, TMakeSFX, TRegArchive,
{.$ifdef INSTALL_TPASSWORD}
		TZipEncrypt,
{.$endif}
      TTurboSearch, TUnSFX, TZipCheck, TZipKey, TZipRun, TZipSearch,
      TZipTV, TZipTV_Stream, TZipView, TztvFindFile, TztvFileScan,
      TArchiveEditor, TZipTV_Clipboard
		{,TConsole}
{$ifdef INSTALL_ztvOPENDIALOG}
       ,TztvOpenDialog
{$endif}
   ]);

{$ifdef USEDESIGNEDITORS}
   RegisterPropertyEditor(TypeInfo(String), TZipTV_Clipboard, 'About', TAboutShow);

   RegisterPropertyEditor(TypeInfo(String), TArc2Arc, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TArc2Arc, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TArchiveEditor, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TArchiveEditor, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TMakeSFX, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TMakeSFX, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TMakeSFX, 'SfxStubDir', TShowDir);
{$ifdef INSTALL_ztvOPENDIALOG}
   RegisterPropertyEditor(TypeInfo(String), TztvOpenDialog, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TztvOpenDialog, 'FileName', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TztvOpenDialog, 'Filter', TFilterProperty);
{$endif}
   //RegisterPropertyEditor(TypeInfo(String), TConsole, 'About', TAboutShow);
   ////RegisterPropertyEditor(TypeInfo(String), TConsole, 'FileName', TPropEditSetArchive);
   ////RegisterPropertyEditor(TypeInfo(String), TConsole, 'Filter', TFilterProperty);
   RegisterPropertyEditor(TypeInfo(String), TRegArchive, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TRegArchive, 'ArchiveFile', TPropEditSetArchive);
{.$ifdef INSTALL_TPASSWORD}
   RegisterPropertyEditor(TypeInfo(String), TZipEncrypt, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipEncrypt, 'ArchiveFile', TPropEditSetArchive);
{.$endif}
   RegisterPropertyEditor(TypeInfo(String), TTurboSearch, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TTurboSearch, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TUnSFX, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TUnSFX, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TZipCheck, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipCheck, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TZipKey, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipKey, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TZipKey, 'WordlistFile', TPropEditWordList);
   RegisterPropertyEditor(TypeInfo(String), TZipRun, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipRun, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TZipSearch, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipSearch, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TZipTV, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipTV, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TZipTV_Stream, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipTV_Stream, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TztvFindFile, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TztvFindFile, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TztvFileScan, 'About', TAboutShow);
{$endif USEDESIGNEDITORS}

   (* ------------ *)
   (* Volume Tools *)
   (* ------------ *)
	RegisterComponents('ZTV Volumes', [TZipSplitter, TArchiveSplitter, TZipSplitGlue]);

{$ifdef USEDESIGNEDITORS}
   RegisterPropertyEditor(TypeInfo(String), TZipSplitGlue, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipSplitGlue, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TArchiveSplitter, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TArchiveSplitter, 'ArchiveFile', TPropEditSetArchive);
   RegisterPropertyEditor(TypeInfo(String), TZipSplitter, 'About', TAboutShow);
   RegisterPropertyEditor(TypeInfo(String), TZipSplitter, 'ArchiveFile', TPropEditSetArchive);
{$endif USEDESIGNEDITORS}

End;
//------------------------------------------------------------

{$ifdef USEDESIGNEDITORS}
Procedure TAboutShow.Edit;
Begin
   Try
   	// with ztvRegister.pas source, rem the following line when compiling
      // packages.
      DA();
   Except
      On e: exception Do
         messageDlg({'Regpack: ' +} e.message, mtError, [mbOk], 0);
   End;
End;
{$endif USEDESIGNEDITORS}
//------------------------------------------------------------

{$ifdef USEDESIGNEDITORS}
Function TAboutShow.GetAttributes: TPropertyAttributes;
Begin
   Result := [paDialog];
End;
{$endif USEDESIGNEDITORS}
//------------------------------------------------------------

{$ifdef USEDESIGNEDITORS}
Function TPropEditWordList.GetAttributes: TPropertyAttributes;
Begin
   Result := [paDialog];
End;
{$endif USEDESIGNEDITORS}
//------------------------------------------------------------

{$ifdef USEDESIGNEDITORS}
Procedure TPropEditWordList.Edit;
Var
   AFileOpen: TOpenDialog;
Begin
   AFileOpen := TOpenDialog.Create(Screen.ActiveForm);
   Try
      With AFileOpen Do
      Begin
         If GetValue <> '' Then
            InitialDir := ExtractFileDir(GetValue);

         Filter := 'Word-lists (*.wrd )|*.wrd';
         Options := [ofPathMustExist, ofHideReadOnly, ofFileMustExist];

         If Execute Then
         Begin
            SetValue(FileName);
            SetCurrentDir(ExtractFileDir(FileName));
         End;
      End;
   Finally
      AFileOpen.Free;
   End;
End;
{$endif USEDESIGNEDITORS}
//------------------------------------------------------------

{$ifdef USEDESIGNEDITORS}
Function TPropEditSetArchive.GetAttributes: TPropertyAttributes;
Begin
   Result := [paDialog];
End;
{$endif USEDESIGNEDITORS}
//------------------------------------------------------------

{$ifdef USEDESIGNEDITORS}
Procedure TPropEditSetArchive.Edit;
Begin
   With TOpenDialog.Create(Application) Do
   Try
      Title := GetName();               // name of property as OpenDialog caption
      FileName := GetValue();
      If FileName <> '' Then
         InitialDir := ExtractFileDir(GetValue);

      Filter := LoadStr(F_TZIPTV);
      Options := [ofPathMustExist, ofFileMustExist, ofHideReadOnly];
      HelpContext := 0;

      If Execute() Then
      Begin
         SetValue(FileName);
         SetCurrentDir(ExtractFileDir(FileName));
      End;
   Finally
      Free();
   End;
End;
{$endif USEDESIGNEDITORS}
//------------------------------------------------------------

{$ifdef USEDESIGNEDITORS}
Procedure TShowDir.Edit;
Var
	Dir: _String;
Begin
   Try
      Dir := _GetCurrentDir();
      If _SelectDirectory(Dir) Then
      Begin
         SetValue(Dir);
         _SetCurrentDir(Dir);
      End Else
         SetValue('');

   Except
      //On e : exception DO
      //  messageDlg(e.message,mtError,[ mbOk ],0);
   End;
End;
{$endif USEDESIGNEDITORS}
//------------------------------------------------------------

{$ifdef USEDESIGNEDITORS}
Function TShowDir.GetAttributes: TPropertyAttributes;
Begin
   Result := [paDialog];
End;
{$endif USEDESIGNEDITORS}
//------------------------------------------------------------

End.


