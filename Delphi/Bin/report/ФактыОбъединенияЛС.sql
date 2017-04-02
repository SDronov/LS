[dsHeader]
 select 
    to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
    ,to_char( :DATE_TO,   'DD.MM.YYYY' ) date_to
  from dual	
[dsLong]
select rownum as nNUM,
	   sreorg.inn as ReorgINN, 
       sreorg.kpp as ReorgKPP, 
       sreorgo.name as ReorgFullName, 
       areorg.sdate as ReorgOpenDate,  
       ssacc.inn as SaccINN, 
       ssacc.kpp as SaccKPP, 
       ssacco.name as SaccFullName, 
       asacc.sdate as SaccOpenDate,
       areorg.edate as UnionDate,
       u.lastname||' '||u.firstname||' '||u.middlename as UserFIO
  from fdc_personal_account areorg
      ,fdc_personal_account asacc   
      ,fdc_subject sreorg
      ,fdc_subject ssacc
      ,fdc_object sreorgo
      ,fdc_object ssacco
      ,fdc_event e
      ,fdc_user u
 where areorg.subject_id = sreorg.id
   and areorg.parent_id =  asacc.id
   and asacc.subject_id = ssacc.id
   and sreorgo.id = sreorg.id
   and ssacco.id = ssacc.id
   and e.object_id = areorg.id
   and e.login = u.login
   and upper(e.descript) like '%œ–»—Œ≈ƒ»Õ®Õ  %'
   and areorg.edate = trunc(e.moment)
   and areorg.edate between :DATE_FROM and :DATE_TO