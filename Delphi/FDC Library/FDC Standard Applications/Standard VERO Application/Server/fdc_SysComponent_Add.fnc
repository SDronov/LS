create or replace function fdc_SysComponent_Add
-- Создает новую системную компоненту и возвращает ее идентификатор 
	(
	  pObject_Type_SysName varchar2,         -- системное имя типа компоненты
	  pName			           varchar2,         -- название            
    pBase_Type_ID		     number,           -- базовый объектный тип для работы с объектами
                                           -- которого предназначена компонента
	  pSysName		         varchar2,         -- системное имя компоненты          
	  pShortName		       varchar2 := null, -- короткое название
	  pDescript	           varchar2 := null  -- описание
	)
    return number
is
  pNewID number(15);
begin
  -- Проверка, что pObject_Type_SysName - потомок 'SysComponent'
  fdc_Object_Type_Is(pObject_Type_SysName,'SysComponent');

  -- Вызываем базовую функцию добавления объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, pSysName, pShortName, pDescript);
  
  -- Даем полные права на объект для администраторов задач (группа AdminTask)
  fdc_Object_Grant_Upd(pNewID, fdc_User_Group_Get_AdminTask, 3, 1);

  -- Добавление записи в таблицу fdc_SysComponent
  insert into fdc_SysComponent(ID, Base_Type_ID)
      values(pNewID, pBase_Type_ID);

  return pNewID;
end fdc_SysComponent_Add;
/
