create or replace procedure fdc_User_In_Group_Del
-- �������� ������������ �� ������
	(
	  pUser_ID number,          -- ������������� ������������
	  pUser_Group_ID number     -- ������������� ������
	)
is
  pAllow number(1);
begin
  -- �������� ������ �� ������� fdc_User_In_Group
  begin
    delete from fdc_User_In_Group
       where User_ID = pUser_ID and
	           User_Group_ID = pUser_Group_ID;
  exception
    when others then 
      fdc_util.abort('������ �������� ������������ �� ������', 1);         
  end;         
           
  -- ���� ������������ �������� �� ������ ��������������� ����� (AdminTask),
  -- �� ������� � ���� ����������� ��������� ����� �� ��������� �������         
  if (fdc_User_Is_AdminTask(pUser_ID, 0) = 0) then
     begin
       -- ����������� ������� �������� AllowGrantOption
       select AllowGrantOption
         into pAllow 
         from fdc_User
        where ID = pUser_ID;
     exception
       when NO_DATA_FOUND then
         fdc_util.abort('�� ������ ������������ �� ID = '||pUser_ID);
 	    when others then 
         fdc_util.abort('������ ����������� ������������ �� ID = '||pUser_ID, 1);           
     end;
     
     -- ���� ���������, �� ���������� AllowGrantOption � ������� fdc_User
     if (pAllow <> 0) then
       update fdc_User
          set AllowGrantOption = 0
        where ID = pUser_ID;
     end if;     
  end if;          
end fdc_User_In_Group_Del;
/
