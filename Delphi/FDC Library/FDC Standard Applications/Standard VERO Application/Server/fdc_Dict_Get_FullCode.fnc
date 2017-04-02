create or replace function fdc_Dict_Get_FullCode
-- Получение полного кода позиции справочника, 
-- соединяющего все коды по иерархии позиций
	(
  pID number              -- Идентификатор позиции справочника
	)
return varchar2
is
  pFullCode varchar2(1500);
  pCode varchar2(1500);
  pOwnerID number;
begin
  -- Проверка типа позиции справочника
  if (fdc_Object_Is(pID, 'Dict') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является позицией справочника');
  end if;
  
  -- Начинаем с текущей позиции
  pOwnerID := pID;
  
  -- Раскручиваем иерархию позиций доверху
  while pOwnerID is not null loop
  	select	O.Owner_Object_ID, trim(D.Code)
  	into	pOwnerID, pCode
  	from	fdc_Dict D,
          fdc_Object O
  	where	O.ID = D.ID and
          D.ID = pOwnerID;
    -- Присоединяем к строке полученный код 
  	pFullCode := trim(pCode||pFullCode);
  end loop;
  
  return pFullCode;
end fdc_Dict_Get_FullCode;
/
