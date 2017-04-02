create or replace procedure fdc_Procedure_Reg_DelProc
-- Регестрирует процедуру как процедуру удаления для объектных типов,
-- имеющих подходящее название (имя процедуры без суффикса Del на конце)
	(
	  pID number    -- идентификатор процедуры
	)
is
  pObject_Type_ID number(15);
  pProcName varchar2(1500);
begin
  -- получение системного имени процедуры
  pProcName := upper(fdc_Object_Get_SysName(pID));

  -- курсор по объектным типам с подходящим названием и с неопределенной
  -- процедурой удаления и регистрация для них заданной процедуры как процедуры удаления
  for T in (select ID
	            from fdc_Object_Type
	           where upper(trim(TableName)||'_DEL') = pProcName and
		               Del_Procedure_ID is null) 
      loop
       	update fdc_Object_Type
	         set Del_Procedure_ID = pID
	       where ID = T.ID;
	    end loop;
end fdc_Procedure_Reg_DelProc;
/
