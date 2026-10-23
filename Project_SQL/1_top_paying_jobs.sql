/*
 Question: What are the top paying data and business analyst jobs?
 - Identify the top 15 highest-paying data and business analyst roles that are available remotely.
 - Focus on job postings with specified salary(remove null).
 - Why -> Discover the top-paying opportunities for data and business analysts, essential high-value skills, 
    and roles to pursue.
*/
 
select 
    job_id,
    company_dim.name,
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date

from
    job_postings_fact
    left join company_dim on job_postings_fact.company_id = company_dim.company_id

where
    job_title_short in ('Data Analyst', 'Business Analyst')
    and salary_year_avg is not null

order by
    salary_year_avg desc

limit 
    15;
    