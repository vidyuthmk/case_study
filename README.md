### What is this repo for?
This repository is the base for case Study at Humanoo, for Analytics Engineer position.
The purpose of it is to test the knowledge of: Python, SQL, dbt

### Setup / Stack

Please use:
- **Python** 3.9 or higher.
- **dbt-core** 1.5.x or higher
- **duckdb** 0.9.x

During this Case Study you would need DuckDB as your DB Engine.
You could install only this package: "dbt-duckdb"
, which will install: dbt-code, duckdb

You can test if you installed DuckDB properly using "duckdb_test.py"


### Tasks
1. Use files inside "source_files" directory as foundation or source for your dbt models, with this data model
   - **users**:
     - user_id - Unique Identifier of a User
     - user_name - Nickname of a User
     - company_id - Unique Identifier of a Company
     - company_name - Company Name
     - company_size - Number of employees
   - **steps_data**:
     - **activity_date** - Date of activity (i.e. when the steps were tracked)
     - **user_id** - Unique Identifier of a User
     - **steps** - How many steps were tracked
2. These final dbt models are expected:
   - users:
     - **user_id** should be unique
     - **user_name** keep "as-is"
   - companies:
     - **company_id** should be unique
     - **company_name** should be Camel Case
     - **company_size** should be integer, if you could convert the original value to int, pls use "floor" math function if not use NULL
   - steps:
     - **activity_date** - should be real date
     - **user_id** - should exist in **users** mart/model
     - **steps** - should be between 1 and 40000
3. Write these Queries with SQL and show the result with Pandas (plain text or chart - is up to you):
    - Show the daily average number of steps for all the users, i.e. it should be 1 number 
    - Show per "Company Name" amount of users and calculate % of how many users have steps data 

### How to share the result?
1. Fork this repository
2. Do the necessary changes
3. Don't forget to commit/push them
4. Share your forked repo URL