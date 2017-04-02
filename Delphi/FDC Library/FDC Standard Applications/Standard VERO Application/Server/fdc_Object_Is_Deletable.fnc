create or replace function fdc_Object_Is_Deletable
-- ���������� ����� �� ������� ������������ ������� �������� ������ 
-- 1 - �����, 0 - �� �����
-- ��������� ����������� �������� ��������:
--   ���� ������������ �������� ���������� ����� - ����� ��� �����
--   ���� ��������� ������� ��������� ��� ��������, 
--        ������� ������������ ����� ����� �� ���� ����� �� ���������
--        �� ���� ������ � ��� �����������
	(
	  pID number,              -- ������������� �������
    pDenyReason out number,  -- ������� ������� ��������: 
                             -- 1 - ������������ ���� �� ��������� ������
                             -- 2 - ��������� ������� �� ��������� ��������
                             -- 3 - ���� ����������� �������, �� ������� ������������ ����
    pDoRaise	number := 0    -- ��������� �� ���������� ���� �� ����� �������
                             -- �� ��������� (�������� 0) �� ���������
                             -- pDoraise ���������� � ���������� ���������
                             -- � � ������ ������ ��������� ��������������� �� ��������������
	)
    return number
is
  pChk number;
begin
  pDenyReason := 0;
  
  -- ���� ������������ �������� �����, �� ��.
  if user = fdc_util.schema then
 	   return 1;
  end if;

  -- ���������� ����� �� ������������ ������� ������� ��� �������� �������
  if fdc_Object_Check_Access_Level(pID, 2, pDoRaise) = 0 then
    pDenyReason := 1;
    return 0;
  end if;

  -- ������ ������� ��������� �� ��������� ������� ��������
  if fdc_Object_Check_State_For_Del(pID, pDoRaise) = 0 then
    pDenyReason := 2;
    return 0;
  end if;

  -- ������ ���������, ���� �� ����� ����������� �������� ��, �� ������� ���� ����
  begin
    select ID 
    into pChk
    from (
      select ID
      from Fdc_Object O
      start with ID = pID
      connect by prior O.ID = O.Owner_Object_Id) Q
    where ID <> pID and
      fdc_Object_Check_Access_Level(Q.ID, 2, pDoRaise) = 0 and
      rownum <= 1;    
  exception
	  when NO_DATA_FOUND then pChk := 0;
  	when others then fdc_util.Abort('������ �������� ���� �� ����������� ������� ��� ������� '||
                                     fdc_Object_Get_Name(pID, 1, 1)||' (ID='||pID||'): ', 1);
  end;
  
  -- ���� ������� �������, �� ��������� ��������
  if (pChk <> 0) then
    pDenyReason := 3;
    return 0;
  else	
    return 1;
  end if;
end fdc_Object_Is_Deletable;
/
