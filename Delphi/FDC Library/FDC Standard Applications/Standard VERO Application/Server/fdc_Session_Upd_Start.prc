create or replace procedure fdc_Session_Upd_Start
-- ������ �������� ��������� ������
	(
  pID                  number,                   -- ������������� ����������� �������� ��������� ������
  pLocal_ID            number := null            -- ������������� �������� � ������������������ ������� 
                                                 -- ��� ������� ���� ��������� 
                                                 -- (� ������, ���� ������� ����� ������������� ������ 
                                                 --  ��������� ��������� ������������� ����)
  ) 
is
  pSession fdc_Session_Lst%rowtype;  
begin
  -- �������� ���� � ��������� ��������
  begin
    select *
    into pSession
    from fdc_Session_Lst 
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('�� ������ �������, ID='||pID);
  	when others then fdc_util.Abort('������ ��������� ��������, ID='||pID, 1);
  end;  
  if pSession.State_SysName <> 'SessionStateCreated' then
    fdc_Util.Abort('�������� ��������� ����������� �������� (ID='|| pID ||')');
  end if;

  -- ������� ��������� ��������
  Fdc_Object_Upd_State(pID, 
                       fdc_State_Transit_Get_ByStates(pSession.Typesysname, 
                                                      'SessionStateCreated', 
                                                      'SessionStateProgress'
                                                     )
                      );
 
  -- ������ ���������� �� �������������� �������� � ������������������ �������
  if pLocal_ID is not null then
    update fdc_Session
    set Local_ID = pLocal_ID
    where ID = pID;    
  end if;
end;
/
