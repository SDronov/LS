create or replace procedure fdc_Object_Type_Is
-- ��������� �������� �� ������������� ��� �������� �������.
-- ���� �� ��������, �� ��������� ����������
	(
	  pType varchar2,     -- ��������� ��� �������������� ����
	  pBaseType varchar2  -- ��������� ��� ���������� ������
	)
is
  pCnt number;
begin
  pCnt := fdc_Object_Type_Is_Subtype(pType,pBaseType,1);
end fdc_Object_Type_Is;
/
