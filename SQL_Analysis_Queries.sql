SELECT
    COUNT(*) AS total_students,
    SUM(Placement_Status = 'Placed') AS placed_students,
    SUM(Placement_Status = 'Not Placed') AS not_placed_students,
    ROUND(
        100.0 * SUM(Placement_Status = 'Placed') / COUNT(*),
        2
    ) AS placement_rate_percent
FROM students;