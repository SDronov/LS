create or replace function fdc_Dict_Get_ByCode
-- ѕолучение позиции справочника по ее коду
  (
  pObject_Type_SysName varchar2,           -- —истемное им€ типа справочника (должен быть подтипом 'Dict') 
  pCode varchar2,                          --  од в позиции в справочнике
	pDoRaise	number := 1                    -- поднимать ли исключение при отсутствии позиции
                                           -- по умолчанию (значение <> 0) поднимать 
  ) 
return number 
is
  pResult number;
begin
  -- ¬ыборка позиции из справочника по коду
  begin
    select ID
    into pResult
    from Fdc_Dict_Lst D
    where D.Code is not null and
          D.TYPESYSNAME = pObject_Type_SysName and
          D.CODE = pCode;
  exception
   when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('ќшибка получени€ позиции справочника '||pObject_Type_SysName||' по коду '||pCode, 1);
  end;

  -- ≈сли не нашлась позици€ и нужно поднимать исключение
  if pResult is null and pDoRaise > 0 then
    fdc_util.Abort('Ќе найдена позици€ справочника '||pObject_Type_SysName||' по коду '||pCode);
  end if; 
    
  return pResult;        
end;
/
