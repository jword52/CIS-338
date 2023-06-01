--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6 Assignment 6_6
--======================================================

CREATE OR REPLACE FUNCTION status_desc_sf
  (p_stage NUMBER)
  RETURN VARCHAR2
  IS
  lv_stage_txt VARCHAR2(20);
BEGIN
  IF p_stage = 1 THEN
    lv_stage_txt := 'Order submitted';
  ELSIF p_stage = 2 THEN
    lv_stage_txt := 'Accepted, sent to shipping';
  ELSIF p_stage = 3 THEN
    lv_stage_txt := 'Back-ordered';
  ELSIF p_stage = 4 THEN
    lv_stage_txt := 'Cancelled';
  ELSIF p_stage = 5 THEN
    lv_stage_txt := 'Shipped';
  END IF;
  RETURN lv_stage_txt;
END;


