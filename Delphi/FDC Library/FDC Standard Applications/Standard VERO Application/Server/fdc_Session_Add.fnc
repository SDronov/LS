create or replace function fdc_Session_Add
-- �������� �������� ��������� ������
	(
	pObject_Type_SysName	varchar2,       -- ��������� ��� �������� ��������� ������ (������ ���� �������� 'Session')
	pInitial_Session_ID number,           -- ������������� ���������� (�����������������) ��������
  pDescript		varchar2 := null          -- �������� �������� ��������� ������
  )
return number
is
  pNewID number(15);
  pTypeName varchar2(2000);
  pName varchar2(2000); 
  pSysDate date := sysdate;
begin
  -- �������� ���� ��������
  fdc_Object_Type_Is(pObject_Type_SysName,'Session');
  
  -- ��������� ����� ���� ��������
  begin
    select Name
    into pTypeName
    from Fdc_Object_Type_Lst
    where SysName = pObject_Type_SysName; 
  exception
    when others then
      raise_application_error(-20201, '������ ����������� ���� ������: '||pObject_Type_SysName);
  end;
  
  -- ���������� �������� ��������
  pName := pTypeName || ' �� ' || to_char(pSysdate, 'DD.MM.YYYY HH24-MI-SS');
  
  -- �������� ���������� ������� (����� ������ ������!)
  pNewID := fdc_object_add(pobject_type_sysname => pObject_Type_SysName,
                           pname => pName,
                           paccesslevel => 0,
                           pdescript => pDescript);
  
  -- ����� ��� ������������� ������ ���� ����� �� ������ ����������� ��������������,
  -- ��������������� ���������� �������
  -- fdc_Object_Grant_Upd...
  
  -- ��������� ���������� � �������� � fdc_Session
  INSERT INTO FDC_SESSION(id, initial_session_id, end_session_id, 
                          local_id, dt_start, dt_end, 
                          message, job_id)
  values (pNewID, pInitial_Session_ID, 0,
          null, pSysDate, null,
          null, null);
  
  
  -- ������� ������� �� ����������������
  fdc_object_upd_state(pNewID, Fdc_Object_Get_Bysysname('StateTransit', 'SessionTransitCreate'));
          
  return pNewID;
end;
/
