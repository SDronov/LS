create or replace function fdc_Table_Get_BaseTableName
-- ��������� ����� ������������ ������� ��� �������� ��������� �������
-- ������������ ��� ����������� �� Erwin ���������� ���� ��� �������
-- ������������ �� ������ ���������� � ��������� �����.
-- ��� fdc_Object ���������� NULL,
-- � ������, ���� ���� ������������ ������� (�� ������ fdc_Column) - ���������� ��
-- ���� ��� - ���������� fdc_Object
	(
	pTableName varchar2  -- �������� �������
	)
  return varchar2
is
  pResTableName varchar2(100);
  pRefTableName varchar2(100) := null;
  pPKColumn     varchar2(100); 
begin
  -- ������������
  pResTableName := upper(trim(pTableName));

  if pResTableName = 'FDC_OBJECT' then
    -- � fdc_Object ��� ������������ �������
    pRefTableName := null;
  else  
    -- ������ � fdc_column
    begin
      select  C.COLNAME, C.PKTableName
      into	  pPKColumn, pRefTableName
      from	  fdc_Column C
      where	  TableName = pResTableName and
      	      IsPK = 1;
    exception
      when no_data_found then
        fdc_util.abort('������ ��������� ������������ �������: �� ������� ���������� � ��������� ����� ������� '||pResTableName||' � fdc_Column');
      when too_many_rows then
        fdc_util.abort('������ ��������� ������������ �������: ��������� ����� � ��������� ����� ������� '||pResTableName);
      when others then      
        fdc_util.abort('������ ��������� ������������ ������� ��� '||pResTableName, 1);
    end;   
    
    -- �������� ���������� ���������� ����� 
    if nvl(pPKColumn, '?') <> 'ID' then
        fdc_util.abort('���� ���������� ����� ������ ���������� <ID>');
    end if;
    
    if pRefTableName is null then
      -- ��� ������ �������� �����
      -- ������ ��� ��������������� ������� ���� ��������������� �� fdc_Object
    	pRefTableName := 'FDC_OBJECT';
    end if;
  end if;  
  return pRefTableName;
end fdc_Table_Get_BaseTableName;
/
