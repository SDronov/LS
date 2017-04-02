{ *************************************************************************** }
{                                                                             }
{ Kylix and Delphi Cross-Platform Visual Component Library                    }
{ Internet Application Runtime                                                }
{                                                                             }
{ Copyright (C) 1997, 2001 Borland Software Corporation                       }
{                                                                             }
{ Licensees holding a valid Borland No-Nonsense License for this Software may }
{ use this file in accordance with such license, which appears in the file    }
{ license.txt that came with this Software.                                   }
{                                                                             }
{  �����������: 1999-2002 Polaris Software                                    }
{               http://polesoft.da.ru                                         }
{ *************************************************************************** }

unit WebConst;

interface

{$IFDEF VER130}
  {$DEFINE D5_}
{$ENDIF}
{$IFDEF VER140}
  {$DEFINE D5_}
  {$DEFINE D6_}
{$ENDIF}
{$IFDEF VER150}
  {$DEFINE D5_}
  {$DEFINE D6_}
{$ENDIF}

resourcestring
{$IFDEF D6_}
  {$IFNDEF VER140}
  sErrorDecodingURLText = '������ ����������� ����� URL (%%XX), ��������������� �������, � ������� %d';
  {$ELSE}
  sErrorDecodingURLText = '������ ����������� ����� URL (%XX), ��������������� �������, � ������� %d';
  {$ENDIF}
  sInvalidURLEncodedChar = '�������� �������������� ������ URL (%s) � ������� %d';
  sInvalidHTMLEncodedChar = '�������� �������������� ������ HTML (%s) � ������� %d';
{$ENDIF}
  sInvalidActionRegistration = '�������� ����������� Action';
{$IFNDEF D5_}
  sOnlyOneDataModuleAllowed = '�������� ������ ���� ������ ������ �� ����������';
  sNoDataModulesRegistered = '�� ���������������� �� ������ ������ ������';
  sNoDispatcherComponent = '�� ������� �� ������ ����������-���������� � ������ ������';
  sOnlyOneDispatcher = '������ ���� WebDispatcher �� �����/������ ������';
{$ENDIF}
  sDuplicateActionName = '�������� ����� action';
{$IFDEF D6_}
  sFactoryAlreadyRegistered = 'Web Module Factory ��� ����������������';
  sAppFactoryAlreadyRegistered = 'Web App Module Factory ��� ����������������.';
{$ENDIF}
{$IFDEF D5_}
  sOnlyOneDispatcher = '������ ���� WebDispatcher �� �����/������ ������';
{$ELSE}
  sTooManyActiveConnections = '��������� �������� ������������� ����������.  ' +
    '��������� ������� �����';
{$ENDIF}
  sHTTPItemName = 'Name';
  sHTTPItemURI = 'PathInfo';
  sHTTPItemEnabled = 'Enabled';
  sHTTPItemDefault = 'Default';
{$IFDEF D5_}
  sHTTPItemProducer = 'Producer';
{$ENDIF}

{$IFNDEF D5_}
  sInternalServerError = '<html><title>���������� ������ ������� 500</title>'#13#10 +
    '<h1>���������� ������ ������� 500</h1><hr>'#13#10 +
    '�������������� ��������: %s<br>'#13#10 +
    '���������: %s<br></html>'#13#10;
{$ENDIF}
{$IFDEF VER120}
  sDocumentMoved = '<html><title>�������� ��������� 302</title>'#13#10 +
    '<body><h1>������ ���������</h1><hr>'#13#10 +
    '���� ������ ����� ���� ������ <a HREF="%s">�����.</a><br>'#13#10 +
    '<br></body></html>'#13#10;
{$ENDIF}
{$IFDEF VER100}
  sWindowsSocketError = '������ Windows socket: %s (%d), � API ''%s''';
  sNoAddress = '�� ������ �����';
  sCannotCreateSocket = '�� ���� ������� ����� socket';
  sCannotListenOnOpen = '�� ���� ������� �������� socket';
  sSocketAlreadyOpen = 'Socket ��� ������';
  sCantChangeWhileActive = '�� ���� �������� ��������, ���� socket ��������';
  sMustCreateThread = '����� ������ ����������� � ������ Thread blocking';
  sSocketMustBeBlocking = 'Socket ������ ���� � blocking mode';
  sSocketIOError = '%s ������ %d, %s';
  sSocketRead = '������';
  sSocketWrite = '������';
  sAsyncSocketError = '������ ������������ socket %d';
{$ENDIF}

  sResNotFound = '������ %s �� ������';

  sTooManyColumns = '������� ����� �������� � �������';
  sFieldNameColumn = 'Field Name';
  sFieldTypeColumn = 'Field Type';

{$IFNDEF D5_}
  sInvalidMask = '''%s'' - �������� ����� (%d)';
{$ENDIF}

{$IFDEF D6_}
  sInvalidWebComponentsRegistration =  '�������� ����������� Web ����������';
  sInvalidWebComponentsEnumeration =  '�������� ��������� Web ����������';
  sInvalidWebParent = '�������� �� ��������������.  ��������� %s �� ������������ IGetWebComponentList'; 
                                                      
  sVariableIsNotAContainer = '���������� %s - �� ���������';
  {$IFNDEF VER140}
  sInternalApplicationError = '<html><body><h1>���������� ������ ����������</h1>' + sLineBreak +
                              '<p>%0:s' + sLineBreak +
                              '<p><hr width="100%%"><i>%1:s</i></body></html>';
  {$ELSE}
  sInternalApplicationError = '<h1>���������� ������ ����������</h1>'#13#10 +
                              '<p>%0:s'#13#10 +
                              '<p><hr width="100%%"><i>%1:s</i>';
  {$ENDIF}
  sInvalidParent = '�������� ��������';

  sActionDoesNotProvideResponse = 'Action �� ������������ �����';
  sActionCantRespondToUnkownHTTPMethod = 'Action �� ����� �������� ������������ HTTP ������';
  sActionCantRedirectToBlankURL = 'Action �� ����� �������������� �� ������ URL';
{$ENDIF}

implementation

end.

