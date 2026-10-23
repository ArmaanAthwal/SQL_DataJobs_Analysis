/*
Question: What are the most in-demand skills for data and business analysts?
- Identify the top 5  in-demand skills.
- Add the specific skills required for these roles.
- Why -> Provides insight into the most valuable skills for job-seekers.
*/

select
    skills,
    count(skills_job_dim.job_id) as demand_count

from
    job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

where
    job_title_short in('Data Analyst', 'Business Analyst')

group by 
    skills 

order by 
    demand_count desc

limit 
    5;