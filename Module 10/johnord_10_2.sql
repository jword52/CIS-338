--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--Module 10, CHAPTER 10 Assignment 10_2
--======================================================


BEGIN
  FOR rec_obj IN cur_obj LOOP
    IF rec_obj.object_type = 'PACKAGE' THEN
      lv_obj := 'PACKAGE SPECIFICATION';
    ELSE
      lv_obj := rec_obj.object_type;
    END IF;
  DBMS_DDL.ALTER_COMPILE(lv_obj, lv_own, rec_obj.object_name);
  DBMS_OUTPUT.PUT_LINE('Compiled: '||lv_obj||'-'||rec_obj.object_name);
  END LOOP;
END;
