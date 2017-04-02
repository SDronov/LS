create or replace function fdc_Object_Get_StateID
-- ���������� ������������� ��������� ������� �� ��� ��������������
-- ���� ���������, �� ������� ���������� ��� ������������� ������
	(
	 pID number,             -- ������������� �������
   pDoRaise number := 0    -- ���� ������� �� 0, �� �� ������� ����������
                           -- �� ��������� ���
	)
   return number
is
  Result number(15);
begin
  begin
    select State_ID
      into Result
      from fdc_Object_Lst
     where ID = pID;
     
    Result := NVL(Result, 0); 
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
end fdc_Object_Get_StateID;
/
