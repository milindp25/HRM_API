const router = require("express").Router()
const mysql = require('mysql');


router.get("/benefitsAvailable", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
   
    var result = db_con.query(`select * from benefits where employee_id =${id}`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });

  router.get("/jobsavailable", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    var result = db_con.query(`select recruitment_id,job_title,department_name,Start_date,end_date from Recruitment r , job j, department d where r.position_id = j.job_id and d.department_id = r.department_id and status='Open'`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });

  router.get("/getPerformance", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    var result = db_con.query(`SELECT 
                                p.employee_id, 
                                e.last_name, 
                                e.first_name, 
                                COALESCE(DATE_FORMAT(LAG(p.date) OVER (PARTITION BY p.employee_id ORDER BY p.date), '%M %Y'), date_format(e.date_of_joining,'%M %Y')) AS start_date, 
                                DATE_FORMAT(p.date, '%M %Y') AS end_date, 
                                p.rating, 
                                p.comments 
                                FROM 
                                Performance p
                                INNER JOIN 
                                Employee e ON p.employee_id = e.employee_id 
                                WHERE 
                                e.employee_id = ${id} 
                                ORDER BY 
                                p.employee_id,
                                p.date`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });

router.get("/getExpenses", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    var result = db_con.query(`Select * from expense where employee_id =${id}`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });

router.get("/getPayroll", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    var result = db_con.query(`Select * from payroll where employee_id =${id}`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });

  router.get("/getEmployeeManaged", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    var result = db_con.query(`SELECT E.employee_id as id, concat(E.first_name,' ',E.last_name)  as name
                            FROM Employee E
                            JOIN Department D ON E.department_id = D.department_id
                            WHERE D.manager_id = ${id} AND E.user_type = 'E'`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });

  router.get("/getAllDepartments", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    var result = db_con.query(`Select * from department`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });
  router.get("/getAllManagers", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    var result = db_con.query(`Select * from employee where user_type='M'`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });
  router.get("/getAllJobs", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    var result = db_con.query(`Select * from job`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });
  router.post("/addEmployee",(req,resp) => {

    const db_con = require("../DB_Connection_Establishment");
  
    const userDetails = {
        first_name : req.body.employeeData.first_name,
        last_name : req.body.employeeData.last_name,
        email : req.body.employeeData.email,
        phone_number : req.body.employeeData.phone_number,
        date_of_birth : req.body.employeeData.date_of_birth,
        city : req.body.employeeData.city,
        state : req.body.employeeData.state,
        date_of_joining : req.body.employeeData.date_of_joining,
        user_type : req.body.employeeData.user_type,
        street_address_1 : req.body.employeeData.street_address_1,
        street_address_2 : req.body.employeeData.street_address_2,
        date_of_joining : req.body.employeeData.date_of_joining,
        password : "Test123"
      };
         db_con.query('Insert into employee SET ?',userDetails,(err,res) => {
        if (err) 
        {
        resp.status(500).json({responseCode : '500' , message : 'Error while creating user'});
        console.log(err);
        throw err;
        };
        resp.status(201).json(res);
        console.log("Insert Successfull");
        db_con.commit();
      }); 
  
    
  });

  router.post("/addPerformance",(req,resp) => {

    const db_con = require("../DB_Connection_Establishment");
  
    const performanceDetails = {
        employee_id : req.body.performanceData.employee_id,
        date : req.body.performanceData.date,
        rating : req.body.performanceData.rating,
        comments : req.body.performanceData.comments
      };
         db_con.query('Insert into performance SET ?',performanceDetails,(err,res) => {
        if (err) 
        {
        resp.status(500).json({responseCode : '500' , message : 'Error while creating user'});
        console.log(err);
        throw err;
        };
        resp.status(201).json(res);
        console.log("Insert Successfull");
        db_con.commit();
      }); 
  
    
  });

  router.get("/getTeamExpense", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    var result = db_con.query(`SELECT 
                          concat(E.first_name, ' ',E.last_name) as employee_name,
                          Ex.expense_id,
                          Ex.expense_type, 
                          DATE_FORMAT(Ex.date, '%D %b %Y') AS date, 
                          Ex.expense_status, 
                          Ex.amount
                          FROM 
                              Expense Ex 
                          JOIN 
                              Employee E ON Ex.employee_id = E.employee_id 
                          JOIN 
                              Department D ON E.department_id = D.department_id 
                          WHERE 
                              D.manager_id = ${id}
                          ORDER BY 
                              E.first_name, 
                              E.last_name, 
                              Ex.date`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });

  router.post("/updateExpense",(req,resp) => {

    const db_con = require("../DB_Connection_Establishment");
    const id = req.query.id;
    
         db_con.query(`update expense
                        set expense_status='APR'
                        where expense_id=${id}`,(err,res) => {
        if (err) 
        {
        resp.status(500).json({responseCode : '500' , message : 'Error while creating user'});
        console.log(err);
        throw err;
        };
        resp.status(201).json(res);
        console.log("Update Successfull");
        db_con.commit();
      }); 
  
    
  });

  router.get("/getAboveAvgEmployee", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    var result = db_con.query(`SELECT 
                                e.first_name, 
                                e.last_name ,
                                AVG(p.rating) as average_rating
                              FROM 
                                Employee e 
                              INNER JOIN 
                                Performance p ON e.employee_id = p.employee_id 
                              GROUP BY 
                                e.first_name, 
                                e.last_name 
                              HAVING 
                                AVG(p.rating) > 
                                (SELECT AVG(rating) FROM Performance)
                                ORDER BY 
                                average_rating DESC`,(err,res,fields) => {
      if (err) 
      {
      resp.status(500).json(err);
      console.log(err);
      throw err;
      };
      resp.status(200).json(res);
  });
    try {
    } catch (err) {
      resp.status(500).json(err);
    }
  });

  router.post("/addExpense",(req,resp) => {

    const db_con = require("../DB_Connection_Establishment");
  
    const expenseDetails = {
        employee_id : req.body.expenseData.employee_id,
        expense_type : req.body.expenseData.expenseType,
        amount : req.body.expenseData.expenseAmount,
        date : req.body.expenseData.date,
        expense_status : req.body.expenseData.status
      };
         db_con.query('Insert into Expense SET ?',expenseDetails,(err,res) => {
        if (err) 
        {
        resp.status(500).json({responseCode : '500' , message : 'Error while creating user'});
        console.log(err);
        throw err;
        };
        resp.status(201).json(res);
        console.log("Insert Successfull");
        db_con.commit();
      }); 
  
    
  });

  router.post("/clockIn",(req,resp) => {

    const db_con = require("../DB_Connection_Establishment");
  
    const clockinDetails = {
        employee_id  : req.body.clockInDetails.employee_id ,
        time_in : req.body.clockInDetails.time_in,
        date : req.body.clockInDetails.date
    };

    // Check if record exists for the employee for the date
    db_con.query('Select * from attendance where employee_id = ? and date = ?', 
                 [clockinDetails.employee_id, clockinDetails.date],
                 (err,res) => {
        if (err) 
        {
            resp.status(500).json({responseCode : '500' , message : 'Error while checking attendance'});
            console.log(err);
            throw err;
        }
        if(res.length > 0) 
        {
            // If record exists, send error response
            resp.status(402).json({responseCode : '402' , message : 'Already clocked in for the day'});
        } else {
            // If no record exists, insert new attendance record
            db_con.query('Insert into attendance SET ?',clockinDetails,(err,res) => {
                if (err) 
                {
                    resp.status(500).json({responseCode : '500' , message : 'Error while creating user'});
                    console.log(err);
                    throw err;
                };
                resp.status(201).json(res);
                console.log("Insert Successfull");
                db_con.commit();
            }); 
        }
    });
});

