--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--02/04/23
--UNIT 3, CHAPTER 3-10 Assignment
--======================================================

DECLARE
  rec_project dd_project%ROWTYPE;
  lv_prev_num dd_project.projfundgoal%TYPE;
  lv_goal_num dd_project.projfundgoal%TYPE := 20000;
  lv_proj_num dd_project.idProj%TYPE := 500;
BEGIN
  SELECT projfundgoal
    INTO lv_prev_num
    FROM dd_project
    WHERE idProj = lv_proj_num;
  UPDATE dd_project
    SET projfundgoal = lv_goal_num
    WHERE idProj = lv_proj_num
    RETURNING idProj, projname, projstartdate, projenddate,
     projfundgoal, projcoord
    INTO rec_project;
  DBMS_OUTPUT.PUT_LINE('Name: ' || rec_project.projname);
  DBMS_OUTPUT.PUT_LINE('Start: ' || rec_project.projstartdate);
  DBMS_OUTPUT.PUT_LINE('Prev Goal: ' || lv_prev_num);
  DBMS_OUTPUT.PUT_LINE('New Goal: ' || rec_project.projfundgoal);
END;
