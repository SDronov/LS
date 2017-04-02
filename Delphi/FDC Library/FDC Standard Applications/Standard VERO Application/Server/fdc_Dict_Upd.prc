create or replace procedure fdc_Dict_Upd
-- ��������� ��������� ������� �����������
	(
	pID			   number,                      -- ������������� ������� �����������
	pName			 varchar2,                    -- ������������ (��������� ��������) ������� �����������
  pShortName  varchar2,                   -- ������� ������������ ������� �����������                        
	pCode			 varchar2,                    -- ��� ������� �����������
  pCode2     varchar2,                    -- �������������� ��� ������� �����������
	pDescript	 varchar2                     -- ����������� � ������� �����������
	)
is
  pDict fdc_Dict%rowtype;
begin
  -- �������� ���� ������� �����������
  if (fdc_Object_Is(pID, 'Dict') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� �������� �����������');
  end if;

  -- ������� ��������� ��������� ������� �� ���������� ����������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- ��������� ������� ��������
  begin
    select *
    into pDict
    from fdc_Dict
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ������� ��������� �� ������� ������� ����������� ID='||pID);
  	when others then fdc_util.Abort('������ ��������� �������� ������� ����������� ID='||pID, 1);
  end;

  -- ��������� ��������� ������ fdc_Dict
  if Nvl(trim(pCode), 'No name') <> Nvl(pDict.Code, 'No name') or
     Nvl(trim(pCode2), 'No name') <> Nvl(pDict.Code2, 'No name') then
    update	fdc_Dict
    set	Code = pCode,
        Code2 = pCode2
    where	ID = pID;
  end if;  
  
end fdc_Dict_Upd;
/
