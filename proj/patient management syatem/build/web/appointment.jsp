<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pms.Patient"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pms.Doctor"%>
<%@page import="pms.DbConnect"%>
<%@page import="pms.Patient"%>

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

<!DOCTYPE html>
<% String PatientId =request.getParameter("patid"); %>
   <%s=request.getSession();
         String patid=s.getAttribute("id").toString();
         
         %>
            <%
                       Doctor D = new Doctor(id);
                       
                   %>

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
</head>
    
    <header>
		<h1>Hospital Management System</h1>
        <a href="Logout">Logout</a>
    </header>
      <ul>
        <li><a href="welcomedoctor.jsp">Personal Info</a></li>
        <li><a href="patientsearch.jsp" >Patient Search</a></li>
        <li><a href="appointment.jsp" class="active">Appointments</a></li>
        <li><a href="RemoveEmployee.jsp">View Report</a></li>
        <li><a href="RemoveEmployee.jsp">Add Report</a></li>
    </ul>

    

        <!-- You only need this form and the form-basic.css -->
         

       <!-- <form class="form-basic" method="post" action="editpatient"> -->
<div id ="veiwappointmentdiv"> 
 
  <table border="0" class="table table-hover">
    <tbody>
<tr>
    <td class="apptid">AppointmentId</td>
<td class="fname">Name of Patient</td>
<td class="date">Date</td>
<td class="time">Time</td>
<td class="aprej"></td>
<td class="aprej"></td>
    </tbody>
 </table>
      
            <%
                 ResultSet R=D.getappoinments();
if(R==null)
{%><h1>No pending  Appointments Found</h1>

<%}
else{
        
           try
{
            while(R.next())
{%>
            
<div class="docappoinmentsdiv">
<table border="0" class="table table-hover">
    <tbody>
<tr>
    <td class="apptid" ><%=R.getString("appointmentid")%></td>
<td class="fname" ><%=R.getString("fname")%></td>
<td class="date"><%=R.getString("day")%></td>
<td class="time"><%=R.getString("value")%></td>
<td class="aprej" > <div class="approvediv" id = "<%=R.getString("appointmentid")%>"><a href="#">Approve</a> </div></td>
<td class="aprej"> <div class="rejectdiv"  id = "<%=R.getString("appointmentid")%>"><a href="#" >Rejct</a>  </div></td>
</tr>
</tbody>
</table>
</div>
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
           

            </div>
        
    
</html>