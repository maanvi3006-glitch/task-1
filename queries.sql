-- Task 1 SQL Analytics Query File
-- Use this file to store your final PostgreSQL queries.
-- Update the table names and column names for your specific schema.

-- STEP 7: Check existing tables
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

--------------------------------------------------

-- STEP 8: Inspect the columns for a specific table
-- Sample dataset owns the 'attempts' table. Replace if needed.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'attempts';

--------------------------------------------------

-- Q1: Average time to reach Level 50
-- Replace table and column names with your schema.
WITH level_50_attempts AS (
    SELECT student_id,
           MIN(attempted_at) FILTER (WHERE level_id = 50) AS first_level_50
    FROM attempts
    GROUP BY student_id
)
SELECT AVG(EXTRACT(EPOCH FROM (first_level_50 - first_attempt))) / 3600.0 AS avg_hours_to_level_50
FROM (
    SELECT a.student_id,
           MIN(a.attempted_at) AS first_attempt
    FROM attempts a
    GROUP BY a.student_id
) start_times
JOIN level_50_attempts l50 ON start_times.student_id = l50.student_id;

--------------------------------------------------

-- Q2: Levels with >40% fail rate
SELECT level_id,
       COUNT(*) FILTER (WHERE success = FALSE) * 100.0 / COUNT(*) AS fail_rate_percent,
       COUNT(*) AS total_attempts
FROM attempts
GROUP BY level_id
HAVING COUNT(*) FILTER (WHERE success = FALSE) * 1.0 / COUNT(*) > 0.40
ORDER BY fail_rate_percent DESC;

--------------------------------------------------

-- Q3: Students with the longest streaks
WITH streaks AS (
    SELECT student_id,
           MAX(consecutive_days) AS max_streak
    FROM student_activity
    GROUP BY student_id
)
SELECT student_id,
       max_streak
FROM streaks
ORDER BY max_streak DESC
LIMIT 20;

--------------------------------------------------

-- Q4: Top 10 fastest successful completions
SELECT student_id,
       level_id,
       MIN(EXTRACT(EPOCH FROM (completed_at - started_at))) / 60.0 AS minutes_to_complete
FROM attempts
WHERE success = TRUE
GROUP BY student_id, level_id
ORDER BY minutes_to_complete ASC
LIMIT 10;

--------------------------------------------------

-- Q5: Overall pass rate by level
SELECT level_id,
       COUNT(*) FILTER (WHERE success = TRUE) * 100.0 / COUNT(*) AS pass_rate_percent,
       COUNT(*) AS total_attempts
FROM attempts
GROUP BY level_id
ORDER BY pass_rate_percent DESC;
