create or replace function fdc_Object_Kind_Check
-- Проверяет имеет ли заданный объект данную пометку
-- Возвращает 1 - имеет, 0 - нет
  (
    pID number,             -- идентификатор объекта
    pKindSysName varchar2   -- системное имя пометки 
	)
    return number
is
  pChk number;
begin
 select 1
   into pChk
   from fdc_Object_Kind_Lst
  where KindSysName = pKindSysName
    and Object_ID = pID
    and rownum <= 1;
    
 return pChk;
exception
	  when NO_DATA_FOUND then return 0;
  	when others then fdc_util.Abort('Ошибка поиска пометки у объекта с ID = '||pID, 1);
end fdc_Object_Kind_Check;
/
