unit uDOAPrintDoc;

interface

uses SysUtils, Windows, Forms, Dialogs, Oracle, Controls;

type
  TExt_print_doc = procedure(AApplicationHandle: THandle; ADOASession:
    TOracleSession; AScriptFileName, AFilter: PChar; AShowFilterForm,ADesignerMode: boolean);
  StdCall;
  EDLLLoadError = class(Exception);

procedure exp_PrintDoc(AScriptFileName, AFilter: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
procedure exp_PrintTPO(AScriptFileName, ATPO_NUMBER: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
procedure exp_PrintTR(AScriptFileName, ATR_NUMBER: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
procedure exp_PrintTRElectronic(AScriptFileName, ATR_NUMBER: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
procedure exp_PrintGTD(AScriptFileName, AG071, AG072, AG073: string;
  ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean); overload;
procedure exp_PrintGTD(AScriptFileName, AGTDNumber: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False); overload;

implementation

uses
  fdcUtils;

procedure exp_PrintDoc(AScriptFileName, AFilter: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
var
  FLibHandle: THandle;
  FExt_print_doc: TExt_print_doc;
begin
  DisplayBusyCursor;
  FLibHandle := LoadLibrary('lgtdviewer.dll');
  try
    try
      if (FLibHandle <= 16) then
        raise EDLLLoadError.Create('Невозможно загрузить DLL!');
      @FExt_print_doc := GetProcAddress(FLibHandle, 'ext_print_doa_doc');
      if (@FExt_print_doc = nil) then
        RaiseLastWin32Error;
      FExt_print_doc(Application.Handle, ADOASession, PChar(AScriptFileName),
        PChar(AFilter), AShowFilterForm, ADesignerMode);
    except
      on E: Exception do
        ShowMessage('Ошибка в библиотеке dll "lgtdviewer.dll" : ' + E.Message);
    end;
  finally
    if FLibHandle > 16 then
      FreeLibrary(FLibHandle);
  end;
end;

procedure ParseNumber(const FullNo: string; var CustCode, DateStr, DocNo:
  string);
var
  P: Integer;
  S: string;
begin
  S := FullNo;
  CustCode := '';
  DateStr := '';
  DocNo := FullNo;

  P := Pos('/', S);
  if P > 0 then
  begin
    CustCode := Copy(S, 1, P - 1);
    S := Copy(S, P + 1, MaxInt);
    P := Pos('/', S);
    if P > 0 then
    begin
      DateStr := Copy(S, 1, P - 1);
      DocNo := Copy(S, P + 1, MaxInt);
    end;
  end;
end;

procedure exp_PrintTPO(AScriptFileName, ATPO_NUMBER: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
var
  LFilter: string;
  S1, S2, S3: string;
begin
  ParseNumber(ATPO_NUMBER, S1, S2, S3);
  LFilter := '"Типографский номер ТПО=' + S3 + '"';
  exp_PrintDoc(ExtractFilePath(Application.ExeName) + 'gtdview\TPOViewerDOA.esr', LFilter, ADOASession, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintTR(AScriptFileName, ATR_NUMBER: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
var
  LFilter: string;
  S1, S2, S3: string;
begin
  ParseNumber(ATR_NUMBER, S1, S2, S3);
  LFilter := '"Типографский номер ТР=' + S3 + '"';
  exp_PrintDoc(ExtractFilePath(Application.ExeName) + 'gtdview\TRViewerDOA.esr', LFilter, ADOASession, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintTRElectronic(AScriptFileName, ATR_NUMBER: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
var
  LFilter: string;
  S1, S2, S3: string;
begin
  ParseNumber(ATR_NUMBER, S1, S2, S3);
  LFilter := '"Типографский номер ТР=' + S3 + '"';
  exp_PrintDoc(ExtractFilePath(Application.ExeName) + 'gtdview\TRELViewerDOA.esr', LFilter, ADOASession, AShowFilterForm, ADesignerMode);
end;



procedure exp_PrintGTD(AScriptFileName, AG071, AG072, AG073: string;
  ADOASession: TOracleSession; AShowFilterForm, ADesignerMode: boolean);
var
  LFilter: string;
begin
  LFilter := '"Код таможенного органа=' + AG071 + '","Дата оформления=' + AG072
    + '","Порядковый номер=' + AG073 + '"';
  if Copy(AG072, 7, 4) = '2007' then
    exp_PrintDoc(AScriptFileName, LFilter, ADOASession, AShowFilterForm, ADesignerMode)
  else
  exp_PrintDoc(ExtractFilePath(Application.ExeName) + 'gtdview\CBD2006DOA.esr', LFilter, ADOASession, AShowFilterForm, ADesignerMode);
end;

procedure exp_PrintGTD(AScriptFileName, AGTDNumber: string; ADOASession:
  TOracleSession; AShowFilterForm: boolean; ADesignerMode: boolean = False);
var
  S1, S2, S3: string;

begin
  ParseNumber(AGTDNumber, S1, S2, S3);
  exp_PrintGTD(AScriptFileName, s1, format('%s.%s.20%s',
    [copy(s2,1,2),copy(s2,3,2),copy(s2,5,2)]), s3, ADOASession, AShowFilterForm, ADesignerMode);
end;

end.
