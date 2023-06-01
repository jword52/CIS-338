--====================================================== 
--John Ord
--01/30/2023
--CIS338: SQL / Oracle
--UNIT 2, CHAPTER 2-4 Assignment
--======================================================
DECLARE
    lv_purchase_total_num NUMERIC;
    
    lv_rating_high_txt VARCHAR2(10);
    lv_rating_mid_txt VARCHAR2(10) ;
    lv_rating_low_txt VARCHAR2(10) ;
    lv_rating_result_txt VARCHAR2(10);
    lv_purchase_case_num NUMERIC:= 0;
BEGIN
    lv_rating_high_txt:= 'HIGH';
    lv_rating_mid_txt:= 'MID';
    lv_rating_low_txt:= 'LOW';
    lv_purchase_case_num:= 0;
    --For getting input from user
    --lv_purchase_total_num := &x;
    lv_purchase_total_num := 250;
    
 lv_purchase_case_num:= lv_purchase_total_num;
  -- evalutate commission percentage
  CASE 
    WHEN lv_purchase_case_num >200 THEN
      lv_rating_result_txt:= lv_rating_high_txt;
    WHEN lv_purchase_case_num >100 THEN
      lv_rating_result_txt:= lv_rating_mid_txt;
    ELSE
        lv_rating_result_txt:= lv_rating_low_txt;
  END CASE;
  -- print rating
  DBMS_OUTPUT.PUT_LINE('Total of purchases: ' ||lv_purchase_total_num);
  DBMS_OUTPUT.PUT_LINE('Rating: ' ||lv_rating_result_txt);
END;
/
DECLARE
    lv_purchase_total_num NUMERIC;
    
    lv_rating_high_txt VARCHAR2(10);
    lv_rating_mid_txt VARCHAR2(10) ;
    lv_rating_low_txt VARCHAR2(10) ;
    lv_rating_result_txt VARCHAR2(10);
    lv_purchase_case_num NUMERIC:= 0;
BEGIN
    lv_rating_high_txt:= 'HIGH';
    lv_rating_mid_txt:= 'MID';
    lv_rating_low_txt:= 'LOW';
    lv_purchase_case_num:= 0;
    --For getting input from user
    --lv_purchase_total_num := &x;
    lv_purchase_total_num := 150;
    
 lv_purchase_case_num:= lv_purchase_total_num;
  -- evalutate commission percentage
  CASE 
    WHEN lv_purchase_case_num >200 THEN
      lv_rating_result_txt:= lv_rating_high_txt;
    WHEN lv_purchase_case_num >100 THEN
      lv_rating_result_txt:= lv_rating_mid_txt;
    ELSE
        lv_rating_result_txt:= lv_rating_low_txt;
  END CASE;
  -- print rating
  DBMS_OUTPUT.PUT_LINE('Total of purchases: ' ||lv_purchase_total_num);
  DBMS_OUTPUT.PUT_LINE('Rating: ' ||lv_rating_result_txt);
END;
/
DECLARE
    lv_purchase_total_num NUMERIC;
    
    lv_rating_high_txt VARCHAR2(10);
    lv_rating_mid_txt VARCHAR2(10) ;
    lv_rating_low_txt VARCHAR2(10) ;
    lv_rating_result_txt VARCHAR2(10);
    lv_purchase_case_num NUMERIC:= 0;
BEGIN
    lv_rating_high_txt:= 'HIGH';
    lv_rating_mid_txt:= 'MID';
    lv_rating_low_txt:= 'LOW';
    lv_purchase_case_num:= 0;
    --For getting input from user
    --lv_purchase_total_num := &x;
    lv_purchase_total_num := 100;
    
 lv_purchase_case_num:= lv_purchase_total_num;
  -- evalutate commission percentage
  CASE 
    WHEN lv_purchase_case_num >200 THEN
      lv_rating_result_txt:= lv_rating_high_txt;
    WHEN lv_purchase_case_num >100 THEN
      lv_rating_result_txt:= lv_rating_mid_txt;
    ELSE
        lv_rating_result_txt:= lv_rating_low_txt;
  END CASE;
  -- print rating
  DBMS_OUTPUT.PUT_LINE('Total of purchases: ' ||lv_purchase_total_num);
  DBMS_OUTPUT.PUT_LINE('Rating: ' ||lv_rating_result_txt);
END;