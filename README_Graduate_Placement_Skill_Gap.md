# Graduate Placement, Skill Gap & IT Job-Market Analysis — 2026

## Overview
A portfolio project demonstrating a data analytics workflow using a **synthetic 500-student placement dataset** and a prepared IT job-market dataset. It explores simulated placement patterns and compares student skill availability with skill mentions in job records.

> **Disclosure:** Student records are synthetic and do not represent a real college's actual placement outcomes. Before publishing, document the job-market dataset's source, collection method, date coverage and license.

## Business questions
- What does the simulated placement distribution look like?
- How do outcomes differ by department?
- What are the recorded average CGPA and average package?
- Which skills appear in job-market records?
- For which skills does job-record demand exceed recorded student availability?

## Tools
Excel/CSV, MySQL, SQL, Power BI and DAX; Python/Pandas where used in the actual workflow.

## Data
Student fields include department, CGPA, internship, project count, certification count, skills, placement status, company, role and package. The job-market data is scoped to IT/technology records for 2025–2026, with standardized skills and a job-skill bridge table. Add exact source and licensing details before release.

## MySQL database
Database: `placement_analysis`
- `students`
- `job_market`
- `job_skills`

`job_skills` links to `job_market` using `Job_ID`. Student records are analyzed separately; they should not be joined to job records as if they represented the same entities.

## Power BI pages
### Placement Overview
Includes placement-status distribution, placed/not-placed counts, placement rate, average CGPA, average package, department comparisons and top companies by simulated student placements.

Current displayed values: 500 students, 317 placed, 183 not placed, 63.40% placement rate, 7.59 average CGPA and 3.67 LPA average package. These are synthetic-data results only.

### Skill Gap Analysis
- **Job Skill Demand %:** percentage of job records mentioning a skill.
- **Student Skill Availability %:** percentage of distinct synthetic students recorded with a skill.
- **Skill Gap %:** job skill demand minus student skill availability.

A positive gap means a skill appears in a larger share of job records than the share of students recorded with it. This is descriptive and does not prove employability or causation.

## Workflow
1. Inspect and prepare datasets.
2. Filter and standardize job-market records and skill labels.
3. Load the three tables into MySQL.
4. Run SQL summaries and skill-gap queries.
5. Connect Power BI to MySQL and create measures and visuals.
6. Interpret findings and document caveats.

## Limitations
- Student data is synthetic.
- Job-market records may not represent the entire IT labor market.
- Skill normalization and dataset coverage affect counts.
- The datasets represent different populations and should be compared cautiously.
- Correlation or group differences do not establish causation.

## Suggested structure
```text
graduate-placement-skill-gap-analysis/
├── README.md
├── report/Graduate_Placement_Skill_Gap_Project_Report.docx
├── sql/SQL_Analysis_Queries.sql
├── sql/Step5_Skill_Gap_Analysis.sql
├── powerbi/Placement_Skill_Gap_Analysis.pbix
├── screenshots/
└── data/  # only files permitted for public redistribution
```

## Before publishing
- [ ] Add exact job-market source and license/provenance.
- [ ] Validate and document final SQL/DAX findings.
- [ ] Add screenshots of both report pages.
- [ ] Confirm data files may be redistributed; otherwise provide a data dictionary and retrieval instructions.
- [ ] Keep synthetic-data disclosure visible.
