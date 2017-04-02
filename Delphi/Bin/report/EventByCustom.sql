[dsData]
SELECT c.name   AS custom_name
      ,(SELECT COUNT(*)
          FROM fdc_user_lst u1
          WHERE u1.custom_id = c.ID
            AND u1.SYSNAME IS NULL
            AND (:status is null or upper(status) like upper(:status))) AS user_reg
      ,(SELECT COUNT(*)
          FROM fdc_user_lst u1
            WHERE EXISTS (SELECT 1
                            FROM fdc_evt_lst e1
                            WHERE e1.user_id = u1.ID
                              AND e1.evt_moment BETWEEN :DateFrom AND :DateTo)
                              AND u1.custom_id = c.ID
                              AND u1.SYSNAME IS NULL
                              AND (:status is null or upper(status) like upper(:status))) AS user_worked
      ,(SELECT COUNT(*)
          FROM fdc_evt_lst e2
              ,fdc_user_lst u2
          WHERE e2.user_id = u2.ID
            AND u2.custom_id = c.ID
            AND e2.evt_moment BETWEEN :DateFrom AND :DateTo
            AND u2.SYSNAME IS NULL 
            AND (:status is null or upper(status) like upper(:status))) evt_count
FROM fdc_user_lst    u
    ,fdc_customs_lst c
WHERE u.custom_id = c.ID
  AND u.SYSNAME IS NULL
  AND (:status is null or upper(status) like upper(:status))
GROUP BY c.ID
        ,c.name
ORDER BY c.name