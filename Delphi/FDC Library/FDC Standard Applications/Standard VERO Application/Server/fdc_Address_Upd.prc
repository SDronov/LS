create or replace procedure fdc_Address_Upd
-- Изменение атрибутов адреса
	(
	pID			number,                             -- Идентификатор адреса
	pName			varchar2,                         -- Наименование (строка адреса)
  pCountry_Dict_ID number,                    -- Идентификатор страны по справочнику стран
  pDescript varchar2                          -- Описание
	)
is
  pAddress fdc_Address%rowtype;
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'Address') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является адресом');
  end if;

  -- Сначала изменение атрибутов объекта со всяческими проверками
  fdc_Object_Upd(pID, pName, null, pDescript);
  
  -- Получение старого значения
  begin
    select *
    into pAddress
    from fdc_Address
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При попытке изменения не найден адрес ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения значений адреса ID='||pID, 1);
  end;

  -- Изменение атрибутов записи fdc_Address
  if Nvl(pCountry_Dict_ID, -1) <> Nvl(pAddress.Country_Dict_ID, -1) then
    update Fdc_Address
    set Country_Dict_ID = pCountry_Dict_ID
    where ID = pID;
  end if;   

end fdc_Address_Upd;
/
