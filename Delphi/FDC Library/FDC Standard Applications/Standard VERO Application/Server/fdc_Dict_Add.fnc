create or replace function fdc_Dict_Add
-- Добавление позиции справочника
	(
	pObject_Type_SysName	varchar2,      -- Системное имя типа справочника (должен быть подтипом 'Dict') 
	pOwner_Object_ID	number,            -- "Родительская" позиция того же справочника (для иерархических справочников)
	pName			varchar2,                  -- Наименование (текстовое значение)
  pShortName  varchar2,                -- Краткое наименование позиции справочника                         
	pCode			varchar2,                  -- Код позиции справочника (например, код ОКОНХ, ОКАТО)
	pCode2			varchar2 := null,        -- Дополнительный код позиции справочника (при необходимости)
	pDescript		varchar2 := null         -- Комментарий к позиции
	)
return number
is
  pChk number;
  pNewID number(15);
begin
  -- Проверка типа справочника  
  fdc_Object_Type_Is(pObject_Type_SysName,'Dict');
  
  -- Проверка типа родительской позиции
  if (pOwner_Object_ID is not null) and (fdc_Object_Is(pOwner_Object_ID, 'Dict') = 0) then
    Fdc_Util.Abort('Объект, указанный как родительская позиция в справочнике (ID='||pOwner_Object_ID||') не является позицией справочника');
  end if;
  
  -- Создание экземпляра объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName,pName,1,pOwner_Object_ID,null,pShortName,pDescript);
  
  -- Даем пользователю права на изменение объекта
  fdc_Object_Grant_Upd(pNewID, fdc_User_Get, 2, 1);
  
  -- Создание записи в fdc_Dict
  insert into fdc_Dict(ID,Code, Code2)
  values(pNewID, pCode, pCode2);
  
  return pNewID;
end fdc_Dict_Add;
/
