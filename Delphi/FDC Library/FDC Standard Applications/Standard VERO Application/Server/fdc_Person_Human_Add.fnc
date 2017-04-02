create or replace function fdc_Person_Human_Add
-- Создание нового субъекта - физического лица
	(
	pObject_Type_SysName	varchar2,           -- Системное имя типа объекта (подтип 'Human')
	pSurName		varchar2,                     -- Фамилия 
	pFirstName		varchar2,                   -- Имя          
	pMiddleName		varchar2,                   -- Отчество
	pINN			varchar2,                       -- Индивидуальный номер налогоплательщика
	pBirthDate		date:=null,                 -- Дата рождения
	pBirthYear		number:=null,               -- Год рождения
	pBirthLocation		varchar2 := null,       -- Место рождения
	pName			varchar2 := null,               -- Полное имя субъекта (если NULL, формируется как ФИО)
	pShortName		varchar2 := null,           -- Краткое имя субъекта  (если NULL, формируется как Фамилия и инициалы)
	pDescript		varchar2:=null                -- Комментарий              
	)
return number
is
  ppName varchar2(1500);
  ppShortName varchar2(1500);
begin
  -- Проверка типа
  Fdc_Object_Type_Is(pObject_Type_SysName, 'Human');

  -- Получение имен для физического лица
  -- Исходим из предположения, что обязательно есть Фамилия (имя-отчество опционально)
  -- и из них формируются Name, ShortName
  -- В перспективе можно дописать извлечение ФИО (при их отсутствии) из Name
  if pSurName is null then
    fdc_Util.Abort('При создании физического лица должна быть указана его фамилия');
  end if;
  ppName := pName;
  ppShortName := pShortName;
  if ppName is null then
    ppName := trim(trim(pSurName)||' '||trim(pFirstName)||' '||trim(pMiddleName));
  end if;
  if ppShortName is null then
    ppShortName := trim(pSurName);
    if pFirstName is not null then
      ppShortName := ppShortName || ' ' || substr(pFirstName, 1, 1) || '.';
      if pMiddleName is null then
        ppShortName := ppShortName || ' ' || substr(pMiddleName, 1, 1) || '.';
      end if;
    end if;
  end if;
  
  
  -- Вызов fdc_Person_Add с соответствующими параметрами
  return fdc_person_add(pobject_type_sysname => pObject_Type_SysName,
                        pname => ppname,
                        pshortname => ppshortname,
                        psurname => pSurName,
                        pfirstname => pFirstName,
                        pmiddlename => pMiddleName,
                        pogrn => null,
                        pinn => pinn,
                        pkpp => null,
                        pokpo => null,
                        pbic => null,
                        pbirthdate => pbirthdate,
                        pbirthyear => pbirthyear,
                        pbirthlocation => pbirthlocation,
                        popf_dict_id => null,
                        pdescript => pdescript);
end fdc_Person_Human_Add;
/
