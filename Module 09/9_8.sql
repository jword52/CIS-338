--====================================================== 
--CIS338: SQL / Oracle
--Module 9, CHAPTER 9 Assignment 9_8
--======================================================



CREATE TABLE bb_prodchg_audit
 (user_id VARCHAR2(10),
  chg_date DATE,
  name_old VARCHAR2(25),
  name_new VARCHAR2(25),
  price_old NUMBER(5,2),
  price_new NUMBER(5,2),
  start_old DATE,
  start_new DATE,
  end_old DATE,
  end_new DATE,
  sale_old NUMBER(5,2),
  sale_new NUMBER(5,2));

CREATE OR REPLACE TRIGGER bb_audit_trg
  AFTER UPDATE OF productname, price, salestart, saleend, saleprice
  ON bb_product
  FOR EACH ROW 
BEGIN
  INSERT INTO bb_prodchg_audit 
    VALUES (USER, SYSDATE, :OLD.productname, :NEW.productname,
      :OLD.price, :NEW.price, :OLD.salestart, :NEW.salestart,
      :OLD.saleend, :NEW.saleend, :OLD.saleprice, :NEW.saleprice);
END;

/*
SELECT productname, price, salestart, saleend, saleprice
  FROM bb_product
  WHERE idProduct = 10;

UPDATE bb_product
  SET salestart = '05-MAY-2012',
      saleend = '12-MAY-2012',
      saleprice = 9
  WHERE idProduct = 10;

SELECT *
  FROM bb_prodchg_audit;

ROLLBACK;

ALTER TRIGGER bb_audit_trg DISABLE;
*/