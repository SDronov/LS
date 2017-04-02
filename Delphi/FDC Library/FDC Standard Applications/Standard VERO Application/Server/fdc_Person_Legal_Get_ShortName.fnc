create or replace function fdc_Person_Legal_Get_ShortName
-- Преобразование имени юридического лица к краткому названию
-- Извлечение краткого названия из кавычек (если есть)
-- Все Общества с Ограниченой ответственностью и прочие ООО убираются
-- по справочнику абревиатур Dict.LegalNameAcro
	(
	pName varchar2                               -- Наименование юридического лица
	)
return varchar2
is
  pResult	varchar2(1500);
  pAcro	varchar2(1500);
  pExpand	varchar2(1500);
  l_quote_pos_1 number := 0;
  l_quote_pos_2 number := 0;
  l_quote_pos_3 number := 0;
  PShortNameExtracted boolean := false;
begin
  -- Инициализация результата
  pResult := pName;
  
  -- Попытка извлечь краткое наименование из кавычек
  -- Определение позиций кавычек
  l_quote_pos_1 := instr(pResult, '"', 1, 1);
  l_quote_pos_2 := instr(pResult, '"', 1, 2);
  l_quote_pos_3 := instr(pResult, '"', 1, 3);
  
  -- Если две кавычки
  if l_quote_pos_2 > 0 and l_quote_pos_3 = 0 then
    pResult := substr(pResult, l_quote_pos_1 + 1, l_quote_pos_2 - l_quote_pos_1 - 1);
    PShortNameExtracted := true;
  end if; 
  
  -- Если краткое наименование извлечено из кавычек - больше ничего не делаем, 
  -- возвращаем полученное значение
  if PShortNameExtracted then
    return pResult;
  end if;
  
  -- Удаление всех общих мест
  -- Сначала по полным значениям (типа Общества с Ограниченой ответственностью)
  -- Удаляются все такого рода подстроки, где бы они ни находились
  while true loop
    begin
      select ShortName, Name
      into pAcro, pExpand
      from 
        (select instr(upper(pResult), upper(Name)||' ') Position, ShortName, Name
         from Fdc_Object_Lst O
         where O.Typesysname = 'Dict.LegalNameAcro' and
               upper(pResult) like '%'||upper(Name)||' %'
         order by instr(upper(pResult), upper(Name)||' '))      
      where rownum <= 1;
      -- Нашли подстроку - кандидата на замену
      pResult := replace(pResult, pExpand||' ');
    exception
  	  when NO_DATA_FOUND then exit;
    	when others then fdc_util.Abort('Ошибка поиска сокращаемых подстрок в наименовании организации '||pName, 1);
    end;
  end loop;
  
  -- А теперь удаление абревиатур
  -- Но только если они находятся в начале строки
  while true loop
    begin
      select ShortName, Name
      into pAcro, pExpand
      from Fdc_Dict_Lst O
      where O.Typesysname = 'Dict.LegalNameAcro' and
            upper(pResult) like upper(Code)||' %' and
            rownum <= 1;
      -- Нашли подстроку - кандидата на замену
      pResult := replace(pResult, pAcro||' ');
    exception
  	  when NO_DATA_FOUND then exit;
    	when others then fdc_util.Abort('Ошибка поиска сокращаемых подстрок в наименовании организации '||pName, 1);
    end;
  end loop;

  return pResult;
end fdc_Person_Legal_Get_ShortName;
/
