{*************************************************************}
{                                                             }
{       Borland Delphi Visual Component Library               }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2002 Borland Software Corporation  }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{                                                             }
{  �����������: 1999-2002 Polaris Software                    }
{               http://polesoft.da.ru                         }
{*************************************************************}

unit IBXConst;

interface

uses IBUtils;

const
{$IFDEF VER150}
  IBX_Version = 7.05;
{$ELSE}
  {$IFDEF VER140}
  IBX_Version = 6.05;
  {$ELSE}
  IBX_Version = 5.05;
  {$ENDIF}
{$ENDIF}

resourcestring
{ generic strings used in code }
  SIBDatabaseEditor = '�������� &��...';
  SIBTransactionEditor = '�������� &����������...';
  SDatabaseFilter = '����� �� (*.gdb)|*.gdb|��� ����� (*.*)|*.*';
  SDisconnectDatabase = '���� �������� ���������� � ����� ������. �������� ���������� � ����������?';
  SCommitTransaction = '���������� �������. �������� �� � ����������?';
  SExecute = '&���������';
  SNoDataSet = '��� ������ �� ����� ������ (dataset)';
  SSQLGenSelect = '���������� ������� ���� �� ���� �������� � ���� ���������� ����';
  SSQLNotGenerated = '������� Update SQL �� �������������, �����?';
  SIBUpdateSQLEditor = '�������� &UpdateSQL...';
  SIBDataSetEditor = '&�������� ������ ������...';
  SSQLDataSetOpen = '�� ���� ���������� ����� ����� ��� %s';
  SDefaultTransaction = '%s, �� ���������';

{ strings used in error messages}
  SUnknownError = '����������� ������';
{$IFNDEF VER130}
 {$IFDEF MSWINDOWS}
  SInterBaseMissing = '���������� InterBase gds32.dll �� �������. ����������, ���������� InterBase ��� ������������� ���� �����������';
 {$ENDIF}
 {$IFDEF LINUX}
  SInterBaseMissing = '���������� InterBase gds.so.0 �� �������. ����������, ���������� InterBase ��� ������������� ���� �����������';
 {$ENDIF}
{$ELSE}
  SInterBaseMissing = '���������� InterBase gds32.dll �� �������. ����������, ���������� InterBase ��� ������������� ���� �����������';
{$ENDIF}
  SInterBaseInstallMissing = '���������� ��������� InterBase ibinstall.dll �� �������. ����������, ���������� InterBase 6 ��� ������������� ���� �����������';
  SIB60feature = '%s - ��� ������� InterBase6. ����������, �������� �� InterBase6 ��� ������������� ���� �����������';
  SNotSupported = '���������������� �����������';
  SNotPermitted = '�� ���������';
  SFileAccessError = '������ ������� � ���������� �����';
  SConnectionTimeout = '������� ����� ���������� � ���� ������';
  SCannotSetDatabase = '�� ���� ���������� ���� ������';
  SCannotSetTransaction = '�� ���� ���������� ����������';
  SOperationCancelled = '�������� �������� �� ������� ������������';
  SDPBConstantNotSupported = 'DPB ��������� (isc_dpb_%s) �� ��������������';
  SDPBConstantUnknown = 'DPB ��������� (%d) ����������';
  STPBConstantNotSupported = 'TPB ��������� (isc_tpb_%s) �� ��������������';
  STPBConstantUnknown = 'TPB ��������� (%d) ����������';
  SDatabaseClosed = '�� ���� ��������� �������� -- �� �� �������';
  SDatabaseOpen = '�� ���� ��������� �������� -- �� �������';
  SDatabaseNameMissing = '�� ������� ��� ���� ������';
  SNotInTransaction = '���������� �� �������';
  SInTransaction = '���������� �������';
  STimeoutNegative = '�������� �������� �� ����� ���� ��������������';
  SNoDatabasesInTransaction = '��� ��� ������ � ������ transaction ����������';
  SUpdateWrongDB = '��������� �������� ���� ������';
  SUpdateWrongTR = '��������� �������� ����������. � ������ ��������� ���������� ����������';
  SDatabaseNotAssigned = '���� ������ �� ����������';
  STransactionNotAssigned = '���������� �� ����������';
  SXSQLDAIndexOutOfRange = '������ XSQLDA ����� �� �������';
  SXSQLDANameDoesNotExist = '��� XSQLDA �� ������� (%s)';
  SEOF = '����� �����';
  SBOF = '������ �����';
  SInvalidStatementHandle = '�������� ���������� �������';
  SSQLOpen = 'IBSQL ������';
  SSQLClosed = 'IBSQL ������';
  SDatasetOpen = '����� ������ (Dataset) ������';
  SDatasetClosed = '����� ������ (Dataset) ������';
  SUnknownSQLDataType = '�������� ��� ������ SQL (%d)';
  SInvalidColumnIndex = '�������� ������ ������� (������ �������� ����������� ��������)';
  SInvalidParamColumnIndex = '�������� ������ ��������� (������ �������� ����������� ��������)';
  SInvalidDataConversion = '�������� �������������� ������';
  SColumnIsNotNullable = '������� �� ����� ���� ����������� � NULL (%s)';
  SBlobCannotBeRead = '�� ���� ��������� �� Blob stream';
  SBlobCannotBeWritten = '�� ���� �������� � Blob stream';
  SEmptyQuery = '������ ������';
  SCannotOpenNonSQLSelect = '�� ���� ��������� Open ��� �� SELECT �������. ����������� ExecQuery';
  SNoFieldAccess = '��� ������� � ���� "%s"';
  SFieldReadOnly = '���� "%s" ������ ��� ������';
  SFieldNotFound = '���� "%s" �� �������';
  SNotEditing = '�� ��������������';
  SCannotInsert = '�� ���� �������� ������ � ����� ������ (dataset). (��� insert �������)';
  SCannotPost = '�� ���� ��������� (post). (��� update/insert �������)';
  SCannotUpdate = '�� ���� �������� (update). (��� update �������)';
  SCannotDelete = '�� ���� ������� �� ������ ������ (dataset). (��� delete �������)';
  SCannotRefresh = '�� ���� �������� ������. (��� refresh �������)';
  SBufferNotSet = '����� �� ����������';
  SCircularReference = '����������� ������ �� ���������';
  SSQLParseError = '������ ��������������� ������� SQL:' + CRLF + CRLF + '%s';
  SUserAbort = '�������� �������������';
  SDataSetUniDirectional = '���������������� ����� ������ (Data set)';
  SCannotCreateSharedResource = '�� ���� ������� ����������� ������. (������ Windows %d)';
  SWindowsAPIError = '������ Windows API. (������ Windows %d [$%.8x])';
  SColumnListsDontMatch = '������ ������� �� ���������';
  SColumnTypesDontMatch = '���� ������� �� ���������. (� ������� %d �� %d)';
  SCantEndSharedTransaction = '�� ���� ��������� ����� (shared) ���������� ����� �������, ����� ��� ������������� ��������� and equal ' +
                             'TimeoutAction ����������';
  SFieldUnsupportedType = '���������������� ��� ����';
  SCircularDataLink = '����������� DataLink ������';
  SEmptySQLStatement = '������ SQL �������';
  SIsASelectStatement = '����������� Open ��� Select �������';
  SRequiredParamNotSet = '��������� �������� Param �� �����������';
  SNoStoredProcName = '�� ���������� ��� �������� ���������';
  SIsAExecuteProcedure = '����������� ExecProc ��� ��������; ����������� TQuery ��� Select ��������';
  SUpdateFailed = '������ ��� ��������� (Update)';
  SNotCachedUpdates = 'CachedUpdates �� ���������';
  SNotLiveRequest = '������ ������ �� ��� ��������� (not live) - �� ���� ��������';
  SNoProvider = '��� ����������';
  SNoRecordsAffected = '�� ����� ������ �� ����������';
  SNoTableName = '�� ���������� ��� �������';
  SCannotCreatePrimaryIndex = '�� ���� ������� Primary ������; ������ �������������';
  SCannotDropSystemIndex = '�� ���� ������� System ������';
  STableNameMismatch = '�� ��������� ��� �������';
  SIndexFieldMissing = '�� ������� ��������� ����';
  SInvalidCancellation = '�� ���� �������� ������� �� ����� ���������';
  SInvalidEvent = '�������� �������';
  SMaximumEvents = '��������� ������������ ������ ��� �������';
  SNoEventsRegistered = '��� ������������������ �������';
  SInvalidQueueing = '�������� ����������� ��������';
  SInvalidRegistration = '�������� �����������';
  SInvalidBatchMove = '�������� �������� ����������� (batch move)';
  SSQLDialectInvalid = '�������� ������� SQL';
  SSPBConstantNotSupported = 'SPB ��������� �� ��������������';
  SSPBConstantUnknown = 'SPB ��������� ����������';
  SServiceActive = '�� ���� ��������� �������� -- ������ �� ����������';
  SServiceInActive = '�� ���� ��������� �������� -- ������ ����������';
  SServerNameMissing = '��� ������� �� �������';
  SQueryParamsError = '��������� ������� �� ������� ��� ��������';
  SStartParamsError = 'Start ��������� �� ������� ��� ��������';
  SOutputParsingError = '����������� �������� ������ ������';
  SUseSpecificProcedures = 'Generic ServiceStart �� ��������: ����������� Specific Procedures ��� ��������� ���������� ������������';
  SSQLMonitorAlreadyPresent = 'SQL Monitor ��� �������';
  SCantPrintValue = '�� ���� ���������� ��������';
  SEOFReached = 'SEOFReached';
  SEOFInComment = '��������� EOF � �����������';
  SEOFInString = '��������� EOF � ������';
  SParamNameExpected = '��� ��������� ���������';
  SSuccess = '�������� ����������';
  SDelphiException = 'DelphiException %s';
  SNoOptionsSet = '�� ������� Install Options';
  SNoDestinationDirectory = 'DestinationDirectory �� �����������';
  SNosourceDirectory = 'SourceDirectory �� �����������';
  SNoUninstallFile = 'Uninstall File Name �� �����������';
  SOptionNeedsClient = '���������� %s ��������� ������ ��� ���������� ������';
  SOptionNeedsServer = '���������� %s ��������� ������ ��� ���������� ������';
  SInvalidOption = '���������� �������� �����';
  SInvalidOnErrorResult = 'onError ��������� ����������� ��������';
  SInvalidOnStatusResult = 'onStatus ��������� ����������� ��������';

  SInterbaseExpressVersion = 'InterbaseExpress 4.3';
  SEditSQL = '�������� SQL';
  SDPBConstantUnknownEx = 'DPB ��������� (%s) �� ��������';
  STPBConstantUnknownEx = 'TPB ��������� (%s) �� ��������';
  SInterbaseExpressVersionEx = 'InterbaseExpress %g';
  SUnknownPlan = '����������� ������ - �� ���� �������� ����';
  SFieldSizeMismatch = '������������ ������� - ����� ���� %s ������� ���� ��� ������';
  SEventAlreadyRegistered   = '������� ��� ����������������';
  SStringTooLarge = '������� ��������� ������ ������ %d � ����, ������� ����� ��������� ������ %d';
  SIBServiceEditor = '&�������� ������� ...';
  SIBSuccessConnect = '�������� ����������';
  SNoTimers = '��� ��������� ��������';
  SIB65feature = '%s - ������� InterBase 6.5. ����������, �������� InterBase �� ������ 6.5 ��� ������������� ���� �����������';
  SLoginPromptFailure = '�� ���� ����� ������ ����� ����� � ������ �� ���������.  ����������, �������� DBLogDlg � ������ uses ������ ��������� �����.';
  SIBMemoryError = '������������ ������';
  SIBInvalidStatement = '�������� �������';
  SIBInvalidComment = '�������� �����������';
  SIBBrokerOpen = '  �������� ���������� ';
  SIBBrokerVersion = '������ IBConnectionBroker ������ 1.0.1:';
  SIBBrokerDatabase = '��� ���� ������ = ';
  SIBBrokerUser = '��� ������������ = ';
  SIBBrokerMinConnections = 'Min ���������� = ';
  SIBBrokerMaxConnections = 'Max ���������� = ';
  SIBBrokerIdleTimer = 'IdleTimer = ';
  SIBBrokerGiveOut = 'gave out connection ';
  SIBBrokerUnavailable = '�� ���� ������� ����� ����������: ';
  SIBBrokerExhausted = '-----> ���������� ���������!  ����� ��������� � ����� �������� � ������ ';
  SIBBrokerNilError = '������� ������������ ������ (nil) ���� ������';
  SIBBrokerRelease = '�������� ���������� ';
  SIBDatabaseINISection = '��������� ���� ������';
  SIBDatabaseINISectionEmpty = '��� ������ �� ����� ���� ������';
  SIB70feature = '%s - ��� ������� InterBase 7.0. ����������, �������� �� InterBase 7.0 ��� ������������� ���� �����������';

implementation

end.
 