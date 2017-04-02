[dsReport]
SELECT CASE WHEN  (rownum = 1) OR
       ( lag( qq.DestCustoms ) over (ORDER BY rownum ) <> qq.DestCustoms ) THEN
            qq.DestCustoms
       ELSE '' END Customs, 
KBK, Summa  
FROM 
(
SELECT CASE
         WHEN grouping( ck.DestCustoms ) = 0
          AND grouping( ck.code  ) = 0 THEN
           ck.DestCustoms
         WHEN grouping(ck.DestCustoms ) = 1 AND 
              grouping( ck.code ) = 1 THEN
           'ИТОГО РАСПРЕДЕЛИЛОСЬ:'
         ELSE 
           '   ' -- Должно быть не NULL
         END AS DestCustoms,
         CASE WHEN grouping( ck.DestCustoms ) = 0
               AND grouping( ck.code  ) = 1 THEN
            'Итого:' 
         ELSE   
          ck.code 
        END AS KBK,
       NVL( SUM(pl.Summa), 0) AS Summa 
FROM
( SELECT cl.destcustoms, kl.id, kl.code
  FROM
  ( SELECT k.id, k.code 
       FROM fdc_kbk_dict_lst k
       WHERE :DateFrom BETWEEN k.sdate AND nvl(k.edate, :DateFrom) AND
             :DateTo BETWEEN k.sdate AND nvl(k.edate, :DateTo)
       ORDER BY k.code
      ) kl,
   (   SELECT c.name AS DestCustoms
          FROM fdc_customs_lst c
         WHERE c.id = p_params.CustomsId
         AND EXISTS ( SELECT 1
                       FROM fdc_po_cashless_lst po
                      WHERE trunc(fdc_Object_GetAddMoment(po.id)) BETWEEN :DateFrom AND :DateTo -- полученные
                        AND po.is_ts = nvl(:is_ts,'N')
                    )  
       UNION ALL
     
       SELECT DISTINCT 
         CASE WHEN dp.Receiver_Soft_Code = 'LSKNP' THEN
                     decode( p_params.CustomLevel, 0, 'КНП ФТС', 'КНП РТУ') 
                   ELSE c.NAME END AS DestCustoms
        FROM fdc_doc_pack_payments_lst dp, fdc_customs_lst c
        WHERE     dp.Receiver_Soft_Code <> p_params.ApplicationCode
              AND dp.is_ts              = nvl(:is_ts,'N')
              AND trunc(fdc_Object_GetAddMoment(dp.id)) BETWEEN :DateFrom AND :DateTo
              AND c.id = dp.DestCustomsId 
     ) CL
 )ck
LEFT OUTER JOIN
   (
    -- "свои" ПП
    SELECT c.NAME AS DestCustoms, 
           po.KBKCODE_ID, 
           po.SUMMA
    FROM fdc_po_cashless_lst po, fdc_customs_lst c
    WHERE trunc(fdc_Object_GetAddMoment(po.id)) BETWEEN :DateFrom AND :DateTo -- полученные
      AND po.is_ts        = nvl(:is_ts,'N')
      AND c.id = p_params.CustomsId
    UNION ALL
    -- отправленные ПП
    SELECT CASE WHEN dp.Receiver_Soft_Code = 'LSKNP' THEN
             decode( p_params.CustomLevel, 0, 'КНП ФТС', 'КНП РТУ') 
           ELSE c.NAME END AS DestCustoms,
           po.KBKCODE_ID,
           po.SUMMA
    FROM fdc_doc_pack_payments_lst dp,
         fdc_rel_pack_docs_lst r,
         fdc_po_cashless_lst_all po,
         fdc_customs_lst c
    WHERE r.Object_ID = dp.ID
      AND r.Rel_Object_ID = po.ID
      AND po.is_ts        = nvl(:is_ts,'N')
      AND dp.Receiver_Soft_Code <> p_params.ApplicationCode
      AND trunc(fdc_Object_GetAddMoment(dp.id)) BETWEEN :DateFrom AND :DateTo
      AND c.id = dp.DestCustomsId
      ) PL
ON pl.DestCustoms = ck.DestCustoms AND pl.KBKCODE_ID = ck.id 
GROUP BY ROLLUP ( ck.DestCustoms, ck.code )
)qq


[dsSummary]
SELECT ck.code AS KBK,
       NVL( SUM(pl.Summa), 0) AS Summa 
FROM
( SELECT k.id, k.code
    FROM fdc_kbk_dict_lst k
    WHERE :DateFrom BETWEEN k.sdate AND nvl(k.edate, :DateFrom) AND
          :DateTo BETWEEN k.sdate AND nvl(k.edate, :DateTo)
    ORDER BY k.code
 )ck
LEFT OUTER JOIN
   (
    -- "свои" ПП
    SELECT po.KBKCODE_ID, 
           po.SUMMA
    FROM fdc_po_cashless_lst po
    WHERE trunc(fdc_Object_GetAddMoment(po.id)) BETWEEN :DateFrom AND :DateTo -- полученные
      AND po.is_ts        = nvl(:is_ts,'N')
    UNION ALL
    -- отправленные ПП
    SELECT po.KBKCODE_ID,
           po.SUMMA
    FROM fdc_doc_pack_payments_lst dp,
         fdc_rel_pack_docs_lst r,
         fdc_po_cashless_lst_all po
    WHERE r.Object_ID = dp.ID
      AND r.Rel_Object_ID = po.ID
      AND po.is_ts        = nvl(:is_ts,'N')
      AND dp.Receiver_Soft_Code <> p_params.ApplicationCode
      AND trunc(fdc_Object_GetAddMoment(dp.id)) BETWEEN :DateFrom AND :DateTo
      ) PL
ON pl.KBKCODE_ID = ck.id 
GROUP BY ck.code
