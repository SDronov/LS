create or replace procedure fdc_Procedure_Reg_DelProc
-- ������������ ��������� ��� ��������� �������� ��� ��������� �����,
-- ������� ���������� �������� (��� ��������� ��� �������� Del �� �����)
	(
	  pID number    -- ������������� ���������
	)
is
  pObject_Type_ID number(15);
  pProcName varchar2(1500);
begin
  -- ��������� ���������� ����� ���������
  pProcName := upper(fdc_Object_Get_SysName(pID));

  -- ������ �� ��������� ����� � ���������� ��������� � � ��������������
  -- ���������� �������� � ����������� ��� ��� �������� ��������� ��� ��������� ��������
  for T in (select ID
	            from fdc_Object_Type
	           where upper(trim(TableName)||'_DEL') = pProcName and
		               Del_Procedure_ID is null) 
      loop
       	update fdc_Object_Type
	         set Del_Procedure_ID = pID
	       where ID = T.ID;
	    end loop;
end fdc_Procedure_Reg_DelProc;
/
