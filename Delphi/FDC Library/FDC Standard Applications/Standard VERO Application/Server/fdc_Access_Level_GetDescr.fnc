create or replace function fdc_Access_Level_GetDescr(pAccessLevel in number) return varchar2
is
begin
	case 
    when pAccessLevel = 0 then return '������ ������� ������� �������� ���������� � ������������� ���� ������� � �������';
    when pAccessLevel = 1 then return '������ ������� ������� ���� ������������� ����� �� ������ ������ �������';
    when pAccessLevel = 2 then return '������ ������� ������� ���� ������������� ����� �� ������, ��������� ������ � �������� �������';
	  when pAccessLevel = 3 then return '������ ������� ������� ���� ������������� ����� �� ����� �������� � ��������, ������� ��������� ���� �������';
	  else fdc_Util.Abort('������� ������� ' || nvl(pAccessLevel, 'null') || ' �� ��������������');
	end case;
end;
/
