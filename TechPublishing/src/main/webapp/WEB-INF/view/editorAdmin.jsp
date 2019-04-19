<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Editor</title>
<link href="static/js/bootstrap.min.js" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cloud.tinymce.com/5/tinymce.min.js"></script>
<link href="static/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script>
	tinymce.init({
		selector : 'textarea'
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#wysiwyg').wysiwyg();
	});
</script>
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
				<li><a href="/logoutAdmin"><font color="white">Logout</font></a></li>
			</ul>
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
		<form action="/saveadminArticle" method="post" name="tinymc"
			id="tinymc">
			<div>
				<select name="areas" class="area">
					<c:forEach items="${areainterest}" var="list">
						<option value="${list.areaname}">${list.areaname}</option>

					</c:forEach>
				</select>
			</div>
			<div class="textarea">
				<textarea name="description" id="description"
					value="${art.description }" required></textarea>
				<div class="uploadButton">
					<button type="submit" name="upload" id="upload">Upload</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>