--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--02/04/23
--UNIT 3, CHAPTER 3-9 Assignment
--======================================================

DECLARE
  lv_idProj_num dd_project.idProj%TYPE := 500;
  lv_name_txt dd_project.projname%TYPE;
  lv_cnt_num NUMBER(3);
  lv_sum_num NUMBER(7,2);
  lv_avg_num NUMBER(7,2);
BEGIN
SELECT projname, COUNT(pledgeamt),SUM(pledgeamt), AVG(pledgeamt)
  INTO lv_name_txt, lv_cnt_num, lv_sum_num, lv_avg_num
  FROM dd_project INNER JOIN dd_pledge USING(idProj)
  WHERE idProj = lv_idProj_num
   GROUP BY projname;
  DBMS_OUTPUT.PUT_LINE(lv_idProj_num || ' * ' || lv_name_txt ||
   ' * ' || lv_cnt_num || ' * ' || lv_sum_num || ' * ' || lv_avg_num);
END;
