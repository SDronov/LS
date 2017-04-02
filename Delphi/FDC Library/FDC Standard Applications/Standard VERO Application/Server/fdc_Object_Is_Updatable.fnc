create or replace function fdc_Object_Is_Updatable
-- ���������� ����� �� ������� ������������ �������� �������� ������ 
-- 1 - �����, 0 - �� �����
	(
	  pID number,              -- ������������� �������
    pDoRaise	number := 0    -- ��������� �� ���������� ���� �� ����� ��������
                             -- �� ��������� (�������� 0) �� ���������
	)
    return number
is
  pAccessLevel number;
  pAllowUpdate number;
begin
  -- ���� ������������ �������� �����, �� ��.
  if user = fdc_util.schema then
 	   return 1;
  end if;

  -- ���������� ����� �� ������������ ������� ������� ��� ��������� �������
  pAccessLevel := fdc_Object_Check_Access_Level(pID, 2, pDoRaise);

  -- ���� ��� ���� �� ���������, �� �������
  if (pAccessLevel = 0) then
     return 0;
  end if;

  -- ������ ������� ��������� �� ��������� ������� ���������
  pAllowUpdate := fdc_Object_Check_State_For_Upd(pID, pDoRaise);
  
  -- ���� ���������, �� ��, ����� �������� ������ ������
  if (pAllowUpdate <> 0) then
	   return 1;
   else	
     return 0;
  end if;
end fdc_Object_Is_Updatable;
/
