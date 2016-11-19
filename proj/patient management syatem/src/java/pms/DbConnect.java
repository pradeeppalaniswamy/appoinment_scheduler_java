/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pms;

/**
 *
 * @author PRADEEP
 */
import java.sql.*;

public class DbConnect {
     private Connection con;
private ResultSet R;
String us;
private Statement st;
    
    public Connection getConnection()
    {
        try{
			Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","Asdf@1234");
		
        
		}

		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
        return con;
    }
}