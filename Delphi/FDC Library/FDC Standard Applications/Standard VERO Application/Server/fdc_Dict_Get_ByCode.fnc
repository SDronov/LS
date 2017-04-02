create or replace function fdc_Dict_Get_ByCode
-- ��������� ������� ����������� �� �� ����
  (
  pObject_Type_SysName varchar2,           -- ��������� ��� ���� ����������� (������ ���� �������� 'Dict') 
  pCode varchar2,                          -- ��� � ������� � �����������
	pDoRaise	number := 1                    -- ��������� �� ���������� ��� ���������� �������
                                           -- �� ��������� (�������� <> 0) ��������� 
  ) 
return number 
is
  pResult number;
begin
  -- ������� ������� �� ����������� �� ����
  begin
    select ID
    into pResult
    from Fdc_Dict_Lst D
    where D.Code is not null and
          D.TYPESYSNAME = pObject_Type_SysName and
          D.CODE = pCode;
  exception
   when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('������ ��������� ������� ����������� '||pObject_Type_SysName||' �� ���� '||pCode, 1);
  end;

  -- ���� �� ������� ������� � ����� ��������� ����������
  if pResult is null and pDoRaise > 0 then
    fdc_util.Abort('�� ������� ������� ����������� '||pObject_Type_SysName||' �� ���� '||pCode);
  end if; 
    
  return pResult;        
end;
/
