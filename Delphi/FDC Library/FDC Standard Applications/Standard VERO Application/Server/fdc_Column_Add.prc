create or replace procedure fdc_Column_Add
-- Добавить описание колонки в таблицу fdc_Column
-- Если описание уже есть, отваливается по первичному ключу
	(
  pTableName varchar2,  --название таблицы
 	pColName varchar2,    --название колонки
  pName	varchar2        --логическое имя колонки
	)
is
  pResTableName varchar2(100);
  pResColName varchar2(100);
  pDescript	varchar2(4000);
begin
  -- Нормализация
  pResTableName := upper(trim(pTableName));
  pResColName := upper(trim(pColName));
  -- Получение комментария к колонке 
  begin
    select Comments
    into	pDescript
    from User_Col_Comments
    where Table_Name = pResTableName and
          Column_Name = pResColName;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка получения описания колонки '||pTableName||'.'||pColName, 1);
  end;
  -- Создание записи в таблице fdc_Column
  insert into fdc_Column(TableName,ColName,Name,IsPK,Descript)
         values (pResTableName,pResColName,pName,fdc_Column_Is_PK(pResTableName,pResColName),pDescript);
exception 
  when others then fdc_Util.Abort('Не прошла регистрация колонки '||pTableName||'.'||pColName, 1);
end fdc_Column_Add;
/
