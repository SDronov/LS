create or replace procedure fdc_Collection_Merge
-- ������� ��������
-- ����� ������� ����������� �� ��������� ���� �������� �������� �������� � �������,
-- � �������� ���������
-- �������� ������� �������� �� ��������������
	(
	pID	number,                        -- ������������� ������� ��������
	pSrcID	number,                    -- ������������� �������������� ��������
  pRoleName	varchar2 := null         -- ���� ������� � ��������
	)
is
  pChkCollectionObject fdc_Collection_Object%rowtype;
  pCollectionObjectDescript varchar2(1500);
begin
  -- �������� �����
  if Fdc_Object_Is(pID, 'Collection') = 0 or Fdc_Object_Is(pSrcID, 'Collection') = 0 then
    fdc_Util.Abort('�������� ���� �������� ��� ������� �������� pID='||pID||', pSrcID='||pSrcID);
  end if;
  
  -- ������� �������� �� �������� �������� � �������
  for rec in (
    select CO.*
    from fdc_Collection_Object CO
    where Collection_ID = pSrcID) loop
    -- ���������, ���� �� � ������� �������� ��� �� ������, ��� � � �������� � � ��� �� �����
    begin
      select CO.*
      into pChkCollectionObject
      from fdc_Collection_Object CO
      where CO.Object_ID = rec.Object_ID and
            CO.Collection_ID = pID and
            ((trim(pRoleName) is null and trim(CO.rolename) is null) or
             (upper(trim(CO.ROLENAME)) = upper(trim(pRoleName))));
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.Abort('������ ��������� ��������� ������� ID='||rec.Object_ID||' � �������� ID='||pID, 1);
    end;
    if pChkCollectionObject.Object_ID is not null then
      -- ������ � ������� �������� ������
      -- ���� � �������� �������� � ������� ��� �����������, 
      -- ����� ��� ������� � ��������� � ������� ��������
      if trim(rec.Descript) is not null then
        if trim(pChkCollectionObject.Descript) is null then
          pCollectionObjectDescript := rec.Descript;
        else
          pCollectionObjectDescript := trim(pChkCollectionObject.Descript) || chr(10) ||
                                       '+ ������������� ������������ ��� ������� ��������:' || chr(10) ||
                                       rec.Descript;
        end if;
        update Fdc_Collection_Object
           set Descript = pCollectionObjectDescript
        where	ID = pChkCollectionObject.ID;
      end if;
      -- � ������ �������� ��������� �������
      delete from Fdc_Collection_Object
      where ID = rec.ID;
    else 
      -- ������ � ������� �������� �� ������
      -- ������ ��������� ������ �� �������������� �������� � �������
      update	fdc_Collection_Object
         set	Collection_ID = pID,
              RoleName = pRoleName
      where	ID = rec.ID;
    end if;
  end loop;  
  
  -- ����� ������� ��������� ������� 
  fdc_Object_Merge(pID, pSrcID);

end fdc_Collection_Merge;
/
