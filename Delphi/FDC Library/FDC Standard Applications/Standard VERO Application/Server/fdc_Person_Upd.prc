create or replace procedure fdc_Person_Upd
-- ��������� ��������� �������� - ������������ ��� ����������� ����
	(
	pID			number,
	pName			varchar2,                       -- ������ ��� �������� 
	pShortName		varchar2,                   -- ������� ��� �������� 
	pSurName		varchar2,                     -- ������� ��� ��� ���, ��� �� ��� �� �����������
	pFirstName		varchar2,                   -- ��� ��� ������, ��� ����� �� �����������             
	pMiddleName		varchar2,                   -- �������� ��� ������, ��� ����� �� �����������
  pOGRN     varchar2,                       -- �������� ��������������� ��������������� �����
	pINN			varchar2,                       -- �������������� ����� �����������������
	pKPP			varchar2,                       -- ��� ������� ���������� �� ��������� ���� (�������������� ��� � ���)
	pOKPO			varchar2,                       -- ��� �� ��������������� �������������� ����������� � �����������
	pBIC			varchar2,                       -- ���������� ����������������� ���
	pBirthDate		date,                       -- ���� �������� (����������� �����������) 
	pBirthYear		number,                     -- ��� �������� (����������� �����������)
	pBirthLocation		varchar2,               -- ����� �������� (����������� �����������)
  pOPF_Dict_ID number,                      -- ��������������-�������� ����� �����������. ������ �� ���������� �����
	pDescript		varchar2                      -- �����������              
	)
is
  pPerson fdc_Person%rowtype;
  ppBirthYear number;
begin
  -- �������� ���� 
  if (fdc_Object_Is(pID, 'Person') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ���������');
  end if;
  
  -- �������� ���������� ��� ����������� ���
  if fdc_Object_Is(pID, 'Legal') = 1 then
    if trim(pName) is null or
       trim(pSurName) is not null or
       trim(pFirstName) is not null or
       trim(pMiddleName) is not null then
      fdc_Util.Abort('�������� ��������� ��� ��������� ������������ ����'); 
    end if;   
    if (pOPF_Dict_ID is not null) and (Fdc_Object_Is(pOPF_Dict_ID, 'Dict.OKOPF')<>1) then
      fdc_Util.Abort('�������� ��� ����������� ��� ��� ��������� ������������ ����'); 
    end if; 
  end if;
  
  -- �������� ���������� ��� ���������� ���
  if fdc_Object_Is(pID, 'Human') = 1 then
    if trim(pOGRN) is not null or
       trim(pKPP) is not null or
       trim(pOKPO) is not null or
       trim(pBIC) is not null or
       trim(pOPF_Dict_ID) is not null then
      fdc_Util.Abort('�������� ��������� ��� ��������� ����������� ����'); 
    end if;   
  end if;
  
  -- ��������� ����
  ppBirthYear := nvl(pBirthYear, To_Number(To_Char(pBirthDate,'YYYY')));

  -- ������� ��������� ��������� ������� �� ���������� ����������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  
  -- ��������� ������������� ���������� ��������
  begin
    select	*
    into	pPerson
    from	fdc_Person
    where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ���������� ��������� �� ������ ������� ID='||pID);
  	when others then fdc_util.Abort('��� ���������� ��������� ������ ��������� ���������� � �������� ID='||pID, 1);
  end;

  -- ���� �� ��������� � ���������� ��������?
  if nvl(pSurName, '???') <> nvl(pPerson.Surname, '???') or
     nvl(pFirstName, '???') <> nvl(pPerson.Firstname, '???') or
     nvl(pMiddleName, '???') <> nvl(pPerson.Middlename, '???') or
     nvl(pOGRN, '???') <> nvl(pPerson.Ogrn, '???') or
     nvl(pINN, '???') <> nvl(pPerson.Inn, '???') or
     nvl(pKPP, '???') <> nvl(pPerson.KPP, '???') or
     nvl(pOKPO, '???') <> nvl(pPerson.OKPO, '???') or
     nvl(pBIC, '???') <> nvl(pPerson.BIC, '???') or
     nvl(pBirthDate, to_Date('01.01.1800', 'DD.MM.YYYY')) <> nvl(pPerson.BirthDate, to_Date('01.01.1800', 'DD.MM.YYYY')) or
     nvl(ppBirthYear, 0) <> nvl(pPerson.BirthYear, 0) or
     nvl(pBirthLocation, '???') <> nvl(pPerson.BirthLocation, '???') or
     nvl(pOPF_Dict_ID, 0) <> nvl(pPerson.OPF_Dict_ID, 0) then
    -- �������� ��������� � ���������� ��������
    update fdc_person
       set surname = pSurName,
           firstname = pFirstName,
           middlename = pMiddleName,
           ogrn = pOGRN,
           inn = pINN,
           kpp = pKPP,
           okpo = pOKPO,
           bic = pBIC,
           birthdate = pBirthDate,
           birthyear = ppBirthYear,
           birthlocation = pBirthLocation,
           opf_dict_id = pOPF_Dict_ID
     where id = pId;
  end if;

end fdc_Person_Upd;
/
