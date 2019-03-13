<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>tecno-tab | home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Tech Publishing platform</a>
			<div>
			<ul>
  				<li><a href="/login">Login</a></li>
  				<li><a href="/register">Register</a></li>
			</ul>
			</div>
			
			
		</div>
	</div>


	<c:choose>
		<c:when test="${mode=='MODE_HOME'}">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome to Tech Publishing platform</h1>
					<h3>Tech Geek</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER'}">
			<div class="modal" id="div-registration">
				<h3>New Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/save-user">
				<div class="imgcontainer">
     				 	<span onclick="document.getElementById('div-registration').style.display='none'" class="close" title="Close PopUp">&times;</span>
      					<img src="/images/1.png"  width="35px" height="40px"/>
     			 		<h1 style="text-align:center">User Registration</h1>
   					 </div>
   					 <div class="container">
					<input type="hidden" name="id" value="${user.id }" />
					<input type="text" placeholder="Enter Username" name="username" value="${user.username}" />
					<input type="text" placeholder="Enter Firstname" name="firstname" value="${user.firstname}" />		
					<input type="text" placeholder="Enter Lastname" name="lastname" value="${user.lastname }" />
					<input type="text" placeholder="Enter Age" name="age" value="${user.age }" />
					<input type="password" placeholder="Enter Password" name="password" value="${user.password }" />
					<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_LOGIN'}">
		<div id="modal-wrapper" class="modal">
				<form class="form-horizontal"  method="POST" action="/login-user">
					 <div class="imgcontainer">
     				 	<span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp" >&times;</span>
      					<img src="/images/1.png"  width="35px" height="40px"/>
     			 		<h1 style="text-align:center">User Login</h1>
   					 </div>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">
							<c:out value="${error}"></c:out>
						</div>
					</c:if>

					<div class="container">
						 <input type="text" placeholder="Enter Username" name="username" value="${user.username}" />
      					<input type="password" placeholder="Enter Password" name="password" value="${user.password}" />
						 <button type="submit">Login</button>
    				  <input type="checkbox" style="margin:26px 30px;"> Remember me      
     			 		<a href="#" style="text-decoration:none; float:right; margin-right:34px; margin-top:26px;">Forgot Password ?</a>
					</div>
					
				</form>
		</div>
		</c:when>
	</c:choose>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>