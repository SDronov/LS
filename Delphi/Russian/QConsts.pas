{ *************************************************************************** }
{                                                                             }
{ Delphi and Kylix Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 2000-2002 Borland Software Corporation                        }
{                                                                             }
{ This file may be distributed and/or modified under the terms of the GNU     }
{ General Public License (GPL) version 2 as published by the Free Software    }
{ Foundation and appearing at http://www.borland.com/kylix/gpl.html.          }
{                                                                             }
{ Licensees holding a valid Borland No-Nonsense License for this Software may }
{ use this file in accordance with such license, which appears in the file    }
{ license.txt that came with this Software.                                   }
{                                                                             }
{  �����������: 2001-02 Polaris Software                                      }
{               http://polesoft.da.ru                                         }
{ *************************************************************************** }

unit QConsts;

interface

const
  // Delphi mime types
  SDelphiBitmap = 'image/delphi.bitmap';
  SDelphiComponent = 'application/delphi.component';
  SDelphiPicture = 'image/delphi.picture';
  SDelphiDrawing = 'image/delphi.drawing';
{$IFNDEF VER140}
  SBitmapExt = 'BMP';
{$ENDIF}

resourcestring
  SInvalidCreateWidget = '����� %s �� ����� ������� QT widget';
  STooManyMessageBoxButtons = '���������� ������� ����� ������ ��� ���� ���������';

  SmkcBkSp = 'Backspace';
  SmkcTab = 'Tab';
  SmkcBackTab = 'BackTab';
  SmkcEsc = 'Esc';
  SmkcReturn = 'Return';
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

  SOpenFileTitle = '�������';
{$IFDEF VER140}
  SAssignError = '�� ���� �������� %s ��������� %s';
  SFCreateError = '�� ���� ������� ���� %s';
  SFOpenError = '�� ���� ������� ���� %s';
  SReadError = '������ ������ ������';
  SWriteError = '������ ������ ������';
  SMemoryStreamError = '�� ������� ������ ��� ���������� memory stream';
  SCantWriteResourceStreamError = '�� ���� ���������� � ����� �������� "������ ��� ������"';
{$ENDIF}
  SDuplicateReference = 'WriteObject ������ ������ ��� ������ � ���� �� ����������';
{$IFDEF VER140}
  SClassNotFound = '����� %s �� ������';
  SInvalidImage = '�������� ������ ������';
  SResNotFound = '������ %s �� ������';
{$ENDIF}
  SClassMismatch = '�������� ����� ������� %s';
{$IFDEF VER140}
  SListIndexError = '������ ������ ����� �� ������� (%d)';
  SListCapacityError = '������ ������ ����� �� ������� (%d)';
  SListCountError = '������� ������ ����� �� ������� (%d)';
  SSortedListError = '�������� ����������� ��� ���������������� ������ �����';
  SDuplicateString = '������ ����� �� ��������� ����������';
{$ENDIF}
  SInvalidTabIndex = 'Tab ������ ����� �� �������';
  SInvalidTabPosition = '������� tab ������������ � ������� ������ tab';
  SInvalidTabStyle = 'C���� tab ����������� � ������� �������� tab';
{$IFDEF VER140}
  SDuplicateName = '��������� � ������ %s ��� ����������';
  SInvalidName = '''''%s'''' ����������� � �������� ����� ����������';
  SDuplicateClass = '����� � ������ %s ��� ����������';
  SNoComSupport = '%s �� ��������������� ��� COM �����';
  SInvalidInteger = '''''%s'''' - �������� ����� �����';
  SLineTooLong = '������ ������� �������';
  SInvalidPropertyValue = '�������� �������� ��������';
  SInvalidPropertyPath = '�������� ���� � ��������';
  SInvalidPropertyType = '�������� ��� ��������: %s';
  SInvalidPropertyElement = '�������� ������� ��������: %s';
  SUnknownProperty = '�������� �� ����������';
  SReadOnlyProperty = '�������� ������ ��� ������';
  SPropertyException = '������ ������ %s%s%s: %s';
  SAncestorNotFound = '������ ��� ''%s'' �� ������';
{$ENDIF}
  SInvalidBitmap = '����������� Bitmap ����� �������� ������';
  SInvalidIcon = '������ (Icon) ����� �������� ������';
  SInvalidPixelFormat = '�������� �������� (pixel) ������';
  SBitmapEmpty = '����������� Bitmap ������';
  SScanLine = 'Scan line ������ ����� �� �������';
  SChangeIconSize = '�� ���� �������� ������ ������';
  SUnknownExtension = '����������� ���������� ����� ����������� (.%s)';
  SUnknownClipboardFormat = '���������������� ������ ������ ������';
  SOutOfResources = '�� ������� ��������� ��������';
  SNoCanvasHandle = 'Canvas �� ��������� ��������';
  SInvalidCanvasState = '�������� ������ ��������� canvas';
  SInvalidImageSize = '�������� ������ �����������';
  SInvalidWidgetHandle = '�������� ���������� widget';
  SInvalidColorDepth = '������� ����� ������ ���� 1, 8 ��� 32 bpp';
{$IFNDEF VER140}
  SInvalidXImage = '�������� XImage';
{$ENDIF}
  STooManyImages = '������� ����� �����������';
  SWidgetCreate = '������ �������� widget';
  SCannotFocus = '�� ���� �������� ����� ����� ������������ ��� ���������� ���� (%s)';
  SParentRequired = '������� ���������� ''%s'' �� ����� ������������� widget';
  SParentGivenNotAParent = '������ �������� �� �������� ��������� ''%s''';
  SVisibleChanged = '�� ���� �������� Visible � OnShow ��� OnHide';
  SCannotShowModal = '�� ���� ������� ������� ��������� ����';
  SScrollBarRange = '�������� Scrollbar ����� �� �������';
  SPropertyOutOfRange = '�������� %s ����� �� �������';
  SMenuIndexError = '������ ���� ����� �� �������';
  SMenuReinserted = '���� ��������� ������';
  SNoMenuRecursion = '�������� ��� ������� ���� �� ��������������';
  SMenuNotFound = '������� - �� � ����';
  SMenuSetFormError = 'TMenu.SetForm: �������� ������ ���� TCustomForm';
  SNoTimers = '��� ��������� ��������';
{$IFDEF VER140}
  SNotPrinting = '������� �� ��������� ������ � ��������� ������';
  SPrinting = '���� ������...';
{$ENDIF}
  SNoAdapter = '��� ���������� �������� �������� ��� ������';
  SPrinterIndexError = '������ �������� ����� �� �������';
  SInvalidPrinter = '������ �������� �������';
  SDeviceOnPort = '%s on %s';
  SGroupIndexTooLow = 'GroupIndex �� ����� ���� ������, ��� GroupIndex ����������� ������ ����';
  SNoMDIForm = '�� ���� ������� �����. ��� �������� MDI ����';
  SNotAnMDIForm = '�������� MDIParent ��� ������ %s';
  SMDIChildNotVisible = '�� ���� ������ �������� MDI �����';
{$IFDEF VER140}
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

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';
  SVIcons = '������';
  SVBitmaps = 'Bitmaps';
  SVPixmaps = 'Pixmaps';
  SVPNGs = 'PNGs';
  SDrawings = '�������';
{$IFNDEF VER140}
  SVJpegs = 'Jpegs';
{$ENDIF}
{$IFDEF VER140}
  SGridTooLarge = '������� (Grid) ������� ������� ��� ������';
  STooManyDeleted = '��������� ������� ����� ����� ��� ��������';
  SIndexOutOfRange = '������ Grid ����� �� �������';
  SFixedColTooBig = '����� ������������� �������� ������ ���� ������ ������ ����� ��������';
  SFixedRowTooBig = '����� ������������� ����� ������ ���� ������ ������ ����� �����';
  SInvalidStringGridOp = '�� ���� �������� ��� ������� ������ �� ������� (grid)';
  SParseError = '%s � ������ %d';
  SIdentifierExpected = '��������� �������������';
  SStringExpected = '��������� ������';
  SNumberExpected = '��������� �����';
  SCharExpected = '��������� ''''%s''''';
  SSymbolExpected = '��������� %s';
{$ENDIF}
  SInvalidNumber = '�������� �������� ��������';
{$IFDEF VER140}
  SInvalidString = '�������� ��������� ���������';
  SInvalidProperty = '�������� �������� ��������';
  SInvalidBinary = '�������� �������� ��������';
{$ENDIF}
  SInvalidCurrentItem = '�������� �������� ��� �������� ��������';
{$IFDEF VER140}
  SMaskErr = '������� �������� ��������';
  SMaskEditErr = '������� �������� ��������.  ������� Esc ��� ������ ���������';
{$ENDIF}

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

  srUnknown = '(����������)';
  srNone = '(���)';
  SOutOfRange = '�������� ������ ���� ����� %d � %d';
  SCannotCreateName = '�� ���� ������� ��� ������ �� ��������� ��� ���������� ��� �����';
  SUnnamed = '����������';

{$IFDEF VER140}
  SDateEncodeError = '�������� �������� ��� ������������ ����';
  STimeEncodeError = '�������� �������� ��� ������������ �������';
  SInvalidDate = '''''%s'''' - �������� ����';
  SInvalidTime = '''''%s'''' - �������� �����';
  SInvalidDateTime = '''''%s'''' - �������� ���� � �����';
  SInvalidFileName = '�������� ��� ����� - %s';
  SDefaultFilter = '��� ����� (*.*)|*.*';
{$ENDIF}
  SInsertLineError = '���������� �������� ������';

  SConfirmCreateDir = '��������� ����� �� ����������. ������� ��?';
  SSelectDirCap = '����� �����';
{$IFNDEF VER140}
  SCannotCreateDirName = '�� ���� ������� ����� "%s".';
  SAccessDeniedTo = '������ � "%s" ��������';
  SCannotReadDirectory = '�� ���� ��������� �����:' + sLineBreak + '"%s"';
  SDirectoryNotEmpty = '����� "%s" - �� ������.';
  SNotASubDir = '"%s" - �� ���������� "%s"';
{$ENDIF}
{$IFDEF VER140}
  SCannotCreateDir = '�� ���� ������� �����';
{$ENDIF}
  SDirNameCap = '&��� �����:';
  SDrivesCap = '&����������:';
  SDirsCap = '&�����:';
  SFilesCap = '&�����: (*.*)';
  SNetworkCap = '&����...';
{$IFNDEF VER140}
  SInvalidDirectory = '�� ���� ��������� ����� "%s".';
  SNewFolder = '����� �����';
  SFileNameNotFound = '"%s"'#10'���� �� ������.';
  SAlreadyExists = '���� � ����� ������ ��� ����������. ����������, ������� '+
    '������ ��� �����.';
  SConfirmDeleteTitle = '������������ �������� �����';
  SConfirmDeleteMany = '�� �������, ��� ������ ������� ��� %d ������(��)?';
  SConfirmDeleteOne = '�� �������, ��� ������ ������� "%s"?';
  SContinueDelete = '���������� �������� ��������?';
  SAdditional = '�������������';
  SName = '���';
  SSize = '������';
  SType = '���';
  SDate = '���� ���������';
  SAttributes = '��������';
 {$IFDEF LINUX}
  SOwner = '������';
  SGroup = '������';
  SDefaultFilter = '��� ����� (*)|*|';
 {$ENDIF}
 {$IFDEF MSWINDOWS}
  SPermissions = '��������';
  SDefaultFilter = '��� ����� (*.*)|*.*|';
  SVolume = '���';
  SFreeSpace = '��������';
  SAnyKnownDrive = ' ����������� ����';
  SMegs = '%d ��';
 {$ENDIF}

  SDirectory = '�����';
  SFile = '����';
  SLinkTo = '������ �� ';
{$ENDIF}

  SInvalidClipFmt = '�������� ������ ������ ������';
  SIconToClipboard = '����� ������ �� ������������ ������';
  SCannotOpenClipboard = '�� ���� ������� ����� ������';

{$IFDEF VER140}
  SInvalidActionRegistration = '�������� ����������� �������� (action)';
  SInvalidActionUnregistration = '�������� ������ ����������� �������� (action)';
  SInvalidActionEnumeration = '�������� �������� �������� (action)';
  SInvalidActionCreation = '�������� �������� �������� (action)';
{$ENDIF}

  SDefault = 'Default';

  SInvalidMemoSize = '����� �������� ������� memo';
  SCustomColors = 'Custom Colors';
  SInvalidPrinterOp = '�������� �� �������������� �� ��������� ��������';
  SNoDefaultPrinter = '��� ���������� �� ��������� ��������';

{$IFDEF VER140}
  SIniFileWriteError = '�� ���� �������� � %s';

  SBitsIndexError = '������ Bits ����� �� �������';
{$ENDIF}

  SUntitled = '(��� �����)';

  SDuplicateMenus = '���� ''%s'' ��� ������������ ������ ������';

  SPictureLabel = '��������:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = '��������';
{$IFNDEF VER140}
  SNoPreview = '��� ���������� ���������';
{$ENDIF}

  SBoldItalicFont = 'Bold Italic';
  SBoldFont = 'Bold';
  SItalicFont = 'Italic';
  SRegularFont = 'Regular';

  SPropertiesVerb = '��������';

{$IFDEF VER140}
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

  SAllCommands = 'All Commands';

{$IFDEF VER140}
  SDuplicateItem = '������ �� ��������� ���������� ($0%x)';
{$ENDIF}

  SDuplicatePropertyCategory = '��������� ��������, ��������� %s, ��� �������';
  SUnknownPropertyCategory = '��������� �������� �� ������� (%s)';

{$IFDEF VER140}
  SInvalidMask = '''%s'' - �������� ����� � ������� %d';
{$ENDIF}
  SInvalidFilter = '�������� ������� ����� ���� ������ ���, ����� ��� ��� �� ���� (%d:%d)';
  SInvalidCategory = '��������� ������ ���������� ���� ��� � ��������';

  sOperationNotAllowed = '�������� �� ��������� �� ����� �������� ������� ����������';
  STextNotFound = '����� �� ������: "%s"';

  SImageIndexError = '�������� ������ ImageList';
  SReplaceImage = '���������� �������� �����������';
  SInvalidImageType = '�������� ��� �����������';
  SInvalidImageDimensions = '������ � ������ ����������� ������ ���������';
  SInvalidImageDimension = '�������� ��������� �����������';
  SErrorResizingImageList = '������ ��������� �������� ImageList';

  SInvalidRangeError = '�������� �� %d �� %d - ��������';
  SInvalidMimeSourceStream = '������ MimeSource ������ ����� ��������� � ������� ����� (stream)';
  SMimeNotSupportedForIcon = '������ Mime �� �������������� ��� TIcon';

  SOpen = '�������';
{$IFDEF VER140}
  SSave = '��������� ���';
{$ELSE}
  SSave = '���������';
  SSaveAs = '��������� ���';
{$ENDIF}
  SFindWhat = '&�����:';
  SWholeWord = '&������ ����� �����';
  SMatchCase = '� �&����� ��������';
  SFindNext = '����� &�����';
  SCancel = '������';
  SHelp = '�������';
  SFindTitle = '�����';
  SDirection = '�����������';
  SUp = '&�����';
  SDown = '��&��';
  SReplaceWith = '��&������ ��:';
  SReplace = '&��������';
  SReplaceTitle = '������';
  SReplaceAll = '�������� �&��';
  SOverwriteCaption = '��������� %s ���';
{$IFDEF VER140}
  SOverwriteText = '%s ��� ������.'#13'������ �������� ���?';
  SFileMustExist = '%s'#13'���� �� ������.'#13'����������, ��������� ������������ '+
    '������� ����� �����.';
  SPathMustExist = '%s'#13'���� �� ������.'#13'����������, ��������� ������������ '+
    '������� ����.';
{$ELSE}
  SOverwriteText = '"%s" ��� ������.' + sLineBreak + '������ �������� ���?';
  SFileMustExist = '"%s"' + sLineBreak + '���� �� ������.' + sLineBreak + '����������, ��������� ������������ '+
    '������� ����� �����.';
  SPathMustExist = '"%s"' + sLineBreak + '���� �� ������.' + sLineBreak + '����������, ��������� ������������ '+
    '������� ����.';
  SDriveNotFound = '���� %s �� ����������.' + sLineBreak + '����������, ��������� ������������ '+
    '������� �����.';
{$ENDIF}

  SUnknownImageFormat = '������ ����������� �� ���������';
  SInvalidHandle = '�������� �������� ����������� (handle) ��� %s';
  SUnableToWrite = '�� ���� �������� bitmap';
  sAllFilter = '���';

  sInvalidSetClipped = '�� ���� ���������� �������� Clipped �� ����� ���������';

  sInvalidLCDValue = '�������� �������� LCDNumber';

  sTabFailDelete = '�� ������� ������� �������� (tab) � �������� %d';
  sPageIndexError = '�������� �������� PageIndex (%d).  PageIndex ������ ���� ' +
    '����� 0 � %d';
  sInvalidLevel = '������������ ��������� ������ ��������';
  sInvalidLevelEx = '�������� ������� (%d) ��� �������� "%s"';
  sTabMustBeMultiLine = 'MultiLine ������ ���� True, ����� TabPosition ����� tpLeft ��� tpRight';
  sStatusBarContainsControl = '%s ��� � StatusBar';
  sListRadioItemBadParent = '������ Radio ������ ����� Controller ��� ��������';
  sOwnerNotCustomHeaderSections = '�������� - �� TCustomHeaderSection';
  sHeaderSectionOwnerNotHeaderControl = '�������� Header Section ������ ���� TCustomHeaderControl';

  SUndo = '��������';
  SRedo = '���������';
  SLine = '-';
  SCut = '��������';
  SCopy = '����������';
  SPaste = '��������';
  SClear = '��������';
  SSelectAll = '������� ���';

{$IFNDEF VER140}
  SBadMovieFormat = '����������� �����������';
  SMovieEmpty = '����� �� ���������';
  SLoadingEllipsis = '��������...';

  SNoAppInLib = '��������� ������: �� ���� ������� ������ ���������� � ����������� (shared) ������� ��� ����������.';
  SDuplicateApp = '��������� ������: �� ���� ������� ����� ������ ���������� TApplication';
{$ENDIF}
implementation

end.
