create or replace function fdc_Object_Get_Owner
-- ���������� ������������� �������, �������� ����������� �������� ������
-- ���� ���������, �� ������� ���������� ��� ������������� ������
	(
	  pID number,              -- ������������� �������
    pDoRaise number := 0     -- ���� ������� �� 0, �� �� ������� ����������
                             -- �� ��������� ��� 
	)
    return number
is
  Result number(15) := null;
  
begin
  begin
    select Owner_Object_ID
      into Result
      from fdc_Object_Lst
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

  return Result;
end fdc_Object_Get_Owner;
/
