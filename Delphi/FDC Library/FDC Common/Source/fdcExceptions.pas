{
  Утилиты FDC, предоставляющие общий механизм обработки
  исключительных ситуаций. Поддерживается стек вызовов и сообщений,
  предназначенных для конечного пользователя, а также для разработчиков
  и тестеровщиков ПО.<p>
  Для обработки исключительной ситуации требуется вызвать метод
  GlobalExceptionHandler. Данный метод выполнит обработку исключительной
  ситуации и повторно создаст ее, что позволит обработать данную
  исключительную ситуацию на более высоком уровне стека вызовов.

  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcExceptions.pas $
  $Revision: 2525 $
  $Author: FORS\alexvolo $
  $Date: 2007-04-03 21:27:02 +0400 (Р’С‚, 03 Р°РїСЂ 2007) $
}

unit fdcExceptions;

{
  IMPORTANT:
    When GlobalExceptionHandler method handles some
    exception it re-raises new one of EfdcException
    type. So, original exception and any assosiated
    data will be lost.

  EXAMPLE:

    unit UnitA;
    ...
    procedure TClassA.MethodA;
    begin
      try
        ...
      except
        on E: Exception do
          GlobalExceptionHandler(
            E,
            'message for end user',
            'UnitA',
            ClassName,
            'MethodA');
      end
    end;
    ...
    end.

}

interface

uses SysUtils, Classes, Contnrs;

type

  { TfdcExceptionInfo }
  TfdcExceptionInfo = class(TObject)
  private
    FUnitName: string; // unit name
    FClassName: string; // class name
    FProcName: string; // procedure name
  public
    constructor Create(AUnitName, AClassName, AProcName: string);

    property UnitName: string read FUnitName;
    {$WARN HIDING_MEMBER OFF}
    property ClassName: string read FClassName;
    {$WARN HIDING_MEMBER ON}
    property ProcName: string read FProcName;
  end;

  TfdcExceptionInfoStack = class(TObjectList)
  private
    function GetItems(i: integer): TfdcExceptionInfo;
  public
    property Items[i: integer]: TfdcExceptionInfo read GetItems; default;
  end;

  { EfdcException }
  EfdcException = class(Exception)
  private
    FUserMessage: string; // message to user
    FUserHint: string;
    FCallStack: TfdcExceptionInfoStack; // exception call stack
  public
    constructor Create(AMessage: string; AExceptionInfo: TfdcExceptionInfo);
    destructor Destroy; override;

    { get details string }
    function GetDetailsString: string; virtual;

    property CallStack: TfdcExceptionInfoStack read FCallStack;
    property UserMessage: string read FUserMessage;
    property UserHint: string read FUserHint;
  end;

{ Метод обработки исключительной ситуации.
  Parameters:
  AException - Исключительная ситуация для обработки
  AUserMessage - Пользовательское сообщение
  AUserHint - Подсказка пользователю
  AUnitName - Имя модуля, в котором возникла исключительная ситуация
  AClassName - Имя класса, в котором возникла исключительная ситуация
  AProcName - Имя процедуры, в которой возникла исключительная ситуация
  Remarks:
    Обработав исключительную ситуацию, метод GlobalExceptionHandler
    создаст новую исключительную ситуацию типа EfdcException. Таким
    образом, исходная исключительная ситуация будет потеряна.
  Note:
    При незаполненных параметрах AUserMessage и AUserHint соответствующие поля
    EfdcException будут инициализированы значениями SDefaultUserMessage и
    SDefaultUserHint соответственно;
  Example:
  <Code>
    <b>unit</b> UnitA;
    ...
    <b>procedure</b> TClassA.MethodA;
    <b>begin</b>
      <b>try</b>
        ...
      <b>except</b>
        <b>on</b> E: Exception <b>do</b>
          GlobalExceptionHandler(
            E,
            'Пользовательское сообщение',
            'Подсказка пользователю',
            'UnitA',
            ClassName,
            'MethodA');
      <b>end</b>;
    <b>end</b>;
    ...
    <b>end</b>.
}
procedure GlobalExceptionHandler(AException: Exception; AUserMessage,
  AUserHint, AUnitName, AClassName, AProcName: string);

{
  Попытка выделить из строки сообщения об ошибке необходимую для
  пользователя информацию. Подразумеавается что строка сообщения
  формируется по шаблону:
    ...<<UserMessage>>...<<UserHint>>...
}
procedure ParseError(E: Exception; var AUserMessage, AUserHint: string);

{
  Обработать ошибку. При этом происходит выделение необходимой для
  пользователя информации об ошибке и возбуждается новая исключительная
  ситуация, содержащая эту необходимую информацию.
}
procedure HandleError(E: Exception);

