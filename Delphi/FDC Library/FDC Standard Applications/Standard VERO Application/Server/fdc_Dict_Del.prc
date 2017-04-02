create or replace procedure fdc_Dict_Del
-- �������� ������� �����������
	(
	pID	number,                     -- ������������� ������� �����������
	pDoLog number := 1              -- ���������� �� ������� �������� ������� 
                                  -- (��������� �� Event?)
                                  -- �� ��������� ���������� (�������� 1)
                                  -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� ������� �����������
  if (fdc_Object_Is(pID, 'Dict') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� �������� �����������');
  end if;

  -- �������� ������ fdc_Dict
  delete from fdc_Dict
  where ID = pID;
  
  -- �������� ���������� �������
  fdc_Object_Del(pID, pDoLog);

end fdc_Dict_Del;
/
