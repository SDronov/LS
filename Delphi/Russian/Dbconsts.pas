{ *************************************************************************** }
{                                                                             }
{ Kylix and Delphi Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 1997, 2001 Borland Software Corporation                       }
{                                                                             }
{  �����������: 1998-2001 Polaris Software                                    }
{               http://polesoft.da.ru                                         }
{ *************************************************************************** }

unit DbConsts;

interface

{$IFDEF VER140}
  {$DEFINE D6_}
{$ENDIF}
{$IFDEF VER150}
  {$DEFINE D6_}
{$ENDIF}

resourcestring
  SInvalidFieldSize = '�������� ������ ����';
{$IFNDEF VER100}
  SInvalidFieldKind = '�������� FieldKind';
{$ENDIF}
  SInvalidFieldRegistration = '�������� ����������� ����';
  SUnknownFieldType = '��� ���� ''%s'' ����������';
  SFieldNameMissing = '����������� ��� ����';
  SDuplicateFieldName = '�������� ����� ���� ''%s''';
{$IFNDEF VER100}
  SFieldNotFound = '���� ''%s'' �� �������';
{$ELSE}
  SFieldNotFound = '%s: ���� ''%s'' �� �������';
{$ENDIF}
  SFieldAccessError = '�� ���� �������� ������ � ���� ''%s'' ��� ���� %s';
  SFieldValueError = '�������� �������� ��� ���� ''%s''';
  SFieldRangeError = '%g - �������� �������� ��� ���� ''%s''. ����������� �������� - �� %g �� %g';
{$IFDEF D6_}
  SBcdFieldRangeError = '%s - �������� �������� ��� ���� ''%s''. ����������� �������� - �� %s �� %s';
{$ENDIF}
  SInvalidIntegerValue = '''%s'' - �������� ����� �������� ��� ���� ''%s''';
  SInvalidBoolValue = '''%s'' - �������� ���������� �������� ��� ���� ''%s''';
  SInvalidFloatValue = '''%s'' - �������� ������� �������� ��� ���� ''%s''';
{$IFNDEF VER100}
  SFieldTypeMismatch = '�������� ��� ���� ''%s'', ���������: %s, �����������: %s';
  SFieldSizeMismatch = '�������� ������ ��� ���� ''%s'', ���������: %d, �����������: %d';
{$ELSE}
  SFieldTypeMismatch = '��� ���� ''%s'' �� ������������� ����������';
{$ENDIF}
  SInvalidVarByteArray = '�������� ���������� ��� ��� ������';
  SFieldOutOfRange = '�������� ���� ''%s'' ����� �� �������';
{$IFNDEF D6_}
  SBCDOverflow = '(������������)';
{$ENDIF}
  SFieldRequired = '���� ''%s'' ������ ����� ��������';
  SDataSetMissing = '���� ''%s'' �� ����� ������ ������ (dataset)';
  SInvalidCalcType = '���� ''%s'' �� ����� ���� ����������� ��� ��������� �����';
  SFieldReadOnly = '���� ''%s'' �� ����� ���� ��������';
  SFieldIndexError = '������ ���� ����� �� �������';
  SNoFieldIndexes = '��� ��������� �������';
  SNotIndexField = '���� ''%s'' �� ������������� � �� ����� ���� ��������';
  SIndexFieldMissing = '�� ���� �������� ������ � ���������� ���� ''%s''';
  SDuplicateIndexName = '�������� ����� ������� ''%s''';
{$IFNDEF VER100}
  SNoIndexForFields = '��� ������� ��� ����� ''%s''';
  SIndexNotFound = '������ ''%s'' �� ������';
  SDuplicateName = '�������� ����� ''%s'' � %s';
{$ELSE}
  SNoIndexForFields = '������� ''%s'' �� ����� ������� ��� ����� ''%s''';
{$ENDIF}
  SCircularDataLink = '����������� ����� ������ �� ���������';
  SLookupInfoError = '���������� ������ (lookup) ��� ���� ''%s'' - ��������';
{$IFDEF D6_}
  SNewLookupFieldCaption = '����� ��������� (lookup) ����';
{$ENDIF}
  SDataSourceChange = 'DataSource �� ����� ���� �������';
{$IFNDEF VER100}
  SNoNestedMasterSource = '��������� ������� �� ����� ����� MasterSource';
{$ENDIF}
  SDataSetOpen = '�� ���� ��������� ��� �������� ��� ��������� ������ ������ (dataset)';
  SNotEditing = '����� ������ (Dataset) �� � ������ �������������� ��� �������';
  SDataSetClosed = '�� ���� ��������� ��� �������� ��� ��������� ������ ������ (dataset)';
  SDataSetEmpty = '�� ���� ��������� ��� �������� ��� ������� ������ ������ (dataset)';
  SDataSetReadOnly = '�� ���� �������� ����� ������ "������ ��� ������" (read-only dataset)';
{$IFNDEF VER100}
  SNestedDataSetClass = '��������� ����� ������ ������ ������������� �� %s';
{$ELSE}
  SAutoSessionExclusive = '�� ���� ���������� �������� AutoSession � ����� ��� ����� ������� � ����� ��� ������ ������';
  SAutoSessionExists = '�� ���� �������� ������ � ����� ��� ������ ������, ���� ������ ''%s'' ����� ������������� AutoSession';
  SAutoSessionActive = '�� ���� �������� SessionName, ���� ����������� AutoSession';
{$ENDIF}
  SExprTermination = '��������� ������� ����������� ���������';
  SExprNameError = '������������� ��� ����';
  SExprStringError = '������������� ��������� ���������';
  SExprInvalidChar = '�������� ������ � ��������� �������: ''%s''';
  SExprNoRParen = ''')'' ���������, �� ���������� %s';
{$IFNDEF VER100}
  SExprNoRParenOrComma = ''')'' ��� '','' ���������, �� ���������� %s';
  SExprNoLParen = '''('' ���������, �� ���������� %s';
{$ENDIF}
  SExprExpected = '��������� ���������, �� ���������� %s';
  SExprBadField = '���� ''%s'' �� ����� �������������� � ��������� �������';
  SExprBadNullTest = 'NULL ��������� ������ � ''='' � ''<>''';
  SExprRangeError = '��������� ����� �� �������';
  SExprNotBoolean = '���� ''%s'' - �� ����������� ����';
  SExprIncorrect = '����������� �������������� ��������� �������';
  SExprNothing = '�����';
{$IFNDEF VER100}
  SExprTypeMis = '������������ ����� � ���������';
  SExprBadScope = '� �������� ������ ��������� ���������� �������� �� ���������� �����';
  SExprNoArith = '���������� � ��������� ������� �� ��������������';
  SExprNotAgg = '��������� �� �������� ����������';
  SExprBadConst = '��������� ��������� ���� %s';
  SExprNoAggFilter = '���������� ��������� �� �������������� � ��������';
  SExprEmptyInList = '������ IN ������� �� ����� ���� ������';
  SInvalidKeywordUse = '�������� ������������� ��������� �����';
{$ENDIF}
  STextFalse = '0';
  STextTrue = '1';
{$IFNDEF VER100}
  SParameterNotFound = '�������� ''%s'' �� ������';
  SInvalidVersion = '���������� ��������� ��������� ��������';
  SParamTooBig = '�������� ''%s'', �� ���� ��������� ������ ������� %d ����';
 {$IFNDEF VER130}
  {$IFDEF D6_}
  SBadFieldType = '��� ���� ''%s'' �� ��������������';
  {$ELSE}
  SParamBadFieldType = '��� ���� ''%s'' �� ��������������';
  {$ENDIF}
 {$ELSE}
  SBadFieldType = '��� ���� ''%s'' �� ��������������';
 {$ENDIF}
  SAggActive = '�������� �� ����� ���� ��������, ���� aggregate �������';
 {$IFNDEF VER110} // Delphi 5 and later
 {$IFNDEF VER120}
 {$IFNDEF VER125}
  SProviderSQLNotSupported = 'SQL �� ��������������: %s';
  SProviderExecuteNotSupported = '���������� �� ��������������: %s';
  SExprNoAggOnCalcs = '������������ ���� ''%s'' ��������� ���� ������������ ���� � aggregate, ����������� internalcalc';
  SRecordChanged = '������ �������� ������ �������������';
  {$IFDEF D6_}
  SDataSetUnidirectional = '�������� �� ����������� �� ���������������� ������ ������ (dataset)';
  SUnassignedVar = 'Unassigned �������� ��������';
  SRecordNotFound = '������ �� �������';
  SFileNameBlank = '�������� FileName �� ����� ���� ������';
  {$IFNDEF VER140}
  SFieldNameTooLarge = '��� ���� %s ��������� %d ��������';
  {$ENDIF}
  {$ENDIF}
 {$ENDIF}
 {$ENDIF}
 {$ENDIF}
{$ENDIF}  // IFNDEF VER100

