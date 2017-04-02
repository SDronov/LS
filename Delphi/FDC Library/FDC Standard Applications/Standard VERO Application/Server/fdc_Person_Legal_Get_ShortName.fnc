create or replace function fdc_Person_Legal_Get_ShortName
-- �������������� ����� ������������ ���� � �������� ��������
-- ���������� �������� �������� �� ������� (���� ����)
-- ��� �������� � ����������� ���������������� � ������ ��� ���������
-- �� ����������� ���������� Dict.LegalNameAcro
	(
	pName varchar2                               -- ������������ ������������ ����
	)
return varchar2
is
  pResult	varchar2(1500);
  pAcro	varchar2(1500);
  pExpand	varchar2(1500);
  l_quote_pos_1 number := 0;
  l_quote_pos_2 number := 0;
  l_quote_pos_3 number := 0;
  PShortNameExtracted boolean := false;
begin
  -- ������������� ����������
  pResult := pName;
  
  -- ������� ������� ������� ������������ �� �������
  -- ����������� ������� �������
  l_quote_pos_1 := instr(pResult, '"', 1, 1);
  l_quote_pos_2 := instr(pResult, '"', 1, 2);
  l_quote_pos_3 := instr(pResult, '"', 1, 3);
  
  -- ���� ��� �������
  if l_quote_pos_2 > 0 and l_quote_pos_3 = 0 then
    pResult := substr(pResult, l_quote_pos_1 + 1, l_quote_pos_2 - l_quote_pos_1 - 1);
    PShortNameExtracted := true;
  end if; 
  
  -- ���� ������� ������������ ��������� �� ������� - ������ ������ �� ������, 
  -- ���������� ���������� ��������
  if PShortNameExtracted then
    return pResult;
  end if;
  
  -- �������� ���� ����� ����
  -- ������� �� ������ ��������� (���� �������� � ����������� ����������������)
  -- ��������� ��� ������ ���� ���������, ��� �� ��� �� ����������
  while true loop
    begin
      select ShortName, Name
      into pAcro, pExpand
      from 
        (select instr(upper(pResult), upper(Name)||' ') Position, ShortName, Name
         from Fdc_Object_Lst O
         where O.Typesysname = 'Dict.LegalNameAcro' and
               upper(pResult) like '%'||upper(Name)||' %'
         order by instr(upper(pResult), upper(Name)||' '))      
      where rownum <= 1;
      -- ����� ��������� - ��������� �� ������
      pResult := replace(pResult, pExpand||' ');
    exception
  	  when NO_DATA_FOUND then exit;
    	when others then fdc_util.Abort('������ ������ ����������� �������� � ������������ ����������� '||pName, 1);
    end;
  end loop;
  
  -- � ������ �������� ����������
  -- �� ������ ���� ��� ��������� � ������ ������
  while true loop
    begin
      select ShortName, Name
      into pAcro, pExpand
      from Fdc_Dict_Lst O
      where O.Typesysname = 'Dict.LegalNameAcro' and
            upper(pResult) like upper(Code)||' %' and
            rownum <= 1;
      -- ����� ��������� - ��������� �� ������
      pResult := replace(pResult, pAcro||' ');
    exception
  	  when NO_DATA_FOUND then exit;
    	when others then fdc_util.Abort('������ ������ ����������� �������� � ������������ ����������� '||pName, 1);
    end;
  end loop;

  return pResult;
end fdc_Person_Legal_Get_ShortName;
/
