-- Listing the manager for each Departments

Select 
  d.department_name, 
  e.first_name, 
  e.last_name
from 
  employee e
  INNER JOIN 
  department d 
  ON
  e.employee_id = d.manager_id;
  
  
-- Find Job Posting with highest Salary

SELECT *
FROM Job
WHERE salary in 
(SELECT MAX(salary) FROM Job);

-- Find the total amount each employee has earned from the Payroll table

SELECT 
  e.employee_id, 
  e.last_name, 
  e.first_name, 
  SUM(p.amount) as total_earned
FROM 
  Employee e
INNER JOIN 
  Payroll p ON e.employee_id = p.employee_id
GROUP BY 
  e.employee_id;


-- Find number of Open positions for each job posting

SELECT 
    j.job_title, 
    r.position_id, 
    COUNT(*) as open_positions
FROM 
    Recruitment r
INNER JOIN 
    Job j ON r.position_id = j.job_id
WHERE 
    r.status = 'Open'
GROUP BY 
    r.position_id, 
    j.job_title;

-- Find out the Performance of an employee
SELECT 
  p.employee_id, 
  e.last_name, 
  e.first_name, 
  COALESCE(DATE_FORMAT(LAG(p.date) OVER (PARTITION BY p.employee_id ORDER BY p.date), '%M %Y'), 'Start') AS start_date, 
  DATE_FORMAT(p.date, '%M %Y') AS end_date, 
  p.rating, 
  p.comments 
FROM 
  Performance p
INNER JOIN 
  Employee e ON p.employee_id = e.employee_id 
WHERE 
  e.employee_id = 1 
ORDER BY 
  p.employee_id,
  p.date;


-- Calcuate No of Days absent.

SELECT 
  Total_Working_Days - IFNULL(Days_Attended, 0) AS Absent_Days
FROM
  (SELECT 
    COUNT(*) AS Total_Working_Days
  FROM 
    (SELECT ADDDATE('2023-07-01', t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) date
    FROM
      (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0,
      (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
      (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
      (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3,
      (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4
    ) v
    WHERE 
      date BETWEEN '2023-07-01' AND '2023-07-31' 
      AND WEEKDAY(date) < 5
  ) AS total
LEFT JOIN 
  (SELECT 
    COUNT(*) AS Days_Attended
  FROM 
    Attendance
  WHERE 
    employee_id = 1 
    AND date BETWEEN '2023-07-01' AND '2023-07-31'
  ) AS attended
ON 1 = 1;

-- Calcuate No of Days present.

SELECT 
    COUNT(*) AS Days_Attended
  FROM 
    Attendance
  WHERE 
    employee_id = 1 
    AND date BETWEEN '2023-07-01' AND '2023-07-31';

-- Ranking Employee with highest income earned 

SELECT 
  e.first_name, 
  e.last_name, 
  total_salary, 
  RANK() OVER (PARTITION BY e.department_id ORDER BY total_salary DESC) salary_rank
FROM (
  SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    e.department_id, 
    SUM(p.amount) AS total_salary 
  FROM 
    Employee e 
    JOIN Payroll p ON e.employee_id = p.employee_id 
  GROUP BY 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    e.department_id
) e
order by salary_rank ;

-- Total Salary earned by Each department

SELECT 
  d.department_name, 
  SUM(p.amount) AS total_salary 
FROM 
  Department d 
INNER JOIN 
  Employee e ON d.department_id = e.employee_id 
INNER JOIN 
  Payroll p ON e.employee_id = p.employee_id 
GROUP BY 
  d.department_name;
  
-- Number of Active Recruitments per Position

SELECT 
  j.job_title, 
  COUNT(r.status) AS active_recruitments 
FROM 
  Job j 
INNER JOIN 
  Recruitment r ON j.job_id = r.position_id 
WHERE 
  r.status = 'OPEN' 
GROUP BY 
  j.job_title;


-- Total expense Per employee
SELECT 
  e.first_name, 
  e.last_name, 
  SUM(ex.amount) AS total_expenses 
FROM 
  Employee e 
INNER JOIN 
  Expense ex ON e.employee_id = ex.employee_id 
GROUP BY 
  e.first_name, 
  e.last_name;

-- Average Age per department

SELECT 
  d.department_name, 
  FLOOR(AVG(e.age)) AS average_age 
FROM 
  Department d 
INNER JOIN 
  Employee e ON d.department_id = e.department_id 
GROUP BY 
  d.department_name;

-- Employees with Above Average Performance Ratings

SELECT 
  e.first_name, 
  e.last_name 
FROM 
  Employee e 
INNER JOIN 
  Performance p ON e.employee_id = p.employee_id 
GROUP BY 
  e.first_name, 
  e.last_name 
HAVING 
  AVG(p.rating) > 
  (SELECT AVG(rating) FROM Performance);

-- Average Performance Rating per Department

SELECT 
  d.department_name, 
  AVG(perf.rating) AS average_rating 
FROM 
  Department d 
INNER JOIN 
  Employee e ON d.department_id = e.employee_id 
INNER JOIN 
  Performance perf ON e.employee_id = perf.employee_id 
GROUP BY 
  d.department_name;



