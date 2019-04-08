<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  <!----For Login ---->
  .modal-header, h4, .close {
    background-color: #5cb85c;
    color:white !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
   <!--------------For background---------------->
 
   </style>
 
</head>
<body background="/images/bg-masthead.jpg">
<div>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Tech Publishing Platform</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/welcomepage">Home</a></li>
      <li><a href="#">Help</a></li>
      <li><a href="#">About</a></li>
	</ul>
	
	<ul class="nav navbar-nav navbar-right">   
<!-- div class="container" id="con1"---->
  <!-- Trigger the modal with a button -->
  <li>
  <button type="button" class="btn btn-danger navbar-btn" id="myBtn">Login User</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="/validateUserLogin" method="POST" role="form">
          
            <div class="form-group">
             <label for="username"><span class="glyphicon glyphicon-user"></span>Username</label>
             <input type="text" class="form-control" name="username" placeholder="Enter Username" value="${user.username}"/>
             </div>
             
            <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             <input type="password" class="form-control" name="password" placeholder="Enter Password" value="${user.password}"/>
            </div>
            
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#">Register</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
      
    </div>
  </div> 
<!-- -/div-->
</li>
<li>
<!-- div class="container" id="con2"---->
  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-danger navbar-btn" id="myBtn2" style="right:40px;">Register Here</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Register</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="/save-user" method="POST" role="form">
          <input type="hidden" name="id" value="${user.id }" />
          
            <div class="form-group">
             <label for="username"><span class="glyphicon glyphicon-user"></span>Username</label>
             <input type="text" class="form-control" name="username" placeholder="Enter Username" value="${user.username}"/>
             </div>
             
              <div class="form-group">
             <label for="firstname"><span class="glyphicon glyphicon-user"></span>Firstname</label>
             <input type="text" class="form-control" name="firstname" placeholder="Enter Firstname" value="${user.firstname}"/>
             </div>
             
              <div class="form-group">
             <label for="lastname"><span class="glyphicon glyphicon-user"></span>Lastname</label>
             <input type="text" class="form-control" name="lastname" placeholder="Enter Lastname" value="${user.lastname}"/>
             </div>
             
              <div class="form-group">
             <label for="username"><span class="glyphicon glyphicon-user"></span>Age</label>
             <input type="text" class="form-control" name="age" placeholder="Enter Age" value="${user.age}"/>
             </div>
             
            <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             <input type="password" class="form-control" name="password" placeholder="Enter Password" value="${user.password}"/>
            </div>
            
             <div class="form-group">
             <label for="email"><span class="glyphicon glyphicon-user"></span>Email</label>
             <input type="text" class="form-control" name="email" placeholder="Enter Email" value="${user.email}"/>
             </div>
             
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
            
          <!--   <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a></p>--->
            
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Register!!</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Already a member? <a href="#">Login</a></p>
        </div>
      </div>   
    </div>
  </div> 
</li>
</ul>
  </div>
  
</nav>
<div  id="text" >
<h1 style="color:white;"><b>Welcome to Tech Publishing Platform!!</b></h1 >
<div style="margin-left:55px;">
<h2 style="color:yellow">Create. </h2><h2 style="color:aqua">Explore. </h2><h2 style="color:crimson">Contribute. </h2>
</div>
</div>
</div>



 
<script>
$(document).ready(function(){
  $("#myBtn").click(function(){
    $("#myModal").modal();
  });
});

$(document).ready(function(){
	  $("#myBtn2").click(function(){
	    $("#myModal2").modal();
	  });
	});
</script>

</body>
</html>
