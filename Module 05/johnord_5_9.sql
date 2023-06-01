--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5_9 Assignment
--======================================================



CREATE OR REPLACE PROCEDURE member_ck_sp
  (p_user IN VARCHAR2,
   p_pass IN OUT VARCHAR2,
   p_cook OUT NUMBER,
   p_check OUT VARCHAR2)
  IS
BEGIN
  SELECT firstname || ' ' || lastname, cookie
    INTO p_pass, p_cook
    FROM bb_shopper
    WHERE username = p_user
    AND password = p_pass;
    p_check := 'VALID';
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    p_check := 'INVALID';
END;

DECLARE
  lv_pass_txt VARCHAR2(30);
  lv_cook_num bb_shopper.cookie%TYPE;
  lv_chk_txt VARCHAR2(7);
BEGIN
  member_ck_sp('rat55',lv_pass_txt,lv_cook_num,lv_chk_txt);
    DBMS_OUTPUT.PUT_LINE(lv_pass_txt);
    DBMS_OUTPUT.PUT_LINE(lv_cook_num);
    DBMS_OUTPUT.PUT_LINE(lv_chk_txt);
END;

DECLARE
  lv_pass_txt VARCHAR2(30);
  lv_cook_num bb_shopper.cookie%TYPE;
  lv_chk_txt VARCHAR2(7);
BEGIN
  member_ck_sp('rat',lv_pass_txt,lv_cook_num,lv_chk_txt);
    DBMS_OUTPUT.PUT_LINE(lv_pass_txt);
    DBMS_OUTPUT.PUT_LINE(lv_cook_num);
    DBMS_OUTPUT.PUT_LINE(lv_chk_txt);
END;
