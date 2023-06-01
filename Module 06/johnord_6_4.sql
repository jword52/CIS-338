--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6 Assignment 6_4
--======================================================

CREATE OR REPLACE FUNCTION day_ord_sf
  (p_date DATE)
  RETURN VARCHAR2
  IS
  lv_day_txt VARCHAR2(10);
  BEGIN
  lv_day_txt := TO_CHAR(p_date, 'DAY');
  RETURN lv_day_txt;
END;
