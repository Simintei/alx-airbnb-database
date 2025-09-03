A query to find all properties where the average rating is greater than 4.0 using a subquery.

SELECT
 property.property.id,
 propery.name
FROM 
 property
WHERE 
     propery.propety_id IN (
      	SELECT
        	review.property_id
      	FROM
        	review
      	GROUP BY
        	review.property_id
      	HAVING
        	AVG(review.rating) > 4.0
     );
	

A correlated subquery to find users who have made more than 3 bookings.

SELECT
 user_id,
 user.first_name,
 user.last_name,
 user.email
FROM 
 users
WHERE
    (
     SELECT
       COUNT(booking.booking_id)
     FROM
       booking
     WHERE
       booking.user_id = user.user_id
     ) > 3;
