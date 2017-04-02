create or replace procedure fdc_Person_Merge
-- Слияние экземпляров субъектов
-- Присоединяемый субъект соединяется (сливается) с целевым
-- Идентификатор субъекта, получившегося в результате, 
-- равен идентификатору целевого субъекта
	(
	pID	number,               -- Идентификатор целевого субъекта
	pSrcID	number            -- Идентификатор присоединяемого субъекта
	)
is
  pDst	fdc_Person_Lst%rowtype;
  pSrc	fdc_Person_Lst%rowtype;
begin
  -- Получение целевого субъекта
  begin
  select	*
  into	pDst
  from	fdc_Person_Lst
  where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('При слиянии не определен целевой субъект по ID = '||pID);
  	when others then fdc_util.Abort('При слиянии ошибка определения целевого субъекта по ID = '||pID, 1);
  end;
  
  -- Получение присоединяемого субъекта
  begin
  select	*
  into	pSrc
  from	fdc_Person_Lst
  where	ID = pSrcID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('При слиянии не определен присоединяемый субъект по ID = '||pID);
  	when others then fdc_util.Abort('При слиянии ошибка определения присоединяемого субъекта по ID = '||pID, 1);
  end;
  
  -- Проверка типов
  Fdc_Object_Type_Is(pSrc.Typesysname, 'Person');
  Fdc_Object_Type_Is(pDst.Typesysname, 'Person');
  
  -- Заполнение незаполненных реквизитов
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
  
  -- Вызов базовой процедуры слияния 
  fdc_Object_Merge(pID, pSrcID);
    
end fdc_Person_Merge;
/
