create or replace procedure fdc_Address_Del
-- �������� ������
	(
	pID number,                -- ������������� ������
  pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                             -- (��������� �� Event?)
                             -- �� ��������� ���������� (�������� 1)
                             -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� ���������� �������
  if (fdc_Object_Is(pID, 'Address') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� �������');
  end if;

  -- �������� ������ �� ������� fdc_Address
  delete from fdc_Address
  where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Address_Del;
/
