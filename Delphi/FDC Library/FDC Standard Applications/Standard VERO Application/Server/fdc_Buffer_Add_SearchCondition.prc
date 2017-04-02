create or replace procedure fdc_Buffer_Add_SearchCondition
-- ���������� ���������� �������� � fdc_Buffer
-- �������� ���������� � ���� ���=��������
-- ��� �������� ��� ������ ������ ���������� � ����� ���������������
-- ��� ������, ��� ������ �������� ���������� � ������� NULL,
-- � ����������� - � ������������ �� ������� ������ ���������������
-- ��������� ������������ � �� ������� �� ����, ��� ����
-- �������� ���������� � FDC_BUFFER � � ���������� �������������� � ������ fdc_Search
-- ������ ��������� ���������� �� ����� ������ � ����� ���������� 
-- ���������� ������� ������ (��������, fdc_Person_Search)
  (
  pSess in out varchar2,         -- ������������� ������ ������
  pTXT  varchar2                 -- ����� �������� � ���� ���=��������
  ) 
is
begin
  if pSess is null then
    pSess := fdc_Search.New_Search_Sess;
  end if;
  insert into fdc_buffer (sess, txt)
  values (pSess, pTxt);
end;
/
