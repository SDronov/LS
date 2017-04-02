create or replace function fdc_User_Group_Get
-- �������� ID ������ �� ���������� �����
   (
     pSysName varchar2
   )  
     return number
is
  Result number(15);
begin
  select G.ID
    into Result
    from fdc_User_Group G,
  	     fdc_Object O
  where	O.ID = G.ID and
  	    O.SysName = pSysName;
        
  -- ������� ����������
  return Result;
exception 
	when NO_DATA_FOUND then fdc_util.abort('�� ������� ������ '||pSysName);
  when others then fdc_util.abort('������ ��������� �������������� ������ '||pSysName, 1);
end fdc_User_Group_Get;
/
