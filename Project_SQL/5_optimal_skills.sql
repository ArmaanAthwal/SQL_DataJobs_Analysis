/*
Question: What are the most optimal skills to learn?
- Identify skills that are in high demand and associated with a high average salary
    for data and business analyst positions.
- Why -> Target skills that offer better hireability and financial benefits, offering insights
    for career development.
*/

select
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count,
    round(avg(job_postings_fact.salary_year_avg), 0) as avg_salary

from
    job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

where
    job_title_short in('Data Analyst', 'Business Analyst')
    and salary_year_avg is not null

group by 
    skills_dim.skill_id

having 
    count(skills_job_dim.job_id) > 15

order by  
    demand_count desc,
    avg_salary desc

limit 
    25;