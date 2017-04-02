[dsReport]
WITH kc AS
 (SELECT DISTINCT c.customs_code_8, c.name, k.code AS id, k.fmt_code as code
    FROM fdc_kbk_dict_lst k, fdc_customs_lst c
   WHERE (k.sdate BETWEEN :DateFrom AND :DateTo OR
         nvl(k.edate, :DateFrom) BETWEEN :DateFrom AND :DateTo)
     AND k.is_for_report = 'Y'
     AND k.is_prepaymentkbk = 'N'
     AND (substr( c.customs_code_8, 6, 3 ) = '000' and p_params.CustomCode <> p_params.ELSCustomCode 
         or 
         p_params.CustomCode = p_params.ELSCustomCode )
     AND substr(c.customs_code_8, 1, 1) = '1'
     AND substr(c.customs_code_8, 2, 1) = '0'
     AND c.customs_code_8 <> '10007000'
     AND c.customs_code_8 <> '10008000'
     AND nvl(c.dt_end, :DateFrom) >= :DateFrom
     AND (c.customs_code_8 = p_Params.CustomCode OR
         p_Params.CustomLevel = 1 AND
         substr(c.customs_code_8, 1, 3) = substr(p_Params.CustomCode, 1, 3) OR
         p_Params.CustomLevel = 0 AND
         (substr(c.customs_code_8, 4, 5) = '00000' OR
         (substr(c.customs_code_8, 1, 3) = '100' and
         substr(c.customs_code_8, 6, 3) = '000' and
         (substr(c.customs_code_8, 4, 1) = '0' OR
         substr(c.customs_code_8, 4, 1) = '1'))))
   ORDER BY c.name, k.code),
ret as
 (SELECT rp.customs_code,
         rp.KBKCode_id,
         sum(rp.summa_from) AS summa_from,
         sum(rp.summa_to) AS summa_to
    FROM table(target_kbk_report_ret(:DateFrom, :DateTo)) rp
   GROUP BY rp.customs_code, rp.KBKCode_id)
SELECT CASE
         WHEN grouping(kc.code) = 0 THEN
          CASE
            WHEN row_number()
             over(PARTITION BY kc.name ORDER BY kc.NAME, kc.code) > 1 THEN
             to_char(NULL)
            ELSE
             CASE
               WHEN grouping(kc.NAME) = 0 THEN
                kc.name
               ELSE
                '»“Œ√Œ:'
             END
          END
         ELSE
          to_char(NULL)
       END AS name,
       CASE
         WHEN grouping(kc.code) = 0 THEN
          kc.code
         ELSE
          '»ÚÓ„Ó:'
       END AS kbk,
       NVL(SUM(ret.summa_from), 0) AS summa_from,
       NVL(SUM(ret.summa_to), 0) AS summa_to
  FROM kc, ret
 WHERE kc.id = ret.kbkcode_id(+)
   AND kc.customs_code_8 = ret.customs_code(+)
 GROUP BY ROLLUP(kc.NAME, kc.code)
HAVING not (grouping(kc.NAME) = 1 and grouping(kc.code) = 1)
union all
SELECT CASE
         WHEN row_number() over(ORDER BY kc.code) > 1 THEN
          to_char(NULL)
         ELSE
          '»“Œ√Œ:'
       END AS name,
       CASE
         WHEN grouping(kc.code) = 0 THEN
          kc.code
         ELSE
          '»ÚÓ„Ó:'
       END AS kbk,
       NVL(SUM(ret.summa_from), 0) AS summa_from,
       NVL(SUM(ret.summa_to), 0) AS summa_to
  FROM kc, ret
 WHERE kc.id = ret.kbkcode_id(+) AND
 kc.customs_code_8 = ret.customs_code(+) AND
 p_Params.CustomLevel IN
 (p_Consts.CustomLevel_FTS, p_Consts.CustomLevel_RTU)
 GROUP BY ROLLUP(kc.code)

