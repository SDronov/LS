В интерфейсный модуль добавилась процедура 
procedure exp_PrintTR(AScriptFileName, ATR_NUMBER: string; ADOASession: TOracleSession; AShowFilterForm: boolean);

где
  AScriptFileName - имя и путь к скрипту;
  ATR_NUMBER - типографский номер таможенной расписки;
  ADOASession - сессия DOA;
  AShowFilterForm - если False, то промежуточноя форма ввода номера ТР не показывается.