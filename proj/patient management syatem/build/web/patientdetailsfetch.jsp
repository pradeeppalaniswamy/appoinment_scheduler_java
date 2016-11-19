<%-- 
    Document   : patientdetailsfetch
    Created on : Apr 28, 2016, 3:29:19 PM
    Author     : PRADEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pms.Patient"%>

<!DOCTYPE html>
<% String PatientId =request.getParameter("patid"); %>
<html>
    <link rel="stylesheet" type ="text/css" href="newcss.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="javascript.js"></script>
   
    <head>
       <!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
    
    <body>
        
        <div id="patientdetailfetch">
            <% Patient P=new Patient(PatientId);    %>
            <table border="0" class="table table-hover">
                
                <tbody>
                    <tr>
                        <td><input type="text" name="First Name" value="First name" /></td>
                        <td><input type="text" name="lname" value="<%=P.fname%>" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="Lastname" value="lname" /></td>
                        <td><input type="text" name="fname" value="<%=P.lname%>" readonly="readonly" /></td>
                    </tr>
                    <td><input type="text" name="usrname" value="UserName" /></td>
                            <td><input type="text" name="username" value="<%=P.username%>" readonly="readonly" /></td>
                    <tr>
                        <td><input type="text" name="fname" value="fname" /></td>
                        <td><input type="text" name="usrname" value="<%=P.fname %>" readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="lname" value="lname" /></td>
                        <td><input type="text" name="lname" value="<%= P.lname %>" readonly="readonly"</td>
                    </tr>
                    
                    <tr>
                        <td><input type="text" name="pid" value="pid" /></td>
                        <td><input  type="pid" value=<%= P.PatientId %> readonly="readonly" ></td>
                    </tr>
                    
                    <tr>
                        <td><input type="text" name="user1" value="user" /></td>
                        <td><input type="text" name="user" id="unam" value="<%= P.username %>" readonly="readonly" </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="pass1" value="pass" /></td>
                        <td><input type="password" name="pass" id="passw" value="<%= P.password %>" readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="gender1" value="gender" /></td>
                        <td><input type="text" name="gender" value="<%= P.gender %>" readonly="readonly"</td>
                    </tr>
                    
                    <tr>
                        <td><input type="text" name="rov1" value="rov" /></td>
                        <td><input type="text" name="rov" value="<%= P.reasonofvisit %>" readonly="readonly"</td>
                    </tr>
                    
                  
                    <tr>
                        <td><input type="text" name="bg1" value="bg" /></td>
                        <td><input type="text" name="bg" id="bgrp" value="<%= P.bloodgroup %>" readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="pno1" value="pno" /></td>
                        <td><input type="text" name="pno" id="ph" value="<%= P.PhoneNumber %>" readonly="readonly" </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="email1" value="email" /></td>
                        <td><input type="text" name="email" id="maill" value="<%= P.email %>" readonly="raedonly"</td>
                    </tr>
                </tbody>
            </table>

        </div>
        
       
    </body>
</html>
