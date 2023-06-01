--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6 Assignment 6_11
--======================================================

CREATE OR REPLACE FUNCTION dd_plstat_sf
  (p_id IN dd_pledge.idstatus%TYPE)
  RETURN VARCHAR2
  IS
BEGIN
  IF p_id = 10 THEN
    RETURN 'Open';
   ELSIF p_id = 20 THEN
    RETURN 'Complete';
   ELSIF p_id = 30 THEN
    RETURN 'Overdue';
   ELSIF p_id = 40 THEN
    RETURN 'Closed';
   ELSIF p_id = 50 THEN
    RETURN 'Hold';
   ELSE
    RETURN 'Unknown';
  END IF;
END;

--Select Statements

SELECT idpledge, pledgedate, dd_plstat_sf(idstatus) status
  FROM dd_pledge;
  
SELECT idpledge, pledgedate, dd_plstat_sf(idstatus) status
  FROM dd_pledge
  WHERE idpledge = 105;
