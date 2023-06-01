--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5_12 Assignment
--======================================================

CREATE OR REPLACE PROCEDURE ddckpay_sp
  (p_id IN dd_pledge.idpledge%TYPE,
   p_amt IN dd_pledge.pledgeamt%TYPE)
  IS
    lv_pay_num dd_pledge.pledgeamt%TYPE;
BEGIN
  SELECT pledgeamt/paymonths
    INTO lv_pay_num
    FROM dd_pledge
    WHERE idpledge = p_id
      AND paymonths > 0;
  IF p_amt <> lv_pay_num THEN
    RAISE_APPLICATION_ERROR(-20050, 'Incorrect  payment amount -- ' ||
                            ' planned payment = ' || lv_pay_num);
    END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No payment information');
END;

BEGIN
  ddckpay_sp(104,25);
END;
