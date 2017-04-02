create or replace function fdc_Person_Search (pConditionSess	varchar2)
-- ��������� ������ �������� �� ������������������ ��������� ����� 
-- � �������������� ��������� ������� fdc_Buffer
-- ���������������, ��� �������������� �� ��� �� ��������� ����� 
-- ����������� ��������� fdc_buffer_add_searchcondition
-- ���������� ������ ��������� ��������� � ����� ��������������� ������ (fdc_Buffer.Sess)
-- ���� ������������� ������ ���������� � ������ ������� (fdc_Person_Search)
-- � �������� �������� ��������� pConditionSess
-- ����� �� ��������� ������� ��������� ������������ � �������������� 
-- �������������� ������ fdc_Search
-- ��������� ������� ���������� � fdc_Buffer � ����� ��������������� ������,
-- ������������� ��� ��������� ������ ������� (fdc_Person_Search)
-- ����� ������������� ������ ��� ��������� ����� ���� ������� �� �������
-- � �������������� ������������� fdc_person_lst_bysearchbuf

-- ���������������, ��� ��������� �������� ������� ������� �� ��� ������:
-- 1. ������� �� ��������� (�������� ��������� ����� ������� REQ_)
-- 2. �������������� �������, ��������, �� ����� � ������� ��������� (�������� ��������� ����� ������� ADD_)
-- ������� ���� ����� ������������ �� "�"
-- � ������ ������ ������ ������� ����� ������������ ��� �� "�", ��� � �� "���"
-- ��� ������������ ����������� PARAM_RequsitesSearchOR � PARAM_AddSearchOR
-- ('1' - "���", '0' - "�")

-- ���������, �������� ������� �� ����, �������� � ���������������� ��� ������,
-- ���������, ������� ���������� �����: true, false ���������� �������������� ��� 1, 0
-- ��� �������������� ���������� ��������� ���������������� �������� ���������� (��������!) ��������,
-- ��� ���������������� ��� ������, ��������, ������ ���������������
-- �������������� ����������� ��� �������� ���������� ��. � ����������� � fdc_buffer_add_searchcondition

-- �������������� �������, �������������� ������ �������� � �������� �������:
-- 1. ������� ������� ������������� ����
-- 2. ������� ������ � ��������������� ���������� ������������� ���� 

-- �������������� ��������� ��������:
-- ������������:
-- PARAM_MAXROWS - ������������ ���������� ������� � ����������
-- PARAM_REQ_SEARCH_OR - ��� ������������ ������� �� ���������: 0 - "�", 1 - "���"
-- PARAM_ADD_SEARCH_OR - ��� ������������ �������������� �������: 0 - "�", 1 - "���"
-- ��������������:
-- REQ_FULLNAME - ��������� ������ ��� ������������
-- REQ_ADDRESS - ��������� ������ ��� ������
-- REQ_BIC - ��������� ������ ��� ���
-- REQ_DOCNUMBER - ��������� ������ ��� ������ ���������
-- REQ_INN - ��������� ������ ��� ���
-- REQ_KPP - ��������� ������ ��� ���
-- REQ_OKPO - ��������� ������ ��� ����
-- REQ_OGRN - ��������� ������ ��� ����
-- ADD_KIND_ID - ������������� �������, �� ������� ������������ �����
-- ADD_REG_DOC_TYPE_ID - ������������� ���� ���������������� ���������

 
return varchar2 is

pCurSess			varchar2(1500);
pPrevSess     varchar2(1500) := null;
pResSess			varchar2(1500) := null;
pFinalSess  	varchar2(1500) := null;

pCnt number;

pCurrent_Criteria varchar2(100);
pObjectTypesList varchar2(2000);

-- ���������� ��������������� �����, ������������ ��� ������
PersonTypeID number;
RegDocumentTypeID number;
AddressTypeID number;

-- ���������� ������ �� ��������������� ����������
lAndSqlLst Fdc_Search.Tsql_Lst := Fdc_Search.Tsql_Lst();
lOrSqlLst Fdc_Search.Tsql_Lst := Fdc_Search.Tsql_Lst();

-- ���������� ������ ������� ��������
lAndSqlStr varchar2(4000);
lOrSqlStr varchar2(4000);
lLinkedObjID number;

