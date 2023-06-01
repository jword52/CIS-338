--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 4, CHAPTER 4 Assignment
--======================================================

SELECT idbasketitem
  FROM bb_basketitem
  WHERE idBasket = 30;

DECLARE
  ex_update EXCEPTION;
  lv_old_num NUMBER(2) := 30;
  lv_new_num NUMBER(2) := 4;
BEGIN
  UPDATE bb_basketitem
    SET idBasket = lv_new_num
    WHERE idBasket = lv_old_num;
  IF SQL%ROWCOUNT = 0 THEN
    RAISE ex_update;
  END IF;
EXCEPTION
  WHEN ex_update THEN
    DBMS_OUTPUT.PUT_LINE('Invalid original basket ID');
END;
