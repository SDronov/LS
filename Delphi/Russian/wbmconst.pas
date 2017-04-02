
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{   Copyright (c) 1999-2001 Borland Software Corp.      }
{                                                       }
{  �����������: 1999-2002 Polaris Software              }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit WbmConst;

interface

resourcestring
  sDataSetFieldBlank = '���� ������ ������ (Data set) - ������';
  sDataSetFieldNotFound = '���� ������ ������ (Data set) �� �������: %s';
  sNotDataSetField = '���� %s - �� ���� ������ ������ (dataset)';
  ScriptTableName = '%s_Table';
  sNoXMLBroker = '%s: �� ������ XMLBroker';
  sFieldNotFound = '%0:s: ���� "%1:s" �� �������';
  sXMLBrokerNotDefined = '%s.XMLBroker = nil';
  sSubmitQuery = 'Submit';
  sResetQuery = 'Reset';
  sApplyUpdates = 'Apply Updates';
  sFieldNameBlank = '%s.FieldName = ''''';
  sXMLComponentNotDefined = '%s.XMLComponent = nil';
  ScriptNamesVar = '%s_Names';
  ScriptIDsVar = '%s_IDs';
  ScriptXMLDisplayName = '%s_Disp';
  sInvalidParent = '�������� �������� (������)';
{$IFNDEF VER130}
  sInvalidParentClass = '�������� ������������ �����: %s';
{$ENDIF}
  sDuplicateStatusField = '���� %s ���������������, ����������� ������ ���� ������ ����';
  sFirstButton = '|<';
  sLastButton = '>|';
  sPriorButton = '<';
  sNextButton = '>';
  sPriorPageButton = '<<';
  sNextPageButton = '>>';
  sDeleteButton = ' - ';
  sInsertButton = ' + ';
  sUndoButton = 'Undo';
  sPostButton = 'Post';
  sWarningsBody = '<TABLE BORDER=1 CELLPADDING=4>'#13#10 +
                '<TR><TD><P ALIGN=CENTER>Design-time Warnings<P>'#13#10 +
                '%s'#13#10 +
                '</TD></TD>'#13#10 +
                '</TABLE>'#13#10;
  ScriptDocumentVarName = '%s_Doc';
  ScriptXMLVarName = '%s_XML';
{$IFDEF VER130}
  sInvalidWebComponentsRegistration =  '�������� ����������� Web ����������';
  sInvalidWebComponentsEnumeration =  '�������� ��������� Web ����������';
{$ENDIF}
  sInvalidWebComponentsCreation =  '�������� �������� Web ����������';
  ScriptRowSetVarName = '%s_RS';
  sApplyUpdatesError = '������ ApplyUpdates.  ����� ������: %d.';
  sDeltaNotFound = '�� ������ Delta Packet';
  sXMLBrokerNotConnected = 'XMLBroker: %s �� ���������';
  sDataSetNotActive = 'DataSet: %s �� �������';

implementation

end.

