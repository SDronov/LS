create or replace procedure fdc_Object_Grant_Upd
-- ������, �������� ��� ������� ������������ ��� ������ ����� �� �������� ������
	(
	pID		number,                   -- ������������� �������, �� ������� �������� �����
	pGrantee_ID	number,             -- ������������� ������������ ��� ������, �������� (�������) �������� �����
	pAccessLevel	number := 1,      -- ������� �������, �� ������� �������� ����� (1 - ������ ������, 2 - ���������, 3 - ��������� ���� �������)
                                  -- ���� ������� ������� 0, �� ����� ��������� � ������ �����������
	pDoNotCheck	number := 0,        -- <> 0 - �� ��������� ���������� �������� ������������ �� ������ ���� �� �������� ������
                                  -- 0 - ��������� ���������� �������� ������������ (�� ���������)
  pAdminNotGrant number := 1,     -- <> 0 - ��������������� ������ (������ AdminData)
                                  -- � ������������ - ��������� ����� ����������� ������ �� ������
                                  -- 0 - ������                         
  pNoReduction  number := 1       -- �� ����� 0 - ���� ������������ ��� ������ ��� ����� ����� ������� ����� �� ������,
                                  -- �� ������ �� ������, ����� �������� �����
                                  -- 0 - ������ �������� �����, � ��� ����� � ������ ��                                
	) 
is
begin
  -- �������� ���� �����������: ������������ ��� ������?
  -- ���� ������������
  if (fdc_Object_Is(pGrantee_ID,'User') <> 0) then
     if (pAccessLevel <> 0) then
        -- ���� pAdminNotGrant ��������� � ������������ - �������� ����� ��� 
        -- ������������� ������, �� �������
        if (pAdminNotGrant <> 0) 
              and ((fdc_User_Is_Schema_Owner(pGrantee_ID) <> 0) 
                  or (fdc_User_Is_AdminData(pGrantee_ID, 0) <> 0)) then
           return;
        end if; 
        
        -- ����� ��������� ������ ������� ��� ������������
  	    fdc_User_Grant_Add(pGrantee_ID, pID, pAccessLevel, pDoNotCheck, pNoReduction);
      else  
        -- ���� ������ �����������
		    fdc_User_Grant_Del(pGrantee_ID, pID, pDoNotCheck);
     end if;   
     
   -- ���� ������  
   elsif (fdc_Object_Is(pGrantee_ID,'UserGroup') <> 0) then
    if (pAccessLevel <> 0) then
        -- ���� pAdminNotGrant ��������� � ������������ - �������� ����� ��� 
        -- ������������� ������, �� �������
        if (pAdminNotGrant <> 0)
              and ((fdc_User_Is_Schema_Owner(pGrantee_ID) <> 0) 
                  or (fdc_User_Is_AdminData(pGrantee_ID, 0) <> 0)) then 
           return;
        end if; 
        
        -- ����� ��������� ������ ������� ��� ������
  	    fdc_User_Group_Grant_Add(pGrantee_ID, pID, pAccessLevel, pDoNotCheck, pNoReduction);
      else  
        -- ���� ������ �����������
		    fdc_User_Group_Grant_Del(pGrantee_ID, pID, pDoNotCheck);
     end if;    
   else	
     fdc_Util.Abort('����� �� ������� �������� ������ ������������� ��� ������� �������������. ��������� ������ (ID = '||pGrantee_ID||') �� �������� �� ��� �� ������.');
  end if;
end fdc_Object_Grant_Upd;
/
