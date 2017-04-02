create or replace function fdc_Object_Get_RowData
-- Получение в одной строке реквизитов объекта
-- Полиморфная процедура,
-- сама разбирается откуда брать какие поля для разных типов объектов;)
  (
  pID number                    -- Идентификатор объекта
  ) 
return varchar2  
is
  pResult varchar2(32767);
  pObjectType fdc_Object_Type_Lst%rowtype;
  pObject fdc_Object_Lst%rowtype;
  type tTableList is table of varchar(30);
  pTableList tTableList := tTableList();
  pParentTypeID number;
  pCurrentTableName varchar2(30);
  pDynamicScript varchar2(32767);
  pTableData varchar2(4000);
  pChk number;
  pMaxStrAttrLength number := 100;
begin
  -- Получение информации объекта
  begin
    select *
    into pObject
    from Fdc_Object_Lst
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('Не найден объект по ID='||pID);
  	when others then fdc_Util.Abort('Ошибка получения информации об объекте по ID='||pID, 1);
  end;
  
  -- Получение информации о типе объекта
  begin
    select *
    into pObjectType
    from Fdc_Object_Type_Lst
    where ID = pObject.Object_Type_Id;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('Не найден тип объекта по ID='||pObject.Object_Type_Id);
  	when others then fdc_Util.Abort('Ошибка получения информации о типе объект по ID='||pObject.Object_Type_Id, 1);
  end;
  
  -- Помещение в результат информации из fdc_Object_Lst
  pResult := 'ID='||pID||
             'TYPENAME='||pObject.TypeName ||
             case nvl(pObject.Name, '~~~') when '~~~' then null else chr(10)||'NAME='||pObject.Name end||
             case nvl(pObject.ShortName, '~~~') when '~~~' then null else chr(10)||'SHORTNAME='||pObject.ShortName end||
             case nvl(pObject.SysName, '~~~') when '~~~' then null else chr(10)||'SYSNAME='||pObject.SysName end||
             case nvl(pObject.Owner_Object_Id, -1) when -1 then null else chr(10)||'OWNER_OBJECT_ID='||pObject.Owner_Object_Id end||
             case nvl(pObject.Descript, '~~~') when '~~~' then null else chr(10)||'DESCRIPT='||substr(pObject.Descript, 1, pMaxStrAttrLength) end;
  if length(trim(pObject.Descript)) > pMaxStrAttrLength then
    pResult := pResult || '...';
  end if;           

  -- Получение списка таблиц, по которым дальше нужно пробежаться
  pParentTypeID := pObjectType.Parent_Object_Type_Id;
  pCurrentTableName := upper(pObjectType.Tablename);   
  while pCurrentTableName <> 'FDC_OBJECT' loop
    if (pTableList.count = 0) or
       ((pTableList.count > 0) and (pCurrentTableName <> pTableList(pTableList.last))) then
      pTableList.extend;
      pTableList(pTableList.last) := pCurrentTableName;
    end if;
    select T.Parent_Object_Type_Id, upper(T.Tablename)
    into pParentTypeID, pCurrentTableName
    from fdc_Object_Type T
    where ID = pParentTypeID;
  end loop;

  -- Проход по всем найденным таблицам
  for i in REVERSE 1..pTableList.last loop
    -- Проверка, есть ли в таблице содержательные колонки
    -- Не берем первичный и внешние ключи
    select count(*)
    into pChk
    from Fdc_Column C, 
         User_Tab_Columns U
    where upper(C.TableName) = pTableList(i) and
          C.IsPK = 0 and
          C.PKTableName is null and
          upper(C.Tablename) = U.TABLE_NAME and
          upper(c.colname) = U.COLUMN_NAME;
    -- Если есть содержательные колонки, формируем динамический скрипт по таблице      
    if pChk > 0 then      
      pDynamicScript := 'declare str varchar2(4000); rec '||pTableList(i)||'%rowtype; maxStrLen number; '||chr(10)||
                        'begin maxStrLen := :pMaxStrAttrLength; '||chr(10)||
                        'select * into rec from '||pTableList(i)||' where ID=:pID; ';    
      -- Проход по содержательным колонкам                  
      for cc in ( select C.Colname, U.DATA_TYPE
                  from Fdc_Column C, 
                       User_Tab_Columns U
                  where upper(C.TableName) = pTableList(i) and
                        C.IsPK = 0 and
                        C.PKTableName is null and
                        upper(C.Tablename) = U.TABLE_NAME and
                        upper(c.colname) = U.COLUMN_NAME) loop
        -- Добавляем кусочек кода для колонки                 
        pDynamicScript := pDynamicScript || chr(10) || 'if rec.'||cc.colname||' is not null then str := str || chr(10) ||'''||upper(cc.colname);
        if cc.DATA_TYPE = 'DATE' then
          pDynamicScript := pDynamicScript || '=''||to_char(rec.'||cc.colname||', ''DD.MM.YYYY HH24-MI-SS''); end if;';         
        elsif cc.DATA_TYPE in ('VARCHAR2', 'CHAR') then
          pDynamicScript := pDynamicScript || '=''||substr(rec.'||cc.colname||', 1, maxStrLen); end if;';
          pDynamicScript := pDynamicScript|| chr(10) || 'if length(trim(rec.'||cc.colname||')) > maxStrLen then str := str || ''...''; end if;';        
        else                 
          pDynamicScript := pDynamicScript || '=''||rec.'||cc.colname||'; end if;';         
        end if;
      end loop;
      -- Завершение скрипта
      pDynamicScript := pDynamicScript || chr(10) || ':retval := str; end;';
      --    Отладка:  
      --    pResult := pResult||chr(10)||chr(10)||pDynamicScript;            
      --    return pResult;
      -- Исполнение динамического скрипта для выбранной таблицы
      begin
        execute immediate pDynamicScript using pMaxStrAttrLength, pID, out pTableData;
      exception
        when others then
          fdc_Util.Abort('Ошибка динамического считывания информации по объекту '||Fdc_Object_Get_Name(pID, 0, 0)||
                         ' (ID='||pID||') из таблицы '||pTableList(i), 1);
      end;  
      
      -- Если вернулось хоть что-то содержательное, присоединяем к результату
      if trim(replace(pTableData, chr(10))) is not null then
        pResult := pResult || pTableData;
      end if;  
    end if;
  end loop;
  
  -- Возврат результата длиной до 4000 (чтобы можно было использовать в SQL)
  return substr(trim(pResult), 1, 4000);  
end fdc_Object_Get_RowData;
/
