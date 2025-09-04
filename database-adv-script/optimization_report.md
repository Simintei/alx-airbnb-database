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

