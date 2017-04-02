{*****************************************************************

                     ФОРС ЦЕНТР РАЗРАБОТКИ

 Описание: Обработка директив условной компиляции определенных в 
 	   файле Def.inc проекта группы. 
                                                                          
 Предопределенные директивы:                                                     
   _DEBUG_   - включает в код полную проверку корректности данных,      
               а также определяет директиву _LOG_. Включена по 
               умолчанию.
   _LOG_     - включает в код ведение журнала.
   _RELEASE_ - отключает директивы _DEBUG_ и _LOG_. 
                         
 Директивы проектов:
   _STD_PROJECT_    - компилируется проект Standard Project
   _STD_ORA_CLIENT_ - компилируется проект Standard Oracle Client

{******************************************************************}

{ ОБРАБОТАТЬ ДИРЕКТИВЫ }

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

{ ВЫСТАВИТЬ ОПЦИИ КОМПИЛЯТОРА }

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

                                              