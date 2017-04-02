create or replace procedure fdc_ValueBool_Upd
-- �������� ��������� ��������� ��� �������������� ������� ������-����.
	(
	  pID	number,                       -- �������������
	  pName			varchar2,               -- ��������  
    pSysName  varchar2,               -- ��������� ��� 
    pNumValue	 number,                -- ����������� �������� (1 - ������, 0 - ����)  
	  pShortName   varchar2 := null,    -- �������� ��������
	  pDescript		varchar2 := null      -- ��������
	)
is
  pValName varchar(1500);
begin
  -- ���� ����������� �������� �� ������, �� ����� � ��������� ����������
  if (pNumValue is null) then
	   fdc_util.abort('���������� ������ ����������� ��������');
  end if;

  -- ������� ��������� ��������, ��������, ��� �������� 0 ��� 1
  -- ���� ���, �� ����� � ��������� ����������  
  if (pNumValue = 1) then
	   pValName := '��';
  elsif (pNumValue = 0) then
     pValName := '���';
   else
     fdc_util.abort('�������� ������ ���� 0 ��� 1');  
  end if;

  -- �������� ������� ���������
  fdc_Value_Upd(pID, pName, pSysName, pValName, pNumValue, null, null, pShortName, pDescript);
  
end fdc_ValueBool_Upd;
/
