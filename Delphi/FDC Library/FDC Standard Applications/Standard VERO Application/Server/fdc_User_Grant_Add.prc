create or replace procedure fdc_User_Grant_Add
-- ������ ������������ ����� �� �������� ������
	(
	pUser_ID number,                -- ������������� ������������, �������� �������� �����
	pObject_ID number,              -- ������������� �������, �� ������� �������� �����
	pAccessLevel number,            -- ������� �������, �� ������� �������� ����� (1 - ������ ������, 2 - ���������, 3 - ��������� ���� �������)
	pDoNotCheck number := 0,        -- �� ����� 0 - �� ��������� ���������� �������� ������������ �� ������ ���� �� �������� ������
                                  -- 0 - ��������� ���������� �������� ������������ (�� ���������)
  pNoReduction number := 0        -- �� ����� 0 - ���� ������������ ��� ����� ����� ������� ����� �� ������,
                                  -- �� ������ �� ������, ����� �������� �����
                                  -- 0 - ������ �������� �����, � ��� ����� � ������ ��
	)
is
  pChk1 number := 0;
  pAcc number := 0;
  pEventID number;
begin
  -- �������� ���������� �������� ������������
  if (pDoNotCheck = 0) then
  	pChk1 := fdc_Object_Check_Access_Level(pObject_ID, 3, 1);
  end if;
  
  -- ���� �� ��� �����-���� ����� � ������������ ������ �� �������� ������?
  begin
    select AccessLevel	
    into	pAcc
    from	fdc_User_Grant
    where	User_ID = pUser_ID and
    	    Object_ID = pObject_ID and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ ����������� ���� ������������ �� ������', 1);
  end;
      
  -- pAcc > 0 - ��� ���� � fdc_User_Grant ������ � ������, 
  -- pAcc = 0 - ���
  if pAcc > 0 then
    -- ���� ������������ ��� ����� ����� �����, �� �������    
    if (pAccessLevel = pAcc) then 
       return;
    end if;
    
    -- ���� pNoReduction ��������� � ������������ ��� ����� ����� ������� �����,
    -- �� ������ �� ������ � �������
    if (pNoReduction <> 0) and (pAccessLevel < pAcc) then
       return;
    end if;      
    
    -- ����� ��������� ������ �������
  	update	fdc_User_Grant
  	set	AccessLevel = pAccessLevel
  	where	User_ID = pUser_ID and
   		    Object_ID = pObject_ID;
          
    -- ������� ��������������� �������
    pEventID := fdc_Event_Add('EventAccessUpd',
          '����������� ������ � ' || fdc_Object_Get_Name(pObject_ID, 1) || 
          ' ��� ������������ ' || fdc_Object_Get_Name(pUser_ID) ||
          ' ������� � "' || fdc_Access_Level_GetName(pAcc) ||
          '" �� "' || fdc_Access_Level_GetName(pAccessLevel), pObject_ID);      
  else
    -- ���������� ������ �������
  	insert into fdc_User_Grant(User_ID, Object_ID, AccessLevel)
	  values(pUser_ID, pObject_ID, pAccessLevel);
    
    -- ������� ��������������� �������
    pEventID := fdc_Event_Add('EventAccessUpd',
          '�������� ����������� ������ � ' || fdc_Object_Get_Name(pObject_ID, 1) || 
          ' �� "' || fdc_Access_Level_GetName(pAccessLevel) ||
          '" ��� ������������ ' || fdc_Object_Get_Name(pUser_ID), pObject_ID);
  end if;
end fdc_User_Grant_Add;
/
