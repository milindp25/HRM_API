# HRM_API

HRM_API is the backend API service for the HRM App, a Human Resource Management application. It provides a set of RESTful endpoints for managing the employees' details and attendance records of the HRM App.

## Installation

1. Clone the repository to your local machine: git clone your-repo-name
2. Navigate to the project directory: cd HRM_API
3. Install the required dependencies: npm install


## Usage

1. Start the server:  npm start
2. Use the following base URL to access the endpoints: `http://localhost:5000/` (or the port number specified in your environment variables).

## List of Endpoints:

### GET endpoints

- **/benefitsAvailable**
  - Description: Returns the benefits available for an employee
  - Query Parameters: id (Employee ID)
  - Example: /benefitsAvailable?id=123

- **/jobsavailable**
  - Description: Returns the open jobs available
  - No Query Parameters
  - Example: /jobsavailable

- **/getPerformance**
  - Description: Returns the performance details of an employee
  - Query Parameters: id (Employee ID)
  - Example: /getPerformance?id=123

- **/getExpenses**
  - Description: Returns the expenses of an employee
  - Query Parameters: id (Employee ID)
  - Example: /getExpenses?id=123

- **/getPayroll**
  - Description: Returns the payroll of an employee
  - Query Parameters: id (Employee ID)
  - Example: /getPayroll?id=123

- **/getEmployeeManaged**
  - Description: Returns the employees managed by a manager
  - Query Parameters: id (Manager ID)
  - Example: /getEmployeeManaged?id=123

- **/getAllDepartments**
  - Description: Returns all the departments
  - No Query Parameters
  - Example: /getAllDepartments

- **/getAllManagers**
  - Description: Returns all the managers
  - No Query Parameters
  - Example: /getAllManagers

- **/getAllJobs**
  - Description: Returns all the jobs
  - No Query Parameters
  - Example: /getAllJobs

- **/getTeamExpense**
  - Description: Returns the expenses of a team managed by a manager
  - Query Parameters: id (Manager ID)
  - Example: /getTeamExpense?id=123

- **/getAboveAvgEmployee**
  - Description: Returns employees with above average rating
  - No Query Parameters
  - Example: /getAboveAvgEmployee

### POST endpoints

- **/addEmployee**
  - Description: Adds a new employee
  - Body: JSON object with employee details
  - Example: /addEmployee

- **/addPerformance**
  - Description: Adds a new performance record
  - Body: JSON object with performance details
  - Example: /addPerformance

- **/updateExpense**
  - Description: Updates an expense
  - Query Parameters: id (Expense ID)
  - Example: /updateExpense?id=123

- **/addExpense**
  - Description: Adds a new expense
  - Body: JSON object with expense details
  - Example: /addExpense

- **/clockIn**
  - Description: Clocks in an employee
  - Body: JSON object with clock in details
  - Example: /clockIn

- **/clockOut**
  - Description: Clocks out an employee
  - Body: JSON object with clock out details
  - Example: /clockOut


## Tech Stack

- Node.js
- Express.js
- MySQL

## Database Setup

To set up the database, follow these instructions:

1. Create the database: CREATE DATABASE HRM_DO
2. Use the newly created database: USE HRM_DO
3. 3. Run all the SQL files located in the `SQL_Scripts\HRM_DB_Dump` directory.

## Contributing

Contributions, issues, and feature requests are welcome!

## Contact

If you have any questions, comments, or concerns, please feel free to reach out.




