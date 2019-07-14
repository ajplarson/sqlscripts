use PersonalTrainer;

-- SELECT
--     COUNT(c.clientId) clientCount
-- FROM client c;
-- Use an aggregate to count the number of Clients.
-- 500 rows
--------------------
-- select 
-- 	count(c.clientid) clientcount
-- from client c
-- where c.birthdate is null;


-- Use an aggregate to count Client.BirthDate.
-- The number is different than total Clients. Why?
-- 463 rows
--------------------
-- SELECT 
--     c.City City, COUNT(c.clientid) clientcount
-- FROM
--     client c
-- GROUP BY (c.City)
-- ORDER BY clientcount DESC;
-- Group Clients by City and count them.
-- Order by the number of Clients desc.
-- 20 rows
-- ------------------
-- SELECT 
--     i.invoiceid InvoiceID,
--     SUM(ili.price * ili.quantity) Summation
-- FROM
--     invoice i
--         INNER JOIN
--     invoicelineitem ili ON i.invoiceid = ili.invoiceid
-- GROUP BY i.invoiceid;
-- Calculate a total per invoice using only the InvoiceLineItem table.
-- Group by InvoiceId.
-- You'll need an expression for the line item total: Price * Quantity.
-- Aggregate per group using SUM().
-- 1000 rows
-- ------------------

-- Calculate a total per invoice using only the InvoiceLineItem table.
-- (See above.)
-- Only include totals greater than $500.00.
-- Order from lowest total to highest.
-- 234 rows
-- SELECT 
--     i.invoiceid InvoiceID,
--     SUM(ili.price * ili.quantity) Summation
-- FROM
--     invoice i
--         INNER JOIN
--     invoicelineitem ili ON i.invoiceid = ili.invoiceid
-- GROUP BY i.invoiceid;
-- ----------------- 


-- -- -- --
-- SELECT 
--     ili.description Description,
--     AVG(ili.price * ili.quantity) avg
--     
-- FROM
--     invoice i
--         INNER JOIN
--     invoicelineitem ili ON i.invoiceid = ili.invoiceid
-- GROUP BY ili.description;
-- Calculate the average line item total
-- grouped by InvoiceLineItem.Description.
-- 3 rows
-- ------------------

-- Select ClientId, FirstName, and LastName from Client
-- for clients who have *paid* over $1000 total.
-- Paid is Invoice.InvoiceStatus = 2.
-- Order by LastName, then FirstName.
-- 146 rows
-- ------------------

-- Count exercises by category.
-- Group by ExerciseCategory.Name.
-- Order by exercise count descending.
-- 13 rows
--------------------

-- Select Exercise.Name along with the minimum, maximum,
-- and average ExerciseInstance.Sets.
-- Order by Exercise.Name.
-- 64 rows
--------------------

-- Find the minimum and maximum Client.BirthDate
-- per Workout.
-- 26 rows
-- Sample: 
-- WorkoutName, EarliestBirthDate, LatestBirthDate
-- '3, 2, 1... Yoga!', '1928-04-28', '1993-02-07'
--------------------

-- Count client goals.
-- Be careful not to exclude rows for clients without goals.
-- 500 rows total
-- 50 rows with no goals
--------------------

-- Select Exercise.Name, Unit.Name, 
-- and minimum and maximum ExerciseInstanceUnitValue.Value
-- for all exercises with a configured ExerciseInstanceUnitValue.
-- Order by Exercise.Name, then Unit.Name.
-- 82 rows
--------------------

-- Modify the query above to include ExerciseCategory.Name.
-- Order by ExerciseCategory.Name, then Exercise.Name, then Unit.Name.
-- 82 rows
--------------------

-- Select the minimum and maximum age in years for
-- each Level.
-- To calculate age in years, use the MySQL function DATEDIFF.
-- 4 rows
--------------------

-- Stretch Goal!
-- Count logins by email extension (.com, .net, .org, etc...).
-- Research SQL functions to isolate a very specific part of a string value.
-- 27 rows (27 unique email extensions)
-- ------------------

-- Stretch Goal!
-- Match client goals to workout goals.
-- Select Client FirstName and LastName and Workout.Name for
-- all workouts that match at least 2 of a client's goals.
-- Order by the client's last name, then first name.
-- 139 rows
-- ------------------