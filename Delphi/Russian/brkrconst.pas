{ *************************************************************************** }
{                                                                             }
{ Delphi and Kylix Cross-Platform Visual Component Library                    }
{ Internet Application Runtime                                                }
{                                                                             }
{ Copyright (C) 1995, 2001 Borland Software Corporation                       }
{                                                                             }
{ Licensees holding a valid Borland No-Nonsense License for this Software may }
{ use this file in accordance with such license, which appears in the file    }
{ license.txt that came with this Software.                                   }
{                                                                             }
{  �����������: 1999-2002 Polaris Software                                    }
{               http://polesoft.da.ru                                         }
{ *************************************************************************** }

unit BrkrConst;

interface

resourcestring
  sOnlyOneDataModuleAllowed = '�������� ������ ���� ������ ������ �� ����������';
  sNoDataModulesRegistered = '�� ���������������� �� ������ ������ ������';
  sNoDispatcherComponent = '�� ������� �� ������ ����������-���������� � ������ ������';
{$IFNDEF VER130}
  sNoWebModulesActivated = '��� ������������� �������������� ������� ������';
{$ENDIF}
  sTooManyActiveConnections = '��������� �������� ������������� ����������.  ' +
    '��������� ������� �����';
  sInternalServerError = '<html><title>���������� ������ ������� 500</title>'#13#10 +
    '<h1>���������� ������ ������� 500</h1><hr>'#13#10 +
    '�������������� ��������: %s<br>'#13#10 +
    '���������: %s<br></html>'#13#10;
  sDocumentMoved = '<html><title>�������� ��������� 302</title>'#13#10 +
    '<body><h1>������ ���������</h1><hr>'#13#10 +
    '���� ������ ����� ���� ������ <a HREF="%s">�����.</a><br>'#13#10 +
    '<br></body></html>'#13#10;


implementation

end.
