--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6 Assignment 6_3
--======================================================

CREATE OR REPLACE FUNCTION num_purch_sf
  (p_id NUMBER)
  RETURN NUMBER
  IS
  lv_tot_num NUMBER(5);
BEGIN
  SELECT COUNT(idBasket)
    INTO lv_tot_num
    FROM bb_basket
    WHERE idShopper = p_id 
      AND orderplaced = 1;
  RETURN lv_tot_num;
END;

