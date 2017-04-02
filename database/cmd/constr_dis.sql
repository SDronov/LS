BEGIN
  FOR r IN ( SELECT *
               FROM User_Constraints
               WHERE constraint_type = 'R' ) LOOP
    EXECUTE IMMEDIATE 'alter table ' || r.table_name || ' DISABLE CONSTRAINT ' || r.constraint_name;
  END LOOP;
END;
/