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


module.exports = router;