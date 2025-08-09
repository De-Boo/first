-- what are the must optimum skills to learn for data driven roles
SELECT COUNT (job_postings_fact.job_id) AS job_id_count,
  skills_job_dim.skill_id,
  skills_dim.skills,
  company_dim.name,
  ROUND (AVG(job_postings_fact.salary_year_avg)) AS job_demand_pament
FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY skills_job_dim.skill_id,
  company_dim.name,
  skills_dim.skills
ORDER BY job_id_count DESC,
  job_demand_pament DESC
LIMIT 15;