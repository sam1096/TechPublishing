<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Editor</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cloud.tinymce.com/5/tinymce.min.js"></script>
<link href="static/css/style.css" rel="stylesheet">
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<link href="static/js/bootstrap.min.js" rel="stylesheet">

<script>
	tinymce.init({
		selector : 'textarea',
		autoresize_overflow_padding: 50,
		max_height: 500,
		plugins: "fullscreen"
	});
</script>

<script type="text/javascript">
	$(function() {
		$('#wysiwyg').wysiwyg();
	});
</script>
</head>

<body>
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
					<li><a href="userHome">Home</a></li>
					<li><a href="/about">About</a></li>
					<li><a href="#">Connect</a></li>
					<li><a href="/userprofile">Profile</a></li>
					<li><a href="/logoutUser">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<%
		response.setIntHeader("Refresh", 60);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);//in your case 60*5=300 (for 5 min)
	%>


	<div>
		<div class="areaSelection">Select Area Name under which you want
			to create article</div>
		<form action="/saveArticle" method="post" name="tinymc" id="tinymc">
			<div>
				<select name="areas" class="area">
					<c:forEach items="${areainterest}" var="list">
						<option value="${list.areaname}">${list.areaname}</option>

					</c:forEach>
				</select>
			</div>
			<div class="textarea">
				<textarea name="description" id="description"
					value="${art.description }"></textarea>
				<div class="uploadButton">
					<button type="submit" name="upload" id="upload" >Upload</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>