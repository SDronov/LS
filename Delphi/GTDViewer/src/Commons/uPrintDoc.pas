unit uPrintDoc;

interface

uses Windows, Forms, dbTables, sysutils, BDE, Dialogs;

type
  TExt_print_doc=procedure(AApplicationHandle: THandle; ADBName, ADriver, AUserName, APassword, AScriptFileName, AFilter: PChar; AShowFilterForm, ADesignerMode: boolean);StdCall;
  EDLLLoadError=class(Exception);

  procedure exp_PrintDoc(AScriptFileName, ADBName, ADriver, AUserName, APassword, AFilter: string; AShowFilterForm, ADesignerMode: boolean);
  procedure exp_PrintTPO(AScriptFileName, ADBName, ADriver, AUserName, APassword, ATPO_NUMBER: string; AShowFilterForm, ADesignerMode: boolean);
  procedure exp_PrintTR(AScriptFileName, ADBName, ADriver, AUserName, APassword, ATR_NUMBER: string; AShowFilterForm, ADesignerMode: boolean);
  procedure exp_PrintGTD(AScriptFileName, ADBName, ADriver, AUserName, APassword, AG071, AG072, AG073: string; AShowFilterForm, ADesignerMode: boolean);overload;
  procedure exp_PrintGTD(AScriptFileName, ADBName, ADriver, AUserName, APassword, AGTDNumber: string; AShowFilterForm, ADesignerMode: boolean);overload;

implementation

procedure exp_PrintDoc(AScriptFileName, ADBName, ADriver, AUserName, APassword, AFilter: string; AShowFilterForm, ADesignerMode: boolean);
var
  FLibHandle: THandle;
  FExt_print_doc: TExt_print_doc;
begin
  try
    FLibHandle:=LoadLibrary('lgtdviewer.dll');
    try
      if FLibHandle=0 then
        raise EDLLLoadError.Create('Невозможно загрузить DLL!');
      @FExt_print_doc:=GetProcAddress(FLibHandle,'ext_print_doc');
      if @FExt_print_doc=nil then RaiseLastWin32Error;
      FExt_print_doc(Application.Handle,PChar(ADBName),PChar(ADriver),PChar(AUserName),PChar(APassword),PChar(AScriptFileName),PChar(AFilter),AShowFilterForm, ADesignerMode);
    finally
      FreeLibrary(FLibHandle);
    end;
  except
    on E: Exception do ShowMessage('Ошибка в библиотеке dll "lgtdviewer.dll" : '+E.Message);
  end;
end;

procedure exp_PrintTPO(AScriptFileName, ADBName, ADriver, AUserName, APassword, ATPO_NUMBER: string; AShowFilterForm, ADesignerMode: boolean);
var
  LFilter: string;
begin
  LFilter:='"Типографский номер ТПО='+ATPO_NUMBER+'"';
  exp_PrintDoc(AScriptFileName, ADBName, ADriver, AUserName, APassword, LFilter, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintTR(AScriptFileName, ADBName, ADriver, AUserName, APassword, ATR_NUMBER: string; AShowFilterForm, ADesignerMode: boolean);
var
  LFilter: string;
begin
  LFilter:='"Типографский номер ТР='+ATR_NUMBER+'"';
  exp_PrintDoc(AScriptFileName, ADBName, ADriver, AUserName, APassword, LFilter, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintGTD(AScriptFileName, ADBName, ADriver, AUserName, APassword, AG071, AG072, AG073: string; AShowFilterForm, ADesignerMode: boolean);
var
  LFilter: string;
begin
  LFilter:='"Код таможенного органа='+AG071+'","Дата оформления='+AG072+'","Порядковый номер='+AG073+'"';
  exp_PrintDoc(AScriptFileName, ADBName, ADriver, AUserName, APassword, LFilter, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintGTD(AScriptFileName, ADBName, ADriver, AUserName, APassword, AGTDNumber: string; AShowFilterForm, ADesignerMode: boolean);overload;
var
  S1, S2, S3: string;
begin
  if AGTDNumber<>'' then
    begin
      S1:=Copy(AGTDNumber,1,8);
      S2:=Copy(AGTDNumber,Pos('/',AGTDNumber)+1,10);
      S3:=Copy(AGTDNumber,Pos('/',AGTDNumber)+12,Length(AGTDNumber));
    end;
  exp_PrintGTD(AScriptFileName, ADBName, ADriver, AUserName, APassword, s1, s2, s3, AShowFilterForm, ADesignerMode);
end;

end.
