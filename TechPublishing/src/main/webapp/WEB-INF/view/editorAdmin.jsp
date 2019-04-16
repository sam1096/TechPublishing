<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Editor</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cloud.tinymce.com/5/tinymce.min.js"></script>
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
<%
  response.setIntHeader("Refresh", 60);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);//in your case 60*5=300 (for 5 min)
%>
	<h1>Create Article</h1>
	<h3>Select Area Name under which you want to create article</h3>
	<br>
	
	<div>
		<form action="/saveadminArticle" method="post" name="tinymc" id="tinymc">
		<select name="areas">
		<c:forEach items="${areainterest}" var="list">
			<option value="${list.areaname}">${list.areaname}</option>
		
		</c:forEach>
	</select>
			<!--  <input type="hidden" name="aid" value="${art.aid }" />-->
			<!--  <input type="hidden" name="authname" value="${user.username}" />-->
			<textarea name="description" id="description"
				value="${art.description }"></textarea>
			<input type="submit" name="upload" id="upload" value="upload">
		</form>
	</div>
</body>

</html>