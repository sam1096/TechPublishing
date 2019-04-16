<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div id="header">hello ${user.username}</div>
		<div id="container">
			<div id="first">
				<div class="card">
					<img src="/images/1.png" alt="John" style="width: 100%">
					<h1>${user.firstname} ${user.lastname}</h1>
					<p class="title">USER</p>
					<div>
						<button onclick="location.href='userprofile';">Basic Details</button>
						<br>
						<button onclick="location.href='area';">Areas</button>
						<br>
						<button onclick="location.href='userArticles';">My articles</button>
					</div>
				</div>
			</div>
			<div id="second">

				<nav class="navbar navbar-inverse">
					<div class="container-fluid">

						<ul class="nav navbar-nav">
							<li class="active"><a href="userprofile">Basic Details</a></li>
							<li><a href="/area">Areas of Interests</a></li>
							<li><a href="/userArticles">My Articles</a></li>
							<li><a href="/user_pass">Change Password</a></li>
							<li> <a href="/logoutUser">Logout</a></li>
						</ul>
					</div>
				</nav>

				<div class="contain">
					
					<table class="table table-striped">
						<caption>
							<h3>Articles Posted By You!!</h3>
						</caption>
						<thead>
							<tr class="tr tr-success">

								<td>Description</td>
								<td>Ratings</td>
								<td>Status</td>
								<td>Post Date</td>
								<td>Review Date</td>
							
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${articleinfo}" var="temp">
								<tr>
									<td>

										<p class="show-read-more">${temp.description}</p>
										<form action="/readmore" method="post">
											<input type="hidden" name="aid" value="${temp.aid }" />
											<button type="submit">Read More>></button>
										</form>
										


									</td>
									<td>${temp.rating}</td>
									<td>${temp.status}</td>
									<td>${temp.postdate}</td>
									<td>${temp.reviewdate}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>



			</div>

		</div>


	</div>




</body>
</html>
