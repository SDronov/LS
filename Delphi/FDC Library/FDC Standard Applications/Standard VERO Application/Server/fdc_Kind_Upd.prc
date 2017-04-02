create or replace procedure fdc_Kind_Upd
-- ��������� �������
	(
	  pID	number,                     -- ������������� �������
	  pName varchar2,                 -- ��������
	  pSysName varchar2,              -- ��������� ��������
	  pRate	number,                   -- ���������� (0 - 100)
	  pIcon	varchar2,                 -- ������ �������
	  pShortName varchar2,            -- �������� ��������
	  pDescript varchar2              -- ��������
	)
is
begin
  -- ���������, ��� ���������� �� 0 �� 100
  if (pRate < 0) or (pRate > 100) then
	   fdc_util.abort('���������� ������� ������ ���� �� 0 �� 100');
  end if;

  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- �������� fdc_Kind
  update fdc_Kind
     set Rate	= pRate,
     	   Icon	= pIcon
   where ID = pID;

  -- ���� �����, �� ������ ��������� ���
  fdc_Object_Upd_SysName(pID, pSysName);
end fdc_Kind_Upd;
/
