create or replace function fdc_User_Group_Get_AdminData
-- �������� ID ������ ��������������� ������ 'AdminData'
return number
is
begin
  -- ������� ����������
  return fdc_User_Group_Get('AdminData');
exception 
  when others then 
    Fdc_Util.Abort('�� ���������� ������ ��������������� ������ (AdminData)! ������ ������������ �������!', 1);
end fdc_User_Group_Get_AdminData;
/
