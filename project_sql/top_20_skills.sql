-- skills for 20 skills to learn
WITH top_20_paying_jobs AS (
  SELECT job_id,
    company_dim.company_id,
    job_title_short,
    job_schedule_type,
    job_no_degree_mention,
    job_health_insurance,
    job_country,
    job_work_from_home,
    salary_year_avg
  FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
  WHERE job_health_insurance = 'true'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 'true'
  ORDER BY salary_year_avg DESC
  LIMIT 20
)
SELECT top_20_paying_jobs.*,
  skills_job_dim.skill_id,
  skills_dim.skills
FROM top_20_paying_jobs
  INNER JOIN skills_job_dim ON top_20_paying_jobs.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LIMIT 20;