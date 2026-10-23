/*
Question: What are the top skills based on salary?
- What is average salary associated with each skill for data and business analyst positions.
- Why -> It reveals how different skills impact salary levels for data and business analysts,
    it helps identify the most financially rewarding skills to acquire or improve.
*/

select
    skills,
    round(avg(salary_year_avg), 0) as avg_salary

from
    job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

where
    job_title_short in('Data Analyst', 'Business Analyst')
    and salary_year_avg is not null

group by
    skills

order by
    avg_salary desc

limit
    25;