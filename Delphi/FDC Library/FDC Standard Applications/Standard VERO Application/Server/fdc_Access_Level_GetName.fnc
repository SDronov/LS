create or replace function fdc_Access_Level_GetName(pAccessLevel in number) return varchar2
is
begin
	case 
    when pAccessLevel = 0 then return 'Нет доступа';
    when pAccessLevel = 1 then return 'Чтение';
    when pAccessLevel = 2 then return 'Изменение';
	  when pAccessLevel = 3 then return 'Полный доступ';
	  else fdc_Util.Abort('Уровень доступа ' || nvl(pAccessLevel, 'null') || ' не поддерживается');
	end case;
end;
/
