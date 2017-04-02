{********************************************************}
{                                                        }
{       Borland Delphi Visual Component Library          }
{                                                        }
{       Copyright (c) 1995,99 Inprise Corporation        }
{                                                        }
{  �����������: 1998-2002 Polaris Software               }
{               http://polesoft.da.ru                    }
{********************************************************}

unit BdeConst;

interface

{$IFDEF VER130}
  {$DEFINE D5_}
{$ENDIF}
{$IFDEF VER140}
  {$DEFINE D5_}
{$ENDIF}
{$IFDEF VER150}
  {$DEFINE D5_}
{$ENDIF}

resourcestring
{$IFNDEF VER100}
  SAutoSessionExclusive = '�� ���� �������� �������� AutoSessionName ��� ����� ��� ����� ������ � ����� ��� ������ ������';
  SAutoSessionExists = '�� ���� �������� ������ � ����� ��� ������ ������, ����� ��� ������ ''%s'' �������� AutoSessionName';
  SAutoSessionActive = '�� ���� �������� SessionName, ���� AutoSessionName ��������';
{$ENDIF}
  SDuplicateDatabaseName = '�������� ����� ���� ������ ''%s''';
  SDuplicateSessionName = '�������� ����� ������ ''%s''';
  SInvalidSessionName = '�������� ��� ������ %s';
  SDatabaseNameMissing = '����������� ��� ���� ������';
  SSessionNameMissing = '����������� ��� ������';
  SDatabaseOpen = '�� ���� ��������� ��� �������� ��� �������� ���� ������';
  SDatabaseClosed = '�� ���� ��������� ��� �������� ��� �������� ���� ������';
  SDatabaseHandleSet = '������������ ���� ������ ������� ������ ������';
  SSessionActive = '�� ���� ��������� ��� �������� ��� �������� ������';
  SHandleError = '������ �������� �������';
  SInvalidFloatField = '�� ���� ������������� ���� ''%s'' � ������� ��������';
  SInvalidIntegerField = '�� ���� ������������� ���� ''%s'' � ����� ��������';
  STableMismatch = '�������-�������� � �������� ������������';
  SFieldAssignError = '���� ''%s'' � ''%s'' �� ���������� ��� ������������';
  SNoReferenceTableName = 'ReferenceTableName �� ���������� ��� ''%s''';
{$IFDEF VER100}
  SFieldUndefinedType = '��� ���� ''%s'' ����������';
  SFieldUnsupportedType = '��� ���� ''%s'' �� ��������������';
{$ENDIF}
  SCompositeIndexError = '�� ���� ������������ ������ �������� ����� � ���������-�����������';
  SInvalidBatchMove = '�������� ��������� ��������� ����������� (batch move)';
  SEmptySQLStatement = '��� ��������� SQL ������';
  SNoParameterValue = '��� �������� ��������� ''%s''';
  SNoParameterType = '�� ����� ��� ��������� ''%s''';
{$IFDEF VER100}
  SParameterNotFound = '�������� ''%s'' �� ������';
  SParamTooBig = '�������� ''%s'', �� ���� ��������� ������ ����� ��� %d ����';
{$ENDIF}
  SLoginError = '�� ���� ������������ � ���� ������ ''%s''';
  SInitError = '������ ������������� Borland Database Engine (������ $%.4x)';
{$IFNDEF D5_}
  SDatasetDesigner = '&�������� �����...';
  SFKInternalCalc = '&InternalCalc';
{$ENDIF}
{$IFDEF VER120}
  SFKAggregate = '&Aggregate';
{$ENDIF}
  SDatabaseEditor = '�������� &��...';
  SExplore = 'E&xplore';
{$IFNDEF D5_}
  SLinkDesigner = '���� ''%s'' �� ������ Detail Fields ������ ���� �������';
{$ENDIF}
  SLinkDetail = '������� ''%s'' �� ����� ���� �������';
  SLinkMasterSource = '�������� MasterSource ''%s'' ������ ���� ������� � DataSource';
  SLinkMaster = '���������� ������� ������� �� MasterSource';
{$IFDEF VER100}
  SSQLDatasetDesigner = '�������� &�����...';
  SQBEVerb = '����������� &��������...';
{$ELSE}
  SGQEVerb = '����������� &��������...';
{$ENDIF}
  SBindVerb = '&���������� ���������...';
  SIDAPILangID = '0019';
  SDisconnectDatabase = '���� ������ ������ ������������. ������������� � ����������?';
  SBDEError = '������ BDE $%.4x';
  SLookupSourceError = '���������� ������������ ������������� DataSource � LookupSource';
  SLookupTableError = 'LookupSource ������ ����������� � ����������� TTable';
  SLookupIndexError = '%s ������ ���� lookup table''s �������� ��������';
  SParameterTypes = ';Input;Output;Input/Output;Result';
  SInvalidParamFieldType = '���������� ������� ���������� ��� ����';
  STruncationError = '�������� ''%s'' ������ ��� ������';
{$IFDEF VER100}
  SInvalidVersion = '���������� ��������� ��������� ��������';
{$ENDIF}
  SDataTypes = ';String;SmallInt;Integer;Word;Boolean;Float;Currency;BCD;Date;Time;DateTime;;;;Blob;Memo;Graphic;;;;;Cursor;';
  SResultName = 'Result';
  SDBCaption = '%s%s%s ���� ������';
  SParamEditor = '%s%s%s ���������';
{$IFNDEF D5_}
  SDatasetEditor = '%s%s%s';
{$ENDIF}
  SIndexFilesEditor = '%s%s%s ��������� �����';
  SNoIndexFiles = '(���)';
  SIndexDoesNotExist = '������ �� ����������. ������: %s';
  SNoTableName = '����������� �������� TableName';
{$IFNDEF VER100}
  SNoDataSetField = '����������� �������� DataSetField';
{$ENDIF}
  SBatchExecute = '�&��������';
  SNoCachedUpdates = '�� � ������ cached update';
  SInvalidAliasName = '�������� ��� ���������� (alias) %s';
{$IFNDEF D5_}
  SDBGridColEditor = '&�������� ��������...';
{$ENDIF}
  SNoFieldAccess = '�� ���� �������� ������ � ���� ''%s'' � �������';
  SUpdateSQLEditor = '&�������� UpdateSQL...';
{$IFNDEF VER100}
  SNoDataSet = '��� ���������� � ������� ������ (dataset)';
{$ENDIF}
  SUntitled = '��������� ��� ���������';
  SUpdateWrongDB = '�� ���� ��������, %s �� ����� ��������� %s';
  SUpdateFailed = '��������� (update) �� ���������';
  SSQLGenSelect = '����� ������� ���� �� ���� �������� ���� � ���� ���������� ����';
  SSQLNotGenerated = '������� Update SQL �� �������������, �����?';
  SSQLDataSetOpen = '���������� ���������� ����� ����� ��� %s';
  SLocalTransDirty = '������� �������� ���������� ������ ���� dirty read ��� ��������� ��';
{$IFNDEF D5_}
  SPrimary = 'Primary';
{$ENDIF}
  SMissingDataSet = '����������� �������� DataSet';
  SNoProvider = '��� ��������� �����������';
{$IFNDEF VER100}
  SNotAQuery = '����� ������ (Dataset) �� �������� ��������';
{$ENDIF}

implementation

end.
