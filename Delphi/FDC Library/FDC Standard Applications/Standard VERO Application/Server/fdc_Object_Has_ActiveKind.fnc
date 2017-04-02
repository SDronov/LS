create or replace function fdc_Object_Has_ActiveKind
-- Определяет имеет ли объект какие-либо действующие пометки
-- Возвращает 1 - имеет, 0 - не имеет
	(
	  pID number
	)
    return number
is
  pChk number := 0;
begin
  -- Смотрим на наличие активных пометок
  begin
    select 1
      into pChk
      from fdc_Object_Lst O, fdc_Object_Kind PK
     where O.Owner_Object_ID = pID and
           PK.ID = O.ID and
 	         (fdc_Object_Is_Active(PK.ID,0) <> 0) and
	         (fdc_User_ReadAccess(PK.Kind_ID) <> 0);
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('Ошибка поиска пометок объекта с ID = '||pID, 1);
  end;           

  -- Возвращаем результат
  if (pChk = 0) then 
     return 0;
   else
     return 1;  
  end if;
end fdc_Object_Has_ActiveKind;
/
