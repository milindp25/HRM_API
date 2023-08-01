const router = require("express").Router();
const mysql = require('mysql');



router.post("/addDeprtment",(req,resp) => {

    const db_con = require("../DB_Connection_Establishment");
  
    const departmentDetails = {
        department_name : req.body.departmentData.departmentName,
        manager_id : req.body.departmentData.managerName
      };
         db_con.query('Insert into department SET ?',departmentDetails,(err,res) => {
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
  
  router.post("/addJob",(req,resp) => {

    const db_con = require("../DB_Connection_Establishment");
  
    const jobDetails = {
        position_id : req.body.jobData.position_name,
        department_id : req.body.jobData.department_name,
        start_date : req.body.jobData.start_date,
        end_date : req.body.jobData.end_date,
        status : req.body.jobData.status
      };
         db_con.query('Insert into Recruitment SET ?',jobDetails,(err,res) => {
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
  router.get("/getDepartmentSalary", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    var result = db_con.query(`SELECT 
                              d.department_name, 
                              SUM(p.amount) AS total_salary 
                            FROM 
                              Department d 
                            INNER JOIN 
                              Employee e ON d.department_id = e.employee_id 
                            INNER JOIN 
                              Payroll p ON e.employee_id = p.employee_id 
                            GROUP BY 
                              d.department_name`,(err,res,fields) => {
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

  router.get("/getDepartmentRating", async (req, resp) => {

    const db_con = require("../DB_Connection_Establishment");
    var result = db_con.query(`SELECT 
                                d.department_name, 
                                AVG(perf.rating) AS average_rating 
                              FROM 
                                Department d 
                              INNER JOIN 
                                Employee e ON d.department_id = e.employee_id 
                              INNER JOIN 
                                Performance perf ON e.employee_id = perf.employee_id 
                              GROUP BY 
                                d.department_name`,(err,res,fields) => {
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

module.exports = router;