-- ���������
REQ_FullName             constant varchar2(100) := 'REQ_FULLNAME';
REQ_Address              constant varchar2(100) := 'REQ_ADDRESS';
REQ_BIC                  constant varchar2(100) := 'REQ_BIC';
REQ_DocNumber            constant varchar2(100) := 'REQ_DOCNUMBER';
REQ_INN                  constant varchar2(100) := 'REQ_INN';
REQ_KPP                  constant varchar2(100) := 'REQ_KPP';
REQ_OKPO                 constant varchar2(100) := 'REQ_OKPO';
REQ_OGRN                 constant varchar2(100) := 'REQ_OGRN';
ADD_KIND_ID              constant varchar2(100) := 'ADD_KIND_ID';
ADD_REG_DOC_TYPE_ID      constant varchar2(100) := 'ADD_REG_DOC_TYPE_ID';
--------------------------------------------------------------------------------
---  ���������� ���������
--------------------------------------------------------------------------------
  -- ���������� ��������� ������������� ������ �����
  -- !! ���������� ��� ���������� ���� ������������� ����� ��������,
  -- �� ��� �������� ������ ���������
  procedure Init_Search_Fields is
  begin
    fdc_Search.Search_Field_Lst.delete;
    fdc_Search.Search_Field_Add(REQ_OGRN, '����', 'OGRN');
    fdc_Search.Search_Field_Add(REQ_INN, '���', 'INN');
    fdc_Search.Search_Field_Add(REQ_KPP, '���', 'KPP');
    fdc_Search.Search_Field_Add(REQ_OKPO, '����', 'OKPO');
    fdc_Search.Search_Field_Add(REQ_BIC, '���', 'BIC');
  end;

  ------------------------------------
  -- ���������� ��������� ���������� ������������� ���� �� ���������� �����
  function SetIDByType (pObjectTypeSysName varchar2) return number is
    lTypeID number;
  begin
    lTypeID := fdc_Object_Get_BySysName('ObjectType',pObjectTypeSysName);
    if lTypeID is null then
      raise_application_error(-20270, '������ ����������� �������������� ���� �������: '||pObjectTypeSysName);
    end if;
    return lTypeID;
  end;

  ------------------------------------
  -- ���������� ��������� ���������� �������� SQL
  procedure InitSQLLst  (pAndSqlLst_Cnt number,
                         pOrSqlLst_Cnt number) is
    begin
    lAndSqlLst.delete;
    lOrSqlLst.delete;
    for i in 1..pAndSqlLst_Cnt loop
      lAndSqlLst.extend;
    end loop;
    for i in 1..pOrSqlLst_Cnt loop
      lOrSqlLst.extend;
    end loop;
    end;
  ------------------------------------
  ------------------------------------
  -- ���������� ��������� ������������ ������ � SQL (��� �������)
  function Get_Debug_SQL return varchar2 is
    lDEbugStr varchar2(4000);
    begin
      for i in 1..lAndSqlLst.count loop
        lDEbugStr := lDEbugStr || '*****AND'||i||':'||chr(10)||lAndSqlLst(i)||chr(10);
      end loop;
      for i in 1..lOrSqlLst.count loop
        lDEbugStr := lDEbugStr || '*****OR'||i||':'||chr(10)||lOrSqlLst(i)||chr(10);
      end loop;
      return lDEbugStr;
    end;
  ------------------------------------
  ------------------------------------
  -- ���������� ��������� ������� ������ �� ��������������� ������
  procedure Exec_Reg_Search_Step  (pSearch_Value varchar2,
                                   pDescr varchar2) is
    begin
      fdc_Search.Exec_Req_Search_Step (
        pSearch_Value => pSearch_Value,
        pDescr => pDescr,
        pSQL_And => lAndSqlLst,
        pSQL_Or => lOrSqlLst,
        pCurSess => pCurSess,
        pPrevSess => pPrevSess,
        pResSess => pResSess);
    end;
  ------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- ���������� ������ ������
