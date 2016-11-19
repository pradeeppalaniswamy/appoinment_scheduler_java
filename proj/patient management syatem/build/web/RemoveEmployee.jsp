<%-- 
    Document   : createemp
    Created on : May 2, 2016, 5:42:04 PM
    Author     : Aswin
--%><%@page import="java.util.HashMap"%>
<%-- 
    Document   : welcome
    Created on : Apr 15, 2016, 12:06:16 PM
    Author     : PRADEEP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pms.Doctor"%>
<%@page import="pms.DbConnect"%>
<%@page import="pms.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String pos=" ";
    String id=" ";
    HttpSession s;
    try{ s =request.getSession();
 pos= s.getAttribute("position").toString();
    id=s.getAttribute("id").toString();
    }
    catch(Exception e)
    {}
%>


<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Remove Employee</title>


	<link rel="stylesheet" href="demo.css">
	<link rel="stylesheet" href="admin.css">

</head>

    <header>
		<h1>Hospital Management System</h1>
        <a href="Logout">Logout</a>
    </header>
      <ul>
       <li><a href="welcomeadmin.jsp" >Personal Info</a></li>
        <li><a href="createemp.jsp">Add Employee</a></li>
        <li><a href="RemoveEmployee.jsp"class="active">Remove Employee</a></li>
        
    </ul>
	



    <div class="main-content">

        

        <form class="form-basic" method="post" action="deleteemp">

             <div class="form-title-row">
                <h1>Create Employee</h1>
            </div>

                                <%
                                    Doctor d = new Doctor();
  
                                ResultSet r=d.getdocdetails();
                                      
                           %>
                           
                           
                        <div class="form-row">
                <label>
                    <span>Employee details</span>
                    <select name="Docdetailadmin" class="docdetailpulldown" id="admindocpulldwn">
                         <%            
                     while(r.next())
                             {
                             %>
                             <option  value= <%= r.getString("employee_id")%>  >
                                     <%=
                                         r.getString("employee_id") +":" +r.getString("Fname")+" "+r.getString("Lname")
                                         %>
                                 </option>
                        <%}%>
                    </select>
                </label>
            </div>
                   
                    <div class="form-row">
                <button type="submit" value="delete">Delete</button>
            </div>
                     
                        <div class="form-row">
                <label>
                    <span>${message4}</span>
                    
                </label>
            </div>
        </form>

    </div>

</body>

</html>
