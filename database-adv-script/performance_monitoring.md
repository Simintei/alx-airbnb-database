SQL commands like SHOW PROFILE or EXPLAIN ANALYZE to monitor the performance of a few of your frequently used queries.

EXPLAIN ANALYZE
SELECT
    -- Booking Details
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status AS booking_status,
    b.created_at AS booking_created_at,
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
JOIN
    users AS u ON b.user_id = u.user_id
-- Join with the property table on property_id to get property information
JOIN
    property AS p ON b.property_id = p.property_id
-- Join with the payment table on booking_id to get payment information
JOIN
    payment AS pay ON b.booking_id = pay.booking_id;

**Bottlenecks and their changes**
For the initial query that retrieves all bookings along with the user details, property details, and payment details 
The primary bottleneck will be in the JOIN operations themselves, especially if any of the tables (booking, users, property, or payment) grow to be very large.
Unindexed
The biggest performance issue is likely due to the lack of indexes on the foreign key columns used in the joins.
JOIN users AS u ON b.user_id = u.user_id
JOIN property AS p ON b.property_id = p.property_id
JOIN payment AS pay ON b.booking_id = pay.booking_id
Without an index on the join columns in the booking and payment tables, the database has to perform a full table scan on at least one side of each join to find matching rows. This is incredibly inefficient and will slow down your query as your data grows.

**Solution: Add indexes to Foreign Keys**
This allows the database to use a much faster index scan instead of a full sequential scan during the joins.

**Below indexes should be used**
-- Create an index on the 'user_id' column of the 'booking' table.
-- This will significantly speed up the join to the users table.
CREATE INDEX idx_booking_user_id ON booking (user_id);

-- Create an index on the 'property_id' column of the 'booking' table.
-- This will optimize the join to the property table.
CREATE INDEX idx_booking_property_id ON booking (property_id);

-- Create an index on the 'booking_id' column of the 'payment' table.
-- This is crucial for quickly linking payments to their corresponding bookings.
CREATE INDEX idx_payment_booking_id ON payment (booking_id);

By adding these indexes, it provides the database with a fast lookup mechanism. Instead of searching the entire booking table for a specific user_id or property_id, it can use the index to go directly to the correct rows, making the query much more efficient.

**Changes implemented**
SELECT
    -- Booking Details
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status AS booking_status,
    b.created_at AS booking_created_at,
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
JOIN
    users AS u ON b.user_id = u.user_id
-- Join with the property table on property_id to get property information

JOIN
    property AS p ON b.property_id = p.property_id
- Join with the payment table on booking_id to get payment information
JOIN
    payment AS pay ON b.booking_id = pay.booking_id;

-- Create an index on the 'user_id' column of the 'booking' table.
-- This will significantly speed up the join to the users table.
CREATE INDEX idx_booking_user_id ON booking (user_id);
-- Create an index on the 'property_id' column of the 'booking' table.
-- This will optimize the join to the property table.
CREATE INDEX idx_booking_property_id ON booking (property_id);
-- Create an index on the 'booking_id' column of the 'payment' table.
-- This is crucial for quickly linking payments to their corresponding bookings.
CREATE INDEX idx_payment_booking_id ON payment (booking_id);

**The improvements noted**
Query takes less time to run and is more efficient.


