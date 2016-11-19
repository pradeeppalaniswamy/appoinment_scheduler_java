<%-- 
    Document   : index
    Created on : Apr 10, 2016, 11:06:11 PM
    Author     : PRADEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     <link rel="stylesheet" type ="text/css" href="indexstyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="javascript.js"></script>
        
    </head>
    <body>
        <%

String S=" ";
 try{
            HttpSession s=request.getSession();
           
S=s.getAttribute("username").toString();
            }
            catch(Exception e)
            {}
        %>
        <%if(S.equals(" ")){%>
    
        <form name="form1" action="NewServlet" method="POST">
     

${message}
     <h4> Login Information </h4>
  <input class="name" type="text" id="user" name="username" placeholder="Enter Username"/>
  <input class="pw" type="password" id="pass"  name="password" placeholder="Enter Password"/>
  <li><a href="register.jsp" class="button1">Register</a></li>
  <input class="button" type="submit" value="SUBMIT" id="btn1"/>
   </form>
    <%} else {
HttpSession s=request.getSession();
s.removeAttribute("username");
//s.getAttribute("position");
s.invalidate();
response.sendRedirect("index.jsp");

    
    %>
     <%} %>
    </body>
</html>
