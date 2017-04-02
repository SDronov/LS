create or replace function fdc_User_Is_Schema_Owner
-- ����������, �������� �� ������������ ���������� �����
-- ���� ��������, ���������� 1
-- ���� ��� - ���������� 0
  (
    pUser_ID number := 0,          -- ������������� ������������, ��� �������� 0 ������� ������� ������������ ������������
    pDoRaise number := 0           -- ��������� �� ���������� ���� �� �������� ����� ��� ��� �� ���������� ������������ 
                                   -- �� ��������� �� ��������� (�������� 0)
                                   -- ��� �������� �������� �� 0 ���������
  )  
  return number 
is
  pLogin varchar2(1500) := null;
  pResult number := 0;
begin
  if (pUser_ID <> 0) then
    -- ���������� ����� ������������
    begin
      select upper(U.Login)	 
        into pLogin
        from fdc_User U
       where U.ID = pUser_ID;
    exception
  	  when NO_DATA_FOUND then 
        if (pDoRaise <> 0) then
           fdc_util.Abort('�� ������ ������������ �� ID = '||pUser_ID); 
        end if;   
    	when others then 
        if (pDoRaise <> 0) then
           fdc_util.abort('������ ���������� ������������ �� ID = '||pUser_ID, 1);
        end if;
    end;
   else
    pLogin := user;
  end if;   

  -- ��������� �������� �� ������������ ���������� �����
  if pLogin = fdc_Util.Schema then
     pResult := 1;
  end if;    

  -- ���� ����� ��������� ����������    
  if (pResult = 0) and (pDoRaise <> 0) then
     fdc_util.Abort('������������ ' || pLogin || ' �� �������� ���������� �����'); 
  end if;   
  
  -- ���������� ���������
  return pResult;
end;
/
