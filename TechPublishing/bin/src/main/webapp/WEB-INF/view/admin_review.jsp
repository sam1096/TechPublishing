<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<title>Reviewing Articles</title>
</head>
<body>
<div class="container">
<table class="table table-striped">
<caption><h3>Articles</h3></caption>
<thead>
<tr class="tr tr-success">
<td>Description</td>
<td>authname</td>
</tr>
</thead>
<tbody>
<c:forEach items="${articles}" var="temp">
	<tr>
	<td>${temp.description}</td>
	<td>${temp.authname}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>