begin

  -----------------------------------
  -- ������������� ��������� ������
  -----------------------------------
  Init_Search_Fields;
  PersonTypeID := SetIDByType('Person');
  RegDocumentTypeID := SetIDByType('RegDocument');
  AddressTypeID := SetIDByType('Address');
  
  -----------------------------------
  -- ������������� ������� ���������
  -----------------------------------
  fdc_Search.Fill_Search_Criteria(pConditionSess);
  if not fdc_Search.Search.REQ_Conditions and
     not fdc_Search.Search.ADD_Conditions then
  	Raise_application_error(-20001,'����� ������ �������� ������!');
  end if;
  
  
  -----------------------------------
  -- �������� ���������
  -----------------------------------
  if not fdc_search.criteria_active(REQ_INN) and
     fdc_search.criteria_active(REQ_KPP) then
  	fdc_Util.Abort('��� ����� ���� ����� ������ ���� ����� ���');
  end if;

  -------------------------------------------------------------------------
  -------------------------------------------------------------------------
  -----------------------------------
  -- ������ �� ��������������� ������
  -----------------------------------
  if fdc_Search.Search.REQ_Conditions then
    pCurSess := fdc_search.new_search_sess;

    -----------------------------------------
    -- ������������� �����
    -- �� �������� ��������������� ����������
    -- (����, ���, ���, ����, ���)
    -----------------------------------------
    InitSQLLst(1, 1);
    for i in 1..fdc_Search.Search_Field_Lst.count loop
      pCurrent_Criteria := fdc_Search.Search_Field_Lst(i).Name;
      if fdc_search.criteria_active(pCurrent_Criteria) then
        lAndSqlLst(1) :=
              'select	/*+FIRST_ROWS*/ distinct P.ID, :pCurSess, P.ID, :pDescr'||chr(10)||
    	        'from	fdc_Person P, fdc_Buffer B'||chr(10)||
    	        'where P.'||fdc_Search.Search_Field_Lst(i).Field_Name || ' like :pSearch_Value and'||chr(10)||
              'B.Sess = :pPrevSess and B.ID = P.ID';
        lOrSqlLst(1) :=
              'select	/*+FIRST_ROWS*/ P.ID, :pCurSess, P.ID, :pDescr'||chr(10)||
    	        'from	fdc_Person P'||chr(10)||
    	        'where	P.' || fdc_Search.Search_Field_Lst(i).Field_Name || ' like :pSearch_Value';
        Exec_Reg_Search_Step (fdc_search.criteria_Str(pCurrent_Criteria),
                              '�� '||fdc_Search.Search_Field_Lst(i).Descr);
        if pResSess is not null then
          exit;
        end if;
      end if; -- fdc_search.criteria_active(pCurrent_Criteria)
    end loop;
    -----------------------------------------
    -- �������� ������������� �����
    -- �� �������� ��������������� ����������
    -----------------------------------------

    -----------------------------------------
    -- ����� �� ������������
    -----------------------------------------
    pCurrent_Criteria := REQ_FullName;
    if fdc_Search.Criteria_Active(pCurrent_Criteria) and pResSess is null then
      pObjectTypesList := PersonTypeID || ', ' ||
                          RegDocumentTypeID;
      InitSQLLst(2, 2);
      -- AND---
      -- �� ������� ����� �������� � ������ � ����������� ���������
      lAndSqlLst(1) :=
          'select /*+RULE*/ distinct'||chr(10)||
          'case when COT.Object_Type_ID = ' || PersonTypeID ||' then O.ID '||chr(10)||
          '     else O.Owner_Object_ID end ID, '||chr(10)||
          ':pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Child_Object_Type COT, fdc_Object O, fdc_Buffer B'||chr(10)||
          'where upper(O.Name) is not null and'||chr(10)||
          'upper(O.Name) like :pSearch_Value and'||chr(10)||
          'COT.Object_Type_ID in (' || pObjectTypesList ||') and'||chr(10)||
          'O.Object_Type_ID is not null and'||chr(10)||
          'O.Object_Type_ID = COT.Child_Object_Type_ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = O.Owner_Object_ID';
      -- �� �������� ����� ��������
      lAndSqlLst(2) :=
          'select /*+FIRST_ROWS*/ distinct'||chr(10)||
          'O.ID as ID,'||chr(10)||
          ':pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Object O, fdc_Buffer B'||chr(10)||
          'where upper(O.ShortName) is not null and'||chr(10)||
          'upper(O.ShortName) like :pSearch_Value and'||chr(10)||
          'O.Object_Type_ID = ' || PersonTypeID || ' and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = O.ID';

      -- OR ---
      -- �� ������� ����� �������� � ������ � ����������� ���������
      lOrSqlLst(1) :=
          'select /*+FIRST_ROWS*/ distinct'||chr(10)||
          'case when COT.Object_Type_ID = ' || PersonTypeID ||' then O.ID '||chr(10)||
          '     else O.Owner_Object_ID end ID, '||chr(10)||
          ':pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Child_Object_Type COT, fdc_Object O'||chr(10)||
          'where upper(O.Name) is not null and'||chr(10)||
          'upper(O.Name) like :pSearch_Value and'||chr(10)||
          'COT.Object_Type_ID in (' || pObjectTypesList ||') and'||chr(10)||
          'O.Object_Type_ID is not null and'||chr(10)||
          'O.Object_Type_ID = COT.Child_Object_Type_ID';
      -- �� �������� ����� ��������
      lOrSqlLst(2) :=
          'select /*+FIRST_ROWS*/ distinct'||chr(10)||
          'O.ID as ID,'||chr(10)||
          ':pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Object O, fdc_Buffer B'||chr(10)||
          'where upper(O.ShortName) is not null and'||chr(10)||
          'upper(O.ShortName) like :pSearch_Value and'||chr(10)||
          'O.Object_Type_ID = ' || PersonTypeID;

      Exec_Reg_Search_Step (fdc_search.criteria_Str(pCurrent_Criteria),
                            '�� ������������');
    end if; -- ����� �� ������������

    -----------------------------------------
    -- ����� �� ������
    -----------------------------------------
    pCurrent_Criteria := REQ_Address;
    if fdc_Search.Criteria_Active(pCurrent_Criteria) and pResSess is null then
        -- � �������� ���� ���������� ������������� Address,
        -- �.�. ������ ����� Owner_object_ID � ������� ���� Address - �����������:
        -- �� ������ ������� ����������� ������� �������� �� �������� �, ��������,
        -- �� ������� ������������.
        -- ��� ���� ������ Person_ID ���� � ������ �� ��������, ��� ���� ��� ���������� ���������
      InitSQLLst(1, 1);
      lAndSqlLst(1) :=
          'select /*+FIRST_ROWS*/ distinct P.ID, :pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Child_Object_Type COT, fdc_Object O, fdc_Person P, fdc_Buffer B'||chr(10)||
          'where upper(O.Name) is not null and'||chr(10)||
          'upper(O.Name) like :pSearch_Value and'||chr(10)||
          'COT.Object_Type_ID = ' || AddressTypeID ||' and'||chr(10)||
          'O.Object_Type_ID = COT.Child_Object_Type_ID and'||chr(10)||
          'O.Owner_Object_Id = P.ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = P.ID';
      lOrSqlLst(1) :=
          'select /*+FIRST_ROWS*/ distinct P.ID, :pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Child_Object_Type COT, fdc_Object O, fdc_Person P'||chr(10)||
          'where upper(O.Name) is not null and'||chr(10)||
          'upper(O.Name) like :pSearch_Value and'||chr(10)||
          'COT.Object_Type_ID = ' || AddressTypeID ||' and'||chr(10)||
          'O.Object_Type_ID = COT.Child_Object_Type_ID and'||chr(10)||
          'O.Owner_Object_Id = P.ID';
      Exec_Reg_Search_Step (fdc_search.criteria_Str(pCurrent_Criteria),
                            '�� ������');
    end if; -- ����� �� ������

    -----------------------------------------
    -- ����� �� ���. ���������
    -----------------------------------------
    pCurrent_Criteria := REQ_DocNumber;
    if fdc_Search.Criteria_Active(pCurrent_Criteria) and pResSess is null then
      InitSQLLst(1, 1);
      lAndSqlLst(1) :=
          'select /*+RULE*/ distinct P.ID, :pCurSess, D.ID, :pDescr'||chr(10)||
          'from	fdc_Reg_Document D, fdc_Object_Lst O, fdc_Buffer B, fdc_Person P'||chr(10)||
          'where D.Docnumber like :pSearch_Value and'||chr(10)||
          '      D.ID = O.ID and'||chr(10)||
          '      O.OWNER_OBJECT_ID = P.ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = P.ID';
      lOrSqlLst(1) :=
          'select /*+RULE*/ distinct P.ID, :pCurSess, D.ID, :pDescr'||chr(10)||
          'from	fdc_Reg_Document D, fdc_Object_Lst O, fdc_Person P'||chr(10)||
          'where D.Docnumber like :pSearch_Value and'||chr(10)||
          '      D.ID = O.ID and'||chr(10)||
          '      O.OWNER_OBJECT_ID = P.ID';

      Exec_Reg_Search_Step (fdc_search.criteria_Str(pCurrent_Criteria),
                            '�� ���. ���������');
    end if; -- ����� �� ���. ���������

    pPrevSess := pCurSess;
  end if; -- fdc_Search.Search.REG_Conditions
  -----------------------------------
  -- ��������� ������ �� ��������������� ������
  -----------------------------------
  -------------------------------------------------------------------------
  -------------------------------------------------------------------------

  ---------------------------------------------------
  -- ������ �� �������������� ��������
  ---------------------------------------------------
  ---------------------------------------------------
  -- ����� �� ��������
  ---------------------------------------------------
  if fdc_Search.Criteria_Active(ADD_KIND_ID) then
    pCurSess := fdc_search.new_search_sess;
    lOrSqlStr := null;
    lAndSqlStr := null;
    for i in 1..fdc_Search.Search.Search_Criteria_Lst(ADD_KIND_ID).List_Value.count loop
      lLinkedObjID := fdc_Search.Search.Search_Criteria_Lst(ADD_KIND_ID).List_Value(i);
      lOrSqlStr := lOrSqlStr || to_char(lLinkedObjID);
      lAndSqlStr := lAndSqlStr||
                    'select /*+FIRST_ROWS*/ O.Owner_Object_ID ID'||chr(10)||
                    'from fdc_Object_Kind K, '||chr(10)||
                    '     fdc_Object_Lst O '||chr(10)||
                    'where K.Kind_ID = '|| to_char(lLinkedObjID) || ' and ' ||chr(10)||
                    '      K.ID = O.ID';
      if i < fdc_Search.Search.Search_Criteria_Lst(ADD_KIND_ID).List_Value.count then
        lOrSqlStr := lOrSqlStr || ',';
        lAndSqlStr := lAndSqlStr || chr(10) || 'intersect' || chr(10);
      end if;
    end loop;
    fdc_Search.Exec_Add_Search_Step(
          pDescr => '�� �������',
          pSQL_WithPrev_And =>
          'select distinct ID, :pCurSess, ID, :pDescr'||chr(10)||
          'from fdc_Buffer B'||chr(10)||
          'where B.Sess = :pPrevSess and ID in ('||lAndSqlStr||')',
          pSQL_WithPrev_Or =>
          'select distinct O.Owner_Object_ID, :pCurSess, O.Owner_Object_ID, :pDescr'||chr(10)||
          'from fdc_Object_Lst O, fdc_Object_Kind K, fdc_Buffer B'||chr(10)||
          'where K.Kind_ID in ('||lOrSqlStr||') and'||chr(10)||
          'O.ID = K.ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = O.Owner_Object_ID',
          pSQL_WithoutPrev_And =>
          'select ID, :pCurSess, ID, :pDescr from (' || lAndSqlStr || ')',
          pSQL_WithoutPrev_Or =>
          'select distinct O.Owner_Object_ID, :pCurSess, O.Owner_Object_ID, :pDescr'||chr(10)||
          'from fdc_Object_Lst O, fdc_Object_Kind K'||chr(10)||
          'where K.Kind_ID in ('||lOrSqlStr||') and'||chr(10)||
          'O.ID = K.ID',
          pCheckSearchExit => true,
          pCurSess => pCurSess,
          pPrevSess => pPrevSess,
          pResSess => pResSess);
  end if; -- fdc_Search.Criteria_Active(ADD_KIND_ID)

  ---------------------------------------------------
  -- ����� �� ��������� ��������������� ����������
  ---------------------------------------------------
  if fdc_Search.Criteria_Active(ADD_REG_DOC_TYPE_ID) then
    if (not fdc_Search.Criteria_Active(ADD_KIND_ID)) or
       not fdc_Search.Search.AddSearchOR then
      pCurSess := fdc_search.new_search_sess;
    end if;
    lOrSqlStr := null;
    lAndSqlStr := null;

    for i in 1..fdc_Search.Search.Search_Criteria_Lst(ADD_REG_DOC_TYPE_ID).List_Value.count loop
      lLinkedObjID := fdc_Search.Search.Search_Criteria_Lst(ADD_REG_DOC_TYPE_ID).List_Value(i);
      lOrSqlStr := lOrSqlStr || to_char(lLinkedObjID);
      lAndSqlStr := lAndSqlStr||
                    'select /*+FIRST_ROWS*/ P.ID'||chr(10)||
                    'from fdc_Object_Lst O, fdc_Person P '||chr(10)||
                    'where O.Object_Type_ID = '|| to_char(lLinkedObjID) || ' and '||
                    'O.Owner_Object_ID = P.ID';
      if i < fdc_Search.Search.Search_Criteria_Lst(ADD_REG_DOC_TYPE_ID).List_Value.count then
        lOrSqlStr := lOrSqlStr || ',';
        lAndSqlStr := lAndSqlStr || chr(10) || 'intersect' || chr(10);
      end if;
    end loop;

    fdc_Search.Exec_Add_Search_Step(
          pDescr => '�� ���� ���������� ���������',
          pSQL_WithPrev_And =>
          'select distinct ID, :pCurSess, ID, :pDescr'||chr(10)||
          'from fdc_Buffer B'||chr(10)||
          'where B.Sess = :pPrevSess and ID in ('||lAndSqlStr||')',
          pSQL_WithPrev_Or =>
          'select distinct P.ID, :pCurSess, P.ID, :pDescr'||chr(10)||
          'from fdc_Object_Lst O, fdc_Person P, fdc_Buffer B'||chr(10)||
          'where O.Object_Type_ID in ('||lOrSqlStr||') and'||chr(10)||
          'O.Owner_Object_ID = P.ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = P.ID',
          pSQL_WithoutPrev_And =>
          'select ID, :pCurSess, ID, :pDescr from (' || lAndSqlStr || ')',
          pSQL_WithoutPrev_Or =>
          'select distinct P.ID, :pCurSess, P.ID, :pDescr'||chr(10)||
          'from fdc_Object_Lst O, fdc_Person P'||chr(10)||
          'where O.Object_Type_ID in ('||lOrSqlStr||') and'||chr(10)||
          'O.Owner_Object_ID = P.ID',
          pCheckSearchExit => false,
          pCurSess => pCurSess,
          pPrevSess => pPrevSess,
          pResSess => pResSess);
  end if; -- fdc_Search.Criteria_Active(ADD_REG_DOC_TYPE_ID)

  ---------------------------------------------------
  -- ��������� ������ �� �������������� ��������
  ---------------------------------------------------
  -------------------------------------------------------------------------
  -------------------------------------------------------------------------
  -- �������� �������������� ������
  if pResSess is null then
    pResSess := pCurSess;
  end if;
  
  -------------------------------------------------------------------------
  -- ���� ������� ������ ��� ����, �������� � ��������� ������
  -------------------------------------------------------------------------
  select /*+RULE*/ count(distinct ID)
  into pCnt
  from Fdc_Buffer
  where Sess is not null and Sess = pResSess;
  
  -- ���� ������� ������ ��� �����, ��������� �� � ��������� ������
  if pCnt > fdc_Search.Search.MaxRows + 1 then
    pFinalSess := fdc_Search.New_Search_Sess(false);
    insert into fdc_Buffer(ID,Sess,Mark1,Txt)
    select /*+RULE*/ B.ID, pFinalSess, B.Mark1, B.Txt
    from Fdc_Buffer B
    where Sess = pResSess and
          ID in (select * from 
                  (select distinct ID from fdc_Buffer where sess = pResSess)
                 where rownum <= fdc_Search.Search.MaxRows + 1); 
  else
    pFinalSess := pResSess;  
  end if;
  
  -------------------------------------------------------------------------
  -- ������������� ���������� � �������������� ������
  -------------------------------------------------------------------------
  if pPrevSess is not null then
    -- ������������ � fdc_Buffer ������ ������������� ������, ��������������� ��� ������
    pCurSess := fdc_Search.New_Search_Sess(false);
    for i in 1..fdc_Search.Search_Sess_Lst.count loop
      if fdc_Search.Search_Sess_Lst(i) <> pResSess then
        insert into fdc_Buffer(Sess, Txt)
        values (pCurSess, fdc_Search.Search_Sess_Lst(i));
      end if;
    end loop;
    -- ���������� ���� ������ �� ��������� �� ������ ������
    update Fdc_Buffer
    set Sess = pFinalSess
    where rowid in (
      select B.rowid
      from fdc_Buffer B, 
           fdc_Buffer Fin,
           fdc_Buffer S
      where S.Sess = pCurSess and
            B.SESS = S.Txt and
            B.ID = Fin.Id and
            Fin.Sess = pFinalSess);
    -- �������� �� ������ ������������� ������, ��������������� ��� ������        
    delete from fdc_buffer
    where Sess in 
      (select Txt from fdc_Buffer where Sess = pCurSess);

  end if; -- pPrevSess is not null

  commit;

  return pFinalSess;
end;
/
