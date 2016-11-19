<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Registration</title>


	<link rel="stylesheet" href="create.css">

</head>


	



    <div class="main-content">

        

        <form class="form-basic" method="post" action="insertemp">

            <div class="form-title-row">
                <h1>Registration</h1>
            </div>
               <div class="form-row">
                <label>
                    <span>Patient Id</span>
                    <input type="text" name="pid" placeholder="like:P01">
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>First name</span>
                    <input type="text" name="fname">
                </label>
            </div>
			<div class="form-row">
                <label>
                    <span>Last name</span>
                    <input type="text" name="lname">
                </label>
            </div>
			<div class="form-row">
                <label>
                    <span>Middle name</span>
                    <input type="text" name="mname">
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>Email</span>
                    <input type="email" name="email">
                </label>
            </div>
			 <div class="form-row">
                <label>
                    <span>Gender</span>
                    <input type="text" name="dob">
                </label>
            </div>
			 <div class="form-row">
                <label>
                    <span>Date of birth</span>
                    <input type="Date" name="date" placeholder="yyyy/mm/dd">
                </label>
            </div>
			 <div class="form-row">
                <label>
                    <span>Reason of visit</span>
                    <input type="text" name="rov">
                </label>
            </div>
			 <div class="form-row">
                <label>
                    <span>Blood Group</span>
                    <input type="text" name="Bloodgroup">
                </label>
            </div>
			 <div class="form-row">
                <label>
                    <span>User Name</span>
                    <input type="text" name="user">
                </label>
            </div>
             <div class="form-row">
                <label>
                    <span>Password</span>
                    <input type="password" name="pass">
                </label>
            </div>
            

            	<div class="form-row">
                <label>
                    <span>Phone Number</span>
                    <input type="text" name="Pno">
                </label>
            </div>

            <div class="form-row">
                <button type="submit">Submit Form</button>
                
            </div>
            <div class="form-row">
                <label><span>${message1}</span></label>
                <div>

        </form>

    </div>

</body>

</html>
