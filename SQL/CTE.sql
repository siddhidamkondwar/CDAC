-- 1) Hello, Employees (staging CTE)
-- Task: Build a CTE that returns EMPLOYEE_ID, full_name, JOB_ID, DEPARTMENT_ID, SALARY.
--  -- Output: employee_id, full_name, job_id, department_id, salary.
-- Hint: CONCAT(COALESCE(FIRST_NAME,''),' ',LAST_NAME).
 use hr;
 
 with hello1 as(
  select EMPLOYEE_ID, CONCAT(COALESCE(FIRST_NAME,''),' ',LAST_NAME)as full_name , JOB_ID, DEPARTMENT_ID, SALARY
  from employees)
  select * from hello1;
  
-- 2) Department Headcount (include 0)
-- Task: CTE with employees grouped by DEPARTMENT_ID. Left-join to departments to show all departments.
--  Output: department_id, department_name, headcount.
--  Hint: COALESCE(headcount,0).


-- 3) Avg Salary by Job
-- Task: CTE aggregates average salary per JOB_ID; join to jobs for titles.
--  Output: job_id, job_title, emp_count, avg_salary.
--  Hint: ROUND(AVG(SALARY),2).
   
   with avg_sal as(
    select job_id, ROUND(AVG(SALARY),2) as avg_salary,count(employee_id) as emp_count
    from employees
   )
-- 4) Employee → Manager (1 hop)
-- Task: Stage employees in a CTE; self-join to get direct manager name.
--  Output: employee_id, employee_name, manager_id, manager_name.
--  Hint: Left join; top boss may have MANAGER_ID = 0 or NULL.

-- 5) Employees Without a Department
-- Task: Use a CTE to list employees where DEPARTMENT_ID IS NULL OR DEPARTMENT_ID=0.
--  Output: employee_id, full_name, job_id, department_id.
with  

-- 6) Departments Without Employees
-- Task: Distinct DEPARTMENT_ID from employees in a CTE; anti-join to departments.
--  Output: department_id, department_name.

-- 7) Map Employees to Region (clean text)
-- Task: CTE joins employees → departments → locations → countries → regions and trims REGION_NAME.
--  Output: employee_id, full_name, department_name, city, country_name, region_name.
--  Hint: TRIM(REPLACE(REGION_NAME,'\r','')).

-- 8) Simple Pay-Band Check
-- Task: CTE joins employees to jobs; return rows where salary < min_salary OR salary > max_salary.
--  Output: employee_id, full_name, job_title, salary, min_salary, max_salary.

-- 9) Top Earners (overall)
-- Task: CTE selecting employee_id, full_name, salary, then order and limit to top 5.
--  Output: employee_id, full_name, salary.
--  Hint: Use the CTE just to keep the final SELECT clean.

-- 10) Jobs Present in Each Department
-- Task: CTE groups employees by DEPARTMENT_ID, JOB_ID and counts. Join jobs for title.
--  Output: department_name, job_title, employees_in_role.

-- 11) Headcount by Region
-- Task: Reuse the “map to region” idea in a CTE; then group by region.
--  Output: region_name, headcount.
--  Hint: Handle NULL region as “Unknown”.

-- 12) Commission Snapshot
-- Task: In a CTE, compute a flag has_commission = commission_pct > 0. Then count by flag.
--  Output: has_commission, headcount.
--  Optional: Break down by department as well.

-- 13) Employees with Any Job History
-- Task: CTE with distinct EMPLOYEE_ID from job_history (exclude dummy row). Join to employees.
--  Output: employee_id, full_name, history_row_count.
--  Hint: COUNT(*) OVER (PARTITION BY EMPLOYEE_ID) or aggregate before join.

-- 14) Latest History Row (gentle)
-- Task: Clean job_history in a CTE (exclude zero/invalid dates) and pick the latest row per employee using ROW_NUMBER.
--  Output: employee_id, last_hist_job_id, last_hist_department_id, last_hist_end_date.
--  Hint: Order by END_DATE DESC, START_DATE DESC.

-- 15) Locations per Country
-- Task: CTE groups locations by COUNTRY_ID; join to countries.
--  Output: country_id, country_name, location_count.
--  Hint: COALESCE(country_name,'Unknown').