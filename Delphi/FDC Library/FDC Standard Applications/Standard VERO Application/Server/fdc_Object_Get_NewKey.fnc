create or replace function fdc_Object_Get_NewKey
-- ���������� ��������� �������� ������������������ ��� ���������
-- �������� �������������� �������
return number
is
  Result number(15);
begin
  select FDC_OBJECT_KEY_SQ.NextVal
    into Result
    from dual;

  return Result;
end fdc_Object_Get_NewKey;
/
