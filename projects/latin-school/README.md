# Latin School SQL Project (UCSD)

## Overview
This project walks through a full end‑to‑end data engineering workflow using the Latin School dataset. I started by cleaning and normalizing the raw Excel files, then built staging tables to validate the data before creating the final SQL Server database from scratch. After importing the cleaned data through SQL Server’s Import Wizard, I wrote SQL queries, views, functions, and stored procedures to analyze enrollment trends, revenue, course offerings, and which instructors teach which sections. The project includes staging, schema design, an ERD, and documented outputs that show how the final relational model works in practice.

## Tools Used
- Excel (initial cleanup)
- SQL Server
- SQL Server Management Studio (SSMS)
- SSMS Database Diagram Tool (for ERD)
- SQL Server Import Wizard

## Folder Structure
- **sql/** – SQL scripts for table creation, staging, queries, and stored procedures
- **erd/** – ERD diagram(s)
- **docs/** – project summary and supporting documents
- **screenshots/** – output images from views and stored procedures


## Key Deliverables
- SQL scripts
- ERD diagram
- Final project summary

## SQL Scripts
- [Full Project Script](sql/full_script.sql)
- [Annual Revenue View](sql/AnnualRevenue_v.sql)
- [Course Revenue View](sql/AnnualRevenue_v.sql)
- [Insert Person Stored Procedure](sql/AnnualRevenue_v.sql)
- [Student History Stored Procedure](sql/AnnualRevenue_v.sql)

## Annual Revenue View Output
![Annual Revenue Output](screenshots/AnnualRevenue_v.png)

## Course Revenue View Output
![Course Revenue Output](screenshots/CourseRevenue_v.png)

## Insert Person Stored Procedure Output 
![Insert Person Output](screenshots/InsertPerson_p.png)

## Student History Stored Procedure Output
![Student History Output](screenshots/StudentHistory_p.png)


## ERD
![Latin School ERD](erd/latin_school_ERD.png)











## SQL Scripts

### Full Script
- [Full Project Script](sql/full_script.sql)

### Views
- [Annual Revenue View](sql/AnnualRevenue_v.sql)
- [Course Revenue View](sql/CourseRevenue_v.sql)

### Stored Procedures
- [Insert Person Stored Procedure](sql/InsertPerson_p.sql)
- [Student History Stored Procedure](sql/StudentHistory_p.sql)

### Outputs
#### Annual Revenue View Output
![Annual Revenue Output](screenshots/AnnualRevenue_v.png)

#### Course Revenue View Output
![Course Revenue Output](screenshots/CourseRevenue_v.png)

#### Insert Person Stored Procedure Output
![Insert Person Output](screenshots/InsertPerson_p.png)

#### Student History Stored Procedure Output
![Student History Output](screenshots/StudentHistory_p.png)

### ERD
![Latin School ERD](erd/latin_school_ERD.png)

