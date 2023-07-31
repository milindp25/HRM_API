const mySQL = require("mysql");

var con = mySQL.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "root",
    database :"HRM_DB",
    multipleStatements: true
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log("DB Connected!");
  });


module.exports = con;
