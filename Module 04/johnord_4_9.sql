--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 4, CHAPTER 4 Assignment
--======================================================

DECLARE
  CURSOR cur_donor IS
    SELECT idpledge, pl.pledgeamt, pl.paymonths, py.paydate, py.payamt
      FROM dd_pledge pl INNER JOIN dd_payment py
        USING (idPledge)
      WHERE idDonor= 308
      ORDER BY idpledge, py.paydate;
  TYPE type_donor IS RECORD (
    pid dd_pledge.idpledge%TYPE,
    pamt dd_pledge.pledgeamt%TYPE,
    pmth dd_pledge.paymonths%TYPE,
    pdate dd_payment.paydate%TYPE,
    ppay dd_payment.payamt%TYPE);
  rec_donor type_donor;
  lv_id_num dd_pledge.idpledge%TYPE := 0;
BEGIN
  OPEN cur_donor;
  LOOP
    FETCH cur_donor INTO rec_donor;
    EXIT WHEN cur_donor%NOTFOUND;
    IF rec_donor.pid <> lv_id_num THEN
      DBMS_OUTPUT.PUT_LINE(rec_donor.pid || ' - ' ||
        TO_CHAR(rec_donor.pamt,'$99,999.00') || ' - ' ||
                rec_donor.pmth || ' - ' ||
                rec_donor.pdate || ' - ' ||
        TO_CHAR(rec_donor.ppay,'$99,999.00') || ' - ' ||
          'First Payment');
        lv_id_num := rec_donor.pid;
      ELSE
        DBMS_OUTPUT.PUT_LINE(rec_donor.pid || ' - ' ||
          TO_CHAR(rec_donor.pamt,'$99,999.00') || ' - ' ||
                  rec_donor.pmth || ' - ' ||
                  rec_donor.pdate || ' - ' ||
          TO_CHAR(rec_donor.ppay,'$99,999.00'));
    END IF;
  END LOOP;
  CLOSE cur_donor;
END;
