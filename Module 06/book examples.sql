SELECT idProduct, price, ROUND(price, 0)
    FROM bb_product
        WHERE idProduct < 4;
        
DECLARE
 v_amt1 number(5,2);
 v_amt2 number(3,0);
BEGIN
 v_amt1 := 32.50;
 v_amt2 := ROUND(v_amt1,0);
 DBMS_OUTPUT.PUT_LINE(v_amt2);
END;

CREATE OR REPLACE FUNCTION ship_calc_sf
    (p_qty IN number)
RETURN NUMBER
IS
    lv_ship_num NUMBER(5,2);
BEGIN
    IF p_qty > 10 THEN
        lv_ship_num := 11.00;
    ELSIF p_qty > 5 THEN
        lv_ship_num := 8.00;
    ELSE
        lv_ship_num := 5;
    END IF;
       RETURN lv_ship_num;
END;

DECLARE
    lv_cost_num NUMBER(5,2);
BEGIN
    lv_cost_num := ship_calc_sf(12);
    DBMS_OUTPUT.PUT_LINE(lv_cost_num);
END;

SELECT idBasket,shipping actual,
                 ship_calc_sf(quantity) calc,
                 ship_calc_sf(quantity) - shipping diff
    FROM bb_basket
    WHERE orderplaced = 1;
    
SELECT SUM(shipping) actual,
       SUM(ship_calc_sf(quantity)) calc,
       SUM(ship_calc_sf(quantity) - shipping) diff
    FROM bb_basket
    WHERE orderplaced = 1;
    
DECLARE
    lv_name_txt VARCHAR2(50);
    lv_id_num bb_shopper.idshopper%TYPE := 25;
    lv_first_txt bb_shopper.firstname%TYPE := 'Scott';
    lv_last_txt bb_shopper.lastname%TYPE := 'Savid';
BEGIN
    lv_name_txt := memfmt1_sf(lv_id_num, lv_first_txt, lv_last_txt);
    DBMS_OUTPUT.PUT_LINE(lv_name_txt);
END;

DECLARE
    lv_user_txt bb_shopper.username%TYPE := 'fdwell';
    lv_pass_txt bb_shopper.password%TYPE := 'tweak';
    lv_id_num bb_shopper.idshopper%TYPE;
    lv_flag_txt CHAR(1);
    lv_name_txt VARCHAR2(50);
BEGIN
    login_sp(lv_user_txt, lv_pass_txt, lv_id_num, lv_flag_txt, lv_name_txt);
    DBMS_OUTPUT.PUT_LINE(lv_id_num);
    DBMS_OUTPUT.PUT_LINE(lv_flag_txt);
    DBMS_OUTPUT.PUT_LINE(lv_name_txt);
END;

DECLARE
    lv_var1_num NUMBER(5) := 1;
    
    lv_var2_txt VARCHAR2(10);
BEGIN
    lv_var2_txt := test_out_sf(lv_var1_num);
    DBMS_OUTPUT.PUT_LINE(lv_var1_num);
    DBMS_OUTPUT.PUT_LINE(lv_var2_txt);
END;

create or replace FUNCTION ship_calc_sf
    (p_qty IN number)
    RETURN NUMBER
    IS
    lv_ship_num NUMBER(5,2);
BEGIN
    IF p_qty > 10 THEN
        lv_ship_num := 11.00;
    ELSIF p_qty > 5 THEN
        lv_ship_num := 8.00;
    ELSE
        lv_ship_num := 5.00;
    END IF;
    RETURN lv_ship_num;
END;

create or replace PROCEDURE test_nocopy_sp
    (p_in IN NUMBER,
     p_out IN OUT NOCOPY VARCHAR2)
     IS
BEGIN
    p_out := 'N';
    IF p_in = 1 THEN
        RAISE NO_DATA_FOUND;
    END IF;
END;

create or replace PROCEDURE run_copy_sp
    IS
        lv_test_txt VARCHAR2(5);
BEGIN
    lv_test_txt := 'Y';
    test_nocopy_sp(1,lv_test_txt);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error - var value = ' || lv_test_txt);
END;

BEGIN
    run_nocopy_sp;
END;

--error
UPDATE bb_test1
    SET col1 = fct_test1_sf(2);

--correct
UPDATE bb_test1
    SET col1 = fct_test2_sf(2);

--error
SELECT fct_test2_sf(col1)
    FROM bb_test1;
    
DESC memfmt1_sf

SELECT text
    FROM user_source
    WHERE name = 'MEMFMT1_SF';

