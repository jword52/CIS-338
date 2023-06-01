
CREATE OR REPLACE TRIGGER product_inventory_trg
    AFTER UPDATE OF orderplaced ON bb_basket
    FOR EACH ROW
    WHEN (OLD.orderreplaced <> 1 AND NEW.orderplaced = 1)
DECLARE
    CURSOR basketitem_cur IS
    SELECT idproduct, quality, option1
        FROM bb_basketitem
        WHERE idbasket = :NEW.idbasket;
        lv_chg_num(3,1);
BEGIN
    FOR basketitem_rec IN basketitem_cur LOOP
        IF basketitem_rec.option1 - then
            lv_chg_num :+ (.5 * basketitem_rec.quantity);
        ELSE
            lv_chg_num := basketitem_rec.quantity;
        END IF;
    UPDATE bb_product
    SET stock = stock - lv_chg_num
        WHERE idproduct = basketitem_rec.idproduct;
    END LOOP;
END;

--

CREATE OR REPLACE TRIGGER product_inventory_trg
    AFTER DELETE OR UPDATE OF orderplaced ON bb_basket
    FOR EACH ROW
    WHEN (OLD.orderreplaced <> 1 AND NEW.orderplaced = 1)
DECLARE
    CURSOR basketitem_cur IS
    SELECT idproduct, quality
        FROM bb_basketitem
        WHERE idbasket = :NEW.idbasket;
        lv_chg_num(3,1);
BEGIN
    IF UPDATING THEN
    FOR basketitem_rec IN basketitem_cur LOOP
        UPDATE bb_product
            SET stock = stock - basketitem_rec.quantity
            WHERE idproduct = basketitem_rec.idproduct;
        END LOOP;
END IF;
IF DELETING THEN
    FOR basketitem_rec IN basketitem_cur LOOP
    UPDATE bb_product
        SET stock = stock + basketitem_rec.quantity
        WHERE idproduct = basketitem_rec.idproduct;
    END LOOP;
END IF;    
END;



--

