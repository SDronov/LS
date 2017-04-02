create or replace function fdc_State_Transit_Get_ByStates
-- ��������� �������������� �������� ��������� �� ���� �������, � �����
-- ��������� ������ ��������� � �������� ���������
  (
  pObject_Type_SysName     varchar2,           -- ��������� ��� ���� �������, ��� �������� ������ ������� 
  pSrc_State_SysName       varchar2,           -- ��������� ��� ��������� ���������
  pDst_State_SysName       varchar2            -- ��������� ��� �������� ���������
  )
return number  
is
  pState_Scheme_ID number;
  pSrc_State_ID number;
  pDst_State_ID number;
  pTransit_ID number;
begin
  -- ��������� �������������� ����� ��������� ��� ��������� ���� ��������
  begin
    select T.State_Scheme_Id
    into pState_Scheme_ID
    from fdc_Object_Type T
    where T.Sysname = pObject_Type_SysName;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('�� ������ ��� ������ �� ���������� ����� '||pObject_Type_SysName);
  	when others then fdc_util.Abort('������ ����������� ���� ������ �� ���������� ����� '||pObject_Type_SysName, 1);
  end;
  
  -- ��������� �������������� ��������� ���������
  begin
    select ID
    into pSrc_State_ID
    from Fdc_State_Lst S
    where S.STATE_SCHEME_ID = pState_Scheme_ID and
          S.Sysname = pSrc_State_SysName;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ���� ������� '||pObject_Type_SysName||' �� ���������� ��������� '||pSrc_State_SysName);
  	when others then fdc_util.Abort('������ ����������� ��������� '||pSrc_State_SysName||' ��� ���� ������� '||pObject_Type_SysName, 1);
  end;        

  -- ��������� �������������� �������� ���������
  begin
    select ID
    into pDst_State_ID
    from Fdc_State_Lst S
    where S.STATE_SCHEME_ID = pState_Scheme_ID and
          S.Sysname = pDst_State_SysName;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ���� ������� '||pObject_Type_SysName||' �� ���������� ��������� '||pDst_State_SysName);
  	when others then fdc_util.Abort('������ ����������� ��������� '||pDst_State_SysName||' ��� ���� ������� '||pObject_Type_SysName, 1);
  end;        

  -- ��������� �������������� �������� ���������
  begin
    select ID
    into pTransit_ID
    from Fdc_State_Transit T
    where T.STATE_SCHEME_ID = pState_Scheme_ID and
          T.SRC_STATE_ID = pSrc_State_ID and
          T.DST_STATE_ID = pDst_State_ID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ���� ������� '||pObject_Type_SysName||' �� ��������� ������� �� ��������� '||pSrc_State_SysName||' � ��������� '||pDst_State_SysName);
	  when TOO_MANY_ROWS then fdc_util.Abort('��� ���� ������� '||pObject_Type_SysName||' �� ��������� ���������� ������� �� ��������� '||pSrc_State_SysName||' � ��������� '||pDst_State_SysName);
  	when others then fdc_util.Abort('������ ����������� �������� �� ��������� '||pSrc_State_SysName||' � ��������� '||pDst_State_SysName||' ��� ���� ������� '||pObject_Type_SysName, 1);
  end;        
  
  -- ������� ����������
  return pTransit_ID;
  
end;
/
