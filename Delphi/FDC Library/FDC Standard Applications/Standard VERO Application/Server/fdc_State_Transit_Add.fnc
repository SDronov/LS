create or replace function fdc_State_Transit_Add
-- ������� ����� ������� �������� ��������� ������� � ���������� ��� �������������
	(
	  pObject_Type_SysName varchar2,   -- ��������� ��� ���������� ����
	  pName	varchar2,                  -- ��������
	  pSysName varchar2,               -- ��������� ��� ��������
	  pState_Scheme_ID number,         -- ������������� ����� ���������
	  pSrc_State_ID number,            -- ������������� ��������� ��������� ������� (�� ��������)
	  pDst_State_ID number,            -- ������������� �������� ��������� ������� (����� ��������)
	  pBefore_Procedure_ID number,     -- ������������� ���������, ������� ���������� ����� ���������
	  pAfter_Procedure_ID	number,      -- ������������� ���������, ������� ���������� ����� ��������
    pShortName varchar2 := null,     -- �������� ��������
	  pDescript varchar2 := null       -- ��������
	)
    return number
is
  pNewID number(15);
  pSch1 number(15) := null;
  pSch2 number(15) := null;
begin
  -- ���������, ��� ��� ��������, ��� ������� ��������� ������
  if (pSrc_State_ID is null) and (pDst_State_ID is null) then
	   fdc_util.abort('������ ���� ������ ���� �������� ���� ������� ���������');
  end if;

  -- ���������, ��� ��������� � ������� ��������� �� ���������
  if (pSrc_State_ID = pDst_State_ID) then
	   fdc_util.abort('�������� � ������� ��������� �� ������ ���������');
  end if;

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

  -- ��������, ��� pObject_Type_SysName - ������� 'StateTransit'
  fdc_Object_Type_Is(pObject_Type_SysName,'StateTransit');

  -- ������� ������ ��������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, pState_Scheme_ID, pSysName, pShortName, pDescript);

  -- ������� ������ � ������� fdc_State_Transit
  insert into fdc_State_Transit(ID, State_Scheme_ID, Src_State_ID, Dst_State_ID, Before_Procedure_ID, After_Procedure_ID)
       values(pNewID, pState_Scheme_ID, pSrc_State_ID, pDst_State_ID, pBefore_Procedure_ID, pAfter_Procedure_ID);

  -- ���������� ������������� ��������     
  return pNewID;
end fdc_State_Transit_Add;
/
