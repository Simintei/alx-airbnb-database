Once the below query is run, this is whats expected

The EXPLAIN command provides an explanation of how your database will execute a query. For the selected query, which involves multiple JOIN operations, the EXPLAIN output will primarily reveal the following:
-Join Order: The sequence in which the database will join the four tables (booking, users, property, and payment).
-Join Type: The specific algorithm used for each join. For instance, it might use a Hash Join or a Nested Loop Join.
-Access Methods: How the database will read data from each table.

Identifying Inefficiencies

The most significant inefficiency you'll likely see in the EXPLAIN output for this query, assuming no indexes are present on the foreign keys, is the use of Sequential Scans (Seq Scan).
-For each JOIN operation, the database needs to find matching rows between tables.
-Without an index on the foreign key columns (booking.user_id, booking.property_id, booking.booking_id which links to the payment table), the database has no quick way to look up the related rows.
-Therefore, it is forced to perform a full Seq Scan on one or more of the tables involved in the join, reading every single row to find a match. This is highly inefficient and becomes a major performance bottleneck as your tables grow in size.        

To resolve the above issue, we would need to add indexes on the foreign key columns to allow the database swith from a Seq Scan to a much faster Index Scan.

---Analyze the query’s performance using EXPLAIN and identify any inefficiencies
EXPLAIN
SELECT
    --- Booking Details
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status AS booking_status,
    b.created_at AS booking_created_at,

    --- User Details
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
