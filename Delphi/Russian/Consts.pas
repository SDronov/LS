{********************************************************}
{                                                        }
{       Borland Delphi Visual Component Library          }
{                                                        }
{  Copyright (c) 1995-2001 Borland Software Corporation  }
{                                                        }
{  �����������: 1998-2002 Polaris Software               }
{               http://polesoft.da.ru                    }
{********************************************************}

unit Consts;

interface

{$IFDEF VER140}
  {$DEFINE D6_}
{$ENDIF}
{$IFDEF VER150}
  {$DEFINE D6_}
{$ENDIF}

resourcestring
{$IFNDEF VER100}
  SOpenFileTitle = '�������';
{$ENDIF}
{$IFNDEF D6_}
  SAssignError = '�� ���� �������� %s ��������� %s';
  SFCreateError = '�� ���� ������� ���� %s';
  SFOpenError = '�� ���� ������� ���� %s';
  SReadError = '������ ������ ������';
  SWriteError = '������ ������ ������';
  SMemoryStreamError = '�� ������� ������ ��� ���������� memory stream';
{$ENDIF}
  SCantWriteResourceStreamError = '�� ���� ���������� � ����� �������� "������ ��� ������"';
  SDuplicateReference = 'WriteObject ������ ������ ��� ������ � ���� �� ����������';
{$IFNDEF D6_}
  SClassNotFound = '����� %s �� ������';
  SInvalidImage = '�������� ������ ������';
  SResNotFound = '������ %s �� ������';
{$ENDIF}
  SClassMismatch = '�������� ����� ������� %s';
{$IFNDEF D6_}
  SListIndexError = '������ ������ ����� �� ������� (%d)';
  SListCapacityError = '������ ������ ����� �� ������� (%d)';
  SListCountError = '������� ������ ����� �� ������� (%d)';
  SSortedListError = '�������� ����������� ��� ���������������� ������ �����';
  SDuplicateString = '������ ����� �� ��������� ����������';
{$ENDIF}
  SInvalidTabIndex = 'Tab ������ ����� �� �������';
{$IFNDEF VER100}
  SInvalidTabPosition = '������� tab ������������ � ������� ������ tab';
  SInvalidTabStyle = 'C���� tab ����������� � ������� �������� tab';
{$ENDIF}
{$IFNDEF D6_}
  SDuplicateName = '��������� � ������ %s ��� ����������';
  SInvalidName = '''''%s'''' ����������� � �������� ����� ����������';
  SDuplicateClass = '����� � ������ %s ��� ����������';
  SNoComSupport = '%s �� ��������������� ��� COM �����';
  SInvalidInteger = '''''%s'''' - �������� ����� �����';
  SLineTooLong = '������ ������� �������';
  SInvalidPropertyValue = '�������� �������� ��������';
  SInvalidPropertyPath = '�������� ���� � ��������';
 {$IFDEF VER130}
  SInvalidPropertyType = '�������� ��� ��������: %s';
  SInvalidPropertyElement = '�������� ������� ��������: %s';
 {$ENDIF}
  SUnknownProperty = '�������� �� ����������';
  SReadOnlyProperty = '�������� ������ ��� ������';
 {$IFDEF VER100}
  SPropertyException = '������ ������ %s.%s: %s';
 {$ELSE}
  SPropertyException = '������ ������ %s%s%s: %s';
 {$ENDIF}
  SAncestorNotFound = '������ ��� ''%s'' �� ������';
{$ENDIF}
  SInvalidBitmap = '����������� Bitmap ����� �������� ������';
  SInvalidIcon = '������ (Icon) ����� �������� ������';
  SInvalidMetafile = '�������� ����� �������� ������';
  SInvalidPixelFormat = '�������� �������� (pixel) ������';
{$IFDEF D6_}
  SInvalidImage = '�������� �����������';
{$ENDIF}
  SBitmapEmpty = '����������� Bitmap ������';
  SScanLine = 'Scan line ������ ����� �� �������';
  SChangeIconSize = '�� ���� �������� ������ ������';
  SOleGraphic = '�������� �������� � TOleGraphic';
  SUnknownExtension = '����������� ���������� ����� ����������� (.%s)';
  SUnknownClipboardFormat = '���������������� ������ ������ ������';
  SOutOfResources = '�� ������� ��������� ��������';
  SNoCanvasHandle = 'Canvas �� ��������� ��������';
  SInvalidImageSize = '�������� ������ �����������';
  STooManyImages = '������� ����� �����������';
  SDimsDoNotMatch = '������� ����������� �� ��������� � ��������� � image list';
  SInvalidImageList = '�������� ImageList';
  SReplaceImage = '���������� �������� �����������';
  SImageIndexError = '�������� ������ ImageList';
  SImageReadFail = '������ ������ ������ ImageList �� ������';
  SImageWriteFail = '������ ������ ������ ImageList � �����';
  SWindowDCError = '������ �������� ��������� ���� (window device context)';
  SClientNotSet = '������ TDrag �� ���������������';
  SWindowClass = '������ �������� �������� ������';
  SWindowCreate = '������ �������� ����';
  SCannotFocus = '�� ���� �������� ����� ����� ������������ ��� ���������� ����';
  SParentRequired = '������� ���������� ''%s'' �� ����� ������������� ����';
{$IFDEF D6_}
  SParentGivenNotAParent = '������ �������� �� �������� ��������� ''%s''';
{$ENDIF}
  SMDIChildNotVisible = '�� ���� ������ �������� ����� MDI';
  SVisibleChanged = '�� ���� �������� Visible � OnShow ��� OnHide';
  SCannotShowModal = '�� ���� ������� ������� ��������� ����';
  SScrollBarRange = '�������� Scrollbar ����� �� �������';
  SPropertyOutOfRange = '�������� %s ����� �� �������';
  SMenuIndexError = '������ ���� ����� �� �������';
  SMenuReinserted = '���� ��������� ������';
  SMenuNotFound = '������� - �� � ����';
  SNoTimers = '��� ��������� ��������';
  SNotPrinting = '������� �� ��������� ������ � ��������� ������';
  SPrinting = '���� ������...';
  SPrinterIndexError = '������ �������� ����� �� �������';
  SInvalidPrinter = '������ �������� �������';
  SDeviceOnPort = '%s on %s';
  SGroupIndexTooLow = 'GroupIndex �� ����� ���� ������, ��� GroupIndex ����������� ������ ����';
  STwoMDIForms = '������ ����� ����� ����� �������� MDI ����� � ���������';
  SNoMDIForm = '�� ���� ������� �����. ��� �������� MDI ����';
{$IFNDEF D6_}
  SRegisterError = '�������� ����������� ����������';
{$ENDIF}
  SImageCanvasNeedsBitmap = '����� ������������� ������ �����������, ������� �������� bitmap';
  SControlParentSetToSelf = '������� ���������� �� ����� ���� ��������� ������ ����';
  SOKButton = 'OK';
  SCancelButton = '������';
  SYesButton = '&��';
  SNoButton = '&���';
  SHelpButton = '&�������';
  SCloseButton = '&�������';
  SIgnoreButton = '���&�������';
  SRetryButton = '&���������';
  SAbortButton = '��������';
  SAllButton = '&���';

  SCannotDragForm = '�� ���� ���������� �����';
  SPutObjectError = 'PutObject ��� ��������������� ����';
  SCardDLLNotLoaded = '�� ���� ��������� CARDS.DLL';
  SDuplicateCardId = '������ �������� CardId';

  SDdeErr = '���������� ������ DDE  ($0%x)';
  SDdeConvErr = '������ DDE - ������ �� ���������� ($0%x)';
  SDdeMemErr = '������ - �� ������� ������ ��� DDE ($0%x)';
  SDdeNoConnect = '�� ���� ������������ DDE ������ (conversation)';

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';
  SOldTShape = '�� ���� ��������� ������ ������ TShape';
  SVMetafiles = '���������';
  SVEnhMetafiles = '����������� ���������';
  SVIcons = '������';
  SVBitmaps = '��������';
  SGridTooLarge = '������� (Grid) ������� ������� ��� ������';
  STooManyDeleted = '��������� ������� ����� ����� ��� ��������';
  SIndexOutOfRange = '������ Grid ����� �� �������';
  SFixedColTooBig = '����� ������������� �������� ������ ���� ������ ������ ����� ��������';
  SFixedRowTooBig = '����� ������������� ����� ������ ���� ������ ������ ����� �����';
  SInvalidStringGridOp = '�� ���� �������� ��� ������� ������ �� ������� (grid)';
{$IFNDEF D6_}
  SParseError = '%s � ������ %d';
  SIdentifierExpected = '��������� �������������';
  SStringExpected = '��������� ������';
  SNumberExpected = '��������� �����';
  SCharExpected = '��������� ''''%s''''';
  SSymbolExpected = '��������� %s';
{$ELSE}
  SInvalidEnumValue = '�������� Enum ��������';
{$ENDIF}
  SInvalidNumber = '�������� �������� ��������';
{$IFNDEF D6_}
  SInvalidString = '�������� ��������� ���������';
  SInvalidProperty = '�������� �������� ��������';
  SInvalidBinary = '�������� �������� ��������';
{$ENDIF}
  SOutlineIndexError = '������ Outline �� ������';
  SOutlineExpandError = '������������ ���� ������ ���� �������';
  SInvalidCurrentItem = '�������� �������� ��� �������� ��������';
  SMaskErr = '������� �������� ��������';
  SMaskEditErr = '������� �������� ��������.  ������� Esc ��� ������ ���������';
  SOutlineError = '�������� ������ outline';
  SOutlineBadLevel = '�������� ����������� ������';
  SOutlineSelection = '�������� �����';
  SOutlineFileLoad = '������ �������� �����';
  SOutlineLongLine = '������ ������� �������';
  SOutlineMaxLevels = '���������� ������������ ������� outline';

  SMsgDlgWarning = '��������������';
  SMsgDlgError = '������';
  SMsgDlgInformation = '����������';
  SMsgDlgConfirm = '�������������';
  SMsgDlgYes = '&��';
  SMsgDlgNo = '&���';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = '������';
  SMsgDlgHelp = '&�������';
  SMsgDlgHelpNone = '������� ����������';
  SMsgDlgHelpHelp = '�������';
  SMsgDlgAbort = '�&�������';
  SMsgDlgRetry = '&���������';
  SMsgDlgIgnore = '���&�������';
  SMsgDlgAll = '&���';
  SMsgDlgNoToAll = '�&�� ��� ����';
  SMsgDlgYesToAll = '�&� ��� ����';

  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcSpace = 'Space';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcIns = 'Ins';
  SmkcDel = 'Del';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';

  srUnknown = '(����������)';
  srNone = '(���)';
  SOutOfRange = '�������� ������ ���� ����� %d � %d';
{$IFNDEF D6_}
  SCannotCreateName = '�� ���� ������� ��� ������ �� ��������� ��� ����������� ����������';
{$ENDIF}

  SDateEncodeError = '�������� �������� ��� ������������ ����';
{$IFNDEF D6_}
  STimeEncodeError = '�������� �������� ��� ������������ �������';
  SInvalidDate = '''''%s'''' - �������� ����';
  SInvalidTime = '''''%s'''' - �������� �����';
  SInvalidDateTime = '''''%s'''' - �������� ���� � �����';
  SInvalidFileName = '�������� ��� ����� - %s';
{$ENDIF}
  SDefaultFilter = '��� ����� (*.*)|*.*';
  sAllFilter = '���';
  SNoVolumeLabel = ': [ - ��� ����� ���� - ]';
  SInsertLineError = '���������� �������� ������';

  SConfirmCreateDir = '��������� ����� �� ����������. ������� ��?';
  SSelectDirCap = '����� �����';
{$IFNDEF D6_}
  SCannotCreateDir = '�� ���� ������� �����';
{$ENDIF}
  SDirNameCap = '&��� �����:';
  SDrivesCap = '&����������:';
  SDirsCap = '&�����:';
  SFilesCap = '&�����: (*.*)';
  SNetworkCap = '&����...';

  SColorPrefix = 'Color';
  SColorTags = 'ABCDEFGHIJKLMNOP';

  SInvalidClipFmt = '�������� ������ ������ ������';
  SIconToClipboard = '����� ������ �� ������������ ������';
{$IFNDEF VER100}
  SCannotOpenClipboard = '�� ���� ������� ����� ������';
{$ENDIF}

  SDefault = 'Default';

  SInvalidMemoSize = '����� �������� ������� memo';
  SCustomColors = 'Custom Colors';
  SInvalidPrinterOp = '�������� �� �������������� �� ��������� ��������';
  SNoDefaultPrinter = '��� ���������� �� ��������� ��������';

  SIniFileWriteError = '�� ���� �������� � %s';

  SBitsIndexError = '������ Bits ����� �� �������';

  SUntitled = '(��� �����)';

  SInvalidRegType = '�������� ��� ������ ��� ''%s''';
{$IFNDEF D6_}
  SRegCreateFailed = '������ �������� ����� %s';
  SRegSetDataFailed = '������ ������ �������� ��� ''%s''';
  SRegGetDataFailed = '������ ������ �������� ��� ''%s''';
{$ENDIF}

  SUnknownConversion = '����������� ���������� ����� ��� ��������������� RichEdit (.%s)';
  SDuplicateMenus = '���� ''%s'' ��� ������������ ������ ������';

  SPictureLabel = '��������:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = '��������';

  SCannotOpenAVI = '�� ���� ������� AVI';

  SNotOpenErr = '��� �������� ��������� MCI';
  SMPOpenFilter = '��� ����� (*.*)|*.*|����� ����� (*.wav)|*.wav|Midi ����� (*.mid)|*.mid|����� ��� Windows (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = 'Other';
  SMCIOverlay = 'Overlay';
  SMCIScanner = 'Scanner';
  SMCISequencer = 'Sequencer';
  SMCIVCR = 'VCR';
  SMCIVideodisc = 'Videodisc';
  SMCIWaveAudio = 'WaveAudio';
  SMCIUnknownError = '����������� ��� ������';

  SBoldItalicFont = 'Bold Italic';
  SBoldFont = 'Bold';
  SItalicFont = 'Italic';
  SRegularFont = 'Regular';

  SPropertiesVerb = '��������';

{$IFNDEF VER100}
 {$IFNDEF D6_}
  sWindowsSocketError = '������ Windows socket: %s (%d), ��� ������ ''%s''';
  sAsyncSocketError = '������ asynchronous socket %d';
  sNoAddress = '�� ��������� �����';
  sCannotListenOnOpen = '�� ���� ������������ �������� socket';
  sCannotCreateSocket = '�� ���� ������� ����� socket';
  sSocketAlreadyOpen = 'Socket ��� ������';
  sCantChangeWhileActive = '�� ���� �������� �������� ���� socket �������';
  sSocketMustBeBlocking = 'Socket ������ ���� � ������ ����������';
  sSocketIOError = '%s ������ %d, %s';
  sSocketRead = 'Read';
  sSocketWrite = 'Write';
 {$ENDIF}

  SServiceFailed = '���� ������ �� %s: %s';
  SExecute = 'execute';
  SStart = 'start';
  SStop = 'stop';
  SPause = 'pause';
  SContinue = 'continue';
  SInterrogate = 'interrogate';
  SShutdown = 'shutdown';
  SCustomError = '���� ������ � custom message(%d): %s';
  SServiceInstallOK = '������ ����������� �������';
  SServiceInstallFailed = '���� ��� ��������� ������ "%s", ������: "%s"';
  SServiceUninstallOK = '������ ����� �������';
  SServiceUninstallFailed = '���� ��� ������ ������ "%s", ������: "%s"';

  SInvalidActionRegistration = '�������� ����������� �������� (action)';
  SInvalidActionUnregistration = '�������� ������ ����������� �������� (action)';
  SInvalidActionEnumeration = '�������� �������� �������� (action)';
  SInvalidActionCreation = '�������� �������� �������� (action)';

  SDockedCtlNeedsName = '������������ ������� ������ ����� ���';
  SDockTreeRemoveError = '������ �������� �������� �� dock tree';
  SDockZoneNotFound = ' - ������� ����������� �� �������';
  SDockZoneHasNoCtl = ' - ������� ����������� �� ����� ��������� ����������';

  SAllCommands = 'All Commands';

 {$IFNDEF VER110} // Delphi 5 and later
 {$IFNDEF VER120}
 {$IFNDEF VER125}
  SDuplicateItem = '������ �� ��������� ���������� ($0%x)';

  {$IFNDEF D6_}
  SDuplicatePropertyCategory = '��������� ��������, ��������� %s, ��� �������';
  SUnknownPropertyCategory = '��������� �������� �� ������� (%s)';

  SActionCategoryName = 'Action';
  SActionCategoryDesc = '�������� �/��� ������� �������� (action)';
  SDataCategoryName = 'Data';
  SDataCategoryDesc = '�������� �/��� ������� ��������� Data';
  SDatabaseCategoryName = 'Database';
  SDatabaseCategoryDesc = '�������� �/��� ������� ��������� Database';
  SDragNDropCategoryName = 'Drag, Drop and Docking';
  SDragNDropCategoryDesc = '�������� �/��� ������� ��������� Drag, Drop and Docking';
  SHelpCategoryName = 'Help and Hints';
  SHelpCategoryDesc = '�������� �/��� ������� ��������� Help and Hint';
  SLayoutCategoryName = 'Layout';
  SLayoutCategoryDesc = '�������� �/��� ������� ��������� Layout';
  SLegacyCategoryName = 'Legacy';
  SLegacyCategoryDesc = '�������� �/��� ������� ��������� Legacy';
  SLinkageCategoryName = 'Linkage';
  SLinkageCategoryDesc = '�������� �/��� ������� ��������� Linkage';
  SLocaleCategoryName = 'Locale';
  SLocaleCategoryDesc = '�������� �/��� ������� ��������� Locale';
  SLocalizableCategoryName = 'Localizable';
  SLocalizableCategoryDesc = '�������� �/��� ������� ��������� Localizable';
  SMiscellaneousCategoryName = 'Miscellaneous';
  SMiscellaneousCategoryDesc = '�������� �/��� ������� ��������� Miscellaneous';
  SVisualCategoryName = 'Visual';
  SVisualCategoryDesc = '�������� �/��� ������� ��������� Visual';
  SInputCategoryName = 'Input';
  SInputCategoryDesc = '�������� �/��� ������� ��������� Input';

  SInvalidMask = '''%s'' - �������� ����� � ������� %d';
  SInvalidFilter = '�������� ������� ����� ���� ������ ���, ����� ��� ��� �� ���� (%d:%d)';
  SInvalidCategory = '��������� ������ ���������� ���� ��� � ��������';

  sOperationNotAllowed = '�������� �� ��������� �� ����� �������� ������� ����������';
  {$ENDIF}
 {$ENDIF}
 {$ENDIF}
 {$ENDIF}
{$ENDIF}  // IFNDEF VER100

{$IFDEF D6_}
  STextNotFound = '����� �� ������: "%s"';
  SBrowserExecError = '�� ��������� ������� �� ���������';

  SColorBoxCustomCaption = '�������...';

  SMultiSelectRequired = '����� �������������� ������ ������ ���� ������� ��� ���� �����������';

  SKeyCaption = '��������';
  SValueCaption = '��������';
  SKeyConflict = '�������� � ������ "%s" ��� ������';
  SKeyNotFound = '�������� "%s" �� ������';
  SNoColumnMoving = 'goColMoving - ���������������� �����';
  SNoEqualsInKey = '�������� �� ����� ��������� ���� "�����" ("=")';

  SSendError = '������ �������� �����';
  SAssignSubItemError = '�� ���� ��������� �������� � actionbar ����� ���� �� ��� ������� ��� �������� actionbar';
  SDeleteItemWithSubItems = '����� %s ����� ���������, ��� ����� �������?';
  {$IFNDEF VER140}
  SDeleteNotAllowed = '��� �� ��������� ������� ���� �����';
  SMoveNotAllowed = '����� %s ������ ����������';
  {$ENDIF}
  SMoreButtons = '������ ������';
  SErrorDownloadingURL = '������ �������� URL: %s';
  SUrlMonDllMissing = '�� ���� ��������� %s';
  SAllActions = '(��� ��������)';
  SNoCategory = '(��� ���������)';
  SExpand = 'Expand';
  SErrorSettingPath = '������ ��������� ����: "%s"';
  SLBPutError = '������� ��������� ������ � ����������� listbox';
  SErrorLoadingFile = '������ �������� ����� ������������ ����� ��������: %s'#13'�� ������ ������� ���?';
  SResetUsageData = 'Reset ��� ������������ ������?';
  SFileRunDialogTitle = '���������';
  SNoName = '(��� �����)';      
  SErrorActionManagerNotAssigned = 'ActionManager ������ ���� �������� ������';
  SAddRemoveButtons = '&�������� ��� ������� ������';
  SResetActionToolBar = 'Reset Toolbar';
  SCustomize = '&���������';
  SSeparator = '�����������';
  SCirularReferencesNotAllowed = '����������� ������ �� ��������������';
  SCannotHideActionBand = '%s �� ��������� ������ (hiding)';
  SErrorSettingCount = '������ ��������� %s.Count';
  SListBoxMustBeVirtual = 'Listbox (%s) Style ������ ���� Virtual ��� ��������� ������ Count';
  SUnableToSaveSettings = '�� ���� ��������� ���������';  
  SRestoreDefaultSchedule = '�� ������ ������������ Priority Schedule �� ���������?';
  {$IFNDEF VER140}
  SNoGetItemEventHandler = '�� ��������� ���������� ������� OnGetItem';
  SInvalidColorMap = '�������� Colormap ���� ActionBand ������� ColorMaps ���� TCustomActionBarColorMapEx';
  SDuplicateActionBarStyleName = '����� � ������ %s ��� ���������������';
  SStandardStyleActionBars = '����������� �����';
  SXPStyleActionBars = '����� XP';
  SActionBarStyleMissing = '��� ������ �� ������ ActionBand � ����������� uses.'#13 +
    '���� ���������� ������ �������� ���� XPStyleActnCtrls, StdStyleActnCtrls, ��� ' +
    '������ �� ������ ActionBand ������� ����� � ����� ����������� uses.';
  {$ENDIF}
{$ENDIF}

implementation

end.
