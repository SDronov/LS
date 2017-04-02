create or replace procedure fdc_Object_Upd_Owner
-- �������� �������� � �������
	(
	  pID	number,               -- ������������� �������
	  pOwnerID number           -- ������������� ��������  
	)
is
  pCnt number;
  pOldOwnerID number;
begin
  -- ��������� ����� �� ������������ ����� �������� ������
  -- ��� - ����������
  pCnt := fdc_Object_Check_Access_Level(pID,2,1);

  -- �������� ������ �������� �������
  begin
     select	Owner_Object_ID
       into	pOldOwnerID
       from	fdc_Object
      where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ��������� �������� �� ������ ������ �� ID = '||pID);
  	when others then fdc_util.Abort('������ ��������� �������� ������� �� ID = '||pID, 1);
  end;

  -- ���� ���������, �� ������������� ��������
  if (NVL(pOwnerID, -1) <> NVL(pOldOwnerID, -1)) then
     update fdc_Object
        set Owner_Object_ID = pOwnerID
      where ID = pID;
  end if;    
exception
  when others then
    Fdc_Util.Abort('�� ������ ��������� �������� � ������� � ID = '||pID||':', 1);        
end fdc_Object_Upd_Owner;
/
