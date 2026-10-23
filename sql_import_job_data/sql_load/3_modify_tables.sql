/* 
\copy company_dim FROM 'C:/Users/Owner/Documents/SQL/SQL_Project_Data_Job_Analysis/sql_import_job_data/2026_csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:/Users/Owner/Documents/SQL/SQL_Project_Data_Job_Analysis/sql_import_job_data/2026_csv_files/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'C:/Users/Owner/Documents/SQL/SQL_Project_Data_Job_Analysis/sql_import_job_data/2026_csv_files/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM 'C:/Users/Owner/Documents/SQL/SQL_Project_Data_Job_Analysis/sql_import_job_data/2026_csv_files/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
*/ 

COPY company_dim
FROM 'C:\Users\Owner\Documents\SQL\SQL_Project_Data_Job_Analysis\sql_import_job_data\2026_csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Users\Owner\Documents\SQL\SQL_Project_Data_Job_Analysis\sql_import_job_data\2026_csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Users\Owner\Documents\SQL\SQL_Project_Data_Job_Analysis\sql_import_job_data\2026_csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Users\Owner\Documents\SQL\SQL_Project_Data_Job_Analysis\sql_import_job_data\2026_csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


