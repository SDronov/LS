create or replace procedure fdc_Object_Upd_Access_Level
-- �������� ����� ������� ������� � �������
	(
	  pID	number,              -- ������������� �������
	  pAccessLevel number      -- ������� �������
	)
is
  pOldAccessLevel number;
  pCnt number;
  pAct varchar2(1500);
  pEventID number;
begin
  -- ��������� ����� �� ������������ ����� ������ ����� ������� ������� � �������
  -- ��� - ����������
  pCnt := fdc_Object_Check_Access_Level(pID,3,1);

  -- �������� ������ �������� ������ ������� � �������
  begin
     select	AccessLevel
       into	pOldAccessLevel
       from	fdc_Object
      where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ��������� ������ ������� �� ������ ������ �� ID = '||pID);
  	when others then fdc_util.Abort('������ ��������� �������� ������ ������� ������� �� ID = '||pID, 1);
  end; 
  
  -- ���� ������� � �������� ������� ������� ���������� ��...
  if (pOldAccessLevel <> pAccessLevel) then
     
     -- �������� ������� ������� � �������
	   update fdc_Object
	      set	AccessLevel = pAccessLevel
    	where	ID = pID;
      
     -- ������� ��������������� �������
     pEventID := fdc_Event_Add('EventAccessUpd',
          '����� ������ � ' || fdc_Object_Get_Name(pID, 1) || 
          ' ������� � "' || fdc_Access_Level_GetName(pOldAccessLevel) ||
          '" �� "' || fdc_Access_Level_GetName(pAccessLevel), pID);

     pCnt := 0;
     
     -- ���� ������ � ������� ����������� �� ������� ����� �� ���� ���-�� ����
     -- �����-�� ����������� ������ ��� ����, ����� ������ ������ �� ��������
     -- �� ���������. ���� ���, �� ���� ��������� ����������� ������ ���� �� ���.
     -- ���������� ������� ���, �������� ������� �������������� ������.
 	   if (pAccessLevel = 0) then
        begin
          -- ������� ����� �� �����-�� ������������ ���� ������ � �������
		      select 1
		        into pCnt
		        from fdc_User_Grant
		       where Object_ID = pID and
                 rownum <= 1;
        exception
	        when NO_DATA_FOUND then null;
  	      when others then fdc_util.abort('������ ����������� ������������ ������� ������������ � ������� � ID = '||pID, 1);
        end;         

        -- ���� ������� ���, �� ������� ����� �� �����-�� ������ ���� ������ � �������
		    if pCnt = 0 then
           begin
			       select 1
			         into	pCnt
			         from	fdc_User_Group_Grant
			        where	Object_ID = pID and
                    rownum <= 1;
           exception
	           when NO_DATA_FOUND then null;
  	         when others then fdc_util.abort('������ ����������� ������������ ������� ������ � ������� � ID = '||pID, 1);
           end;         
		    end if;

        -- ���� ���� ������� ��� �� � ����, �� ���� ���� ��������� ���� ������ �� ���.
		    if pCnt = 0 then
           fdc_Object_Grant_Upd(pID, Fdc_User_Get, 3, 1);
		    end if;
	   end if;
  end if;
exception
  when others then
    Fdc_Util.Abort('�� ������ ��������� ������ ������ ������� � ������� � ID = '||pID||':', 1);        
end fdc_Object_Upd_Access_Level;
/