implementation

uses
  QueryList;

resourcestring
  SDefaultUserMessage = 'Ошибка выполнения операции';
  SDefaultUserHint = 'Обратитесь к администратору системы';
  SErrorOracleLogOnMessage = 'Ошибка соединения с сервером БД';
  SErrorOracleLogOnHint = 'Если ошибка будет повторяться, обратитесь к администратору базы данных Oracle';
  SErrorOracleLoginIsNullHint = 'Введите имя пользователя';
  SErrorOraclePasswordIsNullHint = 'Введите пароль';
  SErrorOracleInvalidLoginPasswordHint = 'Проверьте правильность указания имени пользователя и пароля. Если ошибка будет повторяться, обратитесь к администратору базы данных Oracle.';
  SErrorOracleInvalidServerHint = 'Проверьте правильность указания имени сервера. Если ошибка будет повторяться, обратитесь к администратору базы данных Oracle.';
  SErrorOracleAccessRightsMessage = 'Недостаточно прав';
  SErrorOracleAccessRightsHint = 'Недостаточно прав на выполнение действия. Обратитесь к администратору системы.';
  SErrorOracle4068Hint = 'Состояние объекта(ов) базы данных изменилось, попробуйте повторить операцию. Если ошибка будет повторяться, обратитесь к администратору системы';

  SErrorMessageHeader = 'Ошибка:';
  SErrorCallStackHeader = 'Стек:';
  SNoErrorMessage = '(Описание отсутствует)';
  SNoErrorCallStack = '(Записи отсутствуют)';
  SSeparator = '.';
  SClauseShift = '   ';
  SBeginTag = '<<';
  SEndTag = '>>';

  { TfdcExceptionInfo }

constructor TfdcExceptionInfo.Create(AUnitName, AClassName, AProcName: string);
begin
  inherited Create;
  FUnitName := AUnitName;
  FClassName := AClassName;
  FProcName := AProcName;
end;

{ TfdcExceptionInfoStack }

function TfdcExceptionInfoStack.GetItems(i: integer): TfdcExceptionInfo;
begin
  Result := TfdcExceptionInfo(inherited Items[i]);
end;

{ EfdcException }

constructor EfdcException.Create(AMessage: string; AExceptionInfo: TfdcExceptionInfo);
begin
  inherited Create(AMessage);
  FUserMessage := SDefaultUserMessage;
  FUserHint := SDefaultUserHint;
  FCallStack := TfdcExceptionInfoStack.Create(True);
  FCallStack.Add(AExceptionInfo);
end;

destructor EfdcException.Destroy;
begin
  FCallStack.Free;
  inherited;
end;

function EfdcException.GetDetailsString: string;
var
  Strs: TStrings;
  s: string;
  i: integer;

  function AddSeparator(Strs: array of string): string;
  var
    i: integer;
  begin
    Result := '';
    for i := Low(Strs) to High(Strs) do
      if Strs[i] <> '' then
        Result := Result + Strs[i] + SSeparator;
    Delete(Result, Length(Result), 1);
  end;

begin
  { exception message }
  Strs := TStringList.Create;
  try
    if Message <> '' then
      Strs.Text := Message
    else
      Strs.Text := SNoErrorMessage;
    for i := 0 to Strs.Count - 1 do
      Strs[i] := SClauseShift + Strs[i];
    Result := SErrorMessageHeader + #13 + Strs.Text + #13;
  finally
    Strs.Free;
  end;

  { exception call stack }
  s := SClauseShift;
  for i := CallStack.Count - 1 downto 0 do
  begin
    s := s + AddSeparator([CallStack[i].UnitName,
      CallStack[i].ClassName,
        CallStack[i].ProcName]) + #13 +
      SClauseShift;
  end;
  Result := Result + SErrorCallStackHeader + #13 + s;
end;

{ global exception handler }

procedure GlobalExceptionHandler(AException: Exception; AUserMessage, AUserHint, AUnitName,
  AClassName, AProcName: string);
var
  ExceptionInfo: TfdcExceptionInfo;
  NewException: EfdcException;
  ExceptionText: string;
  i: integer;
