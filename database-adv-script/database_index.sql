Indexes for high-usage columns
-- This is crucial for speeding up joins with the 'property' table,
-- as seen in the ranking query.
CREATE INDEX idx_booking_property_id ON booking (property_id);
-- This helps enforce the unique constraint and makes searching for users by email much faster.
CREATE UNIQUE INDEX idx_user_email ON users (email);
-- This would be beneficial for queries that need to find all properties for a specific host.
CREATE INDEX idx_property_host_id ON property (host_id);


-- Step 1: Analyze the ranking query BEFORE adding indexes.
-- This part of the script assumes no indexes exist on the foreign keys yet.
-- The database will likely perform a full table scan, which is less efficient.
-- You will see a "Seq Scan" or similar in the execution plan output.

EXPLAIN ANALYZE
SELECT
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (
        ORDER BY
            COUNT(b.booking_id) DESC
    ) AS ranking
FROM
    property AS p
JOIN
    booking AS b ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.name
ORDER BY
    ranking ASC;

-- Step 2: Add the indexes to their respective columns.
-- These are the indexes that are crucial for optimizing the JOIN operation.

-- Create an index on the 'property_id' column of the 'booking' table.
CREATE INDEX idx_booking_property_id ON booking (property_id);

-- Step 3: Analyze the ranking query AFTER adding indexes.
-- Now, the database can use the newly created index for the join.
-- The execution plan will likely change to an "Index Scan" or "Hash Join" with an index lookup,
-- and the execution time will be significantly lower, especially with large datasets.

EXPLAIN ANALYZE
SELECT
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (
        ORDER BY
            COUNT(b.booking_id) DESC
    ) AS ranking
FROM
    property AS p
JOIN
    booking AS b ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.name
ORDER BY
    ranking ASC;

-- Final Step (Optional): Clean up the created index.
-- This is good practice if you want to remove the index after testing.
DROP INDEX idx_booking_property_id;
