create or replace function fdc_View_Add
-- Создает новое представление и возвращает его идентификатор 
  (
	  pObject_Type_SysName varchar2,         -- системное имя типа процедуры
	  pName			           varchar2,         -- название            
    pBase_Type_ID		     number,           -- базовый объектный тип для работы с объектами
                                           -- которого предназначена процедура
	  pSysName		         varchar2,         -- системное имя процедуры          
	  pShortName		       varchar2 := null, -- короткое название
	  pDescript	           varchar2 := null  -- описание
	)
    return number
is
  pNewID number(15);
begin
  -- Проверка, что pObject_Type_SysName - потомок 'View'
  fdc_Object_Type_Is(pObject_Type_SysName,'View');

  -- Вызываем базовую функцию добавления серверной компоненты
  pNewID := fdc_Server_Component_Add(pObject_Type_SysName, pName, pBase_Type_ID, pSysName, pShortName, pDescript);

  -- Добавление записи в таблицу fdc_View
  insert into fdc_View(ID)
      values(pNewID);

  return pNewID;
end fdc_View_Add;
/
