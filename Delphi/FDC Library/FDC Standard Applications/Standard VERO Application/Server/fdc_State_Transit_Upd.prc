create or replace procedure fdc_State_Transit_Upd
-- �������� ������� �������� ���������
	(
	  pID	number,                      -- ������������� ������� ��������
  	pName	varchar2,                  -- ��������
	  pSysName varchar2,               -- ��������� ��� ��������
	  pSrc_State_ID number,            -- ������������� ��������� ��������� ������� (�� ��������)
	  pDst_State_ID number,            -- ������������� �������� ��������� ������� (����� ��������)
	  pBefore_Procedure_ID number,     -- ������������� ���������, ������� ���������� ����� ���������
	  pAfter_Procedure_ID	number,      -- ������������� ���������, ������� ���������� ����� ��������
    pShortName varchar2,             -- �������� ��������
	  pDescript varchar2               -- ��������
	)
is
  pSch1 number(15);
  pSch2 number(15);
  pState_Scheme_ID number(15); 
begin
  -- ���������, ��� ��� ��������, ��� ������� ��������� ������
  if (pSrc_State_ID is null) and (pDst_State_ID is null) then
	   fdc_util.abort('������ ���� ������ ���� �������� ���� ������� ���������');
  end if;

  -- ���������, ��� ��������� � ������� ��������� �� ���������
  if (pSrc_State_ID = pDst_State_ID) then
	   fdc_util.abort('�������� � ������� ��������� �� ������ ���������');
  end if;
  
  -- ���������� ����� ��������� ��������
  begin
    select State_Scheme_ID
	    into pState_Scheme_ID
      from Fdc_State_Transit
     where ID = pID;
  exception
    when NO_DATA_FOUND then fdc_util.abort('�� ������� ������� �������� �� ID = ' || pID);
    when others then fdc_util.abort('������ ��������� ������� �������� �� ID = ' || pID, 1);
  end;

  -- ���� ������ �������� ���������, �� ��������� ���
  if (pSrc_State_ID is not null) then
     begin
       -- ���� ��� ����� ���������
	     select	State_Scheme_ID
	       into	pSch1
	       from	fdc_State
	      where	ID = pSrc_State_ID;
     exception
	     when NO_DATA_FOUND then fdc_util.abort('�� ������� �������� ��������� �������� �� ID = ' || pSrc_State_ID);
  	   when others then fdc_util.abort('������ ��������� ��������� ��������� �������� �� ID = ' || pSrc_State_ID, 1);
     end;
     
     -- ���������
     if (pSch1 <> pState_Scheme_ID) then
        fdc_util.abort('�������� ��������� �������� � ��� ������� ����������� ������ ������! ������ ������!'); 
     end if;   
  end if;

  -- ���� ������ ������� ���������, �� ��������� ���
  if (pDst_State_ID is not null) then
     begin
       -- ���� ��� ����� ���������
	     select	State_Scheme_ID
	       into	pSch2
	       from	fdc_State
	      where	ID = pDst_State_ID;
     exception
	     when NO_DATA_FOUND then fdc_util.abort('�� ������� ������� ��������� �������� �� ID = ' || pDst_State_ID);
  	   when others then fdc_util.abort('������ ��������� �������� ��������� �������� �� ID = ' || pDst_State_ID, 1);
     end;   
     
     -- ���������
     if (pSch2 <> pState_Scheme_ID) then
        fdc_util.abort('������� ��������� �������� � ��� ������� ����������� ������ ������! ������ ������!'); 
     end if;
  end if;

  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- �������� fdc_State_Transit
  update fdc_State_Transit
     set Src_State_ID	= pSrc_State_ID,
	       Dst_State_ID	= pDst_State_ID,
	       Before_Procedure_ID = pBefore_Procedure_ID,
	       After_Procedure_ID	= pAfter_Procedure_ID
   where ID = pID;

  -- ���� �����, �� ������ ��������� ��� 
  fdc_Object_Upd_SysName(pID,pSysName);
end fdc_State_Transit_Upd;
/
