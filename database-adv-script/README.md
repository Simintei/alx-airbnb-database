SQL QUERIES

INNER JOIN The INNER JOIN keyword selects records that have matching values in both tables.

LEFT JOIN The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.

FULL OUTER JOIN The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records. FULL OUTER JOIN and FULL JOIN are the same.

SUBQUERIES/CORRELATED QUERIES
In a SQL correlated subquery, e1 and e2 are aliases for the same table.
e1 represents the "outer" or "current" instance of the table. The outer query iterates through each row of this table.
e2 represents the "inner" or "subquery" instance of the same table. The inner query, which is dependent on the outer query, uses this alias to perform its calculation or comparison.
This aliasing allows you to treat the same table as two separate entities in the same query. This is necessary because the inner query needs to reference a value from the outer query to perform its row-by-row operation.