begin
  { create new exception }
  ExceptionInfo := TfdcExceptionInfo.Create(AUnitName, AClassName, AProcName);
  if Assigned(AException) then
    ExceptionText := AException.Message
  else
    ExceptionText := '';
  NewException := EfdcException.Create(ExceptionText, ExceptionInfo);

  { process given message and hint }
  AUserMessage := AUserMessage;
  AUserHint := AUserHint;

  { fill call exception info }
  if Assigned(AException) and
    (AException is EfdcException) then
  begin
    { try to get user message text from current exception }
    if (EfdcException(AException).UserMessage <> '') and
      (EfdcException(AException).UserMessage <> SDefaultUserMessage) then
      AUserMessage := EfdcException(AException).UserMessage;
    { try to get user hint text from current exception }
    if (EfdcException(AException).UserHint <> '') and
      (EfdcException(AException).UserHint <> SDefaultUserHint) then
      AUserHint := EfdcException(AException).UserHint;
    { copy call stack }
    EfdcException(AException).FCallStack.OwnsObjects := False;
    for i := 0 to EfdcException(AException).FCallStack.Count - 1 do
      NewException.FCallStack.Add(EfdcException(AException).FCallStack[i]);
    EfdcException(AException).FCallStack.Clear;
  end;

  { set message and hint to new exception }
  if AUserMessage <> '' then
    NewException.FUserMessage := AUserMessage;
  if AUserHint <> '' then
    NewException.FUserHint := AUserHint;

  { raise new exception }
  raise NewException;
end;

procedure ParseError(E: Exception; var AUserMessage, AUserHint: string);
var
  p: integer;
  lex: string;
begin
  AUserMessage := SDefaultUserMessage;
  AUserHint    := E.Message;

  { ORA-01004: default username feature not supported; logon denied }
  if Pos('ORA-01004', E.Message) > 0 then
  begin
    AUserMessage := SErrorOracleLogOnMessage;
    AUserHint := SErrorOracleLoginIsNullHint;
  end
  else
  { ORA-01005: null password given; logon denied }
  if Pos('ORA-01005', E.Message) > 0 then
  begin
    AUserMessage := SErrorOracleLogOnMessage;
    AUserHint := SErrorOraclePasswordIsNullHint;
  end  
  else
  { ORA-01017: invalid username/password; logon denied }
  if Pos('ORA-01017', E.Message) > 0 then
  begin
    AUserMessage := SErrorOracleLogOnMessage;
    AUserHint := SErrorOracleInvalidLoginPasswordHint;
  end  
  else
  { ORA-12154: TNS could not pesolve service name }
  { ORA-12560: TNS protocol adapter error }
  if (Pos('ORA-12154', E.Message) > 0) or
     (Pos('ORA-12560', E.Message) > 0) then
  begin
    AUserMessage := SErrorOracleLogOnMessage;
    AUserHint := SErrorOracleInvalidServerHint;
  end
  else
  { ORA-00942: table or view does not exists }
  { PLS-00201: identifier 'string' must be declared }
  if (Pos('ORA-00942', E.Message) > 0) or (Pos('ORA-00904', E.Message) > 0) or
     (Pos('PLS-00201', E.Message) > 0) then
  begin
    AUserMessage := SErrorOracleAccessRightsMessage;
    AUserHint    := SErrorOracleAccessRightsHint;
  end
  // ORA-04068: existing state of package has been discarded
  else
  if (Pos('ORA-04068', E.Message) > 0) then
  begin
    AUserHint  := SErrorOracle4068Hint;
  end
  ;

  { extract user message and hint }
  lex := E.Message;
  p := Pos(sBeginTag, lex);
  if p > 0 then begin
    lex := Copy(lex, p + Length(sBeginTag), Length(lex));
    p := Pos(sEndTag, lex);
    if p > 0 then begin
      AUserMessage := Copy(lex, 1, p - 1);
      lex := Copy(lex, p + Length(sBeginTag), Length(lex));
      p := Pos(sBeginTag, lex);
      if p > 0 then begin
        lex := Copy(lex, p + Length(sBeginTag), Length(lex));
        p := Pos(sEndTag, lex);
        if p > 0 then begin
          AUserHint := Copy(lex, 1, p - 1);
        end;
      end;
    end;
  end;

  { update exception message }
  E.Message := StringReplace(E.Message, sBeginTag, '', [rfReplaceAll, rfIgnoreCase]);
  E.Message := StringReplace(E.Message, sEndTag,   '', [rfReplaceAll, rfIgnoreCase]);
  if E is EOracleSQLError then
  begin
    E.Message := Format('%s.'#13'SQL Оператор:'#13'%s'#13'Переменные:'#13'%s',
       [E.Message, EOracleSQLError(E).SQLText, EOracleSQLError(E).Variables.Text]);
  end;
end;

procedure HandleError(E: Exception);
var
  UserMessage: string;
  UserHint: string;
begin
  ParseError(E, UserMessage, UserHint);
  GlobalExceptionHandler(E, UserMessage, UserHint, '', '', '');
end;

end.

