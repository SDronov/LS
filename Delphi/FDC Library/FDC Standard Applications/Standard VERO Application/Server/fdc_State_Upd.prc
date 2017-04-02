create or replace procedure fdc_State_Upd
-- Изменение состояния
	(
	  pID		number,             -- идентификатор состояния 
	  pName		varchar2,         -- название
	  pSysName 	varchar2,       -- системное имя состояния
	  pActive		number,         -- признак активности
	  pAllowUpdates	number,     -- возможно ли изменение объекта в данном состоянии
	  pAllowDelete	number,     -- возможно ли удаление объекта в данном состоянии
    pColor	number,           -- цвет
    pShortName varchar2,      -- короткое название
	  pDescript varchar2        -- описание
	)
is
begin
  -- вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- изменяем fdc_State
  update fdc_State
     set AllowUpdates = pAllowUpdates,
	       AllowDelete = pAllowDelete,
	       Active = pActive,
         Color	= pColor
   where ID = pID;

  -- если нужно, то меняем системное имя
  fdc_Object_Upd_SysName(pID, pSysName);
end fdc_State_Upd;
/
