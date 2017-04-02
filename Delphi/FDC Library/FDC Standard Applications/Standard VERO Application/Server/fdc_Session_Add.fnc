create or replace function fdc_Session_Add
-- Создание процесса обработки данных
	(
	pObject_Type_SysName	varchar2,       -- Системное имя процесса обработки данных (должен быть подтипом 'Session')
	pInitial_Session_ID number,           -- Идентификатор предыдущго (инициализирующего) процесса
  pDescript		varchar2 := null          -- Описание процесса обработки данных
  )
return number
is
  pNewID number(15);
  pTypeName varchar2(2000);
  pName varchar2(2000); 
  pSysDate date := sysdate;
begin
  -- Проверка типа процесса
  fdc_Object_Type_Is(pObject_Type_SysName,'Session');
  
  -- Получение имени типа процесса
  begin
    select Name
    into pTypeName
    from Fdc_Object_Type_Lst
    where SysName = pObject_Type_SysName; 
  exception
    when others then
      raise_application_error(-20201, 'Ошибка определения типа сессии: '||pObject_Type_SysName);
  end;
  
  -- Назначение названия процесса
  pName := pTypeName || ' от ' || to_char(pSysdate, 'DD.MM.YYYY HH24-MI-SS');
  
  -- Создание экземпляра объекта (Общий доступ закрыт!)
  pNewID := fdc_object_add(pobject_type_sysname => pObject_Type_SysName,
                           pname => pName,
                           paccesslevel => 0,
                           pdescript => pDescript);
  
  -- Здесь при необходимости должен быть грант на доступ прикладному администратору,
  -- осуществляющему мониторинг системы
  -- fdc_Object_Grant_Upd...
  
  -- Занесение информации о процессе в fdc_Session
  INSERT INTO FDC_SESSION(id, initial_session_id, end_session_id, 
                          local_id, dt_start, dt_end, 
                          message, job_id)
  values (pNewID, pInitial_Session_ID, 0,
          null, pSysDate, null,
          null, null);
  
  
  -- Перевод статуса на инициализирующий
  fdc_object_upd_state(pNewID, Fdc_Object_Get_Bysysname('StateTransit', 'SessionTransitCreate'));
          
  return pNewID;
end;
/
