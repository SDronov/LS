create or replace function fdc_Reg_Document_Add
-- Создание регистрационного документа
	(
	pObject_Type_SysName	varchar2,             -- Системное имя типа рег. документа (должен быть подтипом 'IdentityCard') 
	pName			varchar2,                         -- Наименование 
  pOwner_ID  number,                          -- Владелец - Объект, к которому относится документ (сейчас проверяется, что это подтип субъекта)                                  
	pDocDate	date,                             -- Дата документа
	pDocNumber	varchar2,                       -- Номер документа
	pDocSerial	varchar2,                       -- Серия документа
	pGrantee	varchar2,                         -- Кем выдан документ
  pStopDate date := null,                     -- Дата окончания действия
  pDescript varchar2 := null                  -- Описание  
	)
return number
is
  pNewID number(15);
begin
  -- Проверка типа рег. документа  
  fdc_Object_Type_Is(pObject_Type_SysName,'RegDocument');

  -- Проверка владельца
  if pOwner_ID is not null and Fdc_Object_Is(pOwner_ID, 'Person') = 0 then
    fdc_Util.Abort('При создании регистрационного документа передан неверный идентификатор владельца');
  end if;

  -- Создание экземпляра объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, pOwner_ID, null, null, pDescript);

  -- Даем пользователю права на изменение и раздачу прав на объект
  fdc_Object_Grant_Upd(pNewID, Fdc_User_Get, 3, 1);

  -- Создание записи в fdc_Reg_Document
  insert into fdc_reg_document
    (id, docdate, docnumber, docserial, grantee, stopdate)
  values
    (pNewID, pdocdate, pdocnumber, pdocserial, pgrantee, pstopdate);
  
  return pNewID;
  
end fdc_Reg_Document_Add;
/
