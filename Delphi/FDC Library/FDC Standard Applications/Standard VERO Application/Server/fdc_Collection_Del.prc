create or replace procedure fdc_Collection_Del
-- �������� ��������
	(
  pID number,                -- ������������� ��������               
  pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                             -- (��������� �� Event?)
                             -- �� ��������� ���������� (�������� 1)
                             -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� ���������� �������
  if (fdc_Object_Is(pID, 'Collection') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ���������');
  end if;

  -- �������� ������ �� ������� fdc_Collection_Object
  delete from fdc_Collection_Object
      where Collection_ID = pID;

  -- �������� ������ �� ������� fdc_Collection
  delete from fdc_Collection
      where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Collection_Del;
/
