unit uDOAPrintDoc;

interface

uses SysUtils, Windows, Forms, Dialogs, Oracle;

type
  TExt_print_doc=procedure(AApplicationHandle: THandle; ADOASession: TOracleSession; AScriptFileName, AFilter: PChar; AShowFilterForm, ADesignerMode: boolean);StdCall;
  EDLLLoadError=class(Exception);

  procedure exp_PrintDoc(AScriptFileName, AFilter: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
  procedure exp_PrintTPO(AScriptFileName, ATPO_NUMBER: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
  procedure exp_PrintTR(AScriptFileName, ATR_NUMBER: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
  procedure exp_PrintGTD(AScriptFileName, AG071, AG072, AG073: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);overload;
  procedure exp_PrintGTD(AScriptFileName, AGTDNumber: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);overload;

implementation

procedure exp_PrintDoc(AScriptFileName, AFilter: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
var
  FLibHandle: THandle;
  FExt_print_doc: TExt_print_doc;
begin
  try
    FLibHandle:=LoadLibrary('lgtdviewer.dll');
    try
      if FLibHandle=0 then
        raise EDLLLoadError.Create('Невозможно загрузить DLL!');
      @FExt_print_doc:=GetProcAddress(FLibHandle,'ext_print_doa_doc');
      if @FExt_print_doc=nil then RaiseLastWin32Error;
      FExt_print_doc(Application.Handle,ADOASession,PChar(AScriptFileName),PChar(AFilter),AShowFilterForm, ADesignerMode);
    finally
      FreeLibrary(FLibHandle);
    end;
  except
    on E: Exception do ShowMessage('Ошибка в библиотеке dll "lgtdviewer.dll" : '+E.Message);
  end;
end;

procedure exp_PrintTPO(AScriptFileName, ATPO_NUMBER: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
var
  LFilter: string;
begin
  LFilter:='"Типографский номер ТПО='+ATPO_NUMBER+'"';
  exp_PrintDoc(AScriptFileName, LFilter, ADOASession, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintTR(AScriptFileName, ATR_NUMBER: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
var
  LFilter: string;
begin
  LFilter:='"Типографский номер ТР='+ATR_NUMBER+'"';
  exp_PrintDoc(AScriptFileName, LFilter, ADOASession, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintGTD(AScriptFileName, AG071, AG072, AG073: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
var
  LFilter: string;
begin
  LFilter:='"Код таможенного органа='+AG071+'","Дата оформления='+AG072+'","Порядковый номер='+AG073+'"';
  exp_PrintDoc(AScriptFileName, LFilter, ADOASession, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintGTD(AScriptFileName, AGTDNumber: string; ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
var
  S1, S2, S3: string;
begin
  if AGTDNumber<>'' then
    begin
      S1:=Copy(AGTDNumber,1,8);
      S2:=Copy(AGTDNumber,Pos('/',AGTDNumber)+1,6);
      s2:=Copy(s2,1,2)+'.'+Copy(s2,3,2)+'.20'+Copy(s2,5,2);
      S3:=Copy(AGTDNumber,Pos('/',AGTDNumber)+8,Length(AGTDNumber));
    end;
  exp_PrintGTD(AScriptFileName, s1, s2, s3, ADOASession ,AShowFilterForm, ADesignerMode);
end;

end.
