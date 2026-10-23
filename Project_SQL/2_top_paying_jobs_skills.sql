/*
Question: What skills are required for the top-paying data and business analyst roles?
- Use the top 15 highest-paying data and business analyst jobs from the first query.
- Add the specific skills required for these roles.
- Why -> It provides a detailed look which high-paying jobs demand certain skills, helping
    job-seekers understand which skills to develop that align with high-paying opportunities.
*/

with top_paying_jobs as (
select
    job_id,
    company_dim.name,
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg

from
    job_postings_fact
    left join company_dim on job_postings_fact.company_id = company_dim.company_id

where
    job_title_short in ('Data Analyst', 'Business Analyst')
    and job_location = 'Anywhere'
    and salary_year_avg is not null

order by
    salary_year_avg desc

limit 15
)

select 
    top_paying_jobs.*,
    skills

from 
    top_paying_jobs
    inner join skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

order by 
    salary_year_avg desc;
    