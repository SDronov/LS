create or replace procedure fdc_Object_Merge
-- ������� ����������� ��������
-- !! ������� ���������, ��������������� �� ����������
-- !! ���������� ������ �� �������� ������� ��������������� �����
-- !! � ����� �����, ����� ���� ����������� ��� ���� ������������
-- �������������� ������ ����������� (���������) � �������
-- ������������� �������, ������������� � ����������, 
-- ����� �������������� �������� �������
-- ��������� ��������������� ������� ���������
-- � ���� ��������� ����� fdc_Object_Free
	(
	pID	number,               -- ������������� �������� �������
	pSrcID	number            -- ������������� ��������������� �������
	)
is
  pDst	fdc_Object_Lst%rowtype;
  pSrc	fdc_Object_Lst%rowtype;
  pChk number;
  pEvent_ID number;
  pChkCollectionObject fdc_Collection_Object%rowtype;
  pCollectionObjectDescript varchar2(1500);
begin
  -- ��������� �������� �������
  begin
  select	*
  into	pDst
  from	fdc_Object_Lst
  where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('��� ������� �� ��������� ������� ������ �� ID = '||pID);
  	when others then fdc_util.Abort('��� ������� ������ ����������� �������� ������� �� ID = '||pID, 1);
  end;
  
  -- ��������� ��������������� �������
  begin
  select	*
  into	pSrc
  from	fdc_Object_Lst
  where	ID = pSrcID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('��� ������� �� ��������� �������������� ������ �� ID = '||pID);
  	when others then fdc_util.Abort('��� ������� ������ ����������� ��������������� ������� �� ID = '||pID, 1);
  end;
  
  -- �������� ������������ �����
  if pSrc.Typesysname<>pDst.Typesysname then
    fdc_util.Abort('��� ������� ����������� ���� ��������');
  end if;
  
  -- �������� ����������� ��������� �������� �������
  begin
    pChk := Fdc_Object_Is_Updatable(pId, 1);
  exception  
    when others then
      fdc_util.Abort('��� ������� ��� ���� �� ��������� �������� �������', 1);
  end;
  
  -- �������� ����������� ��������� ��������������� �������
  begin
    pChk := Fdc_Object_Is_Updatable(pSrcId, 1);
  exception  
    when others then
      fdc_util.Abort('��� ������� ��� ���� �� ��������� ��������������� �������', 1);
  end;

  -- ����� �� ������� (�����������) ������� ������ ������������� �� �� ������� ������
  
  -- ��������� � ��������  
  for rec in (
    select CO.*
    from fdc_Collection_Object CO
    where Object_ID = pSrcID) loop
    -- ���������, ���� �� ������� ������ � ��� �� �������� � ��� �� �����
    begin
      select CO.*
      into pChkCollectionObject
      from fdc_Collection_Object CO
      where CO.Object_ID = pID and
            CO.Collection_ID = rec.Collection_ID and
            ((trim(rec.ROLENAME) is null and trim(CO.rolename) is null) or
             (upper(trim(CO.ROLENAME)) = upper(trim(rec.rolename))));
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.Abort('������ ��������� ��������� ������� ID='||pID||' � �������� ID='||rec.Collection_ID, 1);
    end;
    if pChkCollectionObject.Object_ID is not null then
      -- ������� ������ � �������� ������
      -- ���� � ��������������� ������� � ��� �� �������� ��� �����������, 
      -- ����� ��� ������� � ��������
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
      -- ������� ������ � �������� �� ������
      -- ������ �������� ������ � �������� � ��������������� �� �������
      update	fdc_Collection_Object
      set	Object_ID = pID
      where	ID = rec.ID;
    end if;
  end loop;  
    
  
  -- �����������
  update fdc_Followup
  set	Object_ID = pID
  where	Object_ID = pSrcID;
  
  -- ������� ���� ������������� �������� �� ������ �������
  update fdc_Object O
  set O.OWNER_OBJECT_ID = pID
  where O.Owner_Object_Id = pSrcID;
  
  -- ������� ��������� �������
  update Fdc_Object_Kind
  set Evidence_ID = pID
  where Evidence_ID = pSrcID;
  
  -- ������� ������
  update Fdc_Object_Relation
  set Object_ID = pID
  where	Object_ID = pSrcID;

  update Fdc_Object_Relation
  set Rel_Object_ID = pID
  where	Rel_Object_ID = pSrcID;
  
  -- ������� ��������
  update fdc_subscription S
  set S.OBJECT_ID = pID
  where S.Object_Id = pSrcID;
  
  update fdc_subscription S
  set S.Evidence_Id = pID
  where S.Evidence_Id = pSrcID;
    
  -- ������� ���� �������������
  update	fdc_User_Grant
  set	Object_ID = pID
  where	Object_ID = pSrcID;
  
  -- ������� ���� �����
  update	fdc_User_Group_Grant
  set	Object_ID = pID
  where	Object_ID = pSrcID;

  -- ������� ���� ������ �� �������� ��������
  update	fdc_Value
  set	Ref_Object_ID = pID
  where	Ref_Object_ID = pSrcID;
  
  -- ������� ���� �������
  update	fdc_Event
  set	Object_ID = pID
  where	Object_ID = pSrcID;
    
  -- ����� ���� ���������� ����������� � ��������������� �������?
  if pDst.Descript is null and pSrc.Descript is not null then
  	update	fdc_Object
  	set	Descript = pSrc.Descript
  	where	ID = pID;
  end if;
  
  -- �������� ������� �������
  pEvent_ID := fdc_Event_Add('EventMerge', 
               Fdc_Object_Get_Name(pSrcID, 1, 1)||' (ID='||pSrcID||')'||
               ' ����������� � '||
               Fdc_Object_Get_Name(pID, 1, 1)||' (ID='||pID||')',
               pID);
  
  -- ������� ��������� ��������������� �������
  fdc_Object_Free(pSrcID, 0);
  
end fdc_Object_Merge;
/
