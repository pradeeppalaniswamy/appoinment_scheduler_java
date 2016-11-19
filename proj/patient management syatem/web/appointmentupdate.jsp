<%-- 
    Document   : appointmentupdate
    Created on : Apr 25, 2016, 1:23:55 AM
    Author     : PRADEEP
--%>

<%@page import="pms.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%   
    String appointmentid =request.getParameter("appointmentid");
    String status=request.getParameter("status");
     Doctor D=new Doctor();
     D.updateAppoinment(status, appointmentid);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
