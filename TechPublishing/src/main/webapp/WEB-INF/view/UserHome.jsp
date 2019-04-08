<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>TechPublishing</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<body>

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


	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-2">
				<h3>EDITOR</h3>
				<p>Something on mind write here!!!</p>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a href="/editor">Create Article</a></li>
				</ul>
				
				<hr class="d-sm-none">
			</div>

			<div class="col-sm-10">
				<article>
					<div class="container">
						<table>
							<thead>
								<tr class="tr tr-success">
									<th>Description</th>
									<th>Author Name</th>
									<th>Topic</th>
									<th>Ratings</th>
									<th>Date</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dashboard1}" var="temp">
									<tr>
										<td>
										<section class="card">${temp[0].description}</section>
											<form action="/readmore" method="post">
												<input type="hidden" name="aid" value="${temp[0].aid }" />
												<button class="readmoreButton" type="submit"><span>Read More</span> </button>
											</form>
										</td>
										<td>${temp[0].authname}</td>
										<td>${temp[1].areaname}</td>
										<td>${temp[0].rating}</td>
										<td>${temp[0].postdate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</article>
			</div>
		</div>
	</div>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>


</body>
</html>

