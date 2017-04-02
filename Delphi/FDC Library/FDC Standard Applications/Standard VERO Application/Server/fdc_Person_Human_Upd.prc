create or replace procedure fdc_Person_Human_Upd
-- Исменение атрибутов субъекта - физического лица
	(
	pID			number,
	pSurName		varchar2,                     -- Фамилия 
	pFirstName		varchar2,                   -- Имя 
	pMiddleName		varchar2,                   -- Отчество
	pINN			varchar2,                       -- Индивидуальный номер налогоплательщика
	pBirthDate		date,                       -- Дата рождения 
	pBirthYear		number,                     -- Год рождения 
	pBirthLocation		varchar2,               -- Место рождения
	pName			varchar2,                       -- Полное имя субъекта (например, фамилия-имя-отчество)
	pShortName		varchar2,                   -- Краткое имя субъекта (например, фамилия-инициалы)
	pDescript		varchar2                      -- Комментарий              
	)
is
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'Human') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является физическим лицом');
  end if;

  -- Вызов fdc_Person_Upd с соответствующими параметрами
  fdc_person_upd(pid => pID,
                 pname => pname,
                 pshortname => pshortname,
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
end fdc_Person_Human_Upd;
/
