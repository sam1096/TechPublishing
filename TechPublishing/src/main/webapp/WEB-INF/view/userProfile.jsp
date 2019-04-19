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
<link href="static/css/style.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>


	<nav class="navbar navbar-inverse">
		<div class="container-fluid" style="background-color: #34495e;">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><font color="white">Tech
						Publishing Platform</font></a>
			</div>
			<ul class=" nav navbar-nav ml-auto navbar-right">
				<li><a href="/userHome"><font color="white">Home</font></a></li>
				<li><a href="/about"><font color="white">About</font></a></li>
				<li><a href="#"><font color="White">Connect</font></a></li>
				<li><a href="/userprofile"><font color="white">Profile</font></a></li>
				<li><a href="/logoutUser"><font color="white">Logout</font></a></li>
			</ul>
		</div>
	</nav>


	<div id="con">
		<div id="container">
			<div id="first">
				<div class="car">
					<img src="/images/1.png" alt="John" style="width: 100%">
					<h1>${user.firstname} ${user.lastname}</h1>
					<p class="title">USER</p>
					<p>
						<button onclick="location.href='userprofile';"
							style="background: #3CB371;">Basic Details</button>
						<br>
						<button onclick="location.href='area';"
							style="background: #3CB371;">Areas</button>
						<br>
						<button onclick="location.href='userArticles';"
							style="background: #3CB371;">My articles</button>
					</p>
				</div>
			</div>


			<div id="second">

				<nav class="inside_nav">
					<ul class="inside_nav_admin">
						<li class="active inside_nav_spacing_user"><a
							href="userprofile">Basic Details</a></li>
						<li class="inside_nav_spacing_user"><a href="/area">Interests</a></li>
						<li class="inside_nav_spacing_user"><a href="/userArticles">My
								Articles</a></li>
						<li class="inside_nav_spacing_user"><a href="/user_pass">Change
								Password</a></li>
					</ul>
				</nav>

				<div class="contain">

					<p class="til">DETAILS</p>

					<p>
						<span class="large_font">Username : </span> <span
							class="small_font"> ${user.username}</span>
					</p>
					<p>
						<span class="large_font">First Name : </span> <span
							class="small_font">${user.firstname}</span>
					</p>
					<p>
						<span class="large_font">Last Name : </span> <span
							class="small_font">${user.lastname} </span>
					</p>
					<p>
						<span class="large_font">Password </span> <span class="small_font">
							${user.password}</span>
					</p>
					<p>
						<span class="large_font">Role : </span> <span class="small_font">User</span>
					</p>
					<p>
						<span class="large_font">Age : </span> <span class="small_font">${user.age}</span>
					</p>
					<br> <br>
					<p class="til">CONTACT DETAILS</p>
					<p>
						<span class="large_font">Email : </span> <span class="small_font">${user.email}</span>
					</p>

				</div>



			</div>

		</div>


	</div>




</body>
</html>
