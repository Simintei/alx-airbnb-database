--Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql

SELECT
    -- User Details
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,

    -- Property Details
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,

    -- Payment Details
    pay.payment_id,
    pay.amount AS payment_amount

FROM
    booking AS b
-- Join with the users table on user_id to get user information
INNER JOIN
    users AS u ON b.user_id = u.user_id
-- Join with the property table on property_id to get property information
INNER JOIN
    property AS p ON b.property_id = p.property_id
-- Join with the payment table on booking_id to get payment information
LEFT JOIN
    payment AS pay ON b.booking_id = pay.booking_id;

