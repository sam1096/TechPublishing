<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<link href="static/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<link href="static/js/bootstrap.min.js" rel="stylesheet">


<!-- for media images ex facebook google -->
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<link href="static/css/style.css" rel="stylesheet">
</head>
<body  background="static/images/background.jpg">

	<nav class="navbar navbar-expand-md  sticky-top ">
		<div class="container-fluid ">
			<a class="navbar-brand" href="welcomepage"><img
				src="static/images/tech_geek_logo"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ml-auto">
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Connect</a></li>
					<li><a href="/userProfile">Profile</a></li>
					<li><a href="/logoutUser">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="con">
		<div id="container">
			<div id="first">
				<div class="car">
					<img src="/images/1.png" alt="John" style="width: 100%">
					<h1>${admin.name}</h1>
					<p class="title">ADMIN</p>
					<p>
						<button>Basic Details</button>
						<br>
						<button>Article Reviewed</button>
						<br>
						<button>My articles</button>
					</p>
				</div>
			</div>
			<div id="second">
				<nav class="inside_nav">
						<ul class="inside_nav_admin">
							<li class="active inside_nav_spacing"><a href="admin_profile">Basic Details</a></li>
							<li class="inside_nav_spacing"><a href="/admin_reviewed">Articles Reviewed</a></li>
							<li class="inside_nav_spacing"><a href="/admin_myArticles">My Articles</a></li>
							<li class="inside_nav_spacing"><a href="/admin_pass">Change Password</a></li>
							<li class="inside_nav_spacing"></li>
						</ul>
				</nav>

				<div class="contain">

					<p class="til">DETAILS</p>

					<p>
						<span class="large_font">Username : </span> <span
							class="small_font"> ${admin.adminname}</span>
					</p>
					<p>
						<span class="large_font">Name : </span> <span class="small_font">${admin.name}</span>
					</p>
					<p>
						<span class="large_font">Password </span> <span class="small_font">
							${admin.password}</span>
					</p>
					<p>
						<span class="large_font">Role : </span> <span class="small_font">Admin</span>
					</p>

					<br> <br>
					<p class="til">CONTACT DETAILS</p>
					<p>
						<span class="large_font">Email : </span> <span class="small_font"></span>
					</p>
					<p>
						<span class="large_font">Phone No : </span> <span
							class="small_font"> </span>
					</p>
				</div>



			</div>

		</div>
	</div>



</body>
</html>
