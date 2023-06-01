--====================================================== 
--John Ord
--01/30/2023
--CIS338: SQL / Oracle
--UNIT 2, CHAPTER 2-1 Assignment
--======================================================

DECLARE
    lv_test_date DATE := '10-DEC-2012';
    lv_test_num CONSTANT NUMBER(3) := 10;
    lv_test_txt VARCHAR2(10);
BEGIN
   lv_test_txt := 'Brown';
   DBMS_OUTPUT.PUT_LINE(CONCAT('Date ', lv_test_date));
   DBMS_OUTPUT.PUT_LINE(CONCAT('Number ', lv_test_num));
   DBMS_OUTPUT.PUT_LINE(CONCAT('Text ', lv_test_txt));
END;