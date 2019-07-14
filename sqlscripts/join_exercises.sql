use personaltrainer;

-- SELECT 
--     ec.exercisecategoryid ecid,
--     e.exercisecategoryid eid,
--     COUNT(e.exercisecategoryid)
-- FROM
--     exercise e
--         INNER JOIN
--     exercisecategory ec ON e.exercisecategoryid = ec.exercisecategoryid;

-- Select all columns from ExerciseCategory and Exercise.
-- The tables should be joined on ExerciseCategoryId.
-- This query returns all Exercises and their associated ExerciseCategory.
-- 64 rows
-- ------------------
    
-- SELECT 
--     ec.exercisecategoryid,
--     ec.name categoryname,
--     e.exercisecategoryid,
--     e.name exercisename
-- FROM
--     exercise e
--         INNER JOIN
--     exercisecategory ec ON e.exercisecategoryid = ec.exercisecategoryid
-- WHERE
--     ec.parentcategoryid IS NULL;
-- where the ExerciseCategory does not have a ParentCategoryId (it is null).
-- Again, join the tables on their shared key (ExerciseCategoryId).
-- 9 rows
-- ------------------

-- The query above is a little confusing. At first glance, it's hard to tell
-- which Name belongs to ExerciseCategory and which belongs to Exercise.
-- Rewrite the query using an aliases. 
-- Alias ExerciseCategory.Name as 'CategoryName'.
-- Alias Exercise.Name as 'ExerciseName'.
-- 9 rows
-- ------------------

-- SELECT 
--     c.firstname, 
--     c.lastname, 
--     c.birthdate, 
--     l.emailaddress
-- FROM
--     client c
--         INNER JOIN
--     login l ON l.clientid = c.clientid
-- WHERE
--     c.birthdate BETWEEN '1990-01-01' AND '1999-12-31';
-- Select FirstName, LastName, and BirthDate from Client
-- and EmailAddress from Login 
-- where Client.BirthDate is in the 1990s.
-- Join the tables by their key relationship. 
-- What is the primary-foreign key relationship?
-- 35 rows
-- ------------------


-- select
-- 	w.name,
--     c.firstname,
--     c.lastname
-- from client c inner join clientworkout cw on c.clientid = cw.clientid
-- inner join workout w on w.workoutid = cw.workoutid
-- where c.lastname like 'c%';
-- Select Workout.Name, Client.FirstName, and Client.LastName
-- for Clients with LastNames starting with 'C'?
-- How are Clients and Workouts related?
-- 25 rows
-- ------------------

-- select
-- 	w.name WorkoutName,
--     g.name Goal
-- from workout w inner join workoutgoal wg on w.workoutid = wg.workoutid
-- inner join goal g on g.goalid = wg.goalid;
-- Select Names from Workouts and their Goals.
-- This is a many-to-many relationship with a bridge table.
-- Use aliases appropriately to avoid ambiguous columns in the result.
-- ------------------


-- select 
-- 	c.firstname firstname,
--     c.lastname lastname,
--     l.clientid clientid,
--     l.emailaddress email

-- from client c left outer join login l on l.clientid = c.clientid;
-- Select FirstName and LastName from Client.
-- Select ClientId and EmailAddress from Login.
-- Join the tables, but make Login optional.
-- 500 rows
-- ------------------

-- select 
-- 	c.firstname firstname,
--     c.lastname lastname,
--     l.clientid clientid,
--     l.emailaddress email

-- from client c left outer join login l on l.clientid = c.clientid
-- where l.emailaddress is null and c.firstname = 'Romeo';
-- Using the query above as a foundation, select Clients
-- who do _not_ have a Login.
-- 200 rows
-- ------------------