{$IFDEF VER100}
  { DBClient }
  SNoDataProvider = '�������� ����� � ����������� ��� ����� ������';
  SInvalidDataPacket = '�������� ����� ������';
  SRefreshError = '���������� ��������� ��������� ����� ����������� ������';
  SExportProvider = '������� %s �� ������ ������';
  SProviderInvalid = '�������� ���������. ��������� ������ �������� ����������';
  SClientDSAssignData = 'Assign Local &Data...';
  SLoadFromFile = '&��������� �� �����...';
  SSaveToFile = '��������� � &����...';
  SClientDSClearData = '&�������� ������';
  SClientDataSetEditor = '%s.%s Data';
  SClientDataFilter = 'Client DataSet (*.cds)|*.cds|��� ����� (*.*)|*.*';
  SInvalidProviderName = '��������� �� ��������� ��������';
  SServerNameBlank = '�� ���� ������������, %s ������ ��������� ���������� ServerName ��� ServerGUID';
{$ENDIF}

{$IFNDEF D6_}
  { DBCtrls }
  SFirstRecord = '������ ������';
  SPriorRecord = '���������� ������';
  SNextRecord = '��������� ������';
  SLastRecord = '��������� ������';
  SInsertRecord = '�������� ������';
  SDeleteRecord = '������� ������';
  SEditRecord = '�������� ������';
  SPostEdit = '��������� ���������';
  SCancelEdit = '�������� ���������';
  SRefreshRecord = '�������� ������';
  SDeleteRecordQuestion = '������� ������?';
  SDeleteMultipleRecordsQuestion = '������� ��� ��������� ������?';
  SRecordNotFound = '������ �� �������';
  SDataSourceFixed = '�������� �� ��������� � DBCtrlGrid';
  SNotReplicatable = '���� ������� �� ����� �������������� � DBCtrlGrid';
  SPropDefByLookup = '�������� ��� ���������� ��������� (lookup) �����';
  STooManyColumns = '������� (Grid) �� ����� ��������� ����� 256 �������';
{$ENDIF}

