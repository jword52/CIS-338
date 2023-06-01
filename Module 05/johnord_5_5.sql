--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5_5 Assignment
--======================================================

CREATE OR REPLACE PROCEDURE status_ship_sp
  (i_id      in bb_basketstatus.idbasket%type,
   i_date    in bb_basketstatus.dtstage%type,
   i_shipper in bb_basketstatus.shipper%type,
   i_track   in bb_basketstatus.shippingnum%type)
  is
BEGIN
  INSERT INTO bb_basketstatus (idstatus, idbasket, idstage, dtstage,
                               shipper, shippingnum)
  VALUES (bb_status_seq.NEXTVAL, p_basketid, 3, p_date, p_shipper,
          p_shipnum);
  COMMIT;
END;

BEGIN
  status_ship_sp(3,'20-FEB-12','UPS','ZW2384YXK4957');
END;

SELECT *
  FROM bb_basketstatus;
