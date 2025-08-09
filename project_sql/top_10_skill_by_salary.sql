-- top 20 skill by salary of data analysist roles
SELECT skills_dim.skills,
  ROUND (avg(job_postings_fact.salary_year_avg)) AS avg_salary
FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE (
    job_postings_fact.job_title_short LIKE '%Data%'
    OR job_postings_fact.job_title_short LIKE '%Analyst%'
  )
  AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 10;