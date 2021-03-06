{*****************************************************************

                     ���� ����� ����������

 ��������: ��������� �������� �������� ���������� ������������ � 
 	   ����� Def.inc ������� ������. 
                                                                          
 ���������������� ���������:                                                     
   _DEBUG_   - �������� � ��� ������ �������� ������������ ������,      
               � ����� ���������� ��������� _LOG_. �������� �� 
               ���������.
   _LOG_     - �������� � ��� ������� �������.
   _RELEASE_ - ��������� ��������� _DEBUG_ � _LOG_. 
                         
 ��������� ��������:
   _STD_PROJECT_    - ������������� ������ Standard Project
   _STD_ORA_CLIENT_ - ������������� ������ Standard Oracle Client

{******************************************************************}

{ ���������� ��������� }

  {$ifndef _DEBUG_}
    {$ifndef _LOG_}
      {$ifndef _RELEASE_}
        {$define _DEBUG_}
      {$endif}
    {$endif}
  {$endif}


  {$ifdef _RELEASE_}
    {$undef _DEBUG_}
    {$undef _LOG_}
  {$else}
    {$ifdef _DEBUG_}
      {$define _LOG_}
    {$endif}
  {$endif}

{ ��������� ����� ����������� }

  {$ifdef _DEBUG_}
    {$DEBUGINFO      ON}
    {$LOCALSYMBOLS   ON} 
    {$HINTS          ON}
    {$WARNINGS       ON}
    {$REFERENCEINFO  ON}
    {$IOCHECKS       ON}
    {$RANGECHECKS    ON}
    {$STACKFRAMES    ON}
    {$OVERFLOWCHECKS ON}
    {$OPTIMIZATION   OFF}
  {$endif}

  {$ifdef _RELEASE_}
    {$DEBUGINFO      OFF}
    {$LOCALSYMBOLS   OFF}
    {$HINTS          OFF}
    {$WARNINGS       OFF}
    {$REFERENCEINFO  OFF}
    {$IOCHECKS       OFF}
    {$RANGECHECKS    OFF}
    {$STACKFRAMES    OFF}
    {$OVERFLOWCHECKS OFF}
    {$OPTIMIZATION   ON}
  {$endif}

                                              