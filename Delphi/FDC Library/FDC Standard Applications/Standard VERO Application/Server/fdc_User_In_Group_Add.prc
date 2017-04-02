create or replace procedure fdc_User_In_Group_Add
-- ��������� ������������ � ������
	(
	  pUser_ID number,            -- ������������� ������������
	  pUser_Group_ID	number,     -- ������������� ������
    pDoRaiseDupVal number := 1  -- ���������� ��������� �� ����������, ���� ������������
                                -- ��� ������ � ������ ������.
                                -- �� ��������� (�������� <> 0) ���������,
                                -- 0 �� ���������  
	) 
is
 pAllow number(1);
begin
  -- ���������� ������ � ������� fdc_User_In_Group
  begin
    insert into fdc_User_In_Group(User_ID, User_Group_ID)
          values (pUser_ID, pUser_Group_ID);
  exception
    when DUP_VAL_ON_INDEX then 
      if (pDoRaiseDupVal <> 0) then 
         fdc_util.abort('������������ ��� ������� � ������ ������');   
       else
         return;
      end if;     
  when others then 
      fdc_util.abort('������ ��������� ������������ � ������', 1);         
  end;        
       
  -- ���� ������������ ������� � ������ ��������������� ����� (AdminTask),
  -- �� ���� ��� ����������� ��������� ����� �� ��������� �������
  if (fdc_User_Is_AdminTask(pUser_ID, 0) <> 0) then
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
     
     -- ���� ���������, �� ����������� AllowGrantOption � ������� fdc_User
     if (pAllow <> 1) then
        update fdc_User
           set AllowGrantOption = 1
         where ID = pUser_ID;
     end if;     
  end if;        
end fdc_User_In_Group_Add;
/