router.post("/clockOut", (req, resp) => {

  const db_con = require("../DB_Connection_Establishment");

  const clockOutDetails = {
      employee_id: req.body.clockOutDetails.employee_id,
      time_out: req.body.clockOutDetails.time_out,
      date: req.body.clockOutDetails.date
  };

  // Fetch attendance record for the provided employee_id and date
  db_con.query('Select * from attendance where employee_id = ? and date = ?', 
      [clockOutDetails.employee_id, clockOutDetails.date],
      (err, res) => {
          if (err) {
              resp.status(500).json({ responseCode: '500', message: 'Error while checking attendance' });
              console.log(err);
              throw err;
          }
          console.log(clockOutDetails.time_out);
          console.log(clockOutDetails.date);
          // If no record exists, send error response
          if(res.length === 0) {
              resp.status(402).json({responseCode : '402' , message : 'You have not clocked in for the day'});
          } else if (res[0].time_out !== null) {  // If time_out is not null, send error response
              resp.status(402).json({ responseCode: '402', message: 'Already clocked out for the day' });
          } else {
              // If time_in is not null and time_out is null, update the time_out
              db_con.query('Update attendance SET time_out = ? where employee_id = ? and date = ?', 
                           [clockOutDetails.time_out, clockOutDetails.employee_id, clockOutDetails.date],
                           (err, res) => {
                  if (err) {
                      resp.status(500).json({ responseCode: '500', message: 'Error while updating time_out' });
                      console.log(err);
                      throw err;
                  };
                  resp.status(200).json({ responseCode: '200', message: 'Successfully clocked out' });
                  console.log("Update Successful");
                  db_con.commit();
              });
          }
      });
});
  

module.exports = router;