/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pms;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author PRADEEP
 */
public class BAL {
   private ResultSet R;
    private Statement st;
    
    public BAL()
           {
    DbConnect db=new DbConnect();
     Connection con=null;
    try{
             con = db.getConnection();
    st=con.createStatement();
            }
            catch(Exception E)
                     {
                     String e=E.toString();
                     
                     }
}
    
    public HashMap<String,String> getPatientDetails(String PatientId)
    {
    HashMap<String,String> Patientdetails=new HashMap<String,String>();
    try{
   R=st.executeQuery("select * from patient  where patientid ='"+PatientId+"';");
    while(R.next())
    {
        Date dob=R.getDate("dob");
        Patientdetails.put("firstName", R.getString("fname"));
        Patientdetails.put("middleName",R.getString("middlename"));
        Patientdetails.put("lastName",R.getString("lname"));
        Patientdetails.put("password",R.getString("password"));
        Patientdetails.put("gender",R.getString("gender"));
        //Patientdetails.put("dob", );    
        Patientdetails.put("phonenum",R.getString("phoneno"));
        Patientdetails.put("email",R.getString("email"));
        Patientdetails.put("bloodGroup",R.getString("bloodgroup"));
        Patientdetails.put("reasonOfVisit",R.getString("reason_of_visit"));
        Patientdetails.put("username",R.getString("username") );
    }
    }
    catch(Exception E)
    {
int a=0;        
        
    }
    return Patientdetails;
    }
    
    
   public HashMap<String,String> getAllempdetails(String Empid)
    {int type_Id=-1,dept_Id=-1;
        HashMap<String,String> EmployeeDetails=new HashMap<String,String>();
        try{
   R=st.executeQuery("select * from employeee  where employee_id ='"+Empid+"';");
        // R=st.executeQuery("select * from employeee;");
    while(R.next())
		{
                    int a=10;
                    
                    type_Id=R.getInt("typeid");
                    dept_Id=R.getInt("department_id");
		 EmployeeDetails.put("FirstName", R.getString("Fname"));
                 EmployeeDetails.put("LastName", R.getString("Lname"));
                 EmployeeDetails.put("Gender", R.getString("gender"));
                 EmployeeDetails.put("Phonenumber", R.getString("phonenumber"));
                 EmployeeDetails.put("Email", R.getString("email"));
                 EmployeeDetails.put("Bloodgroup", R.getString("bloodgroup"));
                 EmployeeDetails.put("username", R.getString("username"));
                 EmployeeDetails.put("employeeid", R.getNString("employee_id"));
                EmployeeDetails.put("password", R.getString("password"));
	//	System.out.println("name is "+n);	
		}
		
    
        }
        catch(Exception E)
        {
            EmployeeDetails.put("Employeeexception",E.toString());
        }
        try{
    
        R=st.executeQuery("select department_name  from department where  department_id ="+dept_Id+";");
        
        while(R.next())
        {
        EmployeeDetails.put("Department", R.getString("department_name"));
        }}
        catch(Exception E)
        {
               EmployeeDetails.put("DEPeeexception",E.toString());
        }
        
        try{
    
        R=st.executeQuery("select employee_type  from employee_type  where  type_id ="+1+";");
        
        while(R.next())
        {
        EmployeeDetails.put("Type", R.getString("employee_type"));
        }}
        catch(Exception E)
        {
               EmployeeDetails.put("emptypeexception",E.toString());
        }
        
        
        
        
        
        return(EmployeeDetails);
        
    }
   
   public ArrayList<String> getAllpatientIds()
   {
       ArrayList<String> patientids=new ArrayList<String>();
   try{
   R=st.executeQuery("select patientid from patient;");
        // R=st.executeQuery("select * from employeee;");
    while(R.next())
		{
       patientids.add(R.getString("patientid"));
                    
   }}
   catch(Exception E)
           {
           
           
           }
   return(patientids);
   }
   
   public ResultSet getAppoinments(String doctorid)
   {
      
   try{
   R=st.executeQuery("select a.appointmentid, p.fname,a.day,t.value  from patient p,timeslot t,appointments a where a.patientid =p.patientid and a.timeslotid=t.id and a.doctorid='"+doctorid+"' and confirmation not in ('apr','rej');");
   }
   catch(Exception E)
           {
           return null;
           
           }
   
   return(R);
   
   }
   
   public java.sql.Date getdob(String id)
   {
       java.sql.Date dob;
       dob=null;
       try{
           
           
           R=st.executeQuery("select dob from patient where patient_Id ='"+id+"';");
       }
       catch(Exception E)
       {
           
       }
       try{
       while(R.next())
       {
           
           dob=R.getDate("dob");
       }
       }
       catch(Exception E)
       {
       }
       return dob;
       }
   
   public void updateAppointment(String Status,String id)
   {
   
       try{
           int appid=Integer.parseInt(id);
   st.executeUpdate("update appointments set confirmation ='"+Status+"' where appointmentid ="+appid+";");
        // R=st.executeQuery("select * from employeee;");
   }
   catch(Exception E)
           {
           }
   }

   public int getnumberofimages(String patientid)
   {
       int num=0;
    try{
   R=st.executeQuery("select count(patientid) as a from scanimages where patientid='"+patientid+"';");
   
   while(R.next())
    {
     num=R.getInt("a");
    }
    }
    
   catch(Exception E)
           {
           return -1;
           
           }
   
   
   return num;
   }
   public ResultSet getdoctordetailds()
   {
       try{
   R=st.executeQuery("select e.employee_id,e.Fname,e.Lname,d.department_name from employeee e,employee_type t,department d where employee_type='doctor'and e.typeid=t.type_id and d.department_id=e.department_id;");
   }
   catch(Exception E)
           {
           return null;
           
           }
   
   return(R);
   
   }
   
