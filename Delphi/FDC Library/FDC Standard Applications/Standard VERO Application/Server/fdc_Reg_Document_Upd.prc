create or replace procedure fdc_Reg_Document_Upd
-- Изменение атрибутов регистрационного документа
	(
  pID number,                                 -- Идентификатор регистрационного документа   
	pName			varchar2,                         -- Наименование 
	pDocDate	date,                             -- Дата документа
	pDocNumber	varchar2,                       -- Номер документа
	pDocSerial	varchar2,                       -- Серия документа
	pGrantee	varchar2,                         -- Кем выдан документ
  pStopDate date,                             -- Дата окончания действия
  pDescript varchar2 := null                  -- Описание  
	)
is
  pReg_Document fdc_Reg_Document%rowtype;
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'RegDocument') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является регистрационным документом');
  end if;

  -- Сначала изменение атрибутов объекта со всяческими проверками
  fdc_Object_Upd(pID, pName, null, pDescript);
  
  -- Получение старого значения
  begin
    select *
    into pReg_Document
    from fdc_Reg_Document
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При попытке изменения не найден регистрационный документ ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения значений регистрационного документа ID='||pID, 1);
  end;

  -- Изменение атрибутов записи fdc_Reg_Document
  if Nvl(pReg_Document.DocDate, to_date('01.01.1800', 'DD.MM.YYYY')) <> Nvl(pDocDate, to_date('01.01.1800', 'DD.MM.YYYY')) or
     Nvl(trim(pReg_Document.DocNumber), 'No name') <> Nvl(trim(pDocNumber), 'No name') or
     Nvl(trim(pReg_Document.Docserial), 'No name') <> Nvl(trim(pDocserial), 'No name') or
     Nvl(trim(pReg_Document.Grantee), 'No name') <> Nvl(trim(pGrantee), 'No name') or
     Nvl(trim(pReg_Document.Stopdate), to_date('01.01.1800', 'DD.MM.YYYY')) <> Nvl(pStopdate, to_date('01.01.1800', 'DD.MM.YYYY')) then
    update fdc_Reg_Document D
    set D.DOCDATE = pDocDate,
        D.Docnumber = pDocNumber,
        D.Docserial = pDocSerial,
        D.Grantee = pGrantee,
        D.Stopdate = pStopDate
    where ID = pID;
  end if;   
 
end fdc_Reg_Document_Upd;
/
