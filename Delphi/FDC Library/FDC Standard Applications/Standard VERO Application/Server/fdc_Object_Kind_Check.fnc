create or replace function fdc_Object_Kind_Check
-- ��������� ����� �� �������� ������ ������ �������
-- ���������� 1 - �����, 0 - ���
  (
    pID number,             -- ������������� �������
    pKindSysName varchar2   -- ��������� ��� ������� 
	)
    return number
is
  pChk number;
begin
 select 1
   into pChk
   from fdc_Object_Kind_Lst
  where KindSysName = pKindSysName
    and Object_ID = pID
    and rownum <= 1;
    
 return pChk;
exception
	  when NO_DATA_FOUND then return 0;
  	when others then fdc_util.Abort('������ ������ ������� � ������� � ID = '||pID, 1);
end fdc_Object_Kind_Check;
/
