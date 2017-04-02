create or replace function fdc_Object_Check_State_For_Upd
-- ���������� ��������� �� ��������� ������� ��� ���������
-- 1 - ���������, 0 - ���
	(
	  pID number,              -- ������������� �������
    pDoRaise number := 1     -- ��������� �� ����������, ���� ��������� ������� �� ��������� 
                             -- ��� ���������
                             -- �� ��������� (�������� <> 0) ���������
	)
  return number
is
  Result number := 0;
  pStateID number := null;
begin
  -- ���������� ��������� �������
  begin
    select State_ID
      into pStateID
      from fdc_Object
     where ID = pID;
  exception
    when NO_DATA_FOUND then 
      fdc_util.abort('�� ������ ������ �� ID = '||pID);
  	when others then fdc_util.abort('������ ����������� ������� �� ID = '||pID, 1); 
  end;  

  -- ���� ��������� ������� �� ������ �� ��� ������
  if (pStateID is null) then 
     Result := 1;
   else	
  -- ����� ������� ��������� �� ������ ��������� ��������� �������   
     begin
       select	nvl(AllowUpdates, 0)
	       into	Result
	       from	fdc_State
	      where	ID = pStateID;
     exception   
       when others then 
         fdc_util.abort('������ ����������� ��������� ������� �� ID = '||pStateID, 1); 
     end;   
  end if;

  -- ���� ������ �������� � ����� ����������, �� ��������� ���  
  if (Result = 0) and (pDoRaise <> 0) then
	   fdc_util.abort('��������� ������� �� ��������� ��� ���������.');
  end if;
  
  return Result;
end fdc_Object_Check_State_For_Upd;
/
