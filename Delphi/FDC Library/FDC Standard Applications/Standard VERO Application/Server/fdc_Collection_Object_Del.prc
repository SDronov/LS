create or replace procedure fdc_Collection_Object_Del
-- �������� ������� �� �������� 
	(
  pID	number                   -- ������������� ������� � ��������
	)
is
  pCollectionObject fdc_Collection_Object%rowtype;
begin
    -- ��������� ������� ��������
  begin
    select *
    into pCollectionObject
    from fdc_Collection_Object
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ������� �������� �� ������ ������ � �������� ID='||pID);
  	when others then fdc_util.Abort('������ ��������� ������� � �������� ID='||pID, 1);
  end;

  -- �������� ����������� �������� ��������� � ��������
  if Fdc_Object_Is_Updatable(pCollectionObject.Collection_ID, 0) = 0 then
    fdc_Util.Abort('��� ���� �� ��������� ��������, ���� �� ��������� �� ��������� ���������');
  end if;

  -- �������� ������ �� ������� fdc_Collection_Object
  delete from fdc_Collection_Object
  where	ID = pID;

end fdc_Collection_Object_Del;
/
