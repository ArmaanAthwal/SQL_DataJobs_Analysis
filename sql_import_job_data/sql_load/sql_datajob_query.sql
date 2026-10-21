(select job_id,
        job_title,
        'With Salary Info' AS salary_info

 from job_postings_fact

 where salary_year_avg is not null
    or salary_hour_avg is not null)

union all

(select job_id,
        job_title,
        'Without Salary Info' AS salary_info

 from job_postings_fact

 where salary_year_avg is null
    or salary_hour_avg is null)

ORDER BY
    salary_info DESC,
    job_id; 
    