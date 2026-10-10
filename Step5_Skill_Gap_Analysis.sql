WITH RECURSIVE

job_demand AS (
    SELECT
        Skill,
        COUNT(DISTINCT Job_ID) AS jobs_requiring_skill,
        ROUND(
            100.0 * COUNT(DISTINCT Job_ID) /
            (SELECT COUNT(*) FROM job_market),
            2
        ) AS job_demand_percentage
    FROM job_skills
    GROUP BY Skill
),

student_skill_split AS (
    SELECT
        Student_ID,
        TRIM(SUBSTRING_INDEX(Skills, ',', 1)) AS Skill,
        SUBSTRING(
            Skills,
            LENGTH(SUBSTRING_INDEX(Skills, ',', 1)) + 2
        ) AS Remaining
    FROM students

    UNION ALL

    SELECT
        Student_ID,
        TRIM(SUBSTRING_INDEX(Remaining, ',', 1)) AS Skill,
        SUBSTRING(
            Remaining,
            LENGTH(SUBSTRING_INDEX(Remaining, ',', 1)) + 2
        ) AS Remaining
    FROM student_skill_split
    WHERE Remaining <> ''
),

student_availability AS (
    SELECT
        Skill,
        COUNT(DISTINCT Student_ID) AS students_with_skill,
        ROUND(
            100.0 * COUNT(DISTINCT Student_ID) /
            (SELECT COUNT(*) FROM students),
            2
        ) AS student_percentage
    FROM student_skill_split
    WHERE Skill <> ''
    GROUP BY Skill
)

SELECT
    j.Skill,
    j.job_demand_percentage,
    s.student_percentage,
    ROUND(
        j.job_demand_percentage - s.student_percentage,
        2
    ) AS skill_gap_percentage
FROM job_demand j
JOIN student_availability s
    ON j.Skill = s.Skill
ORDER BY skill_gap_percentage DESC;