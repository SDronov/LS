create or replace function fdc_User_Group_Get_AdminTask
-- �������� ID ������ ��������������� ����� 'AdminTask'
return number
is
begin
  -- ������� ����������
  return fdc_User_Group_Get('AdminTask');
exception 
  when others then 
    Fdc_Util.Abort('�� ���������� ������ ��������������� ����� (AdminTask)! ������ ������������ �������!', 1);
end fdc_User_Group_Get_AdminTask;
/
