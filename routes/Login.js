const router = require("express").Router()
const mysql = require('mysql');

router.post("/checkUser", (req, resp) => {
    const db_con = require("../DB_Connection_Establishment");
    const userName = req.body.username;
    const password = req.body.password;
  
    console.log("UserName is " + userName);
    console.log("Passwrd is " + password);
  
    var result = db_con.query(
      `SELECT 
      E.employee_id, 
      E.first_name, 
      E.last_name, 
      D.department_name,
      E.email,
      e.password,
      e.phone_number,
      DATE_FORMAT(E.date_of_birth, '%D %b %Y') as date_of_birth,
      e.street_address_1,
      e.street_address_2,
      e.city,
      e.state,
      e.age,
      e.user_type,
      DATE_FORMAT(E.date_of_joining, '%D %b %Y') as date_of_joining,
      M.first_name AS manager_first_name, 
      M.last_name AS manager_last_name
      FROM 
        Employee E
      INNER JOIN 
        Department D ON E.department_id = D.department_id
      INNER JOIN 
      Employee M ON D.manager_id = M.employee_id
      where  e.employee_id = ${userName}`,
      (err, res) => {
        if (err) {
          resp.status(500).json(err);
          console.log(err);
          throw err;
        }
  
        if (res.length <= 0) {
          resp.status(401).json({ responseCode: '401', message: 'User not found' });
        } else {
          const user = res[0];
          if (user.password === password) {
            // Password matches
            const { password, ...others } = user;
            resp.status(200).json(others);
          } else {
            // Password doesn't match
            resp.status(401).json({ responseCode: '401', message: 'Invalid password' });
          }
        }
      }
    );
  });
  

module.exports = router;