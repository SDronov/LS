BEGIN
  FOR r IN ( SELECT *
               FROM User_Constraints
               WHERE constraint_type = 'R'
                 AND status          = 'DISABLED' ) LOOP
    EXECUTE IMMEDIATE 'alter table ' || r.table_name || ' ENABLE CONSTRAINT ' || r.constraint_name;
  END LOOP;
END;
/