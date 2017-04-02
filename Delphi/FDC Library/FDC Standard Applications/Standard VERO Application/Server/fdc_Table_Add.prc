create or replace procedure fdc_Table_Add
-- Добавить описание таблицы в таблицу fdc_Table
-- Если описание уже есть, оно полностью удаляется и вносится заново
	(
	pTableName varchar2,  --название таблицы в БД
  pName	varchar2        --логическое имя таблицы
	)
is
  pResTableName varchar2(100);
  pDescript varchar2(4000);
begin
  -- Нормализация
  pResTableName := upper(trim(pTableName));
  -- Удаление существующего описания
  delete from fdc_Column where TableName = pResTableName;
  delete from fdc_Table where TableName = pResTableName;
  -- Получение комментария к таблице
  begin
    select  Comments
    into pDescript
    from User_Tab_Comments
    where Table_Name = pResTableName;
  exception 
     when others then fdc_Util.Abort('Таблица '||pResTableName||' не создана в БД');
  end;
  -- Создание записи в fdc_Table
  insert into fdc_Table(TableName,Name,Descript) 
         values(pResTableName,pName,pDescript);

exception 
  when others then fdc_Util.Abort('Не прошла регистрация таблицы '||pResTableName, 1);
end fdc_Table_Add;
/
