--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--Module 7, CHAPTER 7 Assignment C7_2
--======================================================

CREATE OR REPLACE PACKAGE mm_rentals_pkg
  IS
  PROCEDURE movie_rent_pp
    (p_member IN mm_rental.member_id%TYPE,
     p_movie IN mm_rental.movie_id%TYPE,
     p_pay IN mm_rental.payment_methods_id%TYPE);
  PROCEDURE movie_return_pp
    (p_member IN mm_rental.member_id%TYPE,
     p_movie IN mm_rental.movie_id%TYPE);
  FUNCTION movie_info_pf
    (p_id NUMBER)
  RETURN VARCHAR2;
END;

CREATE OR REPLACE PACKAGE BODY mm_rentals_pkg
  IS
  PROCEDURE movie_rent_pp
    (p_member IN mm_rental.member_id%TYPE,
     p_movie IN mm_rental.movie_id%TYPE,
     p_pay IN mm_rental.payment_methods_id%TYPE)
  IS
BEGIN
  INSERT INTO mm_rental (rental_id, member_id, movie_id,
                         checkout_date, payment_methods_id)
   VALUES(mm_rental_seq.NEXTVAL, p_member, p_movie,
          SYSDATE, p_pay);
  UPDATE mm_movie
    SET movie_qty = movie_qty - 1
    WHERE movie_id = p_movie;
  COMMIT;
END;
  PROCEDURE movie_return_pp
    (p_member IN mm_rental.member_id%TYPE,
     p_movie IN mm_rental.movie_id%TYPE)
  IS
    lv_rental_num mm_rental.rental_id%TYPE;
BEGIN
  SELECT rental_id
    INTO lv_rental_num
    FROM mm_rental
    WHERE member_id = p_member
      AND movie_id = p_movie
      AND checkin_date IS NULL;
  UPDATE mm_rental
    SET checkin_date = SYSDATE
    WHERE rental_id = lv_rental_num;
  UPDATE mm_movie
    SET movie_qty = movie_qty + 1
    WHERE movie_id = p_movie;
  COMMIT;
  END;
  FUNCTION movie_info_pf
    (p_id NUMBER)
    RETURN VARCHAR2
  IS
  lv_title_txt VARCHAR2(35);
  lv_qty_num NUMBER(3);
  lv_msg_txt VARCHAR2(15) := 'Not Available';
  lv_avail_txt VARCHAR2(100);
BEGIN
  SELECT movie_title, movie_qty
    INTO lv_title_txt, lv_qty_num
    FROM mm_movie
    WHERE movie_id = p_id;
  IF lv_qty_num <> 0 THEN
    lv_msg_txt := 'Available';
  END IF;
    lv_avail_txt := lv_title_txt||' is '||lv_msg_txt||': '||
      TO_CHAR(lv_qty_num)||' on the shelf';
  RETURN lv_avail_txt;
  END;
END;
