[dsReport]
WITH kc as
 (SELECT tam.customs_code_8, tam.name, tam.id, tam.code
    FROM table(ElsSvodOut.GetTamKbkSOE(:DateFrom, :DateTo)) tam),  
ret as
 (SELECT tod.customs_code, tod.kbkcode_id, SUM(tod.notice) AS notice, SUM(tod.podt_po) AS podt_po, SUM(tod.vozvrat) AS vozvrat
    FROM table(ElsSvodOut.GetTurnDokSOE(:DateFrom, :DateTo, :currency_id)) tod
   GROUP BY tod.customs_code, tod.kbkcode_id)
SELECT CASE WHEN grouping(kc.code) = 0 THEN
          CASE WHEN row_number() over(PARTITION BY kc.name ORDER BY kc.NAME, kc.code) > 1 THEN to_char(NULL)
            ELSE CASE WHEN grouping(kc.NAME) = 0 THEN kc.name ELSE '»“Œ√Œ:' END
          END
         ELSE to_char(NULL)
       END AS name,
       CASE WHEN grouping(kc.code) = 0 THEN kc.code
         ELSE '»ÚÓ„Ó:'
       END AS kbk,
       NVL(SUM(ret.notice), 0) AS notice,
       NVL(SUM(ret.podt_po), 0) AS podt_po,
       NVL(SUM(ret.vozvrat), 0) AS vozvrat
  FROM kc, ret
 WHERE kc.id = ret.kbkcode_id(+)
   AND kc.customs_code_8 = ret.customs_code(+)
 GROUP BY ROLLUP(kc.NAME, kc.code)
HAVING not (grouping(kc.NAME) = 1 and grouping(kc.code) = 1)
union all
SELECT CASE WHEN row_number() over(ORDER BY kc.code) > 1 THEN to_char(NULL)
         ELSE '»“Œ√Œ:'
       END AS name,
       CASE WHEN grouping(kc.code) = 0 THEN kc.code
         ELSE '»ÚÓ„Ó:'
       END AS kbk,
       NVL(SUM(ret.notice), 0) AS notice,
       NVL(SUM(ret.podt_po), 0) AS podt_po,
       NVL(SUM(ret.vozvrat), 0) AS vozvrat
  FROM kc, ret
 WHERE kc.id = ret.kbkcode_id(+) AND
 kc.customs_code_8 = ret.customs_code(+)
 GROUP BY ROLLUP(kc.code)
