create or replace procedure fdc_Task_Upd
-- ��������� ������
	(
	  pID	            number,             -- ������������� ������
	  pName           varchar2,           -- ��������,
    pSysName        varchar2,           -- ��������� ���
    pShortName	    varchar2,           -- �������� ��������
	  pDescript       varchar2            -- ��������
	)
is
begin
  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- ������ ��������� ���
  fdc_Object_Upd_SysName(pID, pSysName);
end fdc_Task_Upd;
/
