[dsData]
SELECT id
      ,user_name
      ,LOGIN
      ,rtu
      ,customs_code
      ,customs_name
      ,customs_post
      ,evt_count
FROM (SELECT u.id
            ,u.LastName || ' ' || u.FirstName || ' ' || u.MiddleName AS user_name
            ,u.Login  AS LOGIN
            ,CASE fdc_customs_getlevel(c.customs_code_8) 
               WHEN 1 THEN (SELECT t.NAME
                              FROM fdc_customs_lst t
                              WHERE substr(t.customs_code_8, 1, 1) = SUBSTR(c.customs_code_8, 1, 1)
                                AND t.customs_code_8 LIKE '%0000000')
               WHEN 2 THEN (SELECT t.NAME
                              FROM fdc_customs_lst t
                              WHERE substr(t.customs_code_8, 1, 3) = SUBSTR(c.customs_code_8, 1, 3)
                                AND t.customs_code_8 LIKE '%00000' )
             END AS rtu
            
            ,c.customs_code_8    AS customs_code
            ,c.name   AS customs_name
            ,''       AS customs_post
            ,(SELECT COUNT(*) 
                FROM fdc_evt_lst e
                WHERE e.user_id = u.ID
                  AND e.evt_moment BETWEEN :DateFrom AND :DateTo
                ) AS evt_count
      FROM fdc_user_lst    u
          ,fdc_customs_lst c
      WHERE u.custom_id = c.ID
        AND u.SYSNAME IS NULL
        AND (:status is null or upper(status) like upper(:status))
      GROUP BY u.LastName
              ,u.FirstName
              ,u.MiddleName
              ,u.Login
              ,u.id
              ,c.customs_code_8
              ,c.name
)
--WHERE evt_count > 0
ORDER BY user_name
