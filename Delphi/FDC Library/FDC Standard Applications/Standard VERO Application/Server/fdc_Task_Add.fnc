create or replace function fdc_Task_Add
-- Создает новую задачу и возвращает ее идентификатор
	(
	  pObject_Type_SysName	varchar2,         -- системное имя объектного типа задачи
	  pName			            varchar2,         -- название
    pSysName              varchar2,         -- системное имя задачи
    pShortName		        varchar2 := null, -- короткое название
	  pDescript		          varchar2 := null  -- описание
	)
    return number
is
  pNewID number(15);
begin
  -- Проверка, что pObject_Type_SysName - потомок 'Task'
  fdc_Object_Type_Is(pObject_Type_SysName,'Task');

  -- Создаем объект задачи
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, pSysName, pShortName, pDescript);
 
  -- Даем специальный полный доступ администраторам задач к новой задаче
  fdc_Object_Grant_Upd(pNewID, fdc_User_Group_Get_AdminTask, 3, 1);

  -- Заносим запись в таблицу fdc_Table
  insert into fdc_Task(ID)
      values(pNewID);

  -- Возвращаем идентификатор новой задачи    
  return pNewID;
end fdc_Task_Add;
/
