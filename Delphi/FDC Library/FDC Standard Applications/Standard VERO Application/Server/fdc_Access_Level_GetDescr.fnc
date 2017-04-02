create or replace function fdc_Access_Level_GetDescr(pAccessLevel in number) return varchar2
is
begin
	case 
    when pAccessLevel = 0 then return 'Данный уровень доступа означает отсутствие у пользователей прав доступа к объекту';
    when pAccessLevel = 1 then return 'Данный уровень доступа дает пользователям права на чтение данных объекта';
    when pAccessLevel = 2 then return 'Данный уровень доступа дает пользователям права на чтение, изменение данных и удаление объекта';
	  when pAccessLevel = 3 then return 'Данный уровень доступа дает пользователям права на любые операции с объектом, включая изменение прав доступа';
	  else fdc_Util.Abort('Уровень доступа ' || nvl(pAccessLevel, 'null') || ' не поддерживается');
	end case;
end;
/
