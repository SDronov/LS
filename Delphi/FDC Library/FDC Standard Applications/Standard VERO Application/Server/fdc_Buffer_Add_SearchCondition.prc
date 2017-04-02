create or replace procedure fdc_Buffer_Add_SearchCondition
-- Добавление поискового критерия в fdc_Buffer
-- Критерий передается в виде ИМЯ=ЗНАЧЕНИЕ
-- Все критерии для одного сеанса передаются с одним идентификатором
-- Это значит, что первый критерий передается с сеансом NULL,
-- а последующие - с возвращенным из первого вызова идентификатором
-- Процедура универсальна и не зависит от того, ЧТО ищем
-- Критерии помещаются в FDC_BUFFER и в дальнейшем обрабатываются в пакете fdc_Search
-- Массив критериев передается из формы поиска и далее вызывается 
-- конкретная функция поиска (например, fdc_Person_Search)
  (
  pSess in out varchar2,         -- Идентификатор сеанса поиска
  pTXT  varchar2                 -- Текст критерия в виде ИМЯ=ЗНАЧЕНИЕ
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
