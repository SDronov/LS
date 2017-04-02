create or replace function fdc_Object_Get_TypeSysName
-- ���������� ��������� ��� ���� ������� �� ��� ��������������
-- ���� ���������, �� ������� ���������� ��� ������������� ������
(
	pID number,            -- ������������� �������
  pDoRaise number := 0   -- ���� ������� �� 0, �� �� ������� ����������
                         -- �� ��������� ��� 
) 
  return varchar2
is
  pResult	varchar2(1500) := null;

begin
  begin
    select T.SysName
      into pResult
      from fdc_Object_Lst O,
	         fdc_Object T
     where O.ID = pID
       and T.ID = O.Object_Type_ID;
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

  return pResult;
end fdc_Object_Get_TypeSysName;
/
