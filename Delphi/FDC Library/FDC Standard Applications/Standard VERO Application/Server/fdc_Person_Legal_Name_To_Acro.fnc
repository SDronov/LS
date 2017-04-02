create or replace function fdc_Person_Legal_Name_To_Acro
-- Преобразование (сокращение) наименования юридического лица
-- Все Общества с Ограниченой ответственностью и прочие общие места сокращаются до абревиатур
-- по справочнику абревиатур Dict.LegalNameAcro
	(
	pName varchar2                               -- Наименование юридического лица
	)
return varchar2
is
  pResult	varchar2(1500);
  pAcro	varchar2(1500);
  pExpand	varchar2(1500);
begin
  -- Инициализация результата
  pResult := pName;
  
  -- Проход по всем найденным подстрокам из справочника Dict.LegalNameAcro
  while true loop
    begin
      select ShortName, Name
      into pAcro, pExpand
      from 
        (select instr(upper(pResult), upper(Name)) Position, ShortName, Name
         from Fdc_Object_Lst O
         where O.Typesysname = 'Dict.LegalNameAcro' and
               upper(pResult) like '%'||upper(Name)||'%'
         order by instr(upper(pResult), upper(Name)||'%'))      
      where rownum <= 1;
      -- Нашли подстроку - кандидата на замену
      pResult := replace(pResult, pExpand, pAcro);
    exception
  	  when NO_DATA_FOUND then exit;
    	when others then fdc_util.Abort('Ошибка поиска сокращаемых подстрок в наименовании организации '||pName, 1);
    end;
  end loop;
  
  return pResult;
end fdc_Person_Legal_Name_To_Acro;
/
