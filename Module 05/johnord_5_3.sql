--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5_3 Assignment
--======================================================


CREATE OR REPLACE PROCEDURE tax_cost_sp
  (p_state IN bb_shopper.state%TYPE, p_subtot IN NUMBER, p_tax OUT NUMBER)
  IS
BEGIN
  SELECT taxrate * p_subtot
    INTO p_tax
    FROM bb_tax
    WHERE state = p_state;
END;

DECLARE
  lv_tax_num NUMBER(5,2);
BEGIN
  tax_cost_sp('VA',100,lv_tax_num);
  DBMS_OUTPUT.PUT_LINE(lv_tax_num);
END;
