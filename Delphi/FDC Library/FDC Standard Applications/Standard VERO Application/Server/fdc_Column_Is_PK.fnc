create or replace function fdc_Column_Is_PK
-- Проверить, входит ли колонка таблицы в первичный ключ
-- Если входит - возвращает 1,
-- если не входит - 0
	(
	pTableName varchar2,  --название таблицы
	pColName varchar2     --название колонки
	)
  return number
is
  pResTableName varchar2(100);
  pResColName varchar2(100);
  pkName varchar2(30);
begin
  -- Нормализация
  pResTableName := upper(trim(pTableName));
  pResColName := upper(trim(pColName));
  -- Получение PK
  begin
    select C.Constraint_Name
    into	 pkName
    from   User_Cons_Columns CC,
           User_Constraints C
    where CC.Table_Name = pResTableName and
          CC.Column_Name = pResColName and
          C.Constraint_Name = CC.Constraint_Name and
          C.Constraint_Type = 'P';
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('Ошибка определения ограничения первичного ключа для '||pTableName||'.'||pColName, 1);
  end;
  -- Возврат результата
  if pkName is null then 
     return 0;
   else 
     return 1;
  end if;
end fdc_Column_Is_PK;
/
