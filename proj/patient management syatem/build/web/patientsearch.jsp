<%@page import="java.util.HashMap"%>
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
        <li><a href="patientsearch.jsp" class="active">Patient Search</a></li>
        <li><a href="Appointments.jsp">Appointments</a></li>
        <li><a href="viewreport.jsp">View Report</a></li>
        <li><a href="addreport.jsp">Add Report</a></li>
    </ul>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
         

        <form class="form-basic" method="post" action="editpatient">

            <div class="form-title-row">
                <h1>Patient search</h1>
            </div>
            
  <%Patient p = new Patient();
   ArrayList<String> patid= p.getAllpatids();
  Iterator itr  =patid.iterator();
  %>
    
        
            <div class="form-row">
                <label>
                    <span>choose a patient no</span>
                    <select name="patientid" class="businessTypePullDown" id="patid">
                        <% while(itr.hasNext()){%>
                        <option><%=itr.next() %></option>
                        <%}%>
                    </select>
                </label>
            </div>
                    <div id ="patientdetailsin"></div>
        </form>
    </div>
</html>

