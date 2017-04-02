create or replace procedure fdc_Object_Type_Upd
-- Изменение данных объектного типа
	(
	  pID number,                       -- идентификатор типа
	  pName varchar2,                   -- название
	  pSysName varchar2,                -- системное имя
    pShortName varchar2,              -- короткое название
	  pTableName varchar2,              -- таблица, в которой хранятся объекты этого типа
  	pIcon varchar2,                   -- иконка
	  pState_Scheme_ID number,          -- схема состояний 
	  pDescript varchar2                -- описание
	)
is
  ppIcon varchar2(4000);
  pOld fdc_Object_Type_Lst%rowtype;
  pCnt number := 0;
begin
  -- начитываем старые значения объектного типа  
  begin
    select *
      into pOld
      from fdc_Object_Type_Lst
     where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При изменении не найден объектный тип по ID = '||pID);
  	when others then fdc_util.Abort('Ошибка получения значений объектного типа по ID = '||pID, 1);
  end;    

  -- если иконка не задана, то пытаемся взять ее у типа - родителя
  ppIcon := pIcon;
  if (trim(ppIcon) is null) and (pOld.Parent_Object_Type_ID is not null) then
	   begin
	     select	T.Icon
	       into	ppIcon
	       from	fdc_Object_Type T
	      where	T.ID = pOld.Parent_Object_Type_ID;
	   exception 
       when NO_DATA_FOUND then null;
       when others then fdc_util.Abort('Ошибка получения иконки типа - родителя по ID = '||pOld.Parent_Object_Type_ID, 1);     
	   end;
  end if;

  -- если изменяем схему состояний на другую, то смотрим есть ли объекты этого типа 
  -- с непустыми состояними. Если есть, то исключение.
  if (pOld.State_Scheme_ID is not null) and (pState_Scheme_ID is not null) 
        and (pState_Scheme_ID <> pOld.State_Scheme_ID) then
     begin
	     select	1
	       into	pCnt
	       from	fdc_Object
	      where	Object_Type_ID = pID and
		          (State_ID is not null) and
              rownum <= 1;
     exception 
       when NO_DATA_FOUND then null;
       when others then fdc_util.Abort('Ошибка поиска объектов данного типа с непустым состоянием по ID = '||pID, 1);     
	   end;         
     
	   if (pCnt <> 0) then
		    fdc_util.abort('Существуют объекты в состояниях этой схемы. '||chr(10)||
			                 'Изменение схемы при таких условиях пока не реализовано');
		    return;
	   end if;
  end if;

  -- если хотим сбросить схему состояний типа (сделать ее NULL), то сбрасываем и 
  -- все состояния объектов этого типа
  if (pState_Scheme_ID is null) and (pOld.State_Scheme_ID is not null) then
	   update	fdc_Object
	      set	State_ID = null
	    where	Object_Type_ID = pID;
  end if;

  -- если тип не инстанцируется в таблице fdc_object, то он не может иметь схему состояний
  if (pState_Scheme_ID is not null) and (pOld.ObjectTableInstance = 0) then
     fdc_util.abort('Неинстанцируемый в объектах тип не может иметь схемы состояний!');
  end if;
  
  -- изменяем значения объектного типа. 
  -- Название и Короткое название меняются в fdc_Object_Upd
  update fdc_Object_Type
     set SysName = pSysName,  
	       TableName = pTableName,
	       Icon = ppIcon,
	       State_Scheme_ID = pState_Scheme_ID
   where ID = pID;

  -- Изменяем характеристики объектного типа в таблице fdc_Object 
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- Меняем системное имя объектного типа, если нужно
  if (pOld.SysName <> pSysName) then
	   fdc_Object_Upd_SysName(pID, pSysName);
  end if;
exception
  when others then
    Fdc_Util.Abort('Не прошло изменение объектного типа '||pName||'(ID='||pID||'):', 1);      
end fdc_Object_Type_Upd;
/
