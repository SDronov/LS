create or replace function fdc_Object_Is_Child_Of
-- ���������� �������� �� ������ ���� ��������� 
-- 1 - ��������, 0 - ���
	(
	  pID	number,           -- ������������� ������������ �������
  	pParentID number,     -- ������������� ��������,
    pDoRaise number := 0  -- ���� ������� �� 0, �� �� ������� ����������
                          -- �� ��������� ��� 
    
	)
  return number
is
  pOwnerID number;
  
begin
  -- �������� ���������� �������� �������
  begin
    select Owner_Object_ID
      into pOwnerID
      from fdc_Object
     where ID = pID;
  exception 
    when NO_DATA_FOUND then
      if (pDoRaise <> 0) then 
         fdc_util.abort('�� ������ ������ �� ID = '||pID);
       else
         null;
      end if;     
  	when others then 
      if (pDoRaise <> 0) then 
         fdc_util.abort('������ ����������� ������� �� ID = '||pID, 1); 
       else
         null;
      end if;  
  end;    
    
  -- ���� ��������� �������� ��������, �� Ok, �������
  if pOwnerID = pParentID then 
     return 1;
  end if;

  -- ���� �������� �� ���������, �� �������
  if (pOwnerID is null) then 
     return 0;
  end if;

  -- ����� ��������
  return fdc_Object_Is_Child_Of(pOwnerID, pParentID);
end fdc_Object_Is_Child_Of;
/
