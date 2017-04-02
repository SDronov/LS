create or replace function fdc_Kind_Add
-- Создает новую пометку и возвращает его идентификатор
	(
	  pObject_Type_SysName varchar2,  -- системное имя объектного типа
	  pName varchar2,                 -- название
	  pSysName varchar2,              -- системное название
	  pRate	number,                   -- значимость (0 - 100)
	  pIcon	varchar2,                 -- иконка пометки
	  pShortName varchar2 := null,    -- короткое название
	  pDescript varchar2 := null      -- описание
	)
  return number
is
  pNewID number(15);
begin
  -- проверяет, что значимость от 0 до 100
  if (pRate < 0) or (pRate > 100) then
	   fdc_util.abort('Значимость пометки должна быть от 0 до 100');
  end if;

  -- Проверка, что pObject_Type_SysName - потомок 'Kind'
  fdc_Object_Type_Is(pObject_Type_SysName,'Kind');

  -- Создаем объект пометки
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 0, null, pSysName, pShortName, pDescript);
  
  -- Даем автору полный доступ к пометке
  fdc_Object_Grant_Upd(pNewID, fdc_User_Get, 3, 1);
  
  -- Добавляем запись в таблицу fdc_Kind
  insert into fdc_Kind(ID, Rate, Icon)
         values( pNewID, pRate, pIcon);

  -- Возвращаем идентификатор       
  return pNewID;
end fdc_Kind_Add;
/
