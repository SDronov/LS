create or replace function fdc_Procedure_Add
-- Создает новую процедуру и возвращает ее идентификатор 
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
  -- Проверка, что pObject_Type_SysName - потомок 'Procedure'
  fdc_Object_Type_Is(pObject_Type_SysName,'Procedure');

  -- Вызываем базовую функцию добавления серверной компоненты
  pNewID := fdc_Server_Component_Add(pObject_Type_SysName, pName, pBase_Type_ID, pSysName, pShortName, pDescript);

  -- Добавление записи в таблицу fdc_Procedure
  insert into fdc_Procedure(ID)
      values(pNewID);

  -- Регестрирует процедуру с суффиксом Del на конце как процедуру удаления
  -- для объектных типов, имеющих подходящее название    
  if (upper(pSysName) like '%DEL') then
	   fdc_Procedure_Reg_DelProc(pNewID);
  end if;

  return pNewID;
end fdc_Procedure_Add;
/
