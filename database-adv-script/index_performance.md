When you run this script, pay close attention to the output of the two EXPLAIN or ANALYZE commands.

Before Indexing: 
You will likely see a Seq Scan on the booking table. This means the database had to read every single row to find the matching property_id values for the join. The "Planning Time" and "Execution Time" will be higher.

After Indexing: 
You should see a new execution plan that includes an Index Scan on the booking table using the idx_booking_property_id index. This indicates that the database is now using the index to quickly locate the relevant rows, which should result in a much faster "Execution Time."


-- Step 1: Analyze the ranking query BEFORE adding indexes.
-- This part of the script assumes no indexes exist on the foreign keys yet.
-- The database will likely perform a full table scan, which is less efficient.
-- You will see a "Seq Scan" or similar in the execution plan output.

EXPLAIN or ANALYZE
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
