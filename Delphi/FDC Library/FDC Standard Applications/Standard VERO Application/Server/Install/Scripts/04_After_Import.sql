@@Define_Variables.sql
spool &&INSTALL_LOG_PATH\04_After_Import.log

-- Инициализация схемы ВЕРО.
-- Исполняется от имени пользователя - владельца схемы ВЕРО после импорта

PROMPT **************************************************************************
PROMPT Подключение к серверу &&SERVER_NAME от имени пользователя &&VERO_USER...
PROMPT

connect &&VERO_USER/&&VERO_USER_PASSWORD@&&SERVER_NAME

begin
  fdc_Service.New_Location;
end;
/

PROMPT **************************************************************************
PROMPT Установка серверной части ВЕРО успешно завершена.

exit