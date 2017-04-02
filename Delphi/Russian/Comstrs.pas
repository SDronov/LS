{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{  Copyright (c) 1996-2001 Borland Software Corporation }
{                                                       }
{  �����������: 1998-2001 Polaris Software              }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit ComStrs;

interface

resourcestring
{$IFNDEF VER100}
  sTabFailClear = '�� ������� �������� tab control';
  sTabFailDelete = '�� ������� ������� �������� (tab) � �������� %d';
  sTabFailRetrieve = '�� ������� ������������ �������� (tab) � �������� %d';
  sTabFailGetObject = '�� ������� �������� ������ � �������� %d';
  sTabFailSet = '�� ������� ���������� �������� (tab) "%s" � �������� %d';
  sTabFailSetObject = '�� ������� ���������� ������ � �������� %d';
  sTabMustBeMultiLine = 'MultiLine ������ ���� True, ����� TabPosition ����� tpLeft ��� tpRight';
{$ELSE}
  sTabAccessError = '������ ������� � tab control';
{$ENDIF}

  sInvalidLevel = '������������ ��������� ������ ��������';
  sInvalidLevelEx = '�������� ������� (%d) ��� �������� "%s"';
  sInvalidIndex = '�������� ������';
  sInsertError = '���������� �������� �������';

  sInvalidOwner = '�������� ��������';
  sUnableToCreateColumn = '���������� ������� ����� �������';
  sUnableToCreateItem = '���������� ������� ����� �������';

  sRichEditInsertError = '������ ������� ������ � RichEdit';
  sRichEditLoadFail = '���� ��� Load Stream';
  sRichEditSaveFail = '���� ��� Save Stream';

  sTooManyPanels = 'StatusBar �� ����� ����� ����� 64 �������';

  sHKError = '������ ���������� Hot-Key �� %s. %s';
  sHKInvalid = '�������� Hot-Key';
  sHKInvalidWindow = '�������� ��� �������� ����';
  sHKAssigned = 'Hot-Key �������� �� ������ ����';

  sUDAssociated = '%s ��� ������ � %s';

  sPageIndexError = '�������� �������� PageIndex (%d).  PageIndex ������ ���� ' +
    '����� 0 � %d';

  sInvalidComCtl32 = '���� ��������� ������� COMCTL32.DLL ������ 4.70 ��� ����';

  sDateTimeMax = '���� ��������� �������� %s';
  sDateTimeMin = '���� ������, ��� ������� %s';
  sNeedAllowNone = '��������� ����� ShowCheckbox ��� ��������� ���� ����';
{$IFNDEF VER100}
  sFailSetCalDateTime = '������ ��� ��������� ���� ��� ������� � ���������';
  sFailSetCalMaxSelRange = '������ ��� ��������� ������������� ��������� ������';
  sFailSetCalMinMaxRange = '������ ��� ��������� ���/���� ��������� ���������';
  sCalRangeNeedsMultiSelect = '�������� ��� ����� �������������� ������ � ������ ������������';
  sFailsetCalSelRange = '������ ��� ��������� ���������� ��������� ���������';
{$ENDIF}

implementation

end.
