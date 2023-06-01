--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 4, CHAPTER 4 Assignment
--======================================================

DECLARE
  ex_id_pk EXCEPTION;
  PRAGMA EXCEPTION_INIT(ex_id_pk, -00001);
BEGIN
  UPDATE dd_donor
    SET iddonor = 310
    WHERE iddonor = 305;
EXCEPTION
  WHEN ex_id_pk THEN
    DBMS_OUTPUT.PUT_LINE('This ID is already assigned.');
END;
