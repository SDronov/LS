create or replace function fdc_Server_Component_Add
-- Создает новую серверную компоненту и возвращает ее идентификатор 
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
  -- Проверка, что pObject_Type_SysName - потомок 'ServerComponent'
  fdc_Object_Type_Is(pObject_Type_SysName,'ServerComponent');

  -- Вызываем базовую функцию добавления системной компоненты
  pNewID := fdc_SysComponent_Add(pObject_Type_SysName, pName, pBase_Type_ID, pSysName, pShortName, pDescript);

  -- Добавление записи в таблицу fdc_ServerComponent
  insert into fdc_Server_Component(ID)
        values(pNewID);
        
  return pNewID;
end fdc_Server_Component_Add;
/
