<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comments</title>
</head>
<body>
	<div id="display_comment">
		<c:forEach items="${commentList}" var="cmt">
			<div class="media row">
				<div class="media-body col-sm-4">
					<h4 class="media-heading"><font text="bold">${cmt.authname} :</font></h4>
				</div>
				<div class="col-sm-8" style="margin-left: -28%;">
					<p>${cmt.comdesc}</p>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>