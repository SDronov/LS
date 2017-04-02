create or replace procedure fdc_Session_Upd_Finish
-- ���������� �������� ��������� ������ 
	(
  pID                  number,           -- ������������� ������������ �������� ��������� ������
  pResStateSysName     varchar2,         -- ��������� ��� ��������������� ��������� ��������
                                         -- ���� ��: 'SessionStateSuccess', 'SessionStateError', 'SessionStateHung'
  pMessage             varchar2 := null  -- ��������� �� ���������� ������ (��������, ��������� �� ������)
  ) 
is
  pSession fdc_Session_Lst%rowtype;  
begin
  -- �������� ��������������� ��������� ��������
  if pResStateSysName not in ('SessionStateSuccess', 'SessionStateError', 'SessionStateHung') then
    fdc_util.Abort('�������� �������������� ��������� ��� ���������� �������� ��������� ������: '||pResStateSysName);
  end if;

  -- ��������� ������ ��������
  begin
    select *
    into pSession
    from fdc_Session_Lst 
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('�� ������ ����������� �������, ID='||pID);
  	when others then fdc_util.Abort('������ ��������� ������������ ��������, ID='||pID, 1);
  end;  
  
  -- ������� ��������� ��������
  Fdc_Object_Upd_State(pID, 
                       fdc_State_Transit_Get_ByStates(pSession.Typesysname, 
                                                      pSession.State_Sysname, 
                                                      pResStateSysName
                                                     )
                      );
  
  -- ������ ���������� � ������� ���������� � ��������� ��������
  update fdc_Session
  set dt_end = sysdate,
      Message = pMessage
  where ID = pID;    
end;
/