-- Does the Client, Romeo Seaward, have a Login?
-- Decide using a single query.
-- nope :(
-- ------------------

-- select 
-- 	parent.name ParentCategory,
--     parent.exercisecategoryid parentexercisecategoryid,
--     child.name Exercise,
--     child.exercisecategoryid childexercisecategoryid
-- from exercisecategory parent inner join exercisecategory child on parent.exercisecategoryid = child.parentcategoryid;
-- Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
-- This requires a self-join.
-- 12 rows
-- ------------------
-- select 
-- 	parent.name ParentCategory,
--     parent.exercisecategoryid parentexercisecategoryid,
--     child.name Exercise,
--     child.exercisecategoryid childexercisecategoryid
-- from exercisecategory parent inner join exercisecategory child on parent.exercisecategoryid = child.exercisecategoryid;    
-- Rewrite the query above so that every ExerciseCategory.Name is
-- included, even if it doesn't have a parent.
-- 16 rows
-- ------------------
-- select 
-- 	c.firstname
-- from client c left outer join clientworkout cw on c.clientid = cw.clientid
-- left outer join workout w on cw.workoutid = w.workoutid
-- where cw.workoutid is null;
-- Are there Clients who are not signed up for a Workout?
-- 50 rows
- -------------------

-- SELECT 
--     w.name Workout, l.name Level, g.name Goal
-- FROM
--     client c
--         INNER JOIN
--     clientgoal cg ON c.clientid = cg.clientid
--         INNER JOIN
--     goal g ON cg.goalid = g.goalid
--         INNER JOIN
--     workoutgoal wg ON wg.goalid = g.goalid
--         INNER JOIN
--     workout w ON w.workoutid = wg.workoutid
--         INNER JOIN
--     level l ON w.levelid = l.levelid
-- WHERE
--     (c.firstname = 'Shell')
--         AND (c.lastname = 'Creane')
--         AND (l.name = 'Beginner');


-- Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
-- Goals are associated to Clients through ClientGoal.
-- Goals are associated to Workouts through WorkoutGoal.
-- 6 rows, 4 unique rows

-- ------------------
-- select
-- 	w.name workout,
--     g.name goal
-- from workout w left outer join workoutgoal wg on wg.workoutid = w.workoutid and wg.goalid =10
-- left outer join goal g on g.goalid = wg.goalid;


-- Select all Workouts. 
-- Join to the Goal, 'Core Strength', 10 but make it optional.
-- You may have to look up the GoalId before writing the main query.
-- If you filter on Goal.Name in a WHERE clause, Workouts will be excluded.
-- Why?
-- 26 Workouts, 3 Goals
-- ------------------

SELECT 
    e.name Exercise,
    eiuv.value Value,
    u.name Unit
FROM
    workout w
        INNER JOIN
    workoutday wd ON w.workoutid = wd.workoutid
        INNER JOIN
    workoutdayexerciseinstance wod ON wod.workoutdayid = wd.workoutdayid
        INNER JOIN
    exerciseinstance ei ON ei.exerciseinstanceid = wod.exerciseinstanceid
        INNER JOIN
    exercise e ON e.exerciseid = ei.exerciseid
		INNER JOIN
	exerciseinstanceunitvalue eiuv on eiuv.exerciseinstanceid = ei.exerciseinstanceid
		INNER JOIN
	unit u on u.unitid = eiuv.unitid
where 
	e.exerciseid = 17;
-- The relationship between Workouts and Exercises is... complicated.
-- Workout links to WorkoutDay (one day in a Workout routine)
-- which links to WorkoutDayExerciseInstance 
-- (Exercises can be repeated in a day so a bridge table is required) 
-- which links to ExerciseInstance 
-- (Exercises can be done with different weights, repetions,
-- laps, etc...) 
-- which finally links to Exercise.
-- Select Workout.Name and Exercise.Name for related Workouts and Exercises.
-- ------------------
-- An ExerciseInstance is configured with ExerciseInstanceUnitValue.
-- It contains a Value and UnitId that links to Unit.
-- Example Unit/Value combos include 10 laps, 15 minutes, 200 pounds.
-- Select Exercise.Name, ExerciseInstanceUnitValue.Value, and Unit.Name
-- for the 'Plank' exercise. eid 17 eci 5
-- How many Planks are configured, which Units apply, and what 
-- are the configured Values?
-- 4 rows, 1 Unit, and 4 distinct Values
-- ------------------