{$IFNDEF VER100}
 {$IFDEF D6_}
  { For FMTBcd }

  SBcdOverflow = '������������ BCD';
  SInvalidBcdValue = '%s - �������� BCD ��������';
  SInvalidFormatType = '�������� ��� ������� ��� BCD';

  { For SqlTimSt }

  SCouldNotParseTimeStamp = '�� ���� ��������� SQL TimeStamp ������';
  SInvalidSqlTimeStamp = '�������� �������� SQL ����/�������';

  SDeleteRecordQuestion = '������� ������?';
  SDeleteMultipleRecordsQuestion = '������� ��� ��������� ������?';
  STooManyColumns = '������� (Grid) �� ����� ��������� ����� 256 �������';

  {$IFNDEF VER140}
  { For reconcile error }
  SSkip = '����������';
  SAbort = '��������';
  SMerge = '����������';
  SCorrect = 'Correct';
  SCancel  = '������';
  SRefresh = '��������';
  SModified = '��������';
  SInserted = '���������';
  SDeleted  = '�������';
  SCaption = '������ ��������� - %s';
  SUnchanged = '<�� ��������>';  
  SBinary = '(��������)';                              
  SAdt = '(ADT)';   
  SArray = '(������)'; 
  SFieldName = '��� ����'; 
  SOriginal = '�������� ��������'; 
  SConflict = '������������� ��������';  
  SValue = ' ��������';   
  SNoData = '<��� �������>';
  SNew = '���.';    
  {$ENDIF}
 {$ELSE}

  { DBLogDlg }
  SRemoteLogin = 'Remote Login';

  { DBOleEdt }
  SDataBindings = '�������� ������...';
 {$ENDIF}

{$ELSE}
  { MIDASCon }
  SSocketReadError = '������ ������ �� socket';
  SSocketWriteError = '������ ������ � socket';
  SBadVariantType = '���������������� ���������� ���: %s';
  SInvalidAction = '��������� �������� ��������';
  SConnectionLost = '���������� ��������';
  SComputerNameRequired = '��������� ComputerName';

  { ScktSrvr }
  SErrChangePort = '�� ���� �������� ����, ���� ���� �������� ����������';
  SErrClose = '�� ���� �����, ���� ���� �������� ����������';
  SButtonApply = '���������';
  SButtonExit = '�����';
{$ENDIF}

implementation

end.
