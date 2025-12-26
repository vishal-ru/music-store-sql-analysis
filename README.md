# music-store-sql-analysis
Music Store Business Intelligence Analysis
 Project Overview

This project analyzes a relational music store database to uncover insights related to customer behavior, revenue performance, and music preferences. The objective is to simulate a real-world Business Intelligence workflow using SQL and deliver actionable insights that support business decision-making.

* Business Objectives

Identify top revenue-generating countries and cities

Understand customer spending patterns and high-value customers

Analyze music genre and artist popularity across regions

Provide data-driven recommendations for marketing and promotions

** Dataset Description

The dataset consists of multiple CSV files representing a music store’s operations, including:

Customers – customer profile and geographic data

Invoices & Invoice Lines – transactional sales data

Tracks, Albums, Artists, Genres – music catalog data

Employees & Playlists – organizational and content structure

All datasets were loaded into PostgreSQL and connected using relational keys.

** Tools & Technologies

SQL (Joins, Aggregations, CTEs, Window Functions)

PostgreSQL (Data storage & querying)

pgAdmin (Database management)

GitHub (Project version control & sharing)

** Analytical Approach

Loaded raw CSV data into PostgreSQL using a staging-table approach to handle data quality issues.

Validated data integrity and relationships across tables.

Wrote SQL queries to answer business-driven questions.

Summarized findings into clear, actionable business insights.

 ** Key Insights (Summary)

Revenue is concentrated in a small number of countries and cities, indicating strong regional markets.

A small percentage of customers account for a large share of total revenue.

Rock music is the most popular genre across multiple countries.

Customer purchases tend to cluster around a limited set of high-performing artists.

 **Detailed insights are available in insights_summary.md.

** Repository Structure
music-store-sql-analysis/
│
├── README.md
├── schema.sql
├── analysis_queries.sql
└── insights_summary.md

** Business Value

This project demonstrates how SQL-driven analysis can transform raw transactional data into insights that support:

Targeted marketing strategies

Customer retention programs

Content and promotion planning

Revenue optimization

 ** Conclusion

By combining structured data modeling with analytical SQL, this project showcases a complete Business Intelligence workflow from raw data ingestion to insight generation.

** How to Use This Repository

Review schema.sql to understand table structure

Explore analysis_queries.sql for analytical logic

Read insights_summary.md for business findings

*/ About the Author
Vishal Rai
Aspiring Business Intelligence / Data Analyst
Skills: SQL, PostgreSQL, Power BI, Data Analysis
Vishal Rai
Aspiring Business Intelligence / Data Analyst
Skills: SQL, PostgreSQL, Power BI, Data Analysis
