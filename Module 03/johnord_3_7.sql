--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--02/04/23
--UNIT 3, CHAPTER 3-7 Assignment
--======================================================

DECLARE
  lv_bask_num bb_basket.idBasket%TYPE := 12;
  lv_sub_num bb_basket.subtotal%TYPE;
  lv_ship_num bb_basket.shipping%TYPE;
  lv_tax_num bb_basket.tax%TYPE;
  lv_total_num bb_basket.total%TYPE;
BEGIN
 SELECT subtotal, shipping, tax, total
  INTO lv_sub_num, lv_ship_num, lv_tax_num, lv_total_num
  FROM bb_basket
  WHERE idBasket = lv_bask_num;
  DBMS_OUTPUT.PUT_LINE(lv_bask_num);
  DBMS_OUTPUT.PUT_LINE(lv_sub_num);
  DBMS_OUTPUT.PUT_LINE(lv_ship_num);
  DBMS_OUTPUT.PUT_LINE(lv_tax_num);
  DBMS_OUTPUT.PUT_LINE(lv_total_num);
END;
