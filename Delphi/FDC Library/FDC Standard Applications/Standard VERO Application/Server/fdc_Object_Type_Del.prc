create or replace procedure fdc_Object_Type_Del
-- �������� ���� �������
	(
	pID number,                     -- ������������� ���������� ���� �������
	pDoLog number := 1              -- ���������� �� ������� �������� ������� 
                                  -- (��������� �� Event?)
                                  -- �� ��������� ���������� (�������� 1)
                                  -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� ���������� �������
  if (fdc_Object_Is(pID, 'ObjectType') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ����� �������');
  end if;

  -- �������� ���� ������ � ������-��������
  delete from fdc_Child_Object_Type
  where	Child_Object_Type_ID = pID;
  
  -- �������� ������ ���� � fdc_Object_Type
  delete from fdc_Object_Type
  where	ID = pID;
  
  -- ����� ������� ��������� �������� �������
  fdc_Object_Del(pID, pDoLog);

end fdc_Object_Type_Del;
/
