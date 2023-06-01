--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5 Case_2 Assignment
--======================================================

CREATE OR REPLACE PROCEDURE movie_rent_sp
  (p_member IN mm_rental.member_id%TYPE,
   p_movie IN mm_rental.movie_id%TYPE,
   p_pay IN mm_rental.payment_methods_id%TYPE)
  IS
BEGIN
  INSERT INTO mm_rental (rental_id, member_id, movie_id,
                         checkout_date, payment_methods_id)
  VALUES(mm_rental_seq.NEXTVAL, p_member, p_movie, SYSDATE, p_pay);
  UPDATE mm_movie
  SET movie_qty = movie_qty - 1
  WHERE movie_id = p_movie;
  COMMIT;
END;

CREATE OR REPLACE PROCEDURE movie_return_sp
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
