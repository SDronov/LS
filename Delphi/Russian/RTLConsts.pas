{ *************************************************************************** }
{                                                                             }
{ Delphi and Kylix Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 1995, 2001 Borland Software Corporation                       }
{                                                                             }
{  �����������: 2001-02 Polaris Software                                      }
{               http://polesoft.da.ru                                         }
{ *************************************************************************** }

unit RTLConsts;

interface

resourcestring
  SAncestorNotFound = '������ ��� ''%s'' �� ������';
  SAssignError = '�� ���� �������� %s ��������� %s';
  SBitsIndexError = '������ Bits ����� �� �������';
  SBucketListLocked = '������ ������������ ��� �������� ForEach';
  SCantWriteResourceStreamError = '�� ���� ���������� � ����� �������� "������ ��� ������"';
  SCharExpected = '��������� ''''%s''''';
  SCheckSynchronizeError = 'CheckSynchronize ������ �� ������ (thread) $%x, ������� �� �������� �������� �������';
  SClassNotFound = '����� %s �� ������';
  SDelimiterQuoteCharError = '�������� Delimiter � QuoteChar �� ����� ����� ���� � �� �� ��������';
  SDuplicateClass = '����� � ������ %s ��� ����������';
  SDuplicateItem = '������ �� ��������� ���������� ($0%x)';
  SDuplicateName = '��������� � ������ %s ��� ����������';
  SDuplicateString = '������ ����� �� ��������� ����������';
  SFCreateError = '�� ���� ������� ���� %s';
{$IFNDEF VER140}
  SFCreateErrorEx = '�� ���� ������� ���� "%s". %s';
{$ENDIF}
  SFixedColTooBig = '����� ������������� �������� ������ ���� ������ ������ ����� ��������';
  SFixedRowTooBig = '����� ������������� ����� ������ ���� ������ ������ ����� �����';
  SFOpenError = '�� ���� ������� ���� %s';
{$IFNDEF VER140}
  SFOpenErrorEx = '�� ���� ������� ���� "%s". %s';
{$ENDIF}
  SGridTooLarge = '������� (Grid) ������� ������� ��� ������';
  SIdentifierExpected = '��������� �������������';
  SIndexOutOfRange = '������ Grid ����� �� �������';
  SIniFileWriteError = '�� ���� �������� � %s';
  SInvalidActionCreation = '�������� �������� �������� (action)';
  SInvalidActionEnumeration = '�������� �������� �������� (action)';
  SInvalidActionRegistration = '�������� ����������� �������� (action)';
  SInvalidActionUnregistration = '�������� ������ ����������� �������� (action)';
  SInvalidBinary = '�������� �������� ��������';
  SInvalidDate = '''''%s'''' - �������� ����' {$IFNDEF VER140}deprecated{$ENDIF};
  SInvalidDateTime = '''''%s'''' - �������� ���� � �����' {$IFNDEF VER140}deprecated{$ENDIF};
  SInvalidFileName = '�������� ��� ����� - %s';
  SInvalidImage = '�������� ������ ������';
  SInvalidInteger = '''''%s'''' - �������� ����� �����' {$IFNDEF VER140}deprecated{$ENDIF};
  SInvalidMask = '''%s'' - �������� ����� � ������� %d';
  SInvalidName = '''''%s'''' ����������� � �������� ����� ����������';
  SInvalidProperty = '�������� �������� ��������';
  SInvalidPropertyElement = '�������� ������� ��������: %s';
  SInvalidPropertyPath = '�������� ���� � ��������';
  SInvalidPropertyType = '�������� ��� ��������: %s';
  SInvalidPropertyValue = '�������� �������� ��������';
  SInvalidRegType = '�������� ��� ������ ��� ''%s''';
  SInvalidString = '�������� ��������� ���������';
  SInvalidStringGridOp = '�� ���� �������� ��� ������� ������ �� ������� (grid)';
  SInvalidTime = '''''%s'''' - �������� �����' {$IFNDEF VER140}deprecated{$ENDIF};
  SItemNotFound = '����� �� ������ ($0%x)';
  SLineTooLong = '������ ������� �������';
  SListCapacityError = '������ ������ ����� �� ������� (%d)';
  SListCountError = '������� ������ ����� �� ������� (%d)';
  SListIndexError = '������ ������ ����� �� ������� (%d)';
  SMaskErr = '������� �������� ��������';
  SMaskEditErr = '������� �������� ��������.  ������� Esc ��� ������ ���������';
  SMemoryStreamError = '�� ������� ������ ��� ���������� memory stream';
  SNoComSupport = '%s �� ��������������� ��� COM �����';
  SNotPrinting = '������� �� ��������� ������ � ��������� ������';
  SNumberExpected = '��������� �����';
  SParseError = '%s � ������ %d';
  SComponentNameTooLong = '��� ���������� ''%s'' ��������� ������ � 64 ��������';
  SPropertyException = '������ ������ %s%s%s: %s';
  SPrinting = '���� ������...';
  SReadError = '������ ������ ������';
  SReadOnlyProperty = '�������� ������ ��� ������';
  SRegCreateFailed = '������ �������� ����� %s';
  SRegGetDataFailed = '������ ������ �������� ��� ''%s''';
  SRegisterError = '�������� ����������� ����������';
  SRegSetDataFailed = '������ ������ �������� ��� ''%s''';
  SResNotFound = '������ %s �� ������';
  SSeekNotImplemented = '%s.Seek �� ���������';
  SSortedListError = '�������� ����������� ��� ���������������� ������ �����';
  SStringExpected = '��������� ������';
  SSymbolExpected = '��������� %s';
  STimeEncodeError = '�������� �������� ��� ������������ �������' {$IFNDEF VER140}deprecated{$ENDIF};
  STooManyDeleted = '��������� ������� ����� ����� ��� ��������';
  SUnknownGroup = '%s ��� � ������ ����������� ������';
  SUnknownProperty = '�������� %s �� ����������';
  SWriteError = '������ ������ ������';
  SStreamSetSize = '������ ��������� ������� ������ (stream size)';
  SThreadCreateError = '������ �������� ������ (thread): %s';
  SThreadError = '������ ������ (thread): %s (%d)';

  SInvalidDateDay = '(%d, %d) - �������� ���� DateDay';
  SInvalidDateWeek = '(%d, %d, %d) - �������� ��������� DateWeek';
  SInvalidDateMonthWeek = '(%d, %d, %d, %d) - �������� ��������� DateMonthWeek';
  SInvalidDayOfWeekInMonth = '(%d, %d, %d, %d) - �������� ��������� DayOfWeekInMonth';
  SInvalidJulianDate = '%f Julian �� ����� ���� ������������ ��� DateTime';
  SMissingDateTimeField = '?';

  SConvIncompatibleTypes2 = '������������� ���� �������������� [%s, %s]';
  SConvIncompatibleTypes3 = '������������� ���� �������������� [%s, %s, %s]';
  SConvIncompatibleTypes4 = '������������� ���� �������������� [%s - %s, %s - %s]';
  SConvUnknownType = '����������� ��� �������������� %s';
  SConvDuplicateType = '��� �������������� (%s) ��� ��������������� � %s';
  SConvUnknownFamily = '����������� ��������� �������������� %s';
  SConvDuplicateFamily = '��������� �������������� (%s) ��� ����������������';
{$IFNDEF VER140}
  SConvUnknownDescription = '[$%.8x]' deprecated; // no longer used
  SConvUnknownDescriptionWithPrefix = '[%s%.8x]';
{$ELSE}
  SConvUnknownDescription = '[%.8x]';
{$ENDIF}
  SConvIllegalType = '������������ ���';
  SConvIllegalFamily = '������������ ���������';
  SConvFactorZero = '%s ����� ������� ���������';
  SConvStrParseError = '�� ���� ��������� %s';
  SFailedToCallConstructor = '������� TStrings %s ������ ������ ��� ������ inherited constructor';

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

{$IFNDEF VER140}
  SCmplxCouldNotParseImaginary = '�� ���� ���������� ������ �����';
  SCmplxCouldNotParseSymbol = '�� ���� ���������� ��������� ''%s'' ������';
  SCmplxCouldNotParsePlus = '�� ���� ���������� ��������� ''+'' (��� ''-'') ������';
  SCmplxCouldNotParseReal = '�� ���� ���������� �������������� �����';
  SCmplxUnexpectedEOS = '����������� ����� ������ [%s]';
  SCmplxUnexpectedChars = '����������� �������';
  SCmplxErrorSuffix = '%s [%s<?>%s]';

  hNoSystem = '�������� ������� �� ����������.';
  hNoTopics = '������� �� ������ ��� (topic) �� �����������.';
  hNoContext = '����������-��������� ������� �� �����������.';
  hNothingFound = '�� ������� ������� ��� "%s"';
  hNoTableOfContents = '���������� �� �������.';

  { ************************************************************************* }
  { Distance's family type }
  SDistanceDescription = '����������';

  { Distance's various conversion types }
  SMicromicronsDescription = '������������';
  SAngstromsDescription = '���������';
  SMillimicronsDescription = '������������';
  SMicronsDescription = '�������';
  SMillimetersDescription = '����������';
  SCentimetersDescription = '����������';
  SDecimetersDescription = '���������';
  SMetersDescription = '�����';
  SDecametersDescription = '���������';
  SHectometersDescription = '����������';
  SKilometersDescription = '���������';
  SMegametersDescription = '���������';
  SGigametersDescription = '���������';
  SInchesDescription = '�����';
  SFeetDescription = '����';
  SYardsDescription = '����';
  SMilesDescription = '����';
  SNauticalMilesDescription = '������� ����';
  SAstronomicalUnitsDescription = '��������������� �������';
  SLightYearsDescription = '�������� ����';
  SParsecsDescription = '�������';
  SCubitsDescription = '�����';
  SFathomsDescription = '������� ������';
  SFurlongsDescription = '1/8 ����';
  SHandsDescription = '����';
  SPacesDescription = '����';
  SRodsDescription = '����� (rods)';
  SChainsDescription = '������ ����';
  SLinksDescription = '������ ����������� ����';
  SPicasDescription = '���� (picas)';
  SPointsDescription = '�����';

  { ************************************************************************* }
  { Area's family type }
  SAreaDescription = '�������';

  { Area's various conversion types }
  SSquareMillimetersDescription = '��. ����������';
  SSquareCentimetersDescription = '��. ����������';
  SSquareDecimetersDescription = '��. ���������';
  SSquareMetersDescription = '��. �����';
  SSquareDecametersDescription = '��. ���������';
  SSquareHectometersDescription = '��. ����������';
  SSquareKilometersDescription = '��. ���������';
  SSquareInchesDescription = '��. �����';
  SSquareFeetDescription = '��. ����';
  SSquareYardsDescription = '��. ����';
  SSquareMilesDescription = '��. ����';
  SAcresDescription = '����';
  SCentaresDescription = '��������';
  SAresDescription = '���';
  SHectaresDescription = '�������';
  SSquareRodsDescription = '��. ����� (rods)';

  { ************************************************************************* }
  { Volume's family type }
  SVolumeDescription = '�����';

  { Volume's various conversion types }
  SCubicMillimetersDescription = '���. ����������';
  SCubicCentimetersDescription = '���. ����������';
  SCubicDecimetersDescription = '���. ���������';
  SCubicMetersDescription = '���. �����';
  SCubicDecametersDescription = '���. ���������';
  SCubicHectometersDescription = '���. ����������';
  SCubicKilometersDescription = '���. ���������';
  SCubicInchesDescription = '���. �����';
  SCubicFeetDescription = '���. ����';
  SCubicYardsDescription = '���. ����';
  SCubicMilesDescription = '���. ����';
  SMilliLitersDescription = '����������';
  SCentiLitersDescription = '����������';
  SDeciLitersDescription = '���������';
  SLitersDescription = '�����';
  SDecaLitersDescription = '���������';
  SHectoLitersDescription = '����������';
  SKiloLitersDescription = '���������';
  SAcreFeetDescription = '��������';
  SAcreInchesDescription = '���������';
  SCordsDescription = '�����';
  SCordFeetDescription = '��������';
  SDecisteresDescription = 'Decisteres';
  SSteresDescription = 'Steres';
  SDecasteresDescription = 'Decasteres';

  { American Fluid Units }
  SFluidGallonsDescription = '������� ������';
  SFluidQuartsDescription = '������ ������';
  SFluidPintsDescription = '����� ������';
  SFluidCupsDescription = '����� ������';
  SFluidGillsDescription = '1/4 ����� ������';
  SFluidOuncesDescription = '����� ������';
  SFluidTablespoonsDescription = '�������� �����';
  SFluidTeaspoonsDescription = '������ �����';

  { American Dry Units }
  SDryGallonsDescription = '������� �������';
  SDryQuartsDescription = '������ �������';
  SDryPintsDescription = '����� �������';
  SDryPecksDescription = 'DryPecks';
  SDryBucketsDescription = '�����';
  SDryBushelsDescription = '������';

  { English Imperial Fluid/Dry Units }
  SUKGallonsDescription = '����. �������';
  SUKPottlesDescription = 'UKPottle';
  SUKQuartsDescription = '����. ������';
  SUKPintsDescription = '����. �����';
  SUKGillsDescription = '����. 1/4 �����';
  SUKOuncesDescription = '����. �����';
  SUKPecksDescription = 'UKPecks';
  SUKBucketsDescription = '����. �����';
  SUKBushelsDescription = '����. ������';

  { ************************************************************************* }
  { Mass's family type }
  SMassDescription = '�����';

  { Mass's various conversion types }
  SNanogramsDescription = '����������';
  SMicrogramsDescription = '�����������';
  SMilligramsDescription = '�����������';
  SCentigramsDescription = '�����������';
  SDecigramsDescription = '����������';
  SGramsDescription = '������';
  SDecagramsDescription = '����������';
  SHectogramsDescription = '�����������';
  SKilogramsDescription = '����������';
  SMetricTonsDescription = '����. �����';
  SDramsDescription = '������';
  SGrainsDescription = '�����';
  STonsDescription = '�����';
  SLongTonsDescription = '������� �����';
  SOuncesDescription = '�����';
  SPoundsDescription = '�����';
  SStonesDescription = '������';

  { ************************************************************************* }
  { Temperature's family type }
  STemperatureDescription = '�����������';

  { Temperature's various conversion types }
  SCelsiusDescription = '�������';
  SKelvinDescription = '�������';
  SFahrenheitDescription = '���������';
  SRankineDescription = 'Rankine';
  SReaumurDescription = '������';

  { ************************************************************************* }
  { Time's family type }
  STimeDescription = '�����';

  { Time's various conversion types }
  SMilliSecondsDescription = '������������';
  SSecondsDescription = '�������';
  SMinutesDescription = '������';
  SHoursDescription = '����';
  SDaysDescription = '���';
  SWeeksDescription = '������';
  SFortnightsDescription = '��� ������';
  SMonthsDescription = '������';
  SYearsDescription = '����';
  SDecadesDescription = '������';
  SCenturiesDescription = '����';
  SMillenniaDescription = '�����������';
  SDateTimeDescription = '���������';
  SJulianDateDescription = '��������� ����';
  SModifiedJulianDateDescription = '��������� ��������� ����';
{$ENDIF}

implementation

end.
