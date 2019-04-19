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
<link href="static/css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid" style="background-color: #34495e;">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><font color="white">Tech Publishing Platform</font></a>
			</div>
			<ul class=" nav navbar-nav ml-auto navbar-right">
				<li><a href="/adminHome"><font color="white">Home</font></a></li>
				<li><a href="/about"><font color="white">About</font></a></li>
				<li><a href="#"><font color="White">Connect</font></a></li>
				<li><a href="/admin_profile"><font color="white">Profile</font></a></li>
				<li><a href="/logoutUser"><font color="white">Logout</font></a></li>
			</ul>
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
						<button onclick="location.href='admin_profile';"
							style="background: #3CB371;">Basic Details</button>
						<br>
						<button onclick="location.href='admin_reviewed';"
							style="background: #3CB371;">Article Reviewed</button>
						<br>
						<button onclick="location.href='admin_myArticles';"
							style="background: #3CB371;">My articles</button>
					</p>
				</div>
			</div>
			<div id="second">
				<nav class="inside_nav">
					<ul class="inside_nav_admin">
						<li class="inside_nav_spacing"><a href="admin_profile">Basic
								Details</a></li>
						<li class="inside_nav_spacing"><a href="/admin_reviewed">Articles
								Reviewed</a></li>
						<li class="inside_nav_spacing"><a href="/admin_myArticles">My
								Articles</a></li>
						<li class="active inside_nav_spacing"><a href="/admin_pass">Change
								Password</a></li>
						<li class="inside_nav_spacing"><a href="/admin_area">Interests</a></li>
					</ul>
				</nav>

				<div class="contain">

					<p class="til">DETAILS</p>
					<form class="form-horizontal" action="/change_password"
						method="POST" role="form">
						
						<div class="form-group">
							<label class="control-label col-sm-2">Current
								Password:</label>
							<div class="col-sm-10">
						<span>${admin.password}</span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2">New
								Password:</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="password"
									placeholder="Enter Password" required>
							</div>
						</div>
						<button type="submit" class="btn btn-success btn-block" style="width:20%; margin-left:20%;">
							Submit</button>
					</form>

				</div>



			</div>

		</div>


	</div>




</body>
</html>
