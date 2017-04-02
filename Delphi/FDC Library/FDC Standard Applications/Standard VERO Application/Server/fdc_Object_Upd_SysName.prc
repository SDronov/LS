create or replace procedure fdc_Object_Upd_SysName
-- ��������� ���������� ����� �������
	(
	  pID	number,            -- ������������� �������
	  pSysName varchar2      -- ��������� ��� �������
	)
is
  pChk number;
  pOldSysName varchar2(1500);
begin
  -- ��������� ����� �� ������� ������������ �������� ������. ��� - ����������
  pChk := fdc_Object_Is_Updatable(pID, 1);

  -- ���������� ������ ��������� ��� �������
  begin
    select SysName
      into pOldSysName
      from fdc_Object
     where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ��������� ���������� ����� �� ������ ������ �� ID = '||pID);
  	when others then fdc_util.Abort('������ ��������� ���������� ����� ������� �� ID = '||pID, 1);
  end;   

  -- ���� ������ � ����� ��� ���������, �� ������ ������ �� ����
  if Nvl(pOldSysName, 'No name') = Nvl(pSysName, 'No name') then
	   return;
  end if;

  -- �������� ��������� ��� �������
  update fdc_Object
     set SysName = pSysName
   where ID = pID;

  -- ���� ������ �������� ��������� �����, �� ������ ��������� ��� 
  -- � ������� fdc_Object_Type ���� 
  if fdc_object_is(pID, 'ObjectType') = 1 then
     update Fdc_Object_Type
        set SysName = pSysName
      where ID = pID;
  end if;
exception
  when others then
    Fdc_Util.Abort('�� ������ ��������� ���������� ����� ������� '||pSysName||'(ID='||pID||'):', 1);      
end fdc_Object_Upd_SysName;
/
