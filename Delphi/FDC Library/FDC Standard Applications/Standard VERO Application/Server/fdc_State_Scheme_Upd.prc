create or replace procedure fdc_State_Scheme_Upd
-- ��������� ����� ���������
	(
	  pID	number,                 -- ������������� �����
	  pName	varchar2,             -- ��������   
    pShortName varchar2,        -- �������� ��������
	  pDescript varchar2          -- �������� 
	)
is
begin
  -- ����� ������� ������� ��������� �������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
end fdc_State_Scheme_Upd;
/
