{ *********************************************************************** }
{                                                                         }
{ Delphi Runtime Library                                                  }
{                                                                         }
{ Copyright (c) 1999-2001 Borland Software Corporation                    }
{                                                                         }
{                                                                         }
{  �����������: 1998-99 Polaris Software                                  }
{               http://polesoft.da.ru                                     }
{ *********************************************************************** }

unit CorbCnst;

interface

resourcestring
  SCorbaDllNotLoaded = '�� ���� ��������� ���������� CORBA';
  SCorbaNotInitialized = '���������� CORBA �� ������� ��� �� ����������������';
  SCorbaSkeletonNotRegistered = '������-������ CORBA �� ��������������� ��� ������� %s';
  SCorbaStubNotRegistered = '���������� ��������� (stub) CORBA �� ���������������';
  SCorbaInterfaceIDNotRegister = '��������� CORBA �� ���������������';
  SCorbaRepositoryIDNotRegistered = 'CORBA Repository ID "%s" �� ���������������';
  SCorbaIncompleteFactory = 'CORBA Factory �� ��������� CreateInterface';

resourcestring
  sInvalidTypeCast = '������� �� ����� ���� �������������� � CORBA Any';
  sNotCorbaObject = 'Variant/Any - �� ������ CORBA';
  sParamTypeCast = '�������� (%d) ������ %s - ��������� ����';
  sParamOut = '�������� (%d) ������ %s - �������� out ��� in/out � ������� ��������� ��� � ����������';
  sNoRepository = '�� ���� ��������� CORBA Dispatch, �� ������ ����������� ����������';
  sInvalidParameterCount = '�������� ���������� ���������� � ������ %s';
  sMethodNotFound = '����� %s �� ������';
  sConnecting = '���������� � �������� CORBA...';

implementation

end.
