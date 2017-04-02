create or replace procedure fdc_Kind_Upd
-- Изменение пометки
	(
	  pID	number,                     -- идентификатор пометки
	  pName varchar2,                 -- название
	  pSysName varchar2,              -- системное название
	  pRate	number,                   -- значимость (0 - 100)
	  pIcon	varchar2,                 -- иконка пометки
	  pShortName varchar2,            -- короткое название
	  pDescript varchar2              -- описание
	)
is
begin
  -- проверяет, что значимость от 0 до 100
  if (pRate < 0) or (pRate > 100) then
	   fdc_util.abort('Значимость пометки должна быть от 0 до 100');
  end if;

  -- вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- изменяем fdc_Kind
  update fdc_Kind
     set Rate	= pRate,
     	   Icon	= pIcon
   where ID = pID;

  -- если нужно, то меняем системное имя
  fdc_Object_Upd_SysName(pID, pSysName);
end fdc_Kind_Upd;
/
