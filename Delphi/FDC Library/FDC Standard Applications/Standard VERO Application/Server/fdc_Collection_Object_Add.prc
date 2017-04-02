create or replace procedure fdc_Collection_Object_Add
-- �������� ������� � ��������
	(
	pCollection_ID	number,       -- ������������� ��������
	pObject_ID	number,           -- ������������� �������
	pRoleName	varchar2 := null,   -- ���� ������� � ��������
	pDescript	varchar2 := null,   -- ����������� � ������� � ��������
  pDoRaiseDupVal number := 1,   -- ���������� ��������� �� ����������, ���� ������
                                -- ��� ������ � ������ �������� � ����� �� �����.
                                -- �� ��������� (�������� <> 0) ���������,
                                -- 0 �� ���������  
  pDoCheckRoleName number := 0  -- ���������� ������� �� ������ ������������ ��������� �������
                                -- � ������� ������. 
                                -- �� ��������� (�������� = 0) �������,
                                -- <> 0 �� �������    
                                                              
	)
is
  pChk number := null;
begin
  -- �������� ����������� �������� ��������� � ��������
  if Fdc_Object_Is_Updatable(pCollection_ID, 0) = 0 then
    fdc_Util.Abort('��� ���� �� ��������� ��������, ���� �� ��������� �� ��������� ���������');
  end if;
  
  -- ��������, ��� ���� ������ ��� � ��������
  begin
    select Object_ID
    into pChk
    from fdc_Collection_Object CO
    where CO.Object_ID = pObject_ID and
          CO.Collection_ID = pCollection_ID and
          ((NVL(pDoCheckRoleName, 0) = 0) or 
          ((trim(pROLENAME) is null and trim(CO.rolename) is null) or
           (upper(trim(CO.ROLENAME)) = upper(trim(prolename)))));
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('������ �������� ������� ������� � ��������', 1);
  end;
  
  if (pChk is not null) then
     if (pDoRaiseDupVal <> 0) then
        fdc_Util.Abort('������ '||Fdc_Object_Get_Name(pObject_ID, 0, 1)||' ��� ������ � �������� '||Fdc_Object_Get_Name(pCollection_ID, 0, 1));
      else
        return; 
     end if;
  end if;   
  
  -- ���������� ������ � fdc_Collection_Object
	insert into fdc_Collection_Object(ID, Collection_ID,Object_ID, RoleName, Descript)
	values(Fdc_Object_Get_Newkey, pCollection_ID,pObject_ID, pRoleName, pDescript);

end fdc_Collection_Object_Add;
/
