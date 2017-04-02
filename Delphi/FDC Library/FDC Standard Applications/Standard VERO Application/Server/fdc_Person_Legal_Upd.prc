create or replace procedure fdc_Person_Legal_Upd
-- Исменение атрибутов субъекта - юридического лица
	(
	pID			number,
	pName			varchar2,                       -- Полное имя субъекта
	pShortName		varchar2,                   -- Краткое имя субъекта
  pOGRN     varchar2,                       -- Основной государственный регистрационный номер
	pINN			varchar2,                       -- Индивидуальный номер налогоплательщика
	pKPP			varchar2,                       -- Код причины постановки на налоговый учед (дополнительный под к ИНН)
	pOKPO			varchar2,                       -- Код по Общероссийскому классификатору предприятий и организаций
	pBIC			varchar2,                       -- Банковский идентификационный код
	pBirthDate		date,                       -- Дата регистрации организации
	pBirthYear		number,                     -- Год регистрации организации
	pBirthLocation		varchar2,               -- Место регистрации организации
  pOPF_Dict_ID number,                      -- Организационно-правовая форма организации. Ссылка на справочник ОКОПФ
	pDescript		varchar2                      -- Комментарий              
	)
is
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'Legal') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является юридическим лицом');
  end if;

  -- Вызов fdc_Person_Upd с соответствующими параметрами
  fdc_person_upd(pid => pID,
                 pname => pname,
                 pshortname => pshortname,
                 psurname => null,
                 pfirstname => null,
                 pmiddlename => null,
                 pogrn => pogrn,
                 pinn => pinn,
                 pkpp => pkpp,
                 pokpo => pokpo,
                 pbic => pbic,
                 pbirthdate => pbirthdate,
                 pbirthyear => pbirthyear,
                 pbirthlocation => pbirthlocation,
                 popf_dict_id => popf_dict_id,
                 pdescript => pdescript);
end fdc_Person_Legal_Upd;
/
