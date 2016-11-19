<%-- 
    Document   : createemp
    Created on : May 2, 2016, 5:42:04 PM
    Author     : Aswin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Add Employee</title>


	<link rel="stylesheet" href="demo.css">
	<link rel="stylesheet" href="admin.css">

</head>

    <header>
		<h1>Hospital Management System</h1>
        <a href="Logout">Logout</a>
    </header>
      <ul>
        <li><a href="welcomeadmin.jsp" >Personal Info</a></li>
        <li><a href="createemp.jsp"class="active">Add Employee</a></li>
        <li><a href="RemoveEmployee.jsp">Remove Employee</a></li>
        
    </ul>
	



    <div class="main-content">

        

        <form class="form-basic" method="post" action="insertion">

            <div class="form-title-row">
                <h1>Create Employee</h1>
            </div>
            <div class="form-row">
                <label>
                    <span>Employee id</span>
                    <input type="text" name="empid" value="">
                </label>
            </div>
	

            <div class="form-row">
                <label>
                    <span>First name</span>
                    <input type="text" name="fname" value="">
                </label>
            </div>
			<div class="form-row">
                <label>
                    <span>Last name</span>
                    <input type="text" name="lname">
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>Email</span>
                    <input type="email" name="email">
                </label>
            </div>

            <div class="form-row" id="typeid">
                <label>
                    <span>Type id</span>
                    <select name="typeid">
                        <option value="1">Admin</option>
                        <option value="2">Doctor</option>
                        <option value="3">Nurse</option>
                        <option value="4">Guest</option>
                    </select>
                </label>
            </div>

            <div class="form-row" id="deptid">
                <label>
                    <span>Departmant id</span>
                    <select name="deptid">
                        <option value="1">Children</option>
                        <option value="2">Ortho</option>
                    </select>
                </label>
            </div>

            	<div class="form-row">
                <label>
                    <span>Phone Number</span>
                    <input type="text" name="phone">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>Gender</span>
                    <input type="text" name="gender">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>Blood Group</span>
                    <input type="text" name="bloodgroup">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>User Name</span>
                    <input type="text" name="username">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>Password</span>
                    <input type="text" name="pass">
                </label>
            </div>





            <div class="form-row">
                <button type="submit">Submit Form</button>
            </div>

        </form>

    </div>

</body>

</html>
