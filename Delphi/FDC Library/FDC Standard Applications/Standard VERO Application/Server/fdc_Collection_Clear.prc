create or replace procedure fdc_Collection_Clear
-- �������� �������� (������� �� ��� ��� �������)
	(
	pID	number                  -- ������������� ��������
	)
is
  pChk number;
begin
  -- �������� ����������� ��������� ��������
  begin
    pChk := Fdc_Object_Is_Updatable(pId, 1);
  exception  
    when others then
      fdc_util.Abort('��� �������� ���� �������� �� �������� ��� ���� �� ��������� ��������', 1);
  end;
  
  -- �������� ���� ������� � fdc_Collection_Object �� �������� ��������
  delete from fdc_Collection_Object
  where Collection_ID = pID;

end fdc_Collection_Clear;
/
