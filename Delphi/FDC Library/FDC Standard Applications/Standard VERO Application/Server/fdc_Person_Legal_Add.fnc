create or replace function fdc_Person_Legal_Add
-- Создание нового субъекта - юридического лица
	(
	pObject_Type_SysName	varchar2,           -- Системное имя типа объекта (подтип 'Legal')
	pName			varchar2,                       -- Полное имя субъекта 
	pShortName		varchar2,                   -- Краткое имя субъекта 
  pOGRN     varchar2,                       -- Основной государственный регистрационный номер
	pINN			varchar2,                       -- Индивидуальный номер налогоплательщика
	pKPP			varchar2:=null,                 -- Код причины постановки на налоговый учед (дополнительный под к ИНН)
	pOKPO			varchar2:=null,                 -- Код по Общероссийскому классификатору предприятий и организаций
	pBIC			varchar2:=null,                 -- Банковский идентификационный код
	pBirthDate		date:=null,                 -- Дата регистрации организации
	pBirthYear		number:=null,               -- Год регистрации организации
	pBirthLocation		varchar2 := null,       -- Место регистрации организации
  pOPF_Dict_ID number := null,              -- Организационно-правовая форма организации. Ссылка на справочник ОКОПФ
	pDescript		varchar2:=null                -- Комментарий              
	)
return number
is
  ppName varchar2(1500);
  ppShortName varchar2(1500);
begin
  -- Проверка типа
  Fdc_Object_Type_Is(pObject_Type_SysName, 'Legal');

  -- Получение имен для юридического лица
  if pName is null and pShortName is null then
    fdc_Util.Abort('При создании юридического лица должно быть указано его наименование');
  elsif pName is null then
    ppName := fdc_person_legal_name_to_acro(pShortName);
    ppShortName := fdc_person_legal_name_to_acro(pShortName);
  elsif pShortName is null then
    ppName := fdc_person_legal_name_to_acro(pName);
    ppShortName := fdc_person_legal_get_shortname(pName);
  else
    ppName := fdc_person_legal_name_to_acro(pName);
    ppShortName := fdc_person_legal_name_to_acro(pShortName);
  end if;  

  -- Вызов fdc_Person_Add с соответствующими параметрами
  return fdc_person_add(pobject_type_sysname => pObject_Type_SysName,
                        pname => ppname,
                        pshortname => ppshortname,
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
end fdc_Person_Legal_Add;
/
