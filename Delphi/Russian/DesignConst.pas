{ ********************************************************************** }
{                                                                        }
{ Delphi Open-Tools API                                                  }
{                                                                        }
{ Copyright (C) 2000, 2001 Borland Software Corporation                  }
{                                                                        }
{  �����������: 2001-02 Polaris Software                                 }
{               http://polesoft.da.ru                                    }
{ ********************************************************************** }
unit DesignConst;

interface

resourcestring
  srNone = '(���)';
  srLine = '������';
  srLines = '�����';

  SInvalidFormat = '�������� ����������� ������';
  
  SUnableToFindComponent = '�� ���� ����� �����/���������, ''%s''';
  SCantFindProperty = '�� ���� ����� �������� ''%s'' � ���������� ''%s''';
  SStringsPropertyInvalid = '�������� ''%s'' �� ������������������� � ���������� ''%s''';

  SLoadPictureTitle = '��������� ��������';
  SSavePictureTitle = '��������� �������� ���';
  
  SAboutVerb = '�...';
  SNoPropertyPageAvailable = '��� ��������� ������� ������� ��� ����� �������� ����������';
  SNoAboutBoxAvailable = 'About Box �� �������� ��� ����� �������� ����������';
  SNull = '(Null)';
  SUnassigned = '(Unassigned)';
  SUnknown = '(����������)';
  SString = 'String';

  SUnknownType = '����������� ���';

  SCannotCreateName = '�� ���� ������� ����� ��� ����������� ����������';

  SColEditCaption = '��������� %s%s%s';

  SCantDeleteAncestor = '����� �������� ���������, ������� ����������� � �����-������, ������� �� �������';
  SCantAddToFrame = '����� ���������� �� ����� ����������� � ������� �������.';

{$IFDEF LINUX}
  SAllFiles = '��� ����� (*)';
{$ENDIF}
{$IFDEF MSWINDOWS}
  SAllFiles = '��� ����� (*.*)';
{$ENDIF}

const
  SIniEditorsName = 'Property Editors';

implementation

end.
