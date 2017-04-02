create or replace procedure fdc_Person_Merge
-- ������� ����������� ���������
-- �������������� ������� ����������� (���������) � �������
-- ������������� ��������, ������������� � ����������, 
-- ����� �������������� �������� ��������
	(
	pID	number,               -- ������������� �������� ��������
	pSrcID	number            -- ������������� ��������������� ��������
	)
is
  pDst	fdc_Person_Lst%rowtype;
  pSrc	fdc_Person_Lst%rowtype;
begin
  -- ��������� �������� ��������
  begin
  select	*
  into	pDst
  from	fdc_Person_Lst
  where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('��� ������� �� ��������� ������� ������� �� ID = '||pID);
  	when others then fdc_util.Abort('��� ������� ������ ����������� �������� �������� �� ID = '||pID, 1);
  end;
  
  -- ��������� ��������������� ��������
  begin
  select	*
  into	pSrc
  from	fdc_Person_Lst
  where	ID = pSrcID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('��� ������� �� ��������� �������������� ������� �� ID = '||pID);
  	when others then fdc_util.Abort('��� ������� ������ ����������� ��������������� �������� �� ID = '||pID, 1);
  end;
  
  -- �������� �����
  Fdc_Object_Type_Is(pSrc.Typesysname, 'Person');
  Fdc_Object_Type_Is(pDst.Typesysname, 'Person');
  
  -- ���������� ������������� ����������
  update	fdc_Person
  set	SurName	= nvl(SurName, pSrc.SurName),
    	FirstName	= nvl(FirstName, pSrc.FirstName),
    	MiddleName = nvl(MiddleName, pSrc.MiddleName),
    	OGRN	= nvl(OGRN, pSrc.OGRN),
    	INN	= nvl(INN, pSrc.INN),
    	KPP	= nvl(KPP, pSrc.KPP),
    	OKPO = nvl(OKPO, pSrc.OKPO),
    	BIC	= nvl(BIC, pSrc.BIC),
    	BirthDate	= nvl(BirthDate, pSrc.BirthDate),
    	BirthYear	= nvl(BirthYear, pSrc.BirthYear),
    	BirthLocation	= nvl(BirthLocation, pSrc.BirthLocation),
      Opf_Dict_ID = nvl(Opf_Dict_ID, pSrc.Opf_Dict_ID)
  where	ID = pID;
  
  -- ����� ������� ��������� ������� 
  fdc_Object_Merge(pID, pSrcID);
    
end fdc_Person_Merge;
/
