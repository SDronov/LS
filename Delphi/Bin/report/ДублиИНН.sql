[dsReportMaster]
select s.inn
      ,count(*) as reccount
  from fdc_subject_lst s
 where :INN is null or s.inn = :INN
 group by s.inn
having count(*) > 1 or not :INN is null
 
[dsReportDetail] 
select s.inn
      ,s.kpp
      ,s.name
      ,rownum as recno
  from fdc_subject_lst s
 where s.inn = :INN 
