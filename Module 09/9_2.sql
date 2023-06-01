--====================================================== 
--CIS338: SQL / Oracle
--Module 9, CHAPTER 9 Assignment 9_2
--======================================================



INSERT INTO bb_product_request (idRequest, idProduct, dtRequest, qty)
  VALUES (3, 5, SYSDATE, 45);
COMMIT;

CREATE OR REPLACE TRIGGER bb_reqfill_trg
  AFTER UPDATE OF dtRecd ON bb_product_request
  FOR EACH ROW
BEGIN
  IF :OLD.dtRecd IS NULL THEN
    UPDATE bb_product
      SET stock = stock + :NEW.qty
      WHERE idProduct = :NEW.idProduct;
  END IF;
END;


/*
SELECT stock, reorder
  FROM bb_product
  WHERE idProduct = 5;

SELECT * 
  FROM bb_product_request
  WHERE idProduct = 5;

UPDATE bb_product_request
  SET dtRecd = SYSDATE, cost = 225
  WHERE idRequest = 3;

SELECT * 
  FROM bb_product_request
  WHERE idProduct = 5;

SELECT stock, reorder
  FROM bb_product
  WHERE idProduct = 5;

ROLLBACK;

ALTER TRIGGER bb_reqfill_trg DISABLE;
*/