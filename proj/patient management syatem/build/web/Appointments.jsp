<%-- 
    Document   : Appointments
    Created on : Apr 25, 2016, 3:00:28 AM
    Author     : PRADEEP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="pms.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <link rel="stylesheet" type ="text/css" href="Header.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="javascript.js"></script>
    <head>
       
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Personal Info</title>

	<link rel="stylesheet" href="demo.css">
	<link rel="stylesheet" href="admin.css">
          <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
      <header>
		<h1>Hospital Management System</h1>
        <a href="Logout">Logout</a>
    </header>
      <ul>
        <li><a href="welcomedoctor.jsp">Personal Info</a></li>
        <li><a href="patientsearch.jsp" >Patient Search</a></li>
        <li><a href="Appointments.jsp"class="active">Appointments</a></li>
        <li><a href="viewreport.jsp">View Report</a></li>
        <li><a href="addreport.jsp">Add Report</a></li>
    </ul>
    <div class="main-content">
        <form class="form-basic" method="post" action="editpatient">
    <body>
<table border="0" class="table table-hover">
    <thead><tr>
    <td class="apptid">AppointmentId</td>
<td class="fname">Name of Patient</td>
<td class="date">Date</td>
<td class="time">Time</td>
<td class="aprej"></td>
<td class="aprej"></td></tr> </thead> 
    <tbody>
            <%
                String Docid =request.getParameter("docid");
                Doctor D=new Doctor("e01");
           ResultSet R=D.getappoinments();
if(R==null)
{%><h1>No pending  Appointments Found</h1>

<%}
else{
        
           try
{
            while(R.next())
{%>
            


    
<tr>
    <td class="apptid" ><%=R.getString("appointmentid")%></td>
<td class="fname" ><%=R.getString("fname")%></td>
<td class="date"><%=R.getString("day")%></td>
<td class="time"><%=R.getString("value")%></td>
<td class="aprej" > <div class="approvediv" id = "<%=R.getString("appointmentid")%>"><a href="#">Approve</a> </div></td>
<td class="aprej"> <div class="rejectdiv"  id = "<%=R.getString("appointmentid")%>"><a href="#" >Reject</a>  </div></td>
</tr>
<% }
}
catch(Exception e)
{
%>
<h1><%=e.toString()%>

<%
}
}
%>

</tbody>
</table>

    </body>
        </form></div>
</html>
