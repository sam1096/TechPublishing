<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<h3>Hello,${user.username}</h3>
<p>Choose your favorite categories!!</p>
<div class="container">
<form>
<table class="table table-striped">
<caption><h3>Categories</h3></caption>
<thead>
<tr class="tr tr-success">
</thead>
<tbody>
<c:forEach items="${categories}" var="temp">
	<tr>
	<td><input type="checkbox" checked="checked"></td>
	<td><div class="card">${temp.areaname}</div></td>
	
	</tr>
</c:forEach>
</tbody>
</table>

</form>
</div>

</body>
</html>