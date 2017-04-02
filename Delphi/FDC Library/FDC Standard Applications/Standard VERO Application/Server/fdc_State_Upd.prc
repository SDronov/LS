create or replace procedure fdc_State_Upd
-- ��������� ���������
	(
	  pID		number,             -- ������������� ��������� 
	  pName		varchar2,         -- ��������
	  pSysName 	varchar2,       -- ��������� ��� ���������
	  pActive		number,         -- ������� ����������
	  pAllowUpdates	number,     -- �������� �� ��������� ������� � ������ ���������
	  pAllowDelete	number,     -- �������� �� �������� ������� � ������ ���������
    pColor	number,           -- ����
    pShortName varchar2,      -- �������� ��������
	  pDescript varchar2        -- ��������
	)
is
begin
  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- �������� fdc_State
  update fdc_State
     set AllowUpdates = pAllowUpdates,
	       AllowDelete = pAllowDelete,
	       Active = pActive,
         Color	= pColor
   where ID = pID;

  -- ���� �����, �� ������ ��������� ���
  fdc_Object_Upd_SysName(pID, pSysName);
end fdc_State_Upd;
/
