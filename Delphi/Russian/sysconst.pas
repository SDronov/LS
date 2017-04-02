{ *********************************************************************** }
{                                                                         }
{ Delphi / Kylix Cross-Platform Runtime Library                           }
{                                                                         }
{ Copyright (c) 1995, 2001 Borland Software Corporation                   }
{                                                                         }
{  �����������: 1999-2002 Polaris Software                                }
{               http://polesoft.da.ru                                     }
{ *********************************************************************** }

unit SysConst;

interface

{$IFDEF VER140}
  {$DEFINE D6_}
{$ENDIF}
{$IFDEF VER150}
  {$DEFINE D6_}
{$ENDIF}

resourcestring
{$IFNDEF VER120}
{$IFNDEF VER125}
  SUnknown = '<����������>';
{$ENDIF}
{$ENDIF}
  SInvalidInteger = '''%s'' - �������� ����� ��������';
  SInvalidFloat = '''%s'' - �������� ������� ��������';
{$IFDEF D6_}
  SInvalidCurrency = '''%s'' - �������� �������� ��������';
{$ENDIF}
  SInvalidDate = '''%s'' - �������� ����';
  SInvalidTime = '''%s'' - �������� �����';
  SInvalidDateTime = '''%s'' - �������� ���� � �����';
{$IFDEF D6_}
  SInvalidDateTimeFloat = '''%g'' - �������� ���� � �����';
  SInvalidTimeStamp = '''%d.%d'' - �������� ���� � ����� (timestamp)';
  SInvalidGUID = '''%s'' - �������� �������� GUID';
  SInvalidBoolean = '''%s'' - �������� ���������� ��������';
{$ENDIF}
  STimeEncodeError = '�������� �������� ��� ������������ �������';
  SDateEncodeError = '�������� �������� ��� ������������ ����';
  SOutOfMemory = '�� ������� ������';
  SInOutError = '������ �����/������ %d';
  SFileNotFound = '���� �� ������';
  SInvalidFilename = '�������� ��� �����';
  STooManyOpenFiles = '������� ����� �������� ������';
  SAccessDenied = '� ������� � ����� ��������';
  SEndOfFile = '������ �� ���������� �����';
  SDiskFull = '���� �����';
  SInvalidInput = '�������� ���� �����';
  SDivByZero = '������� �� ����';
  SRangeError = '������ ������ �� ������� (Range check)';
  SIntOverflow = '������������ ������';
  SInvalidOp = '�������� �������� � �������� �������';
  SZeroDivide = '��������������� ������� �� ����';
  SOverflow = '��������������� ������������';
  SUnderflow = '��������������� ������ (underflow)';
  SInvalidPointer = '�������� �������� � ����������';
  SInvalidCast = '�������� ���������� ������';
{$IFDEF D6_}
 {$IFDEF MSWINDOWS}
  {$IFDEF VER140}
  SAccessViolation = '��������� ������� �� ������ %p. %s �� ������ %p';
  {$ELSE}
  SAccessViolationArg3 = '��������� ������� �� ������ %p. %s �� ������ %p';
  {$ENDIF}
 {$ENDIF}
 {$IFDEF LINUX}
  {$IFDEF VER140}
  SAccessViolation = '��������� ������� �� ������ %p, ��������� � ������ %p';
  {$ELSE}
  SAccessViolationArg2 = '��������� ������� �� ������ %p, ��������� � ������ %p';
  {$ENDIF}
 {$ENDIF}
  {$IFNDEF VER140}
  SAccessViolationNoArg = '��������� �������';
  {$ENDIF}
{$ELSE}
  SAccessViolation = '��������� ������� �� ������ %p. %s �� ������ %p';
{$ENDIF}
  SStackOverflow = '������������ �����';
  SControlC = '������� Control-C';
{$IFDEF D6_}
  SQuit = '������� ������ �����';
{$ENDIF}
  SPrivilege = '����������������� ����������';
  SOperationAborted = '�������� ��������';
{$IFDEF D6_}
  SException = '�������������� �������� %s � ������ %s �� ������ %p.' + sLineBreak + '%s%s' + sLineBreak;
{$ELSE}
  SException = '�������������� �������� %s � ������ %s �� ������ %p.'#$0A'%s%s';
{$ENDIF}
  SExceptTitle = '������ ����������';
{$IFDEF LINUX}
  SSigactionFailed = 'sigaction call failed';
{$ENDIF}
  SInvalidFormat = '������ ''%s'' ������� ��� ����������� � ����������';
  SArgumentMissing = '��� ��������� ��� ������� ''%s''';
  SInvalidVarCast = '�������� �������������� ����������� ����';
  SInvalidVarOp = '�������� �������� � ���������';
  SDispatchError = '������ ���������� ������� �� ��������������';
  SReadAccess = '������';
  SWriteAccess = '������';
  SResultTooLong = '��������� �������������� �������, ��� 4096 ��������';
  SFormatTooLong = '������ ������� ������� �������';

{$IFDEF VER150}
  SVarArrayCreate = '������ �������� ����������� ��� safe �������';
{$ELSE}
  SVarArrayCreate = '������ �������� ����������� �������';
{$ENDIF}
{$IFNDEF D6_}
  SVarNotArray = '������� �� �������� ��������';
{$ENDIF}
{$IFDEF VER150}
  SVarArrayBounds = '������ ����������� ��� safe ������� ����� �� �������';
{$ELSE}
  SVarArrayBounds = '������ ����������� ������� ����� �� �������';
{$ENDIF}
{$IFDEF D6_}
  {$IFDEF VER150}
  SVarArrayLocked = '���������� ��� safe ������ ������������';
  SVarArrayWithHResult = '����������� ������ ����������� ��� safe �������: %s%.8x';
  {$ELSE}
  SVarArrayLocked = '���������� ������ ������������';
  {$ENDIF}
  SInvalidVarOpWithHResult = '�������� �������� � ��������� ($%.8x)' {$IFDEF VER150}deprecated{$ENDIF};

  // the following are not used anymore
  SVarNotArray = '������� �� �������� ��������' deprecated; // not used, use SVarInvalid
  {$IFDEF VER140}
  SVarTypeUnknown = '����������� ������������ ���������� ��� (%.4x)' deprecated; // not used anymore

  SVarTypeOutOfRange = '������������ ���������� ��� (%.4x) ����� �� �������';
  SVarTypeAlreadyUsed = '������������ ���������� ��� (%.4x) ��� ������������ %s';
  SVarTypeNotUsable = '������������ ���������� ��� (%.4x) �������� �����������';
  {$ELSE}
  SVarTypeUnknown = '����������� ������������ ���������� ��� ($%.4x)' deprecated; // not used anymore
  SVarTypeOutOfRange = '������������ ���������� ��� ($%.4x) ����� �� �������' deprecated;
  SVarTypeAlreadyUsed = '������������ ���������� ��� ($%.4x) ��� ������������ %s' deprecated;
  SVarTypeNotUsable = '������������ ���������� ��� ($%.4x) �������� �����������' deprecated;

  SInvalidVarNullOp = '�������� �������� � NULL';
  SInvalidVarOpWithHResultWithPrefix = '�������� �������� � ��������� (%s%.8x)'#10'%s';
  SVarTypeRangeCheck1 = '������ ������ �� ������� (range check) ��� �������� ���� (%s)';
  SVarTypeRangeCheck2 = '������ ������ �� ������� (range check) ��� ��������������� �������� ���� (%s) � ��� (%s)';
  SVarTypeOutOfRangeWithPrefix = '������������ ���������� ��� (%s%.4x) ����� �� �������';
  SVarTypeAlreadyUsedWithPrefix = '������������ ���������� ��� (%s%.4x) ��� ������������ %s';
  SVarTypeNotUsableWithPrefix = '������������ ���������� ��� (%s%.4x) �������� �����������';
  {$ENDIF}
  SVarTypeTooManyCustom = '���������������� c������ ����� ������������ ���������� �����';

  SVarTypeCouldNotConvert = '�� ���� ������������� ������� ���� (%s) � ��� (%s)';
  SVarTypeConvertOverflow = '������������ ��� �������������� �������� ���� (%s) � ��� (%s)';
  SVarOverflow = '������������ ��������';
  SVarInvalid = '�������� ��������';
  SVarBadType = '�������� ��� ��������';
  SVarNotImplemented = '�������� �� ��������������';
  SVarOutOfMemory = '�������� � ��������� �� ������� ������';
  SVarUnexpected = '����������� ������ ��������';

  SVarDataClearRecursing = '�������� �� ����� ���������� VarDataClear';
  SVarDataCopyRecursing = '�������� �� ����� ���������� VarDataCopy';
  SVarDataCopyNoIndRecursing = '�������� �� ����� ���������� VarDataCopyNoInd';
  SVarDataInitRecursing = '�������� �� ����� ���������� VarDataInit';
  SVarDataCastToRecursing = '�������� �� ����� ���������� VarDataCastTo';
  SVarIsEmpty = '������� - ������';
  sUnknownFromType = '�� ���� ������������� �� ���������� ����';
  sUnknownToType = '�� ���� ������������� � ��������� ���';
{$ENDIF}
  SExternalException = '������� �������������� �������� %x';
  SAssertionFailed = 'Assertion failed';
  SIntfCastError = '��������� �� ��������������';
{$IFNDEF VER120}
{$IFNDEF VER125}
  SSafecallException = '�������������� �������� � safecall ������';
{$ENDIF}
{$ENDIF}
  SAssertError = '%s (%s, ������ %d)';
  SAbstractError = '����������� ������';
  SModuleAccessViolation = '��������� ������� �� ������ %p � ������ ''%s''. %s �� ������ %p';
  SCannotReadPackageInfo = '�� ���� �������� ���������� ������ ��� ������ ''%s''';
  sErrorLoadingPackage = '�� ���� ��������� ����� %s.'#13#10'%s';
  SInvalidPackageFile = '�������� ���� ������ ''%s''';
  SInvalidPackageHandle = '�������� ���������� ������';
  SDuplicatePackageUnit = '�� ���� ��������� ����� ''%s''.  �� �������� ������ ''%s''' +
    ', ������� ����� ���������� � ������ ''%s''';
{$IFDEF D6_}
  SOSError = '��������� ������.  ���: %d.'+sLineBreak+'%s';
  SUnkOSError = '������ ��� ������ ������� ��';
 {$IFDEF MSWINDOWS}
  SWin32Error = '������ Win32.  ���: %d.'#10'%s' deprecated; // use SOSError
  SUnkWin32Error = '������ ������� Win32 API' deprecated; // use SUnkOSError
 {$ENDIF}
{$ELSE}
  SWin32Error = '������ Win32.  ���: %d.'#10'%s';
  SUnkWin32Error = '������ ������� Win32 API';
{$ENDIF}
  SNL = '���������� �� ����� �������� �� ������������� ���� �����������';

{$IFDEF VER140}
  SConvIncompatibleTypes2 = '������������� ���� �������������� [%s, %s]';
  SConvIncompatibleTypes3 = '������������� ���� �������������� [%s, %s, %s]';
  SConvIncompatibleTypes4 = '������������� ���� �������������� [%s - %s, %s - %s]';
  SConvUnknownType = '����������� ��� �������������� %s';
  SConvDuplicateType = '��� �������������� (%s) ��� ���������������';
  SConvUnknownFamily = '����������� ��������� �������������� %s';
  SConvDuplicateFamily = '��������� �������������� (%s) ��� ����������������';
  SConvUnknownDescription = '[%.8x]';
  SConvIllegalType = '������������ ���';
  SConvIllegalFamily = '������������ ���������';
  SConvFactorZero = '%s ����� ������� ���������';
{$ENDIF}

  SShortMonthNameJan = '���';
  SShortMonthNameFeb = '���';
  SShortMonthNameMar = '���';
  SShortMonthNameApr = '���';
  SShortMonthNameMay = '���';
  SShortMonthNameJun = '���';
  SShortMonthNameJul = '���';
  SShortMonthNameAug = '���';
  SShortMonthNameSep = '���';
  SShortMonthNameOct = '���';
  SShortMonthNameNov = '���';
  SShortMonthNameDec = '���';

  SLongMonthNameJan = '������';
  SLongMonthNameFeb = '�������';
  SLongMonthNameMar = '����';
  SLongMonthNameApr = '������';
  SLongMonthNameMay = '���';
  SLongMonthNameJun = '����';
  SLongMonthNameJul = '����';
  SLongMonthNameAug = '������';
  SLongMonthNameSep = '��������';
  SLongMonthNameOct = '�������';
  SLongMonthNameNov = '������';
  SLongMonthNameDec = '�������';

  SShortDayNameSun = '���';
  SShortDayNameMon = '���';
  SShortDayNameTue = '���';
  SShortDayNameWed = '���';
  SShortDayNameThu = '���';
  SShortDayNameFri = '���';
  SShortDayNameSat = '���';

  SLongDayNameSun = '�����������';
  SLongDayNameMon = '�����������';
  SLongDayNameTue = '�������';
  SLongDayNameWed = '�����';
  SLongDayNameThu = '�������';
  SLongDayNameFri = '�������';
  SLongDayNameSat = '�������';

{$IFDEF D6_}
 {$IFDEF LINUX}
  SEraEntries = '';
 {$ENDIF}

  SCannotCreateDir = '���������� ������� �������';
  {$IFDEF VER150}
  SCodesetConversionError = '������ �������������� codeset';
  {$ENDIF}
{$ENDIF}

implementation

end.
