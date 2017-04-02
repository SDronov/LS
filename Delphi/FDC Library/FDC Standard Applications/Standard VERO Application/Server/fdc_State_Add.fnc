create or replace function fdc_State_Add
-- ������� ����� ��������� � ���������� ��� �������������
	(
	  pObject_Type_SysName varchar2,    -- ��������� ��� ���������� ���� 
	  pName	varchar2,                   -- ��������
	  pSysName varchar2,                -- ��������� ��� ���������
	  pState_Scheme_ID number,          -- ������������� ����� ���������
	  pActive	number,                   -- ������� ����������
	  pAllowUpdates number,             -- �������� �� ��������� ������� � ������ ���������
  	pAllowDelete number,              -- �������� �� �������� ������� � ������ ���������
    pColor number := null,            -- ���� 
    pShortName varchar2 := null,      -- �������� ��������
	  pDescript varchar2 := null       -- ��������
	)
    return number
is
  pNewID number(15);
  pCnt number := 0;
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'State'
  fdc_Object_Type_Is(pObject_Type_SysName,'State');

  -- ���� ������� ��������� ��� ���������, �� ��������� ��� ��������� � �����
  -- ��������� ������ ��� �� ���������� � ������ ����� 
  if (trim(pSysName) is not null) then
     begin
	     select	1
	       into	pCnt
	       from	fdc_State S,
		          fdc_Object O
	      where	S.State_Scheme_ID = pState_Scheme_ID and
		          O.ID = S.ID and
		          upper(O.SysName) = upper(trim(pSysName)) and
              rownum <= 1;
     exception
	     when NO_DATA_FOUND then null;
  	   when others then fdc_util.abort('������ ��� ������ ��������� � ��������� ������ ' || pSysName, 1);
     end;         
     
	   if pCnt = 1 then
		    fdc_util.abort('��������� � ��������� ������ '||pSysName||' ��� ���� � ����� '||fdc_Object_Get_Name(pState_Scheme_ID));
		    return 0;
	   end if;
  end if;

  -- ������� ������ ����� ���������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, pState_Scheme_ID, pSysName, pShortName, pDescript);

  -- ������� ������ � ������� fdc_State
  insert into fdc_State(ID, State_Scheme_ID, Active, AllowUpdates, AllowDelete, Color)
         values(pNewID, pState_Scheme_ID, pActive, pAllowUpdates, pAllowDelete, pColor);

  -- ���������� ������������� ���������       
  return pNewID;
end fdc_State_Add;
/
