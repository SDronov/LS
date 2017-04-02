create or replace procedure fdc_Object_Type_Upd
-- ��������� ������ ���������� ����
	(
	  pID number,                       -- ������������� ����
	  pName varchar2,                   -- ��������
	  pSysName varchar2,                -- ��������� ���
    pShortName varchar2,              -- �������� ��������
	  pTableName varchar2,              -- �������, � ������� �������� ������� ����� ����
  	pIcon varchar2,                   -- ������
	  pState_Scheme_ID number,          -- ����� ��������� 
	  pDescript varchar2                -- ��������
	)
is
  ppIcon varchar2(4000);
  pOld fdc_Object_Type_Lst%rowtype;
  pCnt number := 0;
begin
  -- ���������� ������ �������� ���������� ����  
  begin
    select *
      into pOld
      from fdc_Object_Type_Lst
     where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ��������� �� ������ ��������� ��� �� ID = '||pID);
  	when others then fdc_util.Abort('������ ��������� �������� ���������� ���� �� ID = '||pID, 1);
  end;    

  -- ���� ������ �� ������, �� �������� ����� �� � ���� - ��������
  ppIcon := pIcon;
  if (trim(ppIcon) is null) and (pOld.Parent_Object_Type_ID is not null) then
	   begin
	     select	T.Icon
	       into	ppIcon
	       from	fdc_Object_Type T
	      where	T.ID = pOld.Parent_Object_Type_ID;
	   exception 
       when NO_DATA_FOUND then null;
       when others then fdc_util.Abort('������ ��������� ������ ���� - �������� �� ID = '||pOld.Parent_Object_Type_ID, 1);     
	   end;
  end if;

  -- ���� �������� ����� ��������� �� ������, �� ������� ���� �� ������� ����� ���� 
  -- � ��������� ����������. ���� ����, �� ����������.
  if (pOld.State_Scheme_ID is not null) and (pState_Scheme_ID is not null) 
        and (pState_Scheme_ID <> pOld.State_Scheme_ID) then
     begin
	     select	1
	       into	pCnt
	       from	fdc_Object
	      where	Object_Type_ID = pID and
		          (State_ID is not null) and
              rownum <= 1;
     exception 
       when NO_DATA_FOUND then null;
       when others then fdc_util.Abort('������ ������ �������� ������� ���� � �������� ���������� �� ID = '||pID, 1);     
	   end;         
     
	   if (pCnt <> 0) then
		    fdc_util.abort('���������� ������� � ���������� ���� �����. '||chr(10)||
			                 '��������� ����� ��� ����� �������� ���� �� �����������');
		    return;
	   end if;
  end if;

  -- ���� ����� �������� ����� ��������� ���� (������� �� NULL), �� ���������� � 
  -- ��� ��������� �������� ����� ����
  if (pState_Scheme_ID is null) and (pOld.State_Scheme_ID is not null) then
	   update	fdc_Object
	      set	State_ID = null
	    where	Object_Type_ID = pID;
  end if;

  -- ���� ��� �� �������������� � ������� fdc_object, �� �� �� ����� ����� ����� ���������
  if (pState_Scheme_ID is not null) and (pOld.ObjectTableInstance = 0) then
     fdc_util.abort('���������������� � �������� ��� �� ����� ����� ����� ���������!');
  end if;
  
  -- �������� �������� ���������� ����. 
  -- �������� � �������� �������� �������� � fdc_Object_Upd
  update fdc_Object_Type
     set SysName = pSysName,  
	       TableName = pTableName,
	       Icon = ppIcon,
	       State_Scheme_ID = pState_Scheme_ID
   where ID = pID;

  -- �������� �������������� ���������� ���� � ������� fdc_Object 
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- ������ ��������� ��� ���������� ����, ���� �����
  if (pOld.SysName <> pSysName) then
	   fdc_Object_Upd_SysName(pID, pSysName);
  end if;
exception
  when others then
    Fdc_Util.Abort('�� ������ ��������� ���������� ���� '||pName||'(ID='||pID||'):', 1);      
end fdc_Object_Type_Upd;
/
