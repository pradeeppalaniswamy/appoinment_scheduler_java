<%-- 
    Document   : loginselector
    Created on : Apr 11, 2016, 9:20:53 PM
    Author     : PRADEEP
--%>

    

<%@page import="com.sun.corba.se.spi.presentation.rmi.StubAdapter.request(Object, String, boolean)"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>

<%    String username =request.getParameter("username");
     String password =request.getParameter("password");
       %>
<%!public class connect  extends HttpServlet{
private Connection con;
private ResultSet R;
String us;
private Statement st;
	public connect()
	{ 

		try{
			Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","Asdf@1234");
		st=con.createStatement();
		}

		catch(Exception ex)
		{
			System.out.println("create"+ex);
		}
		}

 private String getValue(String param, HttpServletRequest request) {
        return request.getParameter(param);
    }
	
public ResultSet getval() throws SQLException
	{	
//HttpServletRequest request;
String a=request.getParameter("firstname");
String b="pradeep";
try
		{
		R=st.executeQuery("select * from employeee where username='"+a+"' and password='"+b+"';");
	
				}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		return R;
		
	}
	

}
%>
<%
    ResultSet r=null;
    try{
	connect db= new connect();

 r=db.getval();
    }
    catch(Exception E)
    {
        E.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN SELECTOR</title>
        <%
            int flag=0;
            try{
            while(r.next()) {
        %>
    <p>LOGIN SUCCESSFULL click <a href="#"> here </a> to begin</p>
       
    <%  
        flag=1;  }}
    catch(Exception ex)
{
    %>
<p>Login unsuccessful please click <a href="index.jsp">here </a> to try again</p>
<%}
    
    %>
    
    
      </head>
    <body>
      
       
    </body>
   </html>
