-- sample_dataset.sql
-- This script creates sample tables and inserts data for the Task 1 SQL queries.

DROP TABLE IF EXISTS attempts;
DROP TABLE IF EXISTS student_activity;

CREATE TABLE attempts (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    level_id INTEGER NOT NULL,
    attempted_at TIMESTAMP NOT NULL,
    started_at TIMESTAMP NOT NULL,
    completed_at TIMESTAMP NOT NULL,
    success BOOLEAN NOT NULL
);

CREATE TABLE student_activity (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    activity_date DATE NOT NULL,
    consecutive_days INTEGER NOT NULL
);

INSERT INTO attempts (student_id, level_id, attempted_at, started_at, completed_at, success) VALUES
(1, 10, '2026-05-01 08:00:00', '2026-05-01 08:00:00', '2026-05-01 08:12:00', TRUE),
(1, 50, '2026-05-10 09:00:00', '2026-05-10 09:00:00', '2026-05-10 09:35:00', TRUE),
(2, 50, '2026-05-12 09:30:00', '2026-05-12 09:30:00', '2026-05-12 10:10:00', FALSE),
(2, 50, '2026-05-12 10:30:00', '2026-05-12 10:30:00', '2026-05-12 11:00:00', TRUE),
(3, 20, '2026-05-02 14:00:00', '2026-05-02 14:00:00', '2026-05-02 14:14:00', FALSE),
(3, 20, '2026-05-02 14:20:00', '2026-05-02 14:20:00', '2026-05-02 14:40:00', TRUE),
(4, 30, '2026-05-05 11:00:00', '2026-05-05 11:00:00', '2026-05-05 11:50:00', FALSE),
(4, 30, '2026-05-05 12:10:00', '2026-05-05 12:10:00', '2026-05-05 13:00:00', FALSE),
(4, 30, '2026-05-05 13:30:00', '2026-05-05 13:30:00', '2026-05-05 14:25:00', TRUE),
(5, 50, '2026-05-15 13:00:00', '2026-05-15 13:00:00', '2026-05-15 13:55:00', FALSE),
(6, 40, '2026-05-07 10:00:00', '2026-05-07 10:00:00', '2026-05-07 10:25:00', TRUE),
(7, 50, '2026-05-15 15:00:00', '2026-05-15 15:00:00', '2026-05-15 15:45:00', FALSE),
(7, 50, '2026-05-15 16:00:00', '2026-05-15 16:00:00', '2026-05-15 16:50:00', FALSE),
(8, 50, '2026-05-16 08:00:00', '2026-05-16 08:00:00', '2026-05-16 08:40:00', TRUE),
(8, 10, '2026-05-01 09:00:00', '2026-05-01 09:00:00', '2026-05-01 09:10:00', TRUE),
(9, 30, '2026-05-06 09:00:00', '2026-05-06 09:00:00', '2026-05-06 09:30:00', TRUE),
(10, 20, '2026-05-03 08:00:00', '2026-05-03 08:00:00', '2026-05-03 08:20:00', TRUE);

INSERT INTO student_activity (student_id, activity_date, consecutive_days) VALUES
(1, '2026-05-04', 5),
(2, '2026-05-12', 2),
(3, '2026-05-03', 3),
(4, '2026-05-05', 1),
(5, '2026-05-16', 4),
(6, '2026-05-07', 8),
(7, '2026-05-15', 2),
(8, '2026-05-16', 7),
(9, '2026-05-06', 6),
(10, '2026-05-03', 3);
