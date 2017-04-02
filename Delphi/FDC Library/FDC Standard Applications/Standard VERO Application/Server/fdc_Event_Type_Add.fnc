create or replace function fdc_Event_Type_Add
-- Создание типа события
	(
	pObject_Type_SysName	varchar2,             -- Системное имя типа "тип события"(должно быть наследником 'EventType') 
	pName			varchar2 := null,                 -- Полное наименование создаваемого типа
	pSysName		varchar2,                       -- Системное имя создаваемого типа
  pShortName		varchar2,                     -- Краткое наименование создаваемого типа (практически нигде не используется, стандартов на него нет) 
	pTableName		varchar2,                     -- Наименование таблицы для данных этого типа (если null, берется с родительского типа)  
	pIcon			varchar2,                         -- Иконка типа в виде строки (Если null, берется с родительского типа)
	pParent_Event_Type_ID	number,               -- Родительский тип события(всегда not null!)
	pDescript		varchar2 := null                -- Комментарий к типу события
	)
return number
is
pNewID number(15);
begin
  -- Проверка, что это действительно тип события   
  fdc_Object_Type_Is(pObject_Type_SysName,'EventType');
  
  -- Создание нового объектного типа
  pNewID := fdc_Object_Type_Add(
  		pObject_Type_SysName,
  		pName,
  		pSysName,
      pShortName,
  		pTableName,
  		pIcon,
  		null,
  		pParent_Event_Type_ID,
      0,
  		pDescript);
  
  -- "Наследование" в таблице fdc_Event_Type
  insert into fdc_Event_Type(ID)
  values(pNewID);
  
  -- Возврат идентификатора нового типа события
  return pNewID;
end fdc_Event_Type_Add;
/
