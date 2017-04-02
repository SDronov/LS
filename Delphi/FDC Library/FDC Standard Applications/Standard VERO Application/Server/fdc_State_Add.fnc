create or replace function fdc_State_Add
-- Создает новое состояние и возвращает его идентификатор
	(
	  pObject_Type_SysName varchar2,    -- системное имя объектного типа 
	  pName	varchar2,                   -- название
	  pSysName varchar2,                -- системное имя состояния
	  pState_Scheme_ID number,          -- идентификатор схемы состояний
	  pActive	number,                   -- признак активности
	  pAllowUpdates number,             -- возможно ли изменение объекта в данном состоянии
  	pAllowDelete number,              -- возможно ли удаление объекта в данном состоянии
    pColor number := null,            -- цвет 
    pShortName varchar2 := null,      -- короткое название
	  pDescript varchar2 := null       -- описание
	)
    return number
is
  pNewID number(15);
  pCnt number := 0;
begin
  -- Проверка, что pObject_Type_SysName - потомок 'State'
  fdc_Object_Type_Is(pObject_Type_SysName,'State');

  -- Если указано системное имя состояния, то проверяем что состояние с таким
  -- системным именем уже не существует в данной схеме 
  if (trim(pSysName) is not null) then
     begin
	     select	1
	       into	pCnt
	       from	fdc_State S,
		          fdc_Object O
	      where	S.State_Scheme_ID = pState_Scheme_ID and
		          O.ID = S.ID and
		          upper(O.SysName) = upper(trim(pSysName)) and
              rownum <= 1;
     exception
	     when NO_DATA_FOUND then null;
  	   when others then fdc_util.abort('Ошибка при поиске состояния с системным именем ' || pSysName, 1);
     end;         
     
	   if pCnt = 1 then
		    fdc_util.abort('Состояние с системным именем '||pSysName||' уже есть в схеме '||fdc_Object_Get_Name(pState_Scheme_ID));
		    return 0;
	   end if;
  end if;

  -- Создаем объект схемы состояний
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, pState_Scheme_ID, pSysName, pShortName, pDescript);

  -- Заносим запись в таблицу fdc_State
  insert into fdc_State(ID, State_Scheme_ID, Active, AllowUpdates, AllowDelete, Color)
         values(pNewID, pState_Scheme_ID, pActive, pAllowUpdates, pAllowDelete, pColor);

  -- Возвращаем идентификатор состояния       
  return pNewID;
end fdc_State_Add;
/
