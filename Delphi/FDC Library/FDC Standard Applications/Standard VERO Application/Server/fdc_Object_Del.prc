create or replace procedure fdc_Object_Del
-- �������� ���������� �������
-- !!������ � �������� ��������� ��� ����������� ������� (����������� �� ���� ����� OWNER_ID)!!
-- !!��������� �� ���������� ���������������, � ������ �� �������� �������� �� ��������� �����!!
-- !!������ �� �������� �������� ���� ������ ������� fdc_Object_Del
-- ��� ���������, �������������� ��� ��������� ����� ��� ��������� ��������, 
-- ������ ����� �� �� ��� ���������: pID, pDoLog.
-- ��� ���������� ����� ��������� fdc_Object_Free
	(
	pID number,                     -- ������������� �������
	pDoLog number := 1              -- ���������� �� ������� �������� ������� 
                                  -- (��������� �� Event?)
                                  -- �� ��������� ���������� (�������� 1)
                                  -- ��� �������� 0 ���������� �� ����
	)
is
pChk number;
pSysName varchar(1500);
pName varchar(1500);
pError varchar2(4000);
pChildID number;
pDenyReason number;
begin
  -- ��������, ����� �� ������� ������������ ����� �� ��������� �������
  pChk := fdc_Object_Is_Deletable(pID,pDenyReason,1);

  -- ��������� ���������� ����� �������
  begin
    select	SysName
    into	pSysName
    from	fdc_Object
    where 	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� �������� �� ������ ������ �� ID = '||pID);
  	when others then fdc_util.Abort('������ ��������� ���������� ����� ������� �� ID = '||pID, 1);
  end;
  
  -- ���� ���� ��������� ��� - ��������� ���������� �������������� ������
  if (pSysName is not null) and ((user <> fdc_util.schema) and (fdc_User_Is_AdminData(0, 0) = 0)) then
  	fdc_Util.Abort('������ '||fdc_Object_Get_Name(pID,1)||' ����� ��������� ��� '||pSysName||'. ��� ��� �������� ���������� ���������� ��������������.');
  end if;
  
  -- ��������, ��� �� ����������� ��������
  begin
    select	O.OWNER_OBJECT_ID
    into	pChk
    from	fdc_Value V,
          fdc_Object O
    where 	V.Ref_Object_Id = pID and
            V.Id = O.Id and
            rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('�������� ������� <'||fdc_Object_Get_Name(pID, 1, 0)||'> ����������: '||
                                    '���� ������ <'||fdc_Object_Get_Name(pChk, 1, 0)||'>, ����������� �� ����');
  end;
  
  -- ��������, ��� �� ��������� ��������
  begin
    select *
    into	pChk
    from (
      select	O.OBJECT_ID
      from	fdc_Object_Relation O
      where 	O.OBJECT_ID = pID and
              rownum <= 1
      union        
      select	O.OBJECT_ID
      from	fdc_Object_Relation O
      where 	O.Rel_Object_Id = pID and
              rownum <= 1)
    where rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('�������� ������� <'||fdc_Object_Get_Name(pID, 1, 0)||'> ����������: '||
                                    '���� ������ <'||fdc_Object_Get_Name(pChk, 1, 0)||'>, ��������� � ���');
  end;
  
  -- �������� ���������������� � ��������� ����������
  delete from fdc_User_Grant
  where Object_ID = pID;
  
  delete from fdc_User_Group_Grant
  where Object_ID = pID;
  
  -- �������� ����������� ��������
  -- ������ �� fdc_Object � �� �� fdc_Object_Lst 
  -- ��� ��� �������� ���� ��� ����� ��������� ���������� fdc_Object_Del
  for rec in (select ID from fdc_Object O
              where O.Owner_Object_Id = pID) loop
    -- ���������� �� ���� ����������� ��������          
    fdc_Object_Free(rec.ID, pDoLog);          
  end loop;            
  
  -- ���� ���������� �������� - ������� ������� ��������
  if pDoLog = 1 then
    fdc_Event_Add_EventDel(pID);
  end if;
  
  -- �������� ������ ���������� �������
  delete from fdc_Object
  where ID = pID;
  
exception
    when others then
      Fdc_Util.Abort('�� ������ �������� ������� '||pName||'(ID='||pID||'):', 1);
  
end fdc_Object_Del;
/
