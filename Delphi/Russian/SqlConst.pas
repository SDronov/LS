{ *************************************************************************** }
{                                                                             }
{ Kylix and Delphi Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 1997, 2001 Borland Software Corporation                       }
{                                                                             }
{  �����������: 2001-02 Polaris Software                                      }
{               http://polesoft.da.ru                                         }
{ *************************************************************************** }


unit SqlConst;

interface

const
  DRIVERS_KEY = 'Installed Drivers';            { Do not localize }
  CONNECTIONS_KEY = 'Installed Connections';    { Do not localize }
  DRIVERNAME_KEY = 'DriverName';                { Do not localize }
  HOSTNAME_KEY = 'HostName';                    { Do not localize }
  ROLENAME_KEY = 'RoleName';                    { Do not localize }
  DATABASENAME_KEY = 'Database';                { Do not localize }
  MAXBLOBSIZE_KEY = 'BlobSize';                 { Do not localize }          
  VENDORLIB_KEY = 'VendorLib';                  { Do not localize }
  DLLLIB_KEY = 'LibraryName';                   { Do not localize }
  GETDRIVERFUNC_KEY = 'GetDriverFunc';          { Do not localize }
  AUTOCOMMIT_KEY = 'AutoCommit';                { Do not localize }
  BLOCKINGMODE_KEY = 'BlockingMode';            { Do not localize }
  WAITONLOCKS_KEY= 'WaitOnLocks';               { Do not localize }
  COMMITRETAIN_KEY = 'CommitRetain';            { Do not localize }
  TRANSISOLATION_KEY = '%s TransIsolation';     { Do not localize }
  SQLDIALECT_KEY = 'SqlDialect';                { Do not localize }
  SQLLOCALE_CODE_KEY = 'LocaleCode';            { Do not localize }
  ERROR_RESOURCE_KEY = 'ErrorResourceFile';     { Do not localize }
  SQLSERVER_CHARSET_KEY = 'ServerCharSet';      { Do not localize }
  SREADCOMMITTED = 'readcommited';              { Do not localize }
  SREPEATREAD = 'repeatableread';               { Do not localize }
  SDIRTYREAD = 'dirtyread';                     { Do not localize }
  SDRIVERREG_SETTING = 'Driver Registry File';           { Do not localize }
  SCONNECTIONREG_SETTING = 'Connection Registry File';   { Do not localize }
  szUSERNAME         = 'USER_NAME';             { Do not localize }
  szPASSWORD         = 'PASSWORD';              { Do not localize }
  SLocaleCode        = 'LCID';                  { Do not localize }
  ROWSETSIZE_KEY     = 'RowsetSize';            { Do not localize }
{$IFNDEF VER140}
  OSAUTHENTICATION   = 'OS Authentication';     { Do not localize }
  SERVERPORT         = 'Server Port';           { Do not localize }
  MULTITRANSENABLED  = 'Multiple Transaction';  { Do not localize }
  TRIMCHAR           = 'Trim Char';             { Do not localize }
  CUSTOM_INFO        = 'Custom String';         { Do not localize }
  CONN_TIMEOUT       = 'Connection Timeout';    { Do not localize }
{$ELSE}
  OSAUTHENTICATION   = 'Os Authentication';     { Do not localize }
{$ENDIF}
{$IFDEF MSWINDOWS}
  SDriverConfigFile = 'dbxdrivers.ini';            { Do not localize }
  SConnectionConfigFile = 'dbxconnections.ini';    { Do not localize }
  SDBEXPRESSREG_SETTING = '\Software\Borland\DBExpress'; { Do not localize }
{$ENDIF}
{$IFDEF LINUX}
  SDBEXPRESSREG_USERPATH = '/.borland/';          { Do not localize }
  SDBEXPRESSREG_GLOBALPATH = '/usr/local/etc/';   { Do not localize }
  SDriverConfigFile = 'dbxdrivers';                  { Do not localize }
  SConnectionConfigFile = 'dbxconnections';          { Do not localize }
  SConfExtension = '.conf';                       { Do not localize }
{$ENDIF}

resourcestring
  SLoginError = '�� ���� �������������� � ���� ������ ''%s''';
  SMonitorActive = '�� ���� �������� ���������� � Active Monitor';
  SMissingConnection = '����������� �������� SQLConnection';
  SDatabaseOpen = '�� ���� ��������� ��� �������� ��� �������� ����������';
  SDatabaseClosed = '�� ���� ��������� ��� �������� ��� �������� ����������';
  SMissingSQLConnection = '�������� SQLConnection ��������� ��� ���� ��������';
  SConnectionNameMissing = '����������� ��� ����������';
  SEmptySQLStatement = '��� ��������� SQL ������';
  SNoParameterValue = '��� �������� ��� ��������� ''%s''';
  SNoParameterType = '��� ���� ��� ��������� ''%s''';
  SParameterTypes = ';Input;Output;Input/Output;Result';
  SDataTypes = ';String;SmallInt;Integer;Word;Boolean;Float;Currency;BCD;Date;Time;DateTime;;;;Blob;Memo;Graphic;;;;;Cursor;';
  SResultName = 'Result';
  SNoTableName = '����������� �������� TableName';
  SNoSqlStatement = '����������� ������, ��� ������� ��� ��� ���������';
  SNoDataSetField = '����������� �������� DataSetField';
  SNoCachedUpdates = '�� � ������ cached update';
  SMissingDataBaseName = '����������� �������� Database';
  SMissingDataSet = '����������� �������� DataSet';
  SMissingDriverName = '����������� �������� DriverName';
  SPrepareError = '�� ���� ��������� ������';
  SObjectNameError = '�������/��������� �� �������';
  SSQLDataSetOpen = '�� ���� ���������� ����� ����� ��� %s';
  SNoActiveTrans = '��� �������� ����������';
  SActiveTrans = '���������� ��� �������';
  SDllLoadError = '�� ���� ��������� %s';
  SDllProcLoadError = '�� ���� ����� ��������� %s';
  SConnectionEditor = '&�������� �������� ����������';
  SCommandTextEditor = '&�������� CommandText';
  SMissingDLLName = '��� DLL/Shared Library �� �����������';
  SMissingDriverRegFile = '���� ����������� ��������/���������� ''%s'' �� ������';
  STableNameNotFound = '�� ���� ����� TableName � CommandText';
  SNoCursor = '������ �� ��������� �� �������';
  SMetaDataOpenError = '�� ���� ������� Metadata';
  SErrorMappingError = '������ SQL: Error mapping failed';
  SStoredProcsNotSupported = '�������� ��������� �� �������������� ''%s'' Server';
  SPackagesNotSupported = '������ �� �������������� ''%s'' ��������';
  SDBXUNKNOWNERROR = '������ DBX: No Mapping for Error Code Found';
  SDBXNOCONNECTION = '������ DBX: ���������� �� �������, ��������� �� ������ �� ����� ���� ��������';
  SDBXNOMETAOBJECT = '������ DBX: MetadataObject �� ������, ��������� �� ������ �� ����� ���� ��������';
  SDBXNOCOMMAND = '������ DBX: ���������� �� �������, ��������� �� ������ �� ����� ���� ��������';
  SDBXNOCURSOR = '������ DBX: ���������� �� �������, ��������� �� ������ �� ����� ���� ��������';
{$IFNDEF VER140}
  SNOMEMORY = '������ dbExpress: �� ������� ������ ��� ��������';
  SINVALIDFLDTYPE = '������ dbExpress: �������� ��� ����';
  SINVALIDHNDL = '������ dbExpress: �������� ����������';
  SINVALIDTIME = '������ dbExpress: �������� �����';
  SNOTSUPPORTED = '������ dbExpress: �������� �� ��������������';
  SINVALIDXLATION = '������ dbExpress: �������� �������������� ������';
  SINVALIDPARAM = '������ dbExpress: �������� ��������';
  SOUTOFRANGE = '������ dbExpress: ��������/������� ����� �� �������';
  SSQLPARAMNOTSET = '������ dbExpress: �������� �� ����������';
  SEOF = '������ dbExpress: ��������� ��������� � EOF';
  SINVALIDUSRPASS = '������ dbExpress: �������� ���/������';
  SINVALIDPRECISION = '������ dbExpress: �������� ��������';
  SINVALIDLEN = '������ dbExpress Error: �������� �����';
  SINVALIDXISOLEVEL = '������ dbExpress: �������� ������� �������� ����������';
  SINVALIDTXNID = '������ dbExpress: �������� ID ����������';
  SDUPLICATETXNID = '������ dbExpress: �������� ID ����������';
  SDRIVERRESTRICTED = '������ dbExpress: ���������� �� ������������� ��� ������������� ���� �����������';
  SLOCALTRANSACTIVE = '������ dbExpress: ��������� ���������� ��� �������';
  SMULTIPLETRANSNOTENABLED = '������ dbExpress: ��������� ���������� �� ��������';
{$ELSE}
  SNOMEMORY = '������ DBX: �� ������� ������ ��� ��������';
  SINVALIDFLDTYPE = '������ DBX: �������� ��� ����';
  SINVALIDHNDL = '������ DBX: �������� ����������';
  SINVALIDTIME = '������ DBX: �������� �����';
  SNOTSUPPORTED = '������ DBX: �������� �� ��������������';
  SINVALIDXLATION = '������ DBX: �������� ��������������';
  SINVALIDPARAM = '������ DBX: �������� ��������';
  SOUTOFRANGE = '������ DBX: �������� ����� �� �������';
  SSQLPARAMNOTSET = '������ DBX: �������� �� ����������';
  SEOF = '������ DBX: ��������� ��������� � EOF';
  SINVALIDUSRPASS = '������ DBX: �������� ���/������';
  SINVALIDPRECISION = '������ DBX: �������� ��������';
  SINVALIDLEN = '������ DBX: �������� �����';
  SINVALIDXISOLEVEL = '������ DBX: �������� ������� �������� ����������';
  SINVALIDTXNID = '������ DBX: �������� ID ����������';
  SDUPLICATETXNID = '������ DBX: �������� ID ����������';
  SDRIVERRESTRICTED = 'dbExpress: ���������� �� ������������� ��� ������������� ���� �����������';
  SLOCALTRANSACTIVE = '������ DBX: ��������� ���������� ��� �������';
{$ENDIF}
  SMultiConnNotSupported = '�������������� ���������� �� �������������� ��������� %s';
  SConfFileMoveError = '�� ���� ����������� %s � %s';
  SMissingConfFile = '���� ������������ %s �� ������';
  SObjectViewNotTrue = 'ObjectView ������ ���� True ��� ������ � Object ������';
  SDriverNotInConfigFile = '������� (%s) �� ������ � ������. ����� (%s)';
  SObjectTypenameRequired = '��� ���� Object ��������� ��� �������� ���������';
  SCannotCreateFile = '�� ���� ������� ���� %s';
{$IFDEF LINUX}
  SCannotCreateParams = '��������������: ���������� �������, ��������� �� �������������';
{$ENDIF}
// used in SqlReg.pas
{$IFNDEF VER140}
  SDlgOpenCaption = '������� ���� ��������� �����������';
{$ENDIF}
{$IFDEF MSWINDOWS}
  SDlgFilterTxt = '��������� ����� (*.txt)|*.txt|��� ����� (*.*)|*.*';
{$ENDIF}
{$IFDEF LINUX}
  SDlgFilterTxt = '��������� ����� (*.txt)|��� ����� (*)';
{$ENDIF}
  SLogFileFilter = '����� ��������� (*.log)';
{$IFNDEF VER140}
  SCircularProvider = '����������� ������ ����������� �� �����������.';
{$ENDIF}

const

{$IFNDEF VER140}
  DbxError : array[0..19] of String = ( '', SNOMEMORY, SINVALIDFLDTYPE,
{$ELSE}
  DbxError : array[0..18] of String = ( '', SNOMEMORY, SINVALIDFLDTYPE,
{$ENDIF}
                SINVALIDHNDL, SINVALIDTIME,
                SNOTSUPPORTED, SINVALIDXLATION, SINVALIDPARAM, SOUTOFRANGE,
                SSQLPARAMNOTSET, SEOF, SINVALIDUSRPASS, SINVALIDPRECISION,
                SINVALIDLEN, SINVALIDXISOLEVEL, SINVALIDTXNID, SDUPLICATETXNID,
{$IFNDEF VER140}
                SDRIVERRESTRICTED, SLOCALTRANSACTIVE, SMULTIPLETRANSNOTENABLED );
{$ELSE}
                SDRIVERRESTRICTED, SLOCALTRANSACTIVE );
{$ENDIF}

implementation

end.