   public int bookappointment(String Doctorid,String Patientid,java.sql.Date apntdate,int Timeslotid )
   {
   int succ=0;
   try
   {
        succ=st.executeUpdate("insert into appointments  (doctorid,patientid,day,timeslotid,confirmation) values('"+Doctorid+"','"+Patientid+"','"+apntdate+"',"+Timeslotid+",'Bkd');");
 
  // succ=st.executeUpdate("insert into appointments  (doctorid,patientid,day,timeslotid,confirmation) values('"+Doctorid+"','"+Patientid+"','"+apntdate+"',"+Timeslotid+");");
   }
   catch(Exception E)
   {
   succ=-1;
   }
   return succ;
   }
   //insert employee
   public int newuser(String Patientid,String rov,String mname,java.sql.Date dob,String fname,String lname,String gender,String phoneno,String email,String blooggroup,String user,String pass)
   {
       int succ=0;
       try{
           succ=st.executeUpdate("insert into patient values('"+Patientid+"','"+mname+"','"+fname+"','"+lname+"','"+gender+"','"+dob+"','"+phoneno+"','"+email+"','"+rov+"','"+blooggroup+"','"+user+"','"+pass+"');");
       }
       catch(Exception E)
       {
           String msg=E.getMessage();
           succ=-1;
       }
       return succ;
   }
   public int insertemp(String empid,String typeid,String fname,String lname,String deptid,String gender,String phoneno,String email,String blooggroup,String user,String pass)
   {
       int succ=0;
       try{
           succ=st.executeUpdate("insert into employeee values('"+empid+"','"+typeid+"','"+fname+"','"+lname+"','"+deptid+"','"+gender+"','"+phoneno+"','"+email+"','"+blooggroup+"','"+user+"','"+pass+"');");
       }
       catch(Exception E)
       {
           
           String msg=E.getMessage();
           succ=-1;
       }
       return succ;
   }
   //delete emp
   public int deleteemp(String empid)
   {
       int succ=0;
       try{
           succ=st.executeUpdate("delete from employeee where employee_id='"+empid+"';");
       }
       catch(Exception E)
       {
           succ=-1;
       }
       return succ;
   }

    /**
     *
     * @param empid
     * @param phone
     * @param email
     * @param bloodgroup
     * @param username
     * @param password
     * @return
     */
    public int editemp(String empid,String phone,String email,String bloodgroup,String username,String password)
   {
       int succ=0;
       try{
           succ=st.executeUpdate("update employeee set phonenumber='"+phone+"',email='"+email+"',bloodgroup='"+bloodgroup+"',username='"+username+"',password='"+password+"' where employee_id='"+empid+"';");
       }
       catch(Exception E)
       {
           
       }
       return succ;
   }
 
     public int editpatient(String patid,String phone,String email,String bloodgroup,String username,String password)
   {
       int succ=0;
       try{
           succ=st.executeUpdate("update patient set phoneno='"+phone+"',email='"+email+"',bloodgroup='"+bloodgroup+"',username='"+username+"',password='"+password+"' where patientid='"+patid+"';");
       }
       catch(Exception E)
       {
           String msg=E.getMessage();
           
       }
       return succ;
   }
   public ArrayList<String> gettimeslots()
           {
           ArrayList<String> timeslots=new ArrayList<String>();
   try{
   R=st.executeQuery("select id,value from timeslot;");
        // R=st.executeQuery("select * from employeee;");
    while(R.next())
		{
                   // String k=;
       timeslots.add(R.getInt("id")+ "=>" + R.getString("value"));
                    
   }}
   catch(Exception E)
           {
           
           
           }
   return(timeslots);
}
           
           
public HashMap<String,String> getimgdtls(String patientid,int limit)
{
    int lim=1;
    HashMap<String,String> imgdets=new HashMap<String,String>();
    try{  

   R=st.executeQuery("select image_id,imgdescription,dateofimage from scanimages where patientid = '"+patientid+"'order by image_id limit 5 ;");
   
   while(R.next())
    {
     imgdets.put("imageid", R.getString("image_id"));
     imgdets.put("imgdescription", R.getString("imgdescription"));
    if(lim==6)
        return imgdets;
    else
        lim++;
    }
    }
     catch(Exception E)
           {
           return null;
           
           }
  
return imgdets;
}


   public  java.sql.Date getimgdat(String patientid,int limit)
{
   // HashMap<String,Date> imgdets=new HashMap<String,Date>();
    java.sql.Date D=null;
    int lim=1;
    try{  

   R=st.executeQuery("select image_id,imgdescription,dateofimage from scanimages where patientid = '"+patientid+"'order by image_id limit 1;");
   
   while(R.next())
    {
     D= R.getDate("dateofimage");
        }
   if(lim==limit)
        return D;
    else
        lim++;
    }
    
    
     catch(Exception E)
           {
           return null;
           
           }
  
return D;

}
   
   
   

   public ResultSet getAppoinmentsforpatients(String Patientid)
   {
      
   try{
   R=st.executeQuery("select a.appointmentid, e.fname,a.day,t.value,a.confirmation from employeee e,timeslot t,appointments a where a.doctorid =e.employee_id and a.timeslotid =t.id and a.patientid='"+Patientid+"';");
   }
   catch(Exception E)
           {
           return null;
           
           }
   
   return(R);
   
   }
      
   
   
}
   
   
  
