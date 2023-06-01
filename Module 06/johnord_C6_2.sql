--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6 Assignment Case_2
--======================================================



CREATE OR REPLACE FUNCTION mm_qtyck_sf
  (p_id NUMBER)
  RETURN VARCHAR2
  IS
  lv_title_txt VARCHAR2(35);
  lv_qty_num NUMBER(3);
  lv_msg_txt VARCHAR2(15) := 'Not Available';
  lv_avail_txt VARCHAR2(100);
BEGIN
  SELECT movie_title, movie_qty
    INTO lv_title_txt, lv_qty_num
    FROM mm_movie
    WHERE movie_id = p_id;
  IF lv_qty_num <> 0 THEN
    lv_msg_txt := 'Available';
  END IF;
    lv_avail_txt := lv_title_txt || ' is ' || lv_msg_txt || ': '||
                 TO_CHAR(lv_qty_num) || ' on the shelf';
  RETURN lv_avail_txt;
END;