<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring Project</title>

<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
 /* right: 28px;
  width: 280px;*/
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
    /*bottom:40px;*/
/*  right: 15px;*/
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
</head>
<body>

<h1>Welcome to Tech Publishing Platform</h1>
<p>Tech Geek!!</p>

<button class="open-button" id ="b1" onclick="openForm()" style="right:5%; width:10%;">Login User!!</button>

<div class="form-popup" id="myForm" style="right:15px; bottom:65px;">
  <form action="/login-user" method="POST" class="form-container">
    <h2>Login</h2>

    <label for="username"><b>UserName</b></label>
    <input type="text" placeholder="Enter Username" name="username" value="${user.username}" required/>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" value="${user.password}"/>

    <button type="submit" class="btn">Login</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
  </form>
</div>

<button class="open-button"  id="b2" onclick="openForm2()" style="right:16%; width:10%;">Register!!</button>

<div class="form-popup" id="myForm2" style="right:200px; bottom:36px;">
  <form action="/save-user" method="POST" class="form-container">
    <h2>Registration</h2>
    				
    				<input type="hidden" name="id" value="${user.id }" />
    				
    				<label for="id"><b>UserName</b></label>
					<input type="text" placeholder="Enter Username" name="username" value="${user.username}" required />
					
					<label for="firstname"><b>First Name</b></label>
					<input type="text" placeholder="Enter Firstname" name="firstname" value="${user.firstname}" />	
					
					<label for="lastname"><b>LastName</b></label>	
					<input type="text" placeholder="Enter Lastname" name="lastname" value="${user.lastname }" />
					
					<label for="age"><b>Age</b></label>
					<input type="text" placeholder="Enter Age" name="age" value="${user.age }" />
					
					<label for="password"><b>Password</b></label>
					<input type="password" placeholder="Enter Password" name="password" value="${user.password }" />
					
					<label for="email"><b>Email</b></label>
					<input type="email" placeholder="Enter email" name="email" value="${user.email }" />
					
					<input type="submit" class="btn" value="Register" />
					<button type="button" class="btn cancel" onclick="closeForm2()">Close</button>
					
			
  </form>
</div>
<button class="open-button" id ="b3" onclick="openForm3()" style="right:27%; width:10%;">Login Admin!!</button>

<div class="form-popup" id="myForm3" style="right:360px; bottom:65px;">
  <form action="/login-admin" method="POST" class="form-container">
    <h2>Login</h2>

   	<label for="adminname"><b>Admin Name</b></label>
    <input type="text" placeholder="Enter Admin Name" name="adminname" value="${admin.adminname}" required/>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" value="${admin.password}"/>

    <button type="submit" class="btn">Login</button>
    <button type="button" class="btn cancel" onclick="closeForm3()">Close</button>
  </form>
</div>

<script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function openForm2() {
	  document.getElementById("myForm2").style.display = "block";
	}
function openForm3() {
	  document.getElementById("myForm3").style.display = "block";
	}
function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
function closeForm2() {
	  document.getElementById("myForm2").style.display = "none";
	}
function closeForm3() {
	  document.getElementById("myForm3").style.display = "none";
	}
</script>

</body>
</html>

