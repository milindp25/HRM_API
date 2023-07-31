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

module.exports = router;