create or replace procedure fdc_Person_Upd
-- Исменение атрибутов субъекта - юридического или физического лица
	(
	pID			number,
	pName			varchar2,                       -- Полное имя субъекта 
	pShortName		varchar2,                   -- Краткое имя субъекта 
	pSurName		varchar2,                     -- Фамилия для физ лиц, для юр лиц не заполняется
	pFirstName		varchar2,                   -- Имя для физлиц, для юрлиц не заполняется             
	pMiddleName		varchar2,                   -- Отчество для физлиц, для юрлиц не заполняется
  pOGRN     varchar2,                       -- Основной государственный регистрационный номер
	pINN			varchar2,                       -- Индивидуальный номер налогоплательщика
	pKPP			varchar2,                       -- Код причины постановки на налоговый учед (дополнительный под к ИНН)
	pOKPO			varchar2,                       -- Код по Общероссийскому классификатору предприятий и организаций
	pBIC			varchar2,                       -- Банковский идентификационный код
	pBirthDate		date,                       -- Дата рождения (регистрации организации) 
	pBirthYear		number,                     -- Год рождения (регистрации организации)
	pBirthLocation		varchar2,               -- Место рождения (регистрации организации)
  pOPF_Dict_ID number,                      -- Организационно-правовая форма организации. Ссылка на справочник ОКОПФ
	pDescript		varchar2                      -- Комментарий              
	)
is
  pPerson fdc_Person%rowtype;
  ppBirthYear number;
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'Person') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является субъектом');
  end if;
  
  -- Проверка параметров для юридических лиц
  if fdc_Object_Is(pID, 'Legal') = 1 then
    if trim(pName) is null or
       trim(pSurName) is not null or
       trim(pFirstName) is not null or
       trim(pMiddleName) is not null then
      fdc_Util.Abort('Неверные параметры при изменении юридического лица'); 
    end if;   
    if (pOPF_Dict_ID is not null) and (Fdc_Object_Is(pOPF_Dict_ID, 'Dict.OKOPF')<>1) then
      fdc_Util.Abort('Неверный тип справочника ОПФ при изменении юридического лица'); 
    end if; 
  end if;
  
  -- Проверка параметров для физических лиц
  if fdc_Object_Is(pID, 'Human') = 1 then
    if trim(pOGRN) is not null or
       trim(pKPP) is not null or
       trim(pOKPO) is not null or
       trim(pBIC) is not null or
       trim(pOPF_Dict_ID) is not null then
      fdc_Util.Abort('Неверные параметры при изменении физического лица'); 
    end if;   
  end if;
  
  -- Получение года
  ppBirthYear := nvl(pBirthYear, To_Number(To_Char(pBirthDate,'YYYY')));

  -- Сначала изменение атрибутов объекта со всяческими проверками
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  
  -- Получение существующего экземпляра субъекта
  begin
    select	*
    into	pPerson
    from	fdc_Person
    where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При выполнении изменения не найден субъект ID='||pID);
  	when others then fdc_util.Abort('При выполнении изменения ошибка получения информации о субъекте ID='||pID, 1);
  end;

  -- Есть ли изменения в атрибутике субъекта?
  if nvl(pSurName, '???') <> nvl(pPerson.Surname, '???') or
     nvl(pFirstName, '???') <> nvl(pPerson.Firstname, '???') or
     nvl(pMiddleName, '???') <> nvl(pPerson.Middlename, '???') or
     nvl(pOGRN, '???') <> nvl(pPerson.Ogrn, '???') or
     nvl(pINN, '???') <> nvl(pPerson.Inn, '???') or
     nvl(pKPP, '???') <> nvl(pPerson.KPP, '???') or
     nvl(pOKPO, '???') <> nvl(pPerson.OKPO, '???') or
     nvl(pBIC, '???') <> nvl(pPerson.BIC, '???') or
     nvl(pBirthDate, to_Date('01.01.1800', 'DD.MM.YYYY')) <> nvl(pPerson.BirthDate, to_Date('01.01.1800', 'DD.MM.YYYY')) or
     nvl(ppBirthYear, 0) <> nvl(pPerson.BirthYear, 0) or
     nvl(pBirthLocation, '???') <> nvl(pPerson.BirthLocation, '???') or
     nvl(pOPF_Dict_ID, 0) <> nvl(pPerson.OPF_Dict_ID, 0) then
    -- Внесение изменений в атрибутику субъекта
    update fdc_person
       set surname = pSurName,
           firstname = pFirstName,
           middlename = pMiddleName,
           ogrn = pOGRN,
           inn = pINN,
           kpp = pKPP,
           okpo = pOKPO,
           bic = pBIC,
           birthdate = pBirthDate,
           birthyear = ppBirthYear,
           birthlocation = pBirthLocation,
           opf_dict_id = pOPF_Dict_ID
     where id = pId;
  end if;

end fdc_Person_Upd;
/
