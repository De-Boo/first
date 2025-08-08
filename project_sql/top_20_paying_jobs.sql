-- top 20 paying jobs for data analysis
SELECT job_id,
  job_title_short,
  job_schedule_type,
  job_no_degree_mention,
  job_health_insurance,
  job_country,
  job_work_from_home,
  salary_year_avg
FROM job_postings_fact
WHERE job_health_insurance = 'true'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = 'true'
ORDER BY salary_year_avg DESC
LIMIT 20;