--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6 Assignment 6_2
--======================================================

CREATE OR REPLACE FUNCTION tot_purch_sf
  (p_id NUMBER)
  RETURN NUMBER
  IS
  lv_tot_num NUMBER(8,2);
BEGIN
  SELECT SUM(total)
    INTO lv_tot_num
    FROM bb_basket
    WHERE idShopper = p_id;
  RETURN lv_tot_num;
END;



