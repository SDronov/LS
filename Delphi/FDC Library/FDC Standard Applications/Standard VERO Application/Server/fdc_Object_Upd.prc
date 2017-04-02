create or replace procedure fdc_Object_Upd
-- ��������� �������� ������������� �������. ��������������, �����
-- ������ �������, ���������� �����, �������-��������� ��������
-- ���������� �����������
	(
	  pID	number,                   -- ������������� �������
	  pName	varchar2,               -- ��������
    pShortName varchar2,          -- �������� ��������
	  pDescript varchar2            -- ��������
	)
is
  pChk number;
  pEvent_ID number;
  lName varchar2(1500);
  lDescript varchar2(1500);
  lShortName varchar2(1500);
begin
  -- ��������� ����� �� ������� ������������ �������� ������. ��� - ����������
  pChk := fdc_Object_Is_Updatable(pID, 1);

  -- ���������� ������ �������� �������
  begin
    select O.Name, O.ShortName, O.Descript
      into lName, lShortName, lDescript 
      from fdc_Object O
     where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ��������� �� ������ ������ �� ID = '||pID);
  	when others then fdc_util.Abort('������ ��������� �������� ������� �� ID = '||pID, 1);
  end;   
  
  -- ���� �������� ����������, �� �������� ������   
  if Nvl(trim(pName), 'No name') <> Nvl(lName, 'No name') or 
     Nvl(trim(pShortName), 'No name') <> Nvl(lShortName, 'No name') or
     Nvl(trim(pDescript), 'No name') <> Nvl(lDescript, 'No name') then
        update	fdc_Object
           set Name = trim(pName),
               ShortName = trim(pShortName),
  	           Descript = trim(pDescript)
         where ID = pID;
  end if;  

  -- ���� ������ �������� �������� �����, �� ������ �������� ����, ���� ��� ����
  if fdc_object_is(pID, 'ObjectType') = 1 then
     begin
       -- ���������� ������ �������� ���������� ����
       select Name, ShortName
         into lName, lShortName
         from Fdc_Object_Type
         where ID = pID;
     exception
	     when NO_DATA_FOUND then fdc_util.Abort('��� ��������� �� ������ ��������� ��� �� ID = '||pID);
       when others then fdc_util.Abort('������ ��������� �������� ���������� ���� �� ID = '||pID, 1);
     end;   

     -- ���� �������� ����������, �� �������� ��������� ���       
     if Nvl(trim(pName), 'No name') <> Nvl(lName, 'No name') or 
        Nvl(trim(pShortName), 'No name') <> Nvl(lShortName, 'No name') then
           update Fdc_Object_Type
              set Name = pName,
                  ShortName = pShortName
            where ID = pID;
     end if;
  end if;
 
  -- ���� �����, �� ������ ������������ �������������� �������� �������� ���������
  -- ��������, ���������� �������� �� ��� ������
  for V in (select V.ID
	            from fdc_Value V, fdc_Object O
             where V.Ref_Object_ID = pID
               and O.ID = V.ID
               and Nvl(trim(O.Name), 'No name') <> Nvl(pName, 'No name'))
	    loop
	      update fdc_Object
	         set Name = trim(pName)
         where ID = V.ID;
      end loop;

  -- ������� ������� ��������� �������     
  pEvent_ID := fdc_Event_Add('EventUpd','������� '||fdc_Object_Get_Name(pID,1),pID);
  
exception
  when others then
    Fdc_Util.Abort('�� ������ ��������� ������� '||pName||'(ID='||pID||'):', 1);    
end fdc_Object_Upd;
/
