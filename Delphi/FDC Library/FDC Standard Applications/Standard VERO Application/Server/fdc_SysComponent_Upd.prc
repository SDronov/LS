create or replace procedure fdc_SysComponent_Upd
-- Изменяет системную компоненту 
	(
	  pID		               number,           -- идентификатор компоненты
	  pName			           varchar2,         -- название            
    pBase_Type_ID		     number,           -- базовый объектный тип для работы с объектами
                                           -- которого предназначена компонента
	  pShortName		       varchar2 := null, -- короткое название
	  pDescript	           varchar2 := null  -- описание
	)
is
begin
  -- Вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- Изменение базового типа компоненты в fdc_SysComponent
  update fdc_SysComponent
     set Base_Type_ID = pBase_Type_ID
   where ID = pID;
   
end fdc_SysComponent_Upd;
/
