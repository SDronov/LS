create or replace function fdc_Session_Is_Waiting (pSession_ID number)
return number is
-- Проверить, действительно ли завершенный процесс - ожидающий
-- возвращает 1 если ожидающая или 0 если нет
begin
  return fdc_dispatch.session_iswaiting(pSession_ID);
end fdc_Session_Is_Waiting;
/
