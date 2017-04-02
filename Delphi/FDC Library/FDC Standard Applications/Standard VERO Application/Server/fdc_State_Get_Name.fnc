create or replace function fdc_State_Get_Name
-- ���������� �������� ��������� �������. ���� ��������� �� �������,
-- �� ����������
	(
	  pID number   -- ������������� ���������
	)
    return varchar2
is
  Result varchar2(1500);
begin
  -- ���� ��������� ���, �� ���������� '�����������',
  -- ����� �������� �������
  if (pID is null) or (pID = 0) then
	   Result := '�����������';
   else
     Result := fdc_Object_Get_Name(pID);  
  end if;

  return Result;
end fdc_State_Get_Name;
/
