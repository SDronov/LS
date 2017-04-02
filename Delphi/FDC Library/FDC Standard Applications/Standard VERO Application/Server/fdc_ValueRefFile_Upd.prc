create or replace procedure fdc_ValueRefFile_Upd
-- �������� ��������� ��������� ��� �������������� ������� ������ �� ����. 
	(
    pID	number,                       -- �������������
	  pName			varchar2,               -- ��������  
    pSysName  varchar2,               -- ��������� ���
    pFile_ID number,                  -- ������������� �����, �� ������� �������� ������
	  pShortName   varchar2,            -- �������� ��������
	  pDescript		varchar2              -- ��������
	)
is
  pChk number;
begin
  -- ������� �� ������� �����, �� ������� �������� ������
  begin
    select 1
      into pChk
      from fdc_File
     where ID = pFile_ID;
  exception
    when NO_DATA_FOUND then fdc_util.Abort('�� ��������� ���� �� ID = '||pFile_ID);
  	when others then fdc_util.Abort('������ ��������� ����� �� ID = '||pFile_ID, 1); 
  end;

  -- �������� ������� ��������� ��������� ������ �� ������
  fdc_ValueRef_Upd(pID, pName, pSysName, pFile_ID, pShortName, pDescript);

end fdc_ValueRefFile_Upd;
/
