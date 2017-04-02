create or replace procedure fdc_User_Upd
-- ��������� ������������ VERO
	(
	  pID	number,                    -- ������������� ������������
	  pLastName	varchar2,            -- �������
	  pFirstName varchar2,           -- ���
	  pMiddleName	varchar2,          -- ��������
    pShortName varchar2,           -- �������� ��������
    pDescript varchar2             -- ��������
	)
is
begin
  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID,trim(pLastName||' '||pFirstName||' '||pMiddleName), pShortName, pDescript);
  
  -- ��������� ������ 
  update fdc_User
     set LastName = pLastName,
	       FirstName = pFirstName,
	       MiddleName = pMiddleName
   where ID = pID;
end fdc_User_Upd;
/
