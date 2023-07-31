const express = require("express");
const app = express();
const cors = require('cors');
const employee = require("./routes/Employee");
const login = require("./routes/Login");
const department = require("./routes/Department");


app.use(express.json());
app.use(cors({
    origin: '*',
    methods: ['GET','POST','DELETE','UPDATE','PUT','PATCH']

}));

app.use("/hrm/api/employee",employee);
app.use("/hrm/api/login",login);
app.use("/hrm/api/department",department);


app.listen(5000,() => {
    console.log("Server is running on port 5000");
})