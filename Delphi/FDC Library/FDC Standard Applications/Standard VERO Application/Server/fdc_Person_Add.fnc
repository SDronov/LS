create or replace function fdc_Person_Add
-- Создание нового субъекта - юридического или физического лица
	(
	pObject_Type_SysName	varchar2,           -- Системное имя типа объекта (например, 'Legal', 'Human')
	pName			varchar2,                       -- Полное имя субъекта 
	pShortName		varchar2,                   -- Краткое имя субъекта 
	pSurName		varchar2,                     -- Фамилия для физ лиц, для юр лиц не заполняется
	pFirstName		varchar2,                   -- Имя для физлиц, для юрлиц не заполняется             
	pMiddleName		varchar2,                   -- Отчество для физлиц, для юрлиц не заполняется
  pOGRN     varchar2,                       -- Основной государственный регистрационный номер
	pINN			varchar2,                       -- Индивидуальный номер налогоплательщика
	pKPP			varchar2:=null,                 -- Код причины постановки на налоговый учед (дополнительный под к ИНН)
	pOKPO			varchar2:=null,                 -- Код по Общероссийскому классификатору предприятий и организаций
	pBIC			varchar2:=null,                 -- Банковский идентификационный код
	pBirthDate		date:=null,                 -- Дата рождения (регистрации организации) 
	pBirthYear		number:=null,               -- Год рождения (регистрации организации)
	pBirthLocation		varchar2 := null,       -- Место рождения (регистрации организации)
  pOPF_Dict_ID number := null,              -- Организационно-правовая форма организации. Ссылка на справочник ОКОПФ
	pDescript		varchar2:=null                -- Комментарий              
	)
return number
is
  pNewID number(15);
  ppBirthYear number;
begin
  -- Проверка типа объекта: он должен быть подтипом Person
  fdc_Object_Type_Is(pObject_Type_SysName,'Person');
  
  -- Проверка параметров для юридических лиц
  if Fdc_Object_Type_Is_Subtype(pObject_Type_SysName, 'Legal') = 1 then
    if trim(pName) is null or
       trim(pSurName) is not null or
       trim(pFirstName) is not null or
       trim(pMiddleName) is not null then
      fdc_Util.Abort('Неверные параметры при создании юридического лица'); 
    end if;   
    if (pOPF_Dict_ID is not null) and (Fdc_Object_Is(pOPF_Dict_ID, 'Dict.OKOPF')<>1) then
      fdc_Util.Abort('Неверный тип справочника ОПФ при создании юридического лица'); 
    end if; 
  end if;
  
  -- Проверка параметров для физических лиц
  if Fdc_Object_Type_Is_Subtype(pObject_Type_SysName, 'Human') = 1 then
    if trim(pOGRN) is not null or
       trim(pKPP) is not null or
       trim(pOKPO) is not null or
       trim(pBIC) is not null or
       trim(pOPF_Dict_ID) is not null then
      fdc_Util.Abort('Неверные параметры при создании физического лица'); 
    end if;   
  end if;
  
  -- Получение года
  ppBirthYear := nvl(pBirthYear, To_Number(To_Char(pBirthDate,'YYYY')));
  
  -- Создание экземпляра объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, null, pShortName, pDescript);

  -- Добавлений записи в таблицу fdc_Person  
  insert into fdc_person
    (id, surname, firstname, middlename, ogrn, inn, kpp, okpo, bic, birthdate, birthyear, birthlocation, opf_dict_id)
  values
    (pNewID, pSurName, pFirstName, pMiddleName, 
     trim(pOGRN), trim(pINN), trim(pKPP), trim(pOKPO), trim(pBIC),
     pBirthDate, ppBirthYear, trim(pBirthLocation), pOPF_Dict_ID);
  
  return pNewID;
end fdc_Person_Add;
/
