{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{  Copyright (c) 1995-2001 Borland Software Corporation }
{                                                       }
{  �����������: 1998-2002 Polaris Software              }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit OleConst;

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
  SBadPropValue = '''%s'' - ������������ �������� ��������';
  SCannotActivate = '������ ��������� �������� ���������� OLE';
  SNoWindowHandle = '�� ���� �������� ���������� ���� �������� ���������� OLE';
  SOleError = '������ OLE %.8x';
  SVarNotObject = 'Variant �� ��������� �� ������ OLE';
  SVarNotAutoObject = 'Variant �� ��������� �� ������ automation';
  SNoMethod = '����� ''%s'' �� �������������� �������� OLE';
  SLinkProperties = '�������� ����������';
  SInvalidLinkSource = '�� ���� ������������ � ��������� ���������.';
  SCannotBreakLink = '�������� ������ ���������� �� ��������������.';
  SLinkedObject = '��������� %s';
  SEmptyContainer = '�������� �� ��������� �� ������ OLE ����������';
  SInvalidVerb = 'Invalid object verb';
  SPropDlgCaption = '%s ��������';
  SInvalidStreamFormat = '�������� ������ ������';
  SInvalidLicense = '�������� ���������� � �������� ��� %s';
  SNotLicensed = '���������� � �������� ��� %s �� �������. �� �� ������ ������������ ���� ������� ���������� � ������ ����������';
{$IFDEF D5_}
  sNoRunningObject = '�� ���� �������� ������ �� ���������� ������, ������������������ � OLE, ��� %s/%s';
{$ENDIF}

implementation

end.