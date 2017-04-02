{ *************************************************************************** }
{                                                                             }
{ Kylix and Delphi Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 1997, 2001 Borland Software Corporation                       }
{                                                                             }
{  �����������: 1998-2003 Polaris Software                                    }
{               http://polesoft.da.ru                                         }
{ *************************************************************************** }

unit MidConst;

interface

{$IFNDEF VER120} // Delphi 5 � ����
{$IFNDEF VER125}
  {$DEFINE D5_}
{$ENDIF}
{$ENDIF}

{$IFDEF VER140}
  {$DEFINE D6_}
{$ENDIF}
{$IFDEF VER150}
  {$DEFINE D6_}
{$ENDIF}

{$IFDEF D5_}
const
{ Do not localize }
  {$IFDEF D6_}
  MIDAS_CatDesc = 'Borland DataSnap Application Servers';
  {$ELSE}
  MIDAS_CatDesc = 'Borland MIDAS Application Servers';
  {$ENDIF}
  CATID_MIDASAppServer: TGUID = '{13E85B3C-9508-11D2-AB63-00C04FA35CFA}';
  {$IFDEF D6_}
  MIDASInterceptor_CatDesc = 'Borland DataSnap Application Servers';
  CATID_MIDASInterceptor: TGUID = '{6BFD12F2-7004-11D4-BE3C-0001023E6E0F}';
  SCatImplBaseKey = '%s\Implemented Categories';
  {$ELSE}
  SCatImplBaseKey = 'CLSID\%s\Implemented Categories';
  {$ENDIF}
  SCatImplKey = SCatImplBaseKey + '\%s';
  MIDAS_DLL = 'MIDAS.DLL';
  SClsid = 'CLSID\';
  SPooled = 'Pooled';
  SMaxObjects = 'MaxObjects';
  STimeout = 'Timeout';
  SSingleton = 'Singleton';
  SSockets = 'Sockets';
  SWeb = 'Web';
  SFlagOn = '1';
  SFlagOff = '0';
 {$IFDEF D6_}
  MINDATAPACKETSIZE = 8;
  {$IFNDEF VER140}
{$IFDEF LINUX}
  SMidasLib = 'libmidas.so.1';
{$ENDIF}
{$IFDEF MSWINDOWS}
  SMidasLib = 'midas.dll';
{$ENDIF}
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

resourcestring
  { App Server }
{$IFDEF D5_}
  SProviderNotExported = '��������� �� �������������: %s';
{$ENDIF}

  { DBClient }
  SNoDataProvider = '������� ��������� ������ ��� ����� ������';
  SInvalidDataPacket = '�������� ����� ������';
  SRefreshError = '���������� ��������� ��������� ����� ����������� ������';
  SProviderInvalid = '�������� ���������. ��������� ��� ���������� �������� ����������';
  SServerNameBlank = '�� ���� �����������, %s ������ ��������� ���������� ServerName ��� ServerGUID';
  SRepositoryIdBlank = '�� ���� �����������, %s ������ ��������� ���������� repository id';
  SAggsGroupingLevel = '������� ����������� �������� ������� ���������� ����� �������';
  SAggsNoSuchLevel = '������� ����������� �� ���������';
  SNoCircularReference = '����������� ������ ����������� �� �����������';
{$IFDEF D5_}
  SErrorLoadingMidas = '������ �������� MIDAS.DLL';
  SCannotCreateDataSet = '���� �� ����������.  �� ���� ������� ����� ������ (dataset)';
 {$IFDEF VER140}
  SFieldNameTooLarge = 'Fieldname %s ��������� %d ��������';
 {$ENDIF}
 {$IFDEF D6_}
  SInvalidClone = '�������� CloneConnection: ��������� ������� ClientDataSet';
 {$ENDIF}
 {$IFNDEF VER140}
  SCDSDlgOpenCaption = '������� ������� MyBase';
  SNoConnectToBroker = '���������� � TConnectionBroker �� ���������';
 {$ENDIF}
{$ENDIF}

  { MConnect }
  SSocketReadError = '������ ������ �� socket';
  SInvalidProviderName = '��� ���������� "%s" �� ���������� ��������';
  SBadVariantType = '���������������� ���������� ���: %s';
  SInvalidAction = '��������� �������� �������� (action): %d';
{$IFDEF D6_}
  SNoParentConnection = 'ParentConnection �� ���������';
  SBlankChildName = 'ChildName �� ����� ���� ������';
{$ENDIF}

  { Resolver }
  SInvalidResponse = '�������� �����';
{$IFNDEF D5_}
  SRecordChanged = '������ �������� ������ �������������';
{$ENDIF}
  SRecordNotFound = '������ �� �������';
  STooManyRecordsModified = '��������� (Update) ����������� ����� 1 ������.';

  { Provider }
  SInvalidOptParamType = '�������� �� ����� ���� ��������� � �������������� ��������';
  SMissingDataSet = '�������� �������� DataSet';
  SConstraintFailed = '������� �� ������ ��� ���� (constraint) �� �����������.';
  SField = 'Field';
  SReadOnlyProvider = '�� ���� ��������� ��������� ��� ReadOnly ����������';
  SNoKeySpecified = '�� ���� ����� ������.  �� ��������� ����';
  SFieldNameTooLong = '��� ���� �� ����� ���� ������� ��� %d ��������.  ����������� ' +
                      '���������� ObjectView � True � dataset';
  SNoDataSets = '�� ���� ���������� ����� ������, ����� ������������ ��������� ������ ������ ��� ������';
  SRecConstFail = '���������� record constraint �� ����������� � ������� "%s"';
  SFieldConstFail = '���������� field constraint �� ����������� � ������� "%s"';
  SDefExprFail = '���������� default expression �� ����������� � ������� "%s"';
  SArrayElementError = '������ ��������� ���� %s �� ��������������'; 
  SNoTableName = '�� ���� ���������� ������.  ��� ������� �� �������.';
{$IFDEF D5_}
  SNoEditsAllowed = '��������� �� ���������';
  SNoDeletesAllowed = '�������� �� ���������';
  SNoInsertsAllowed = '���������� (inserts) �� ���������';
  SCannotChangeCommandText = '��������� CommandText �� ���������';
 {$IFDEF D6_}
  SAggregatesActive = '�������� �� ��������� � ��������� aggregates';
 {$ENDIF}
{$ENDIF}

  { ObjectBroker }
  SNoServers = '��� ���������� �������';

{$IFDEF D6_}
  { ConnectionBroker }

  SConnectionMissing = '��������� Connection ����� ���������';
  SNoCircularConnection = '����������� ������ �� Connection �� ���������';
{$ENDIF}

  { Socket Connection }
  SReturnError = '��������� ������������ �������� �� ��������';
  SNoWinSock2 = '������ ���� ���������� WinSock 2 ��� ������������� socket ����������';

{$IFDEF D5_}
  { Web Connection }
  SURLRequired = '��������� URL';
  SDefaultURL = 'http://server.company.com/scripts/httpsrvr.dll';
  SInvalidURL = 'URL ������ ���� � ����� "http://server.company.com/scripts/httpsrvr.dll"';
  SServerIsBusy = '������ �����';

  SObjectNotAvailable = '������ �� ��������: %s';
 {$IFDEF D6_}

  { SuperComponents }
  SMasterNotOpen = '�� ���� ������� detail �������, ���� master �������';
 {$ENDIF}
{$ENDIF}

implementation

end.
