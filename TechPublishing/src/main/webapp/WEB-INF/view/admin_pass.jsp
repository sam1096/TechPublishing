<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 300px;
	margin: auto;
	text-align: center;
	font-family: arial;
}

.contain {
	margin: auto;
	padding-left: 100px;
	font-family: arial;
	padding-top: 25px;
	padding-bottom: 25px;
}

.title {
	color: grey;
	font-size: 18px;
}

.til {
	color: grey;
	font-size: 28px;
}

button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}

a {
	text-decoration: none;
	font-size: 22px;
	color: black;
}

button:hover, a:hover {
	opacity: 0.7;
}

#header {
	width: 100%;
	background-color: white;
	height: 80px;
}

#container {
	width: 100%;
	background-color: black;
}

#first {
	width: 25%;
	float: left;
	background-color: white;
}

#second {
	width: 73%;
	float: left;
	background-color: #b3e7ff;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	margin: auto;
}

.large_font {
	font-size: 18pt;
}

.small_font {
	font-size: 12pt;
	color: grey;
	font-style: italic;
}
</style>
</head>
<body>

	<div id="con">
		<div id="header">hello Admin</div>
		<div id="container">
			<div id="first">
				<div class="card">
					<img src="/images/1.png" alt="John" style="width: 100%">
					<h1>${admin.name}</h1>
					<p class="title">ADMIN</p>
					<p>
						<button  onclick="location.href='admin_profile';" >Basic Details</button>
						<br>
						<button onclick="location.href='admin_reviewed';">Article Reviewed</button>
						<br>
						<button onclick="location.href='admin_myArticles';">My articles</button>
					</p>
				</div>
			</div>
			<div id="second">

				<nav class="navbar navbar-inverse">
					<div class="container-fluid">

						<ul class="nav navbar-nav">
							<li class="active"><a href="admin_profile">Basic Details</a></li>
							<li><a href="/admin_area">Area Of Interest</a></li>
							<li><a href="/admin_reviewed">Articles Reviewed</a></li>
							<li><a href="/admin_myArticles">My Articles</a></li>
							<li><a href="/admin_pass">Change Password</a></li>
							<li> <a href="/logoutAdmin">Logout</a></li>
						</ul>
					</div>
				</nav>

				<div class="contain">

					<p class="til">DETAILS</p>
             <form action="/change_password" method="POST" role="form">
					<p>
						<span class="large_font">Password : </span> <span
							class="small_font"> ${admin.password}</span>
					</p>
					<p>
						<span class="large_font">New Password : </span>
					</p>
				 <input type="password" class="form-control" name="password" placeholder="Enter Password" required/>
				 <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Submit</button>	
            </form>
				
				</div>



			</div>

		</div>


	</div>




</body>
</html>
