create or replace function fdc_Collection_Add
-- Создание подборки объектов
	(
	pObject_Type_SysName	varchar2,             -- Системное имя типа подборки (должен быть подтипом 'Collection') 
	pName			varchar2,                         -- Наименование подборки
  pShortName    varchar2,                     -- Краткое наименование подборки
	pUser_ID    number := null,                 -- Пользователь - владелец подборки. В случае NULL берется текущий подключенный пользователь
	pDescript		varchar2 := null,               -- Комментарий к подборке
	pDefCollection		number := 0               -- Создавать ли как текущую рабочую подборку
	)
return number
is
  pNewID number(15);
  ppUser_ID number(15);
begin
  -- Проверка типа подборки  
  fdc_Object_Type_Is(pObject_Type_SysName,'Collection');

  -- Получение идентификатора пользователя
  ppUser_ID := nvl(pUser_ID,fdc_User_Get);

  -- Создание экземпляра объекта (общий доступ закрыт)
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 0, null, null, pShortName, pDescript);

  -- Даем пользователю права на изменение и раздачу прав на объект
  fdc_Object_Grant_Upd(pNewID, ppUser_ID, 3, 1);

  -- Если создаем рабочую подборку - нужно снять признак "рабочей" с другой подборки
  if pDefCollection = 1 then
  	update	fdc_Collection
  	set	DefCollection = 0
  	where	User_ID = ppUser_ID and
          DefCollection = 1;
  end if;

  -- Создание записи в fdc_Collection
  insert into fdc_Collection(ID, User_Id, Coldate, Defcollection)
  values(pNewID, ppUser_ID, sysdate, pDefCollection);
  
  return pNewID;
end fdc_Collection_Add;
/
