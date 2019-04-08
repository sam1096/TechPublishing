<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>User Profile</title>
</head>
<body>
<!-- Navigation bar -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Cart</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/welcomepage">Home</a></li>
				
				<li><a href="#">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/logoutUser"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>
	<!---------- end ----------------->
<div class="container-fluid" style="width:55%" align="center">
  <h1 style="font-family:Georgia;"><b>USER INFORMATION</b></h1>
		<div class="jumbotron jumbotron-fluid">
			<div class="row">
				<div class="col-sm-4 card" style="background-color: lavender;">
					<b>USER'S FIRSTNAME </b>
				</div>
				<div class="col-sm-6 card" style="background-color: lavenderblush;">
					${user.firstname }
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-4 card" style="background-color: lavender;">
					<b>USER'S LASTNAME </b>
				</div>
				<div class="col-sm-6 card" style="background-color: lavenderblush;">
					${user.lastname }
				</div>
			</div>

			<div class="row">
				<div class="col-sm-4 card" style="background-color: lavender;">
					<b>EMAIL ID</b>
				</div>
				<div class="col-sm-6 card" style="background-color: lavenderblush;">
					${user.email }
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-4 card" style="background-color: lavender;">
					<b>AGE </b>
				</div>
				<div class="col-sm-6 card" style="background-color: lavenderblush;">
					${user.age}
				</div>
			</div>
			
		</div>
		
		<h2 style="font-family:Georgia;"><b>AREA OF INTEREST</b></h2>
		<div class="jumbotron jumbotron-fluid">
		<c:forEach items="${userarea}" var="temp">
		<div class="col-sm-4 card" style="background-color: lavender;">
					<b>${temp.areaid}</b>
				</div>
				<div class="col-sm-6 card" style="background-color: lavenderblush;">
					${temp.areaname}
				</div>
		</c:forEach>
		
		</div>
		
		<h2 style="font-family:Georgia;"><b>ARTICLES</b></h2>
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
		<div  style="background-color:  lavenderblush;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;  ">
				${temp.description }</div>
						<form action="/readmore" method="post">
							<input type="hidden" name="aid" value="${temp.aid }" />
							<button type="submit">Read More>></button>
						</form>
			</div>		
		<div class="col-sm-2 card" style="background-color: lavenderblush;">
		${temp.rating}
				</div>
		
		<div class="col-sm-2 card" style="background-color: lavenderblush;">
			${temp.status}
		</div>
		<div class="col-sm-2 card" style="background-color: lavenderblush;">
			${temp.postdate}
		</div>
		<div class="col-sm-2 card" style="background-color:  lavenderblush;">
			${temp.reviewdate}
		</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>