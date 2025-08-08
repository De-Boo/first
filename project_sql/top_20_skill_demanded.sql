-- top 20 demand skill for data analysis
-- use the job_id to represent the demand of a skill by companies
SELECT skills_dim.skills,
  count (job_postings_fact.job_id) AS top_demand_skill
FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short LIKE '%Data%'
  OR job_postings_fact.job_title_short LIKE '%Analyst%'
GROUP BY skills
ORDER BY top_demand_skill DESC
LIMIT 20;