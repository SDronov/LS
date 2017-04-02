create or replace procedure fdc_Dict_Upd
-- Изменение атрибутов позиции справочника
	(
	pID			   number,                      -- Идентификатор позиции справочника
	pName			 varchar2,                    -- Наименование (текстовое значение) позиции справочника
  pShortName  varchar2,                   -- Краткое наименование позиции справочника                        
	pCode			 varchar2,                    -- Код позиции справочника
  pCode2     varchar2,                    -- Дополнительный код позиции справочника
	pDescript	 varchar2                     -- Комментарий к позиции справочника
	)
is
  pDict fdc_Dict%rowtype;
begin
  -- Проверка типа позиции справочника
  if (fdc_Object_Is(pID, 'Dict') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является позицией справочника');
  end if;

  -- Сначала изменение атрибутов объекта со всяческими проверками
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- Получение старого значения
  begin
    select *
    into pDict
    from fdc_Dict
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При попытке изменения не найдена позиция справочника ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения значений позиции справочника ID='||pID, 1);
  end;

  -- Изменение атрибутов записи fdc_Dict
  if Nvl(trim(pCode), 'No name') <> Nvl(pDict.Code, 'No name') or
     Nvl(trim(pCode2), 'No name') <> Nvl(pDict.Code2, 'No name') then
    update	fdc_Dict
    set	Code = pCode,
        Code2 = pCode2
    where	ID = pID;
  end if;  
  
end fdc_Dict_Upd;
/
