A query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT
 user.user_id,
 user.first_name,
 user.last_name
 COUNT(booking.booking_id)
FROM
 users
WHERE
 users
INNER JOIN booking 
 ON users.user_id = booking.user_id
GROUP BY
 user.user_id
 user.first_name,
 user.last_name
     );

Window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.      
SELECT
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (
        ORDER BY
            COUNT(b.booking_id) DESC
    ) AS rank_ranking, 
    ROW_NUMBER() OVER (
        ORDER BY
            COUNT(b.booking_id) DESC
    ) AS row_number_ranking 
FROM
    property AS p
JOIN
    booking AS b ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.name
ORDER BY
    rank_ranking ASC;
