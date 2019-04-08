<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}
</style>
<title>Article</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

<c:forEach items="${article}" var="temp">
<div class="card" style="margin-top:8%;margin-left:5%,margin-right:5%">
${temp.description}
</div>
<div style="text-align:center;">
<h1>Comments</h1>
</div>
</c:forEach>
</body>
</html>