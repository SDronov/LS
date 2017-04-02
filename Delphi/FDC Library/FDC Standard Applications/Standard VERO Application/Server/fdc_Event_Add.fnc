create or replace function fdc_Event_Add
-- Создание экземпляра события
	(
	pEvent_Type_SysName	varchar2,             -- системное имя типа события
	pName			varchar2,                       -- имя события
	pObject_ID		number,                     -- объект, по которому произошло событие
	pDescript		varchar2 := null,             -- описание события
  pProgram    varchar2 := null              -- название программы, инициировавшей событие
	)
return number
is
pNewID 		number(15);
pMachine	varchar2(1500);
pEvent_Type_ID number;
begin
  -- Проверка, что это действительно тип события
  fdc_Object_Type_Is(pEvent_Type_SysName,'Event');
  
  -- Получение идентификатора нового события
  pNewID := fdc_Object_Get_NewKey;
  
  -- Получение имени машины, с которой инициировано событие
  pMachine := SYS_CONTEXT('USERENV','HOST');
  
  -- Получение идентификатора типа события
  pEvent_Type_ID := Fdc_Object_Get_BySysName('EventType', pEvent_Type_SysName);
  
  -- Добавление записи в таблицу fdc_Event
  insert into fdc_Event(ID,Object_ID,Moment, Login, Program, Machine, Event_Type_Id, Name, Descript)
  values(pNewID,pObject_ID,sysdate,user,pProgram, pMachine, pEvent_Type_ID, pName, pDescript);
  
  -- Возврат идентификатора нового события
  return pNewID;
exception
  when others then
    fdc_Util.Abort('Ошибка создания события ', 1);  
end fdc_Event_Add;
/
