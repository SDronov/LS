{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{  �����������: 1999-2001 Polaris Software              }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit ScktCnst;

interface

const
  //Do not localize
  KEY_SOCKETSERVER  = '\SOFTWARE\Borland\Socket Server';
{$IFNDEF VER120}
{$IFNDEF VER125}
  KEY_IE            = 'SOFTWARE\Microsoft\Internet Explorer';
{$ENDIF}
{$ENDIF}
  csSettings        = 'Settings';
  ckPort            = 'Port';
  ckThreadCacheSize = 'ThreadCacheSize';
  ckInterceptGUID   = 'InterceptGUID';
  ckShowHost        = 'ShowHost';
  ckTimeout         = 'Timeout';
{$IFNDEF VER120}
{$IFNDEF VER125}
  ckRegistered      = 'RegisteredOnly';
  SServiceName      = 'SocketServer';
  SApplicationName  = 'Borland Socket Server';
{$ENDIF}
{$ENDIF}

resourcestring
  SServiceOnly = 'Socket Server ����� �������� ������ ��� ������ �� NT 3.51 ��� �����';
  SErrClose = '�� ���� �����, ����� ���� �������� ����������. �������� ����������?';
  SErrChangeSettings = '�� ���� �������� ���������, ����� ���� �������� ����������. �������� ����������?';
  SQueryDisconnect = '������������ �������� ����� ������� ������ ����������. ����������?';
  SOpenError = '������ �������� ����� %d � �������: %s';
  SHostUnknown = '(����������)';
{$IFNDEF VER120}
{$IFNDEF VER125}
  SNotShown = '(�������)';
{$ENDIF}
{$ENDIF}
  SNoWinSock2 = '������ ���� ���������� WinSock 2 ��� ������������� socket ����������';
{$IFNDEF VER120}
{$IFNDEF VER125}
  SStatusline = '%d ������� ����������';
  SAlreadyRunning = 'Socket Server ��� ��������';
  SNotUntilRestart = '��� ��������� �� ������� � ���� ���� Socket Server �� ����� ������������';
{$ENDIF}
{$ENDIF}

implementation

end.
 