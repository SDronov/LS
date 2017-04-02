{*******************************************************}
{                                                       }
{       Borland Delphi Test Server                      }
{                                                       }
{  Copyright (c) 2001 Borland Software Corporation      }
{                                                       }
{  �����������: 2001 Polaris Software                   }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit SvrConst;

interface

resourcestring
  sWebAppDebugger = '�������� Web-����������';
  sStopServer = '����';
  sStartServer = '�����';
  sCouldNotOpenRegKey = '�� ���� ������� ���� �������: %s';
  sUnauthorizedString = '<HTML><HEAD><TITLE>�����������������</TITLE></HEAD>' +
    '<BODY><H1>�����������������</H1>' +
    '���������� ����������� ��������� ��� ���� �������. ' +
    '���� ��� ������� �� ������������ �����������, ' +
    '���� ���� ����������� - ��������.' +
    '</BODY></HTML>'#13#10;
  sForbiddenString = '<HTML><TITLE>��������� URL ��������</TITLE>' + '<BODY>' + '<H1>��������� URL ��������</H1>' + '<P>��� ������� HTTP: 403' + '</BODY></HTML>'#13#10;
  sNoDirBrowseString = '<HTML><TITLE>�������� ��������� ��������</TITLE>' + '<BODY>' + '<H1>��������� URL ��������</H1>' + '<P>��� ������� HTTP: 403' + '</BODY></HTML>'#13#10;
  sBadRequest = '<HTML><TITLE>�������� HTTP ������: ����� �� ����������� ��� HTTP/1.0</TITLE>' + '<BODY>' + '<H1>�������� HTTP ������: ����� �� ����������� ��� HTTP/1.0</H1>' + '<P>��� ������� HTTP: 400' + '</BODY></HTML>'#13#10;
  sNotFound =
    '<TITLE>��������� URL �� ������</TITLE>' +
    '<BODY>' +
    '<H1>��������� URL �� ������</H1>' +
    '<P>��� ������� HTTP: 404' +
    '</BODY>';
  sInternalServerError =
    '<TITLE>���������� ������ �������</TITLE>' +
    '<BODY>' +
    '<H1>���������� ������ �������</H1>' +
    '<P>��� ������� HTTP: 500' +
    '<P>��������� �� ������ HTTP: %s' +
    '</BODY>';

  SInvalidActionRegistration = '�������� ����������� �������� (action)';
  sErrorEvent = 'ERROR';
  sResponseEvent = 'RESPONSE';
  sEvent = 'Event';
  sTime = 'Time';
  sDate = 'Date';
  sElapsed = 'Elapsed';
  sPath = 'Path';
  sCode = 'Code';
  sContentLength = 'Content Length';
  sContentType = 'Content Type';
  sThread = 'Thread';

  sNoDefaultURL = '(���)';
  sLogTab = 'Log(%d)';

  sSend = 'Send';
  sReceive = 'Receive';
  sLogStrTemplate = '%s %s ������: (%d)%s';

  UnauthorizedString = '<HTML><HEAD><TITLE>�����������������</TITLE></HEAD>' +
    '<BODY><H1>�����������������</H1>' +
    '���������� ����������� ��������� ��� ���� �������. ' +
    '���� ��� ������� �� ������������ �����������, ' +
    '���� ���� ����������� - ��������.' +
    '</BODY></HTML>'#13#10;
  ForbiddenString = '<HTML><TITLE>��������� URL ��������</TITLE>' + '<BODY>' + '<H1>��������� URL ��������</H1>' + '<P>��� ������� HTTP: 403' + '</BODY></HTML>'#13#10;
  NoDirBrowseString = '<HTML><TITLE>�������� ��������� ��������</TITLE>' + '<BODY>' + '<H1>��������� URL ��������</H1>' + '<P>��� ������� HTTP: 403' + '</BODY></HTML>'#13#10;
  BadRequest = '<HTML><TITLE>�������� HTTP ������: ����� �� ����������� ��� HTTP/1.0</TITLE>' + '<BODY>' + '<H1>�������� HTTP ������: ����� �� ����������� ��� HTTP/1.0</H1>' + '<P>��� ������� HTTP: 400' + '</BODY></HTML>'#13#10;
  NotFound =
    '<TITLE>��������� URL �� ������</TITLE>' +
    '<BODY>' +
    '<H1>��������� URL �� ������</H1>' +
    '<P>��� ������� HTTP: 404' +
    '</BODY>';
  DateFormat = 'ddd, dd mmm yyyy hh:mm:ss';
  sBuild = 'Build';
  sDirHeader = '<HTML><HEAD><TITLE>������� %s</TITLE></HEAD>' +
    '<BODY><H1>������� %0:s</H1>'#13#10;
  sDirParent = 'Up to <A HREF="%s">%0:s</A>'#13#10'<UL>';
  sDirRoot = '����� � <A HREF="%s">�������� �������</A>'#13#10'<UL>';
  sDirEntry = '<LI>[ <A HREF="%s">%s</A> ]'#13#10;
  sFileEntry = '<LI><A HREF="%s">%s</A> (%d ����)'#13#10;
  sListStart = '<UL>'#13#10;
  sDirFooter = '</UL></BODY></HTML>'#13#10;


implementation

end.
