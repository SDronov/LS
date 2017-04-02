[dsHeader]
SELECT
    fdc_valuestring_sys_get( 'CustomsName', 0 ) AS CustomsName
   ,:begin_date                                 AS Date_From
   ,nvl( :end_date, SYSDATE )                   AS Date_To
   ,:report_type                                AS report_type
   ,:is_ts                                      AS is_ts
  FROM dual

[dsBody]
SELECT CASE
         WHEN num > 1
          AND kbk_source IS NOT NULL
          AND kbk_target IS NOT NULL THEN
           NULL
         ELSE
           name
       END AS name
      ,kbk_source
      ,kbk_target
      ,summa
  FROM (
      SELECT
          grouping_id( nvl(kc.ShortName, kc.name) , ret.kbk_source, ret.kbk_target  ) grp
         ,row_number() over(PARTITION BY nvl(kc.ShortName, kc.name) ORDER BY nvl(kc.ShortName, kc.name), ret.kbk_source, ret.kbk_target) num
         ,CASE
            WHEN grouping_id( nvl(kc.ShortName, kc.name) , ret.kbk_source, ret.kbk_target  ) = 7 THEN
              'ÈÒÎÃÎ:'
            WHEN grouping_id( nvl(kc.ShortName, kc.name) , ret.kbk_source, ret.kbk_target  ) = 3 THEN
              '         Èòîãî:'
            ELSE
              nvl(kc.ShortName, kc.name)
          END                        NAME
         ,ret.kbk_source             kbk_source
         ,ret.kbk_target             kbk_target
         ,nvl( sum( ret.summa ), 0 ) summa
        FROM fdc_customs_lst kc,
           ( 
            SELECT CASE
                     WHEN bskl.ext_source = p_params.softcustomscode THEN
                       p_params.customcode
                     ELSE
                       dptl.customs_out_code
                   END             customs_code
                  ,bskl.kbk_code_s kbk_source
                  ,bskl.kbk_code_t kbk_target
                  ,bskl.summa * (case bskl.currency_code when '643' then 1 else fdc_nsi_currency_get_rate ( bskl.currency_id, bskl.doc_date ) end) Summa
            FROM (
                  select distinct id
                  from (
                        SELECT bs.id
                        FROM fdc_event_lst e
                            ,fdc_bud_specify_kindpay_lst bs
                        WHERE 0 = :report_type
                          AND e.Moment >= :begin_date
                          AND e.Moment < nvl( to_date(:end_date)+1, SYSDATE ) 
                          AND e.object_type_id = 35
                          AND e.object_id      = bs.id
                          and (
                               (bs.ext_source = p_params.softcustomscode and bs.typesysname in ('NoticeSpecifyKindPay', 'NoticeSpecifyKindPayCorr'))
                               or
                               (bs.ext_source != p_params.softcustomscode and bs.typesysname in ('NoticeSpecifyKindPay','NoticeSpecifyKindPaySumm','NoticeSpecifyKindPayCorr','NoticeSpecifyKindPayCorrSumm'))
                              )           
                        union all
                        SELECT bs.id
                        FROM fdc_rel_short_reestr_skpay_lst    rr
                            ,fdc_reestr_specify_kindpay_lst cr
                            ,fdc_bud_specify_kindpay_lst bs
                        WHERE 1 = :report_type
                          AND (cr.doc_date BETWEEN :begin_date AND nvl( :end_date, SYSDATE ) )
                          AND rr.rel_object_id = bs.ID
                          AND bs.ext_source = p_params.softcustomscode
                          AND rr.object_id     = cr.id
                          AND cr.ext_source   = p_params.softcustomscode
                          and (
                               (bs.ext_source = p_params.softcustomscode and bs.typesysname in ('NoticeSpecifyKindPay', 'NoticeSpecifyKindPayCorr'))
                               or
                               (bs.ext_source != p_params.softcustomscode and bs.typesysname in ('NoticeSpecifyKindPay','NoticeSpecifyKindPaySumm','NoticeSpecifyKindPayCorr','NoticeSpecifyKindPayCorrSumm'))
                              )           
                        union all
                        SELECT bs.ID
                        FROM fdc_rel_reestr_reestr_lst      rr
                            ,fdc_reestr_specify_kindpay_lst cr
                            ,fdc_reestr_specify_kindpay_lst rs
                            ,fdc_rel_short_reestr_skpay_lst rel
                            ,fdc_bud_specify_kindpay_lst bs
                        WHERE 1 = :report_type
                          AND (cr.doc_date BETWEEN :begin_date AND nvl( :end_date, SYSDATE ) )
                          AND rr.object_id     = cr.id
                          AND cr.ext_source   = p_params.softcustomscode
                          AND rr.rel_object_id = rs.ID
                          AND rs.ID = rel.object_id
                          AND bs.ext_source != p_params.softcustomscode
                          AND rel.rel_object_id = bs.ID
                          and (
                               (bs.ext_source = p_params.softcustomscode and bs.typesysname in ('NoticeSpecifyKindPay', 'NoticeSpecifyKindPayCorr'))
                               or
                               (bs.ext_source != p_params.softcustomscode and bs.typesysname in ('NoticeSpecifyKindPay','NoticeSpecifyKindPaySumm','NoticeSpecifyKindPayCorr','NoticeSpecifyKindPayCorrSumm'))
                              )           
                       )
                 ) bsid
                ,fdc_reestr_specify_kindpay_lst rskl
                ,fdc_bud_specify_kindpay_lst bskl
                ,fdc_rel_short_reestr_skpay_lst rrsl
                ,fdc_rel_short_pack_docs_lst rpdl
                ,fdc_doc_pack_transfer_lst dptl
            WHERE bsid.id = bskl.id
              AND bskl.id = rrsl.rel_object_id
              AND rrsl.object_id = rskl.id
              AND rskl.is_ts = decode(:is_ts, NULL, rskl.is_ts, 'N', rskl.is_ts, 'Y')
              AND rskl.id = rpdl.rel_object_id(+)
              AND rpdl.object_id = dptl.id(+)
                 ) ret
      WHERE kc.customs_code_8 = ret.customs_code
      GROUP BY CUBE(nvl(kc.ShortName, kc.name), ret.kbk_source, ret.kbk_target)
      ORDER BY nvl(kc.ShortName, kc.name), (case when (grouping_id( nvl(kc.ShortName, kc.name) , ret.kbk_source, ret.kbk_target  ) = 7) then '0' else ret.kbk_source end), (case when (grouping_id( nvl(kc.ShortName, kc.name) , ret.kbk_source, ret.kbk_target  ) = 7) then '0' else ret.kbk_target end)
     )
WHERE grp IN (0,3,4,7)