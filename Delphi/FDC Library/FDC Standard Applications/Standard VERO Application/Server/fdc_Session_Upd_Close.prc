create or replace procedure fdc_Session_Upd_Close
-- ����������� �������������� ������������ �������� ��������� ������
-- ��� ��� ����������������� �������� 
-- ������������� ������������� ��� �������� ���������� ������������ ��������
	(
  pID                number,                      -- ������������� "������������" �������� ��������� ������
  pEnd_Session_ID    number                       -- ������������� "������������" �������� ��������� ������
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
	  when NO_DATA_FOUND then fdc_util.Abort('�� ������ ����������� �������, ID='||pID);
  	when others then fdc_util.Abort('������ ��������� ������������ ��������, ID='||pID, 1);
  end;  
  if pSession.State_SysName <> 'SessionStateSuccess' then
    fdc_Util.Abort('�������� ��������� �������� ��� ��� ����������� ����������� ���������! (ID='|| pID ||')');
  end if;
  
  -- ��������� �������������� "������������" ��������
  update fdc_Session
  set End_Session_ID = pEnd_Session_ID
  where ID = pID;    
end;
/
