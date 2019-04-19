<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->

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

<title>User Profile</title>
</head>
<body>
	<!-- Navigation bar -->
	<nav class="navbar navbar-expand-md sticky-top usernav">
		<div class="container-fluid ">
			<a class="navbar-brand" href="welcomepage"><img
				src="static/images/tech_geek_logo"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class=" nav navbar-nav ml-auto">
					<li><a href="#">Home</a></li>
					<li><a href="/about">About</a></li>
					<li><a href="#">Connect</a></li>
					<li><a href="/userProfile">Profile</a></li>
					<li><a href="/logoutUser">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- userProfile picture -->

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
						<li class="active inside_nav_spacing"><a href="admin_profile">Basic
								Details</a></li>
						<li class="inside_nav_spacing"><a href="/admin_reviewed">Interests</a></li>
						<li class="inside_nav_spacing"><a href="/admin_myArticles">My
								Articles</a></li>
						<li class="inside_nav_spacing"><a href="/admin_pass">Change
								Password</a></li>
						<li class="inside_nav_spacing"></li>
					</ul>
				</nav>

				<div class="contain">

					<p class="til">DETAILS</p>

					<p>
						<span class="large_font">First Name :	</span> <span
							class="small_font"> ${user.firstname}</span>
					</p>
					<p>
						<span class="large_font">Last Name :	</span> <span
							class="small_font"> ${user.lastname }</span>
					</p>
					<p>
						<span class="large_font">Email ID :		</span> <span
							class="small_font"> ${user.email }</span>
					</p>					
					
					<p>
						<span class="large_font">Age :		</span> <span
							class="small_font"> ${user.age }</span>
					</p>

				</div>
			</div>

		</div>
	</div>


	<!-- need to add up -->
	<%-- <div class="container-fluid" style="width: 55%" align="center">
				<h1 style="font-family: Georgia;">
					<b>USER INFORMATION</b>
				</h1>
				<div class="jumbotron jumbotron-fluid">
					<div class="row">
						<div class="col-sm-4 card" style="background-color: lavender;">
							<b>USER'S FIRSTNAME </b>
						</div>
						<div class="col-sm-6 card"
							style="background-color: lavenderblush;">${user.firstname }</div>
					</div>

					<div class="row">
						<div class="col-sm-4 card" style="background-color: lavender;">
							<b>USER'S LASTNAME </b>
						</div>
						<div class="col-sm-6 card"
							style="background-color: lavenderblush;">${user.lastname }</div>
					</div>

					<div class="row">
						<div class="col-sm-4 card" style="background-color: lavender;">
							<b>EMAIL ID</b>
						</div>
						<div class="col-sm-6 card"
							style="background-color: lavenderblush;">${user.email }</div>
					</div>

					<div class="row">
						<div class="col-sm-4 card" style="background-color: lavender;">
							<b>AGE </b>
						</div>
						<div class="col-sm-6 card"
							style="background-color: lavenderblush;">${user.age}</div>
					</div>

				</div>

				<h2 style="font-family: Georgia;">
					<b>AREA OF INTEREST</b>
				</h2>
				<div class="jumbotron jumbotron-fluid">
					<c:forEach items="${userarea}" var="temp">
						<div class="col-sm-4 card" style="background-color: lavender;">
							<b>${temp.areaid}</b>
						</div>
						<div class="col-sm-6 card"
							style="background-color: lavenderblush;">${temp.areaname}</div>
					</c:forEach>

				</div>

				<h2 style="font-family: Georgia;">
					<b>ARTICLES</b>
				</h2>
				<div class="jumbotron jumbotron-fluid">
					<div class="row">
						<div class="col-sm-4 card" style="background-color: lavender;">
							<b>Description</b>
						</div>
						<div class="col-sm-2 card" style="background-color: lavender;">
							<b>Ratings</b>
						</div>

						<div class="col-sm-2 card" style="background-color: lavender;">
							<b>Status</b>
						</div>
						<div class="col-sm-2 card" style="background-color: lavender;">
							<b>PostDate</b>
						</div>
						<div class="col-sm-2 card" style="background-color: lavender;">
							<b>ReviewDate</b>
						</div>
					</div>
					<c:forEach items="${articleinfo}" var="temp">
						<div class="row">
							<div class="col-sm-4 card">
								<div
									style="background-color: lavenderblush; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									${temp.description }</div>
								<form action="/readmore" method="post">
									<input type="hidden" name="aid" value="${temp.aid }" />
									<button type="submit">Read More>></button>
								</form>
							</div>
							<div class="col-sm-2 card"
								style="background-color: lavenderblush;">${temp.rating}</div>

							<div class="col-sm-2 card"
								style="background-color: lavenderblush;">${temp.status}</div>
							<div class="col-sm-2 card"
								style="background-color: lavenderblush;">${temp.postdate}</div>
							<div class="col-sm-2 card"
								style="background-color: lavenderblush;">
								${temp.reviewdate}</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div> --%>

	<!---------- end ----------------->
</body>
</html>