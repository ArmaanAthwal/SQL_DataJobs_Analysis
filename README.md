# 📊 Introduction
What does the data job market actually look like? With a focus on data analyst and business analyst roles, I used SQL to explore the job market, 
uncovering which positions pay the most, what skills employers are looking for, and which skills offer the best combination of demand and salary. 
Since these are two roles I'm particularly interested in, I wanted to get a better understanding of the opportunities and skills that matter most.

Check out the queries: [Project_SQL folder](/Project_SQL/)
# Background
As someone interested in pursuing a career in data analytics or business analytics, I wanted to take a closer look at the job market and better understand 
what employers are actually looking for. This project gave me the opportunity to build my SQL skills while exploring salaries, job opportunities, and the 
technical skills that are most valuable in the industry. The dataset was provided by Luke Barousse's SQL and includes information on job postings, salaries, 
locations, and required skills.

Questions I Wanted to Answer:
  1. What are the top paying data and business analyst jobs?
  2. What skills are required for the top-paying data and business analyst roles?
  3. What are the most in-demand skills for data and business analysts?
  4. What are the top skills based on salary?
  5. What are the most optimal skills to learn?
# Tools I used
For my deep dive into the data and business analyst job market, I harnessed the power of several key tools:
- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **JetBrains Rider**: My go-to for database management and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# The Analysis 
Each query for this project aimed at investigating specific aspects of the data and business analyst job market. Here’s how I approached each question:

### 1. Top Paying Data and Business Analyst Jobs
To identify the highest-paying roles, I filtered data and business analyst positions by average yearly salary and location. This query highlights the high paying opportunities in the field.
```sql
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
```

# What I Learned
# Conclusion
