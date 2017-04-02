[dsReport]
WITH act AS ( SELECT id FROM fdc_acc_light_lst START WITH code = '06.00.00' CONNECT BY PRIOR id = parent_id )
select s.name
      ,s.inn          
      ,c.code                                as curr
      ,nvl(doc.sum, 0)                       as dsum
      ,nvl(a_entry.sum, 0)                   as esum
      ,nvl(doc.sum, 0) - nvl(a_entry.sum, 0) as diff
  from fdc_subject_lst      s
      ,fdc_nsi_currency_lst c
      ,(select na.payer_id    as subj_id
              ,na.currency_id as curr_id 
              ,sum(rest_summa) as sum
          from fdc_po_credit_lst na
         where (na.currency_id = :CURRENCY_ID or :CURRENCY_ID is null)
           and (na.payer_id    = :SUBJECT_ID  or :SUBJECT_ID  is null)
         group by na.payer_id, na.currency_id
       ) doc
      ,( SELECT subject_id  AS subj_id
               ,currency_id AS curr_id
               ,SUM( s )    AS sum
           FROM ( SELECT bs.subject_id
                        ,bs.currency_id
                        ,SUM( bs.balance_sum ) AS s
                    FROM fdc_acc_balance_subject bs
                   WHERE ( bs.subject_id  = :subject_id  OR :subject_id IS NULL )
                     AND ( bs.currency_id = :currency_id OR :currency_id IS NULL )
                     AND bs.account_id IN ( SELECT id FROM act )
                     AND bs.balance_date <= to_date( '01' || to_char( SYSDATE, 'MMYYYY' ), 'DDMMYYYY' )
                   GROUP BY bs.subject_id, bs.currency_id
                  UNION ALL
                  SELECT rs.subject_id
                        ,rs.currency_id
                        ,SUM( rs.reg_sum ) AS s
                    FROM fdc_acc_reg_subject rs
                   WHERE ( rs.subject_id  = :subject_id  OR :subject_id IS NULL )
                     AND ( rs.currency_id = :currency_id OR :currency_id IS NULL )
                     AND rs.account_id IN ( SELECT id FROM act )
                     AND rs.reg_date >= to_date( '01' || to_char( SYSDATE, 'MMYYYY' ), 'DDMMYYYY' )
                     AND rs.reg_date <= trunc( SYSDATE )
                   GROUP BY rs.subject_id, rs.currency_id )
           GROUP BY subject_id, currency_id
       ) a_entry
 where doc.subj_id = a_entry.subj_id(+)
   and doc.curr_id = a_entry.curr_id(+)
   and doc.subj_id = s.id
   and doc.curr_id = c.id
   and (nvl(doc.sum, 0) - nvl(a_entry.sum, 0) <> 0 or 0 = :ONLY_DIFF)
 order by s.name, c.code
