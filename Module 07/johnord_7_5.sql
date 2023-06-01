--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--Module 7, CHAPTER 7 Assignment 7_5
--======================================================


CREATE OR REPLACE PACKAGE shop_query_pkg
  IS
  PROCEDURE shop_lookup_pp 
    (p_id IN NUMBER,
     p_name OUT VARCHAR2,
     p_city OUT VARCHAR2,
     p_state OUT CHAR,
     p_phone OUT VARCHAR2,
     p_email OUT VARCHAR2);
  PROCEDURE shop_lookup_pp 
    (p_last IN VARCHAR2,
     p_name OUT VARCHAR2,
     p_city OUT VARCHAR2,
     p_state OUT CHAR,
     p_phone OUT VARCHAR2,
     p_email OUT VARCHAR2);
END;

CREATE OR REPLACE PACKAGE BODY shop_query_pkg
  IS
  PROCEDURE shop_lookup_pp
    (p_id IN NUMBER,
     p_name OUT VARCHAR2,
     p_city OUT VARCHAR2,
     p_state OUT CHAR,
     p_phone OUT VARCHAR2,
     p_email OUT VARCHAR2)
  IS
  BEGIN
    SELECT firstname||' '||lastname, city, state, phone, email
      INTO p_name, p_city, p_state, p_phone, p_email
      FROM bb_shopper
      WHERE idShopper = p_id;
  END;
  PROCEDURE shop_lookup_pp 
    (p_last IN VARCHAR2,
     p_name OUT VARCHAR2,
     p_city OUT VARCHAR2,
     p_state OUT CHAR,
     p_phone OUT VARCHAR2,
     p_email OUT VARCHAR2)
  IS
  BEGIN
    SELECT firstname||' '||lastname, city, state, phone, email
     INTO p_name, p_city, p_state, p_phone, p_email
     FROM bb_shopper
     WHERE lastname = p_last;
  END;
END;


DECLARE
  lv_name_txt VARCHAR2(20);
  lv_city_txt VARCHAR2(15);
  lv_state_txt VARCHAR2(2);
  lv_phone_txt VARCHAR2(12);
  lv_email_txt VARCHAR2(20);
BEGIN
  shop_query_pkg.shop_lookup_pp(23,lv_name_txt,lv_city_txt,
    lv_state_txt,lv_phone_txt,lv_email_txt);
  DBMS_OUTPUT.PUT_LINE(lv_name_txt);
  DBMS_OUTPUT.PUT_LINE(lv_city_txt);
  DBMS_OUTPUT.PUT_LINE(lv_state_txt);
  DBMS_OUTPUT.PUT_LINE(lv_phone_txt);
  DBMS_OUTPUT.PUT_LINE(lv_email_txt);
  shop_query_pkg.shop_lookup_pp('Ratman',lv_name_txt,lv_city_txt,
    lv_state_txt,lv_phone_txt,lv_email_txt);
  DBMS_OUTPUT.PUT_LINE(lv_name_txt);
  DBMS_OUTPUT.PUT_LINE(lv_city_txt);
  DBMS_OUTPUT.PUT_LINE(lv_state_txt);
  DBMS_OUTPUT.PUT_LINE(lv_phone_txt);
  DBMS_OUTPUT.PUT_LINE(lv_email_txt);
END;