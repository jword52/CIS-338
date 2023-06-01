--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--02/04/23
--UNIT 3, CHAPTER 3-8 Assignment
--======================================================

DECLARE
  TYPE type_basket IS RECORD (
  bask bb_basket.idBasket%TYPE,
  sub bb_basket.subtotal%TYPE,
  ship bb_basket.shipping%TYPE,
  tax bb_basket.tax%TYPE,
  total bb_basket.total%TYPE);
  rec_basket type_basket;
  lv_bask_num bb_basket.idBasket%TYPE := 12;
BEGIN
  SELECT idBasket, subtotal, shipping, tax, total
  INTO rec_basket
  FROM bb_basket
  WHERE idBasket = lv_bask_num;
  DBMS_OUTPUT.PUT_LINE(rec_basket.bask);
  DBMS_OUTPUT.PUT_LINE(rec_basket.sub);
  DBMS_OUTPUT.PUT_LINE(rec_basket.ship);
  DBMS_OUTPUT.PUT_LINE(rec_basket.tax);
  DBMS_OUTPUT.PUT_LINE(rec_basket.total);
END;
