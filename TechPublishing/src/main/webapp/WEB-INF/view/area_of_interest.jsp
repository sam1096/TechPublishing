<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<title>Reviewing Articles</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="static/css/style.css" rel="stylesheet">

<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}
</style>
<title>Tech Categories</title>
</head>
<body>
<nav class="navbar navbar-inverse">
		<div class="container-fluid" style="background-color: #34495e;">
			<a class="navbar-brand" href="welcomepage"><img
				src="static/images/tech_geek_logo"></a>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/welcomepage">Home</a></li>

				<li><a href="/about">About</a></li>
				<li><a href="#">Connect</a></li>

				<li><a href="/userprofile">Profile</a></li>
				<li><a href="/logoutUser">Logout</a></li>
			</ul>

		</div>
	</nav>
<form action="/submitarea" method="post">

<h3>Choose your favorite categories!!</h3>

<div class="container">

<table class="table table-striped">
<caption><h3>Categories</h3></caption>
<thead>
<tr class="tr tr-success">
</thead>
<tbody>
<c:forEach items="${categories}" var="temp">
	<tr>
	<td><input type="checkbox" name="area" class="card" value=${temp.areaid } ></td>
	<!--  <td><label class="card" for="area">${temp.areaid}</label></td>-->
	<td><div class="card">${temp.areaname}</div></td>
	</tr>
</c:forEach>
</tbody>
</table>
<div class="uploadButton">
					<button type="submit" name="upload"  id="myBtn1" >Save Interest</button>
				</div>
 
</div>
</form>

	

</body>
</html>