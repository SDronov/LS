{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCommonReg.pas $
  $Revision: 271 $
  $Author: alexvolo $
  $Date: 2005-11-03 19:42:50 +0400 (Р§С‚, 03 РЅРѕСЏ 2005) $
}

unit fdcCommonReg;

interface

{$I fdcIDEVersion.inc}

procedure Register;

implementation

uses
  SysUtils, Classes, ToolsAPI, DelForEng, DesignIntf, fdcConsts,
  fdcLogger, fdcParamsHolderEditor, fdcNamePropertyEditor,
  fdcFormatterWizard, fdcUtils, fdcTimer, fdcInspector, fdcQuery,
  fdcOracleSession, fdcStringsHolder, fdcParamsHolder, fdcDBTreeView, QueryList,
    SQLEditorFrm;

procedure CopyINI(const ASourceFile, ATargetFile: string);
begin
  if (FileExists(ASourceFile)) and
     (ASourceFile <> ATargetFile) then
    CopyFile(ASourceFile, ATargetFile);
end;

procedure CopyDLL(const ASourceFile, ATargetFile: string);
begin
  if (FileExists(ASourceFile)) and
     (ASourceFile <> ATargetFile) and
     (not FileExists(ATargetFile)) then
    CopyFile(ASourceFile, ATargetFile);
end;

procedure Register;
begin
  { копировать ini-файл с префиксами и суффиксами в каталог Windows }
  CopyINI('Source\' + SComponentsNameINI, GetWinDir + '\' + SComponentsNameINI);

  { копировать dll в каталог Windows }
  CopyDLL('Source\' + SDelForDLL, GetWinDir + '\' + SDelForDLL);

  { зарегистрировать компоненты }
  RegisterComponents(SCompanyComponentsPage, [
    TfdcEventSource, TfdcConsoleLog, TfdcWinDebugLog,
    TfdcWinEventLog, TfdcFileLog, TfdcTimer, TfdcInspector,
    TfdcQuery, TfdcOracleSession, TfdcStringsHolder,
    TfdcParamsHolder, TfdcDBTreeView]);

  { зарегистрировать редакторы компонент }
  RegisterComponentEditor(TfdcParamsHolder, TfdcParamsHolderEditor);

  { зарегистрировать редакторы свойств }
  RegisterPropertyEditor(TypeInfo(TComponentName), TComponent, 'Name',
    TfdcComponentNameProperty);
    
  { зарегистрировать эксперты }
  RegisterPackageWizard(TfdcFormatterWizard.Create);

  RegisterComponents(SCompanyComponentsPage, [TQueryList]);
  RegisterNoIcon([TsqlOp]);
  RegisterClass(TsqlOp);
  RegisterComponentEditor(TQueryList, TSQLEditor);

end;

end.

