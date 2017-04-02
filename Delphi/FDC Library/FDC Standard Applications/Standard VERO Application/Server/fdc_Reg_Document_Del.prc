create or replace procedure fdc_Reg_Document_Del
-- ��������  ���������������� ���������
	(
	pID number,                -- �������������  ���������������� ���������
  pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                             -- (��������� �� Event?)
                             -- �� ��������� ���������� (�������� 1)
                             -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� ���������� �������
  if (fdc_Object_Is(pID, 'RegDocument') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ��������������� ����������');
  end if;

  -- �������� ������ �� ������� fdc_Reg_Document
  delete from fdc_Reg_Document
  where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Reg_Document_Del;
/
