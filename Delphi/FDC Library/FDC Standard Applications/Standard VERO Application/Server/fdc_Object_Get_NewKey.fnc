create or replace function fdc_Object_Get_NewKey
-- Возвращает следующее значение последовательности как следующее
-- значение идентификатора объекта
return number
is
  Result number(15);
begin
  select FDC_OBJECT_KEY_SQ.NextVal
    into Result
    from dual;

  return Result;
end fdc_Object_Get_NewKey;
/
