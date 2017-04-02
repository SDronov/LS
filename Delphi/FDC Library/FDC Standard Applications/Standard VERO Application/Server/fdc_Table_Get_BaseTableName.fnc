create or replace function fdc_Table_Get_BaseTableName
-- Получение имени родительской таблицы для заданной объектной таблицы
-- Используется при регистрации из Erwin объектного типа для таблицы
-- Отваливается по ошибке информации о первичном ключе.
-- Для fdc_Object возвращает NULL,
-- В случае, если есть родительская таблица (по данным fdc_Column) - возвращает ее
-- Если нет - возвращает fdc_Object
	(
	pTableName varchar2  -- название таблицы
	)
  return varchar2
is
  pResTableName varchar2(100);
  pRefTableName varchar2(100) := null;
  pPKColumn     varchar2(100); 
begin
  -- Нормализация
  pResTableName := upper(trim(pTableName));

  if pResTableName = 'FDC_OBJECT' then
    -- У fdc_Object нет родительской таблицы
    pRefTableName := null;
  else  
    -- Запрос к fdc_column
    begin
      select  C.COLNAME, C.PKTableName
      into	  pPKColumn, pRefTableName
      from	  fdc_Column C
      where	  TableName = pResTableName and
      	      IsPK = 1;
    exception
      when no_data_found then
        fdc_util.abort('Ошибка получения родительской таблицы: не найдена информация о первичном ключе таблицы '||pResTableName||' в fdc_Column');
      when too_many_rows then
        fdc_util.abort('Ошибка получения родительской таблицы: несколько полей в первичном ключе таблицы '||pResTableName);
      when others then      
        fdc_util.abort('Ошибка получения родительской таблицы для '||pResTableName, 1);
    end;   
    
    -- Проверка именования первичного ключа 
    if nvl(pPKColumn, '?') <> 'ID' then
        fdc_util.abort('Поле первичного ключа должно называться <ID>');
    end if;
    
    if pRefTableName is null then
      -- Нет явного внешнего ключа
      -- Значит это подразумеваемый внешний ключ непосредственно на fdc_Object
    	pRefTableName := 'FDC_OBJECT';
    end if;
  end if;  
  return pRefTableName;
end fdc_Table_Get_BaseTableName;
/
