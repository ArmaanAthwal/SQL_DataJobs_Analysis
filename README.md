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
Breakdown:
- **Diverse Employers**: Companies include Texas Health and Human Services, Goliath Partners, and Thermo Fisher Scientific, spanning public health, finance, and life sciences.
- **Variety of Roles**: Job titles range from Data Analyst and GIS Data Analyst to Quantitative Researcher and Senior Business Intelligence Analyst.
- **Repeated Listings**: The Legends Agency appears four times and Akraya Inc. twice with identical titles and salaries, potentially skewing the analysis.

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql
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
```
Breakdown:
- **SQL** and **Power BI** lead with a count of 7 each.
- **Tableau** follows closely, appearing in 6 job postings.
- **Python** appears in 3 postings, while **Looker** appears in 2. Other skills, including **Excel, VBA, Go,** and **C**, appear less frequently.

![Skills for Top Paying Jobs](https://github.com/ArmaanAthwal/SQL_DataJobs_Analysis/blob/d6ba4c51ceff160b57dc10797a5788d29f48b0ba/Assets/skills%20for%20top%20paying%20jobs.png)
### 3. In-Demand Skills
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.
```sql
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
```
Breakdown:
- **SQL** and **Excel** remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
- **Programming** and **Visualization Tools** like **Python, Tableau,** and **Power BI** are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

![Top Demanded Skills](https://github.com/ArmaanAthwal/SQL_DataJobs_Analysis/blob/d6ba4c51ceff160b57dc10797a5788d29f48b0ba/Assets/top%20demanded%20skills.png)
### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.
```sql
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
```
Breakdown:
- **High-Paying Programming & Machine Learning Skills**: **Kotlin** leads with an average salary of $198,500, followed by **MXNet** at $174,317 and **APL** at $162,500. **Hugging Face** also ranks highly at $158,626, highlighting the strong salaries associated with specialized programming and machine learning skills.
- **API Development & Software Engineering**: **FastAPI** ($155,833), **GraphQL** ($137,469), **Node.js** ($133,620), and **ASP.NET Core** ($130,500) demonstrate the value of backend development and API-related technologies in higher-paying technical roles.
- **Infrastructure, Databases & Specialized Tools**: **Terraform** ($142,910), **DynamoDB** ($140,741), **Elasticsearch** ($131,792), and **Couchbase** ($127,572) show that infrastructure and database expertise also feature among the higher-paying skills.
- These are average salaries associated with each skill in the dataset; the data alone does not establish that possessing a particular skill causes higher pay.

![Top Paying Skills](https://github.com/ArmaanAthwal/SQL_DataJobs_Analysis/blob/d6ba4c51ceff160b57dc10797a5788d29f48b0ba/Assets/top%20paying%20skills.png)
### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.
```sql
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
    skills_dim.skill_id,
    skills_dim.skills

having 
    count(skills_job_dim.job_id) > 15

order by  
    demand_count desc,
    avg_salary desc

limit 
    25;
```
Breakdown:
- **High-Demand Programming Languages**: Python and R stand out among the programming skills, with demand counts of 9,355 and 4,964 respectively. Python pairs its strong demand with the highest average salary of the group at $107,048, while R follows at $104,504. Go ($105,224, 1,104 postings), Java ($103,486, 1,056) and JavaScript ($98,574, 743) show considerably lower demand, so Python and R remain the clearest choices for volume and pay together.
- **Cloud Tools and Technologies**: Snowflake, AWS, Azure and Databricks combine solid demand with some of the highest salaries in the dataset. Snowflake leads at $120,429 (1,683 postings), followed by Databricks at $116,889, AWS at $115,028 and Azure at $111,453. Spark, a big data processing framework, tops the list at $120,638 with 844 postings. This points to the growing importance of cloud platforms and big data technologies, which command a clear premium over most other skills.
- **Business Intelligence and Visualization Tools**: Tableau and Power BI show very high demand, with 8,002 and 6,643 postings and average salaries of $102,004 and $97,385. Looker has lower demand at 1,388 postings but a higher average salary of $108,302. Together they highlight the central role of data visualization and business intelligence in turning data into actionable insights.
- **Database Technologies**: SQL is the most in-demand skill in the entire dataset at 14,352 postings, with an average salary of $102,497. Oracle ($102,425, 1,581 postings) and SQL Server ($99,134, 1,405) sit in a similar salary range, reflecting the enduring need for data storage, retrieval and management expertise.
- **Office and Productivity Tools**: Excel (11,390 postings, $89,608), PowerPoint ($89,813), Word ($81,961) and Outlook ($79,854) are widely requested but carry the lowest average salaries. They appear to be expected baseline skills rather than differentiators.
- **Enterprise and Workflow Tools**: SAP ($96,584), Flow ($97,743) and Jira ($108,960) have moderate demand. Jira stands out with a relatively high salary for its demand level of 775 postings.
- Note on the data: SAS appears twice (skill IDs 8 and 194)

  ![Optimal Skills](https://github.com/ArmaanAthwal/SQL_DataJobs_Analysis/blob/d6ba4c51ceff160b57dc10797a5788d29f48b0ba/Assets/optimal%20skills.png)
# Conclusion
From the analysis, several general insights emerged:

- **Top-Paying Jobs**: The highest-paying jobs for data and business analysts is $841,500!
- **Skills for Top-Paying Jobs**: High-paying data and business analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
- **Most In-Demand Skills**: SQL is also the most demanded skill in the data and business analyst job market, thus making it essential for job seekers.
- **Skills with Higher Salaries**: Specialized skills, such as Kotlin, are associated with the highest average salaries, indicating a premium on niche expertise.
- **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

