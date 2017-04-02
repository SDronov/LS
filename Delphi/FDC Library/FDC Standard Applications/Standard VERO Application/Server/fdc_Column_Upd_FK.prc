create or replace procedure fdc_Column_Upd_FK
-- Прокладывание в fdc_column информации о вхождении колонок во внешний ключ
-- Вызывается из Post-trigger-а Erwin при регистрации таблицы
-- Почему не делается исходя из информации в схеме БД?
-- Потому что на момент исполнения процедуры родительская таблица может еще не существовать в схеме БД
	(
  pTableName varchar2,   --название таблицы
	pColName varchar2,     --название колонки
	pPKTableName varchar2, --название связанной таблицы
	pPKColName varchar2,   --название связанной колонки
	pFKName varchar2       --название связи
	)
is
begin
  -- Запись информации о внешнем ключе
  update fdc_Column
  set PKTableName = upper(trim(pPKTableName)),
    	PKColName = upper(trim(pPKColName)),
	    FKName = upper(trim(pFKName))
  where TableName = upper(trim(pTableName)) 
    and ColName = upper(trim(pColName));
end fdc_Column_Upd_FK;
/
