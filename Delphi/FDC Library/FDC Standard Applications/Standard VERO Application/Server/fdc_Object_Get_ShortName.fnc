create or replace function fdc_Object_Get_ShortName
-- ���������� �������� �������� ������� �� ��� ��������������
	(
	  pID number,               -- ������������� �������
    pDoRaise number := 1      -- ���� �� 0, �� ����������� ���������� ��� �������������
                              -- �����-�� ������. �� ��������� �����������.
	)
    return varchar2
is
  Result varchar2(1500);
begin
  begin
    select ShortName
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
end fdc_Object_Get_ShortName;
/
