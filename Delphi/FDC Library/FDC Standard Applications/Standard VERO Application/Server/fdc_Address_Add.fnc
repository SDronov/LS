create or replace function fdc_Address_Add
-- Создание адреса
	(
	pObject_Type_SysName	varchar2,             -- Системное имя типа адреса (должен быть подтипом 'Address') 
	pName			varchar2,                         -- Наименование (строка адреса)
  pOwner_ID number := null,                   -- Владелец - Объект, к которому относится адрес (сейчас проверяется, что это подтип субъекта)                                  
  pCountry_Dict_ID number := null,            -- Идентификатор страны по справочнику стран
  pDescript varchar2 := null                  -- Описание  
	)
return number
is
  pNewID number(15);
begin
  -- Проверка типа адреса  
  fdc_Object_Type_Is(pObject_Type_SysName,'Address');

  -- Проверка строки адреса
  if trim(pName) is null then
    fdc_Util.Abort('При создании адреса не допускается пустая адресная строка');
  end if;
  
  -- Проверка владельца
  if pOwner_ID is not null and Fdc_Object_Is(pOwner_ID, 'Person') = 0 then
    fdc_Util.Abort('При создании адреса передан неверный идентификатор владельца');
  end if;
  
  -- Проверка идентификатора страны
  if pCountry_Dict_ID is not null and Fdc_Object_Is(pCountry_Dict_ID, 'Dict.OKSM') = 0 then
    fdc_Util.Abort('При создании адреса передан неверный идентификатор страны');
  end if;

  -- Создание экземпляра объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, pOwner_ID, null, null, pDescript);

  -- Даем пользователю права на изменение и раздачу прав на объект
  fdc_Object_Grant_Upd(pNewID, Fdc_User_Get, 3, 1);

  -- Создание записи в fdc_Address
  insert into fdc_Address(ID, Country_Dict_ID)
  values(pNewID, pCountry_Dict_ID);
  
  return pNewID;
end fdc_Address_Add;